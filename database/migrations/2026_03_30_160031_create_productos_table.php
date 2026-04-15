<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("catalogo_id");
            $table->string("codigo")->unique();
            $table->string("nombre", 255);
            $table->string("moneda");
            $table->decimal("precio", 24, 2);
            $table->string("imagen", 255)->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign("catalogo_id")->on("catalogos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
