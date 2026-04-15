<?php

namespace App\Services;

use App\Models\Configuracion;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ConfiguracionService
{
    public function __construct(private CargarArchivoService $cargarArchivoService) {}

    /**
     * Actualizar configuracion
     *
     * @param array $datos
     * @param Configuracion $configuracion
     * @return Configuracion
     */
    public function actualizar(array $datos, Configuracion $configuracion): Configuracion
    {
        $configuracion = Configuracion::first();
        if (!$configuracion) {
            $configuracion = Configuracion::create([
                "nombre_sistema" => $datos["nombre_sistema"],
                "alias" => $datos["alias"],
            ]);
        } else {
            $configuracion->update([
                "nombre_sistema" => $datos["nombre_sistema"],
                "alias" => $datos["alias"],
            ]);
        }

        // cargar logo
        if ($datos["logo"] && !is_string($datos["logo"])) {
            $this->cargarImagen($configuracion, $datos["logo"], "logo");
        }

        // cargar portada
        if ($datos["portada"] && !is_string($datos["portada"])) {
            $this->cargarImagen($configuracion, $datos["portada"], "portada");
        }


        return $configuracion;
    }

    public function cargarImagen(Configuracion $configuracion, UploadedFile $logo, String $col): void
    {
        if ($configuracion[$col]) {
            \File::delete(public_path("imgs/" . $configuracion[$col]));
        }
        $nombre = $col . $configuracion->id . time();
        $configuracion[$col] = $this->cargarArchivoService->cargarArchivo($logo, public_path("imgs"), $nombre);
        $configuracion->save();
    }
}
