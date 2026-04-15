<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Visitante extends Model
{
    use HasFactory;

    protected $fillable = [
        "ip",
        "user_agent",
        "browser",
        "platform",
        "device",
        "url",
        "referer",
    ];
}
