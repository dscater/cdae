<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    use HasFactory;

    protected $fillable = [
        "ip_cliente",
        "pdf",
        "fecha",
        "hora",
    ];

    protected $appends = [
        "pdf_url",
    ];

    public function getPdfUrlAttribute()
    {
        return asset(public_path("pedidos/" . $this->pdf));
    }
    public function pedido_detalles()
    {
        return $this->hasMany(PedidoDetalle::class);
    }
}
