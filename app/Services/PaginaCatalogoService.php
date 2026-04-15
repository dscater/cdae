<?php

namespace App\Services;

use App\Services\HistorialAccionService;
use App\Models\PaginaCatalogo;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Container\Attributes\Auth;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Validation\ValidationException;

class PaginaCatalogoService
{
    private $modulo = "CATALOGOS";

    public function __construct(private  CargarArchivoService $cargarArchivoService, private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $pagina_catalogos = PaginaCatalogo::select("pagina_catalogos.*")->get();
        return $pagina_catalogos;
    }
    /**
     * Lista de pagina_catalogos paginado con filtros
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
        $pagina_catalogos = PaginaCatalogo::select("pagina_catalogos.*");

        // Filtros exactos
        foreach ($columnsFilter as $key => $value) {
            if (!is_null($value)) {
                $pagina_catalogos->where("pagina_catalogos.$key", $value);
            }
        }

        // Filtros por rango
        foreach ($columnsBetweenFilter as $key => $value) {
            if (isset($value[0], $value[1])) {
                $pagina_catalogos->whereBetween("pagina_catalogos.$key", $value);
            }
        }

        // Búsqueda en múltiples columnas con LIKE
        if (!empty($search) && !empty($columnsSerachLike)) {
            $pagina_catalogos->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere("$col", "LIKE", "%$search%");
                }
            });
        }

        // Ordenamiento
        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $pagina_catalogos->orderBy($value[0], $value[1]);
            }
        }


        $pagina_catalogos = $pagina_catalogos->paginate($length, ['*'], 'page', $page);
        return $pagina_catalogos;
    }

    /**
     * Crear pagina_catalogo
     *
     * @param array $datos
     * @return PaginaCatalogo
     */
    public function crear(array $datos): PaginaCatalogo
    {
        $pagina_catalogo = PaginaCatalogo::create([
            "nombre" => mb_strtoupper($datos["nombre"]),
            "tipo" => $datos["tipo"],
            "descargar" => $datos["descargar"]
        ]);

        if ($datos["tipo"] == 'icono') {
            $pagina_catalogo->imagen = $datos["imagen"];
            $pagina_catalogo->save();
        } else {

            // cargar imagen
            if ($datos["imagen"] && !is_string($datos["imagen"])) {
                $this->cargarFoto($pagina_catalogo, $datos["imagen"]);
            }
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UN CATALOGO", $pagina_catalogo);

        return $pagina_catalogo;
    }


    /**
     * Actualizar pagina_catalogo
     *
     * @param array $datos
     * @param PaginaCatalogo $pagina_catalogo
     * @return PaginaCatalogo
     */
    public function actualizar(array $datos, PaginaCatalogo $pagina_catalogo): PaginaCatalogo
    {
        $old_pagina_catalogo = clone $pagina_catalogo;

        $pagina_catalogo->update([
            "nombre" => mb_strtoupper($datos["nombre"]),
            "tipo" => $datos["tipo"],
            "descargar" => $datos["descargar"]
        ]);

        if ($datos["tipo"] == 'icono') {
            $pagina_catalogo->imagen = $datos["imagen"];
            $pagina_catalogo->save();
        } else {
            // cargar imagen
            if ($datos["imagen"] && !is_string($datos["imagen"])) {
                $this->cargarFoto($pagina_catalogo, $datos["imagen"]);
            }
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN CATALOGO", $old_pagina_catalogo, $pagina_catalogo->withoutRelations());

        return $pagina_catalogo;
    }

    /**
     * Eliminar pagina_catalogo
     *
     * @param PaginaCatalogo $pagina_catalogo
     * @return boolean
     */
    public function eliminar(PaginaCatalogo $pagina_catalogo): bool|Exception
    {
        $old_pagina_catalogo = clone $pagina_catalogo;

        $pagina_catalogo->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UN CATALOGO", $old_pagina_catalogo, $pagina_catalogo);

        return true;
    }

    /**
     * Cargar imagen
     *
     * @param PaginaCatalogo $pagina_catalogo
     * @param UploadedFile $imagen
     * @return void
     */
    public function cargarFoto(PaginaCatalogo $pagina_catalogo, UploadedFile $imagen): void
    {
        if ($pagina_catalogo->imagen) {
            \File::delete(public_path("imgs/pagina_catalogos/" . $pagina_catalogo->imagen));
        }

        $nombre = $pagina_catalogo->id . time();
        $pagina_catalogo->imagen = $this->cargarArchivoService->cargarArchivo($imagen, public_path("imgs/pagina_catalogos"), $nombre);
        $pagina_catalogo->save();
    }
}
