<?php

use App\Http\Controllers\CatalogoController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\IconoController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\PaginaCatalogoController;
use App\Http\Controllers\PortalController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\SocialController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


// portal
Route::get('/productos/buscar', [ProductoController::class, 'buscar'])->name('productos.buscar');
Route::get('/productos/miCatalogo', [PortalController::class, 'miCatalogo'])->name('portal.miCatalogo');
Route::post('/productos/crearPedido', [PortalController::class, 'crearPedido'])->name('portal.crearPedido');
Route::get('/productos/descargar_catalogo', [PortalController::class, 'descargar_catalogo'])->name('portal.descargar_catalogo');
Route::middleware(['logVisitante'])->group(function () {
    Route::get('/', [PortalController::class, 'index'])->name('portal');
    Route::get('/productos/verProducto/{producto}', [PortalController::class, 'verProducto'])->name('portal.verProducto');
});

Route::get("configuracions/getConfiguracion", [ConfiguracionController::class, 'getConfiguracion'])->name("configuracions.getConfiguracion");
Route::get("socials/getSocial", [SocialController::class, 'getSocial'])->name("socials.getSocial");

Route::get('/clear-cache', function () {
    Artisan::call('config:cache');
    Artisan::call('config:clear');
    Artisan::call('optimize');
    return 'Cache eliminado <a href="/">Ir al inicio</a>';
})->name('clear.cache');

Route::get("iconos/getIconos", [IconoController::class, 'lista'])->name("iconos.lista");

// ADMINISTRACION
Route::middleware(['auth', 'permisoUsuario'])->prefix("admin")->group(function () {
    // INICIO
    Route::get('/inicio', [InicioController::class, 'inicio'])->name('inicio');

    // CONFIGURACION
    Route::resource("configuracions", ConfiguracionController::class)->only(
        ["index", "show", "update"]
    );

    // USUARIO
    Route::get('profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::patch('profile/update_foto', [ProfileController::class, 'update_foto'])->name('profile.update_foto');
    Route::delete('profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get("getUser", [UserController::class, 'getUser'])->name('users.getUser');
    Route::get("permisosUsuario", [UserController::class, 'permisosUsuario']);

    // USUARIOS
    Route::put("usuarios/password/{user}", [UsuarioController::class, 'actualizaPassword'])->name("usuarios.password");
    Route::get("usuarios/paginado", [UsuarioController::class, 'paginado'])->name("usuarios.paginado");
    Route::get("usuarios/listado", [UsuarioController::class, 'listado'])->name("usuarios.listado");
    Route::get("usuarios/listado/byTipo", [UsuarioController::class, 'byTipo'])->name("usuarios.byTipo");
    Route::get("usuarios/show/{user}", [UsuarioController::class, 'show'])->name("usuarios.show");
    Route::put("usuarios/update/{user}", [UsuarioController::class, 'update'])->name("usuarios.update");
    Route::delete("usuarios/{user}", [UsuarioController::class, 'destroy'])->name("usuarios.destroy");
    Route::resource("usuarios", UsuarioController::class)->only(
        ["index", "store"]
    );

    // PAGINA CATALOGOS
    Route::get("pagina_catalogos/paginado", [PaginaCatalogoController::class, 'paginado'])->name("pagina_catalogos.paginado");
    Route::get("pagina_catalogos/listado", [PaginaCatalogoController::class, 'listado'])->name("pagina_catalogos.listado");
    Route::resource("pagina_catalogos", PaginaCatalogoController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // CATALOGOS
    Route::delete("catalogos/eliminarFondo/{catalogo}", [CatalogoController::class, 'eliminarFondo'])->name("catalogos.eliminarFondo");
    Route::get("catalogos/paginado", [CatalogoController::class, 'paginado'])->name("catalogos.paginado");
    Route::get("catalogos/listado", [CatalogoController::class, 'listado'])->name("catalogos.listado");
    Route::resource("catalogos", CatalogoController::class)->only(
        ["index", "create", "store", "edit", "show", "update", "destroy"]
    );

    // REDES SOCIALES
    Route::resource("socials", SocialController::class)->only(
        ["index", "show", "update"]
    );

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");

    Route::get('reportes/catalogos', [ReporteController::class, 'catalogos'])->name("reportes.catalogos");
    Route::get('reportes/r_catalogos', [ReporteController::class, 'r_catalogos'])->name("reportes.r_catalogos");

    Route::get('reportes/visitantes', [ReporteController::class, 'visitantes'])->name("reportes.visitantes");
    Route::get('reportes/r_visitantes', [ReporteController::class, 'r_visitantes'])->name("reportes.r_visitantes");
});
require __DIR__ . '/auth.php';
