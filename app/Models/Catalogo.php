<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Catalogo extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "pagina_id",
        "imagen",
        "estado",
    ];

    protected $appends = ["url_imagen"];

    public function getUrlImagenAttribute()
    {
        return asset("imgs/catalogos/{$this->imagen}");
    }

    public function productos()
    {
        return $this->hasMany(Producto::class, 'catalogo_id');
    }

    public function pagina_catalogo()
    {
        return $this->belongsTo(PaginaCatalogo::class, 'pagina_id');
    }
}
