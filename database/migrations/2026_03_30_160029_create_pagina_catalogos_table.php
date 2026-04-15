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
        Schema::create('pagina_catalogos', function (Blueprint $table) {
            $table->id();
            $table->integer("pagina");
            $table->integer("descripcion");
            $table->integer("productos");
            $table->integer("redes")->default(0);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pagina_catalogos');
    }
};
