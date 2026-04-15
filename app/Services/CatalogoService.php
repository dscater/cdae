<?php

namespace App\Services;

use App\Services\HistorialAccionService;
use App\Models\Catalogo;
use App\Models\Producto;
use App\Models\ProductoDescripcion;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Container\Attributes\Auth;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Validation\ValidationException;

class CatalogoService
{
    private $modulo = "CATALOGOS";

    public function __construct(private  CargarArchivoService $cargarArchivoService, private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $catalogos = Catalogo::select("catalogos.*")->get();
        return $catalogos;
    }
    /**
     * Lista de catalogos paginado con filtros
     *
     * @param integer $length
     * @param integer $page
     * @param string $search
     * @param array $columnsSerachLike
     * @param array $columnsFilter
     * @return LengthAwarePaginator
     */
    public function listadoPaginado(int $length, int $page, string $search, array $columnsSerachLike = [], array $columnsFilter = [], array $columnsBetweenFilter = [], array $orderBy = []): LengthAwarePaginator
    {
        $catalogos = Catalogo::select("catalogos.*")
            ->with(["pagina_catalogo:id,pagina,productos"]);

        // Filtros exactos
        foreach ($columnsFilter as $key => $value) {
            if (!is_null($value)) {
                $catalogos->where("catalogos.$key", $value);
            }
        }

        // Filtros por rango
        foreach ($columnsBetweenFilter as $key => $value) {
            if (isset($value[0], $value[1])) {
                $catalogos->whereBetween("catalogos.$key", $value);
            }
        }

        // Búsqueda en múltiples columnas con LIKE
        if (!empty($search) && !empty($columnsSerachLike)) {
            $catalogos->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere("$col", "LIKE", "%$search%");
                }
            });
        }

        // Ordenamiento
        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $catalogos->orderBy($value[0], $value[1]);
            }
        }


        $catalogos = $catalogos->paginate($length, ['*'], 'page', $page);
        return $catalogos;
    }

    /**
     * Crear catalogo
     *
     * @param array $datos
     * @return Catalogo
     */
    public function crear(array $datos): Catalogo
    {
        $catalogo = Catalogo::create([
            "pagina_id" => $datos["pagina_id"],
            "estado" => $datos["estado"],
        ]);

        // productos
        foreach ($datos["productos"] as $key => $item) {
            $producto =  $catalogo->productos()->create([
                "codigo" => $item["codigo"],
                "nombre" => $item["nombre"],
                "moneda" => $item["moneda"],
                "precio" => $item["precio"],
            ]);

            foreach ($item["producto_descripcions"] as $descripcion) {
                $producto->producto_descripcions()->create([
                    "descripcion" => $descripcion["descripcion"]
                ]);
            }

            // cargar imagen producto
            if ($item["imagen"] && !is_string($item["imagen"])) {
                $this->cargarImagenProducto($producto, $item["imagen"], $key);
            }
        }

        // cargar fondo imagen
        if ($datos["imagen"] && !is_string($datos["imagen"])) {
            $this->cargarFondo($catalogo, $datos["imagen"]);
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UN CATALOGO", $catalogo);

        return $catalogo;
    }


    /**
     * Actualizar catalogo
     *
     * @param array $datos
     * @param Catalogo $catalogo
     * @return Catalogo
     */
    public function actualizar(array $datos, Catalogo $catalogo): Catalogo
    {
        $old_catalogo = clone $catalogo;

        $catalogo->update([
            "pagina_id" => $datos["pagina_id"],
            "estado" => $datos["estado"],
        ]);

        if ($old_catalogo->pagina_id != $catalogo->pagina_id) {
            // SI SE CAMBIO DE PAGINA ELIMINAR Y REHACER TODOS LOS PRODUCTOS
            foreach ($catalogo->productos as $item) {
                \File::delete(public_path("imgs/productos/" . $this->item->imagen));
                $item->producto_descripcions()->forceDelete();
                $item->forceDelete();
            }

            // productos
            foreach ($datos["productos"] as $key => $item) {
                $producto =  $catalogo->productos()->create([
                    "codigo" => $item["codigo"],
                    "nombre" => $item["nombre"],
                    "moneda" => $item["moneda"],
                    "precio" => $item["precio"],
                ]);

                foreach ($item["producto_descripcions"] as $descripcion) {
                    $producto->producto_descripcions()->create([
                        "descripcion" => $descripcion["descripcion"]
                    ]);
                }

                // cargar imagen producto
                if ($item["imagen"] && !is_string($item["imagen"])) {
                    $this->cargarImagenProducto($producto, $item["imagen"], $key);
                }
            }
        } else {
            // ACTUALIZAR DATOS DE LOS PRODUCTOS EXISTENTES
            // productos
            foreach ($datos["productos"] as $key => $item) {
                $producto = Producto::find($item["id"]);
                $producto->update([
                    "codigo" => $item["codigo"],
                    "nombre" => $item["nombre"],
                    "moneda" => $item["moneda"],
                    "precio" => $item["precio"],
                ]);

                foreach ($item["producto_descripcions"] as $descripcion) {
                    $producto_descripcion = ProductoDescripcion::find($descripcion["id"]);
                    $producto_descripcion->update([
                        "descripcion" => $descripcion["descripcion"]
                    ]);
                }

                // cargar imagen producto
                if ($item["imagen"] && !is_string($item["imagen"])) {
                    $this->cargarImagenProducto($producto, $item["imagen"], $key);
                }
            }
        }

        // cargar fondo imagen
        if ($datos["imagen"] && !is_string($datos["imagen"])) {
            $this->cargarFondo($catalogo, $datos["imagen"]);
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN CATALOGO", $old_catalogo, $catalogo, ["productos"]);

        return $catalogo;
    }

    /**
     * Eliminar catalogo
     *
     * @param Catalogo $catalogo
     * @return boolean
     */
    public function eliminar(Catalogo $catalogo): bool|Exception
    {
        $old_catalogo = clone $catalogo;

        $catalogo->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UN CATALOGO", $old_catalogo, $catalogo, ["productos"]);

        return true;
    }

    /**
     * Cargar imagen
     *
     * @param Catalogo $catalogo
     * @param UploadedFile $imagen
     * @return void
     */
    public function cargarFondo(Catalogo $catalogo, UploadedFile $imagen): void
    {
        if ($catalogo->imagen) {
            \File::delete(public_path("imgs/catalogos/" . $catalogo->imagen));
        }

        $nombre = $catalogo->id . time();
        $catalogo->imagen = $this->cargarArchivoService->cargarArchivo($imagen, public_path("imgs/catalogos"), $nombre);
        $catalogo->save();
    }


    /**
     * Cargar imagen producto
     *
     * @param Producto $producto
     * @param UploadedFile $imagen
     * @return void
     */
    public function cargarImagenProducto(Producto $producto, UploadedFile $imagen, $index): void
    {
        if ($producto->imagen) {
            \File::delete(public_path("imgs/productos/" . $producto->imagen));
        }

        $nombre = $index . $producto->id . time();
        $producto->imagen = $this->cargarArchivoService->cargarArchivo($imagen, public_path("imgs/productos"), $nombre);
        $producto->save();
    }
}
