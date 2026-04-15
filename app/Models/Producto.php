<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $fillable = [
        "catalogo_id",
        "codigo",
        "nombre",
        "moneda",
        "precio",
        "imagen",
    ];

    protected $appends = ["url_imagen"];

    public function getUrlImagenAttribute()
    {
        if ($this->imagen) {
            return asset("imgs/productos/" . $this->imagen);
        }
        return null;
    }

    public function getImagenB64Attribute()
    {
        $path = public_path("imgs/productos/" . $this->imagen);
        if (file_exists($path)) {
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data = file_get_contents($path);
            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
            return $base64;
        }
        return "";
    }

    public function catalogo()
    {
        return $this->belongsTo(Catalogo::class, 'catalogo_id');
    }

    public function producto_descripcions()
    {
        return $this->hasMany(ProductoDescripcion::class, 'producto_id');
    }
}
