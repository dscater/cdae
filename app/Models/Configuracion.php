<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Configuracion extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "nombre_sistema",
        "alias",
        "logo",
        "portada",
    ];

    protected $casts = [];

    protected $appends = ["url_logo", "logo_b64", "url_portada"];

    public function getUrlPortadaAttribute()
    {
        return asset("imgs/" . $this->portada);
    }

    public function getUrlLogoAttribute()
    {
        return asset("imgs/" . $this->logo);
    }

    public function getLogoB64Attribute()
    {
        $path = public_path("imgs/" . $this->logo);
        if (file_exists($path)) {
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data = file_get_contents($path);
            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
            return $base64;
        }
        return "";
    }
}
