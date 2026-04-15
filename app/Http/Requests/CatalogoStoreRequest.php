<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CatalogoStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            "nombre" => "required|string|unique:catalogos,nombre",
            "tipo" => "required",
            "descargar" => "required",
        ];

        if ($this->tipo === 'imagen') {
            $rules["imagen"] = "required|image|mimes:webp,jpeg,png,jpg,gif,svg|max:4096";
        } else {
            $rules["imagen"] = "required|string";
        }

        return $rules;
    }

    public function messages()
    {
        return [
            "nombre.required" => "Debes completar este campo",
            "nombre.string" => "Debes ingresar una cadena",
            "imagen.required" => "Debes completar este campo",
            "imagen.mimes" => "Solo puedes cargar imagenes webp,jpeg,png,jpg,gif,svg",
            "imagen.max" => "No puedes subir imagenes que pesen mas de 4MB"
        ];
    }
}
