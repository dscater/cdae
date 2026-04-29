<?php

namespace App\Rules;

use App\Models\Producto;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Support\Facades\Log;

class CatalogoProductosRule implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (empty($value)) {
            $fail("No se encontró ningun producto agregado");
        }
        $extensionesPermitidas = ['jpg', 'jpeg', 'png', 'webp', 'svg'];
        foreach ($value as $key => $item) {
            if (trim('' . $item["codigo"]) == '') {
                $fail("No se ingreso el código del producto " . ($key + 1));
            }

            $existe = Producto::where("codigo", $item["codigo"]);
            if ($item["id"] != 0) {
                $existe->where("id", "!=", $item["id"]);
            }
            $existe = $existe->get()->first();
            if ($existe) {
                $fail("El código del producto " . ($key + 1) . ", ya fue registrado");
            }

            if (trim('' . $item["nombre"]) == '') {
                $fail("No se ingreso el nombre del producto " . ($key + 1));
            }
            if (trim('' . $item["moneda"]) == '') {
                $fail("No se ingreso el texto de precio del producto " . ($key + 1));
            } else {
                if (!preg_match('/^[\p{L}\s\.\'"]+$/u', $item["moneda"])) {
                    $fail("El campo moneda del producto " . ($key + 1) . " solo debe contener texto válido (sin números).");
                }
            }
            if (trim('' . $item["precio"]) == '' || (float)$item["precio"] < 0) {
                $fail("No se ingreso el precio del producto " . ($key + 1));
            }
            if (!isset($item['imagen'])) {
                $fail("No se cargo la imagen del producto " . ($key + 1));
                continue;
            }

            $imagen = $item['imagen'];
            // Si es archivo (nuevo upload)
            if ($imagen instanceof UploadedFile) {
                // Validar tamaño (4MB = 4096 KB)
                if ($imagen->getSize() > 4 * 1024 * 1024) {
                    $fail("El archivo del producto " . ($key + 1) . " supera los 4MB.");
                }

                // Validar extensión
                $extension = strtolower($imagen->getClientOriginalExtension());
                if (!in_array($extension, $extensionesPermitidas)) {
                    $fail("El archivo del producto " . ($key + 1) . " tiene un formato inválido. Solo puedes cargar jpg, jpeg, png, webp, svg");
                }
            }
        }
    }
}
