<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IconoController extends Controller
{
    public function lista()
    {
        $iconos = [
            // Redes sociales
            ['nombre' => 'WhatsApp', 'clase' => 'fab fa-whatsapp'],
            ['nombre' => 'Facebook', 'clase' => 'fab fa-facebook'],
            ['nombre' => 'Instagram', 'clase' => 'fab fa-instagram'],
            ['nombre' => 'TikTok', 'clase' => 'fab fa-tiktok'],
            ['nombre' => 'Telegram', 'clase' => 'fab fa-telegram'],
            ['nombre' => 'YouTube', 'clase' => 'fab fa-youtube'],

            // Ecommerce / acciones
            ['nombre' => 'Carrito', 'clase' => 'fas fa-shopping-cart'],
            ['nombre' => 'Comprar', 'clase' => 'fas fa-credit-card'],
            ['nombre' => 'Favorito', 'clase' => 'fas fa-heart'],
            ['nombre' => 'Compartir', 'clase' => 'fas fa-share-alt'],
            ['nombre' => 'Ver', 'clase' => 'fas fa-eye'],

            // Contacto
            ['nombre' => 'Teléfono', 'clase' => 'fas fa-phone'],
            ['nombre' => 'Email', 'clase' => 'fas fa-envelope'],
            ['nombre' => 'Ubicación', 'clase' => 'fas fa-map-marker-alt'],
            ['nombre' => 'Chat', 'clase' => 'fas fa-comments'],

            // Navegación
            ['nombre' => 'Inicio', 'clase' => 'fas fa-home'],
            ['nombre' => 'Menú', 'clase' => 'fas fa-bars'],
            ['nombre' => 'Buscar', 'clase' => 'fas fa-search'],
            ['nombre' => 'Categorías', 'clase' => 'fas fa-th-large'],
            ['nombre' => 'Atrás', 'clase' => 'fas fa-arrow-left'],
            ['nombre' => 'Siguiente', 'clase' => 'fas fa-arrow-right'],
            ['nombre' => 'Arriba', 'clase' => 'fas fa-angle-up'],
            ['nombre' => 'Abajo', 'clase' => 'fas fa-angle-down'],
            ['nombre' => 'Derecha', 'clase' => 'fas fa-angle-left'],
            ['nombre' => 'Izquierda', 'clase' => 'fas fa-angle-right'],
            ['nombre' => 'Arriba', 'clase' => 'fas fa-chevron-circle-up'],
            ['nombre' => 'Abajo', 'clase' => 'fas fa-chevron-circle-down'],
            ['nombre' => 'Derecha', 'clase' => 'fas fa-chevron-circle-left'],
            ['nombre' => 'Izquierda', 'clase' => 'fas fa-chevron-circle-right'],
            ['nombre' => 'Arriba', 'clase' => 'fas fa-arrow-circle-up'],
            ['nombre' => 'Abajo', 'clase' => 'fas fa-arrow-circle-down'],
            ['nombre' => 'Derecha', 'clase' => 'fas fa-arrow-circle-left'],
            ['nombre' => 'Izquierda', 'clase' => 'fas fa-arrow-circle-right'],
            ['nombre' => 'Actualizar', 'clase' => 'fas fa-undo'],
            ['nombre' => 'Actualizar', 'clase' => 'fas fa-redo'],
            ['nombre' => 'Lista', 'clase' => 'fas fa-list'],
            ['nombre' => 'Lista', 'clase' => 'fas fa-list-alt'],
            ['nombre' => 'Actualizar', 'clase' => 'fas fa-sync'],
            ['nombre' => 'Actualizar', 'clase' => 'fas fa-sync-alt'],
            ['nombre' => 'Compartir', 'clase' => 'fas fa-reply'],
            ['nombre' => 'Play', 'clase' => 'fas fa-play'],
            ['nombre' => 'Mouse', 'clase' => 'fas fa-mouse-pointer'],
            ['nombre' => 'Flecha Arriba', 'clase' => 'fas fa-long-arrow-alt-up'],
            ['nombre' => 'Flecha Derecha', 'clase' => 'fas fa-long-arrow-alt-right'],
            ['nombre' => 'Flecha Izquierda', 'clase' => 'fas fa-long-arrow-alt-left'],
            ['nombre' => 'Flecha Abajo', 'clase' => 'fas fa-long-arrow-alt-down'],
            ['nombre' => 'Flecha Arriba', 'clase' => 'fas fa-angle-double-up'],
            ['nombre' => 'Flecha Derecha', 'clase' => 'fas fa-angle-double-right'],
            ['nombre' => 'Flecha Izquierda', 'clase' => 'fas fa-angle-double-left'],
            ['nombre' => 'Flecha Abajo', 'clase' => 'fas fa-angle-double-down'],
            ['nombre' => 'Ubicación', 'clase' => 'fas fa-location-arrow'],
            ['nombre' => 'Mano Arriba', 'clase' => 'fas fa-hand-pointer'],
            ['nombre' => 'Mano Arriba', 'clase' => 'fas fa-hand-point-up'],
            ['nombre' => 'Mano Derecha', 'clase' => 'fas fa-hand-point-right'],
            ['nombre' => 'Mano Izquierda', 'clase' => 'fas fa-hand-point-left'],
            ['nombre' => 'Mano Abajo', 'clase' => 'fas fa-hand-point-down'],

            // Usuario
            ['nombre' => 'Usuario', 'clase' => 'fas fa-user'],
            ['nombre' => 'Login', 'clase' => 'fas fa-sign-in-alt'],
            ['nombre' => 'Logout', 'clase' => 'fas fa-sign-out-alt'],
            ['nombre' => 'Configuración', 'clase' => 'fas fa-cog'],

            // Sistema / utilidades
            ['nombre' => 'Editar', 'clase' => 'fas fa-edit'],
            ['nombre' => 'Eliminar', 'clase' => 'fas fa-trash'],
            ['nombre' => 'Guardar', 'clase' => 'fas fa-save'],
            ['nombre' => 'Descargar', 'clase' => 'fas fa-download'],
            ['nombre' => 'Subir', 'clase' => 'fas fa-upload'],
        ];

        return response()->JSON($iconos);
    }
}
