<?php

namespace App\Http\Requests;

use App\Rules\CatalogoProductosRule;
use Illuminate\Foundation\Http\FormRequest;

class CatalogoUpdateRequest extends FormRequest
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
            "pagina_id" => "required",
            "estado" => "required",
            "imagen" => "nullable|image|mimes:webp,jpeg,png,jpg,gif,svg|max:4096",
            "productos" => ["required", "array", "min:1", new CatalogoProductosRule()]
        ];
        return $rules;
    }

    public function messages()
    {
        return [
            "pagina_id.required" => "Debes completar este campo",
            "productos.required" => "Debe existir al menos 1 producto",
            "productos.array" => "Debe enviar una lista de productos",
            "productos.min" => "Debe existir al menos :min producto",
            "imagen.required" => "Debe cargar una imagen de fondo",
            "imagen.mimes" => "Debes cargar solo imagenes webp,jpeg,jpg,png,gif,svg",
            "imagen.max" => "La imagen no puede pesar mas de 4MB",
        ];
    }
}
