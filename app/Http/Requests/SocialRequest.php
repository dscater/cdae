<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SocialRequest extends FormRequest
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
        return [
            "dir" => "required",
            "whatsapp" => "required",
            "facebook" => "nullable",
            "tiktok" => "nullable",
            "instagram" => "nullable",
            "youtube" => "nullable",
            "x" => "nullable",
            "web" => "nullable",
            "correo" => "nullable",
        ];
    }

    /**
     * Mensajes validacion
     *
     * @return array
     */
    public function messages(): array
    {
        return [];
    }
}
