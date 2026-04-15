<?php

namespace App\Http\Controllers;

use App\Models\Catalogo;
use App\Models\Pedido;
use App\Models\Producto;
use App\Models\Social;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use PDF;

class PortalController extends Controller
{
    public function index(Request $request)
    {
        $page = $request->page ?? 1;
        $page = is_string($page) ? (int)$page : $page;
        $catalogos = Catalogo::where("estado", 1)
            ->with(["pagina_catalogo:id,pagina", "productos.producto_descripcions"])->paginate(1);

        $listCatalogos = Catalogo::with(["pagina_catalogo:id,pagina", "productos.producto_descripcions"])->where("estado", 1)->get();

        return inertia("Portal/Inicio", compact("catalogos", "page", "listCatalogos"));
    }

    public function verProducto(Producto $producto)
    {
        $catalogo = $producto->load(["catalogo", "producto_descripcions"]);
        return inertia("Portal/VerProducto", compact("producto", "catalogo"));
    }
    public function descargar_catalogo()
    {

        $catalogos = Catalogo::where("estado", 1)->get();
        $pdf = PDF::loadView('reportes.catalogo', compact('catalogos'));

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text(round($ancho / 2, 0), 22, "{PAGE_NUM}/{PAGE_COUNT}", null, 11, array(0, 0, 0));

        return $pdf->stream('catalogo.pdf');
    }

    public function miCatalogo()
    {
        return inertia("Portal/MiCatalogo");
    }


    public function crearPedido(Request $request)
    {
        $nuevo_pedido = Pedido::create([
            "ip_cliente" => $request->ip(),
            "fecha" => date("Y-m-d"),
            "hora" => date("H:i:s"),
        ]);
        foreach ($request->productos as $producto) {
            $nuevo_pedido->pedido_detalles()->create([
                "producto_id" => $producto["id"],
                "cantidad" => $producto["cantidad"],
                "precio" => $producto["producto"]["precio"],
                "subtotal" => $producto["subtotal"],
            ]);
        }

        // crear pdf con DOMPDF
        // $pdf = PDF::loadView('reportes.pedido', compact('nuevo_pedido'));
        // $pdf_path = public_path("pedidos/pedido_" . $nuevo_pedido->id . ".pdf");
        // $pdf->save($pdf_path);
        // $nuevo_pedido->pdf = "pedido_" . $nuevo_pedido->id . ".pdf";
        // $nuevo_pedido->save();

        $social = Social::first();

        $total = $nuevo_pedido->pedido_detalles->sum("subtotal");

        $productos_txt  = "";
        foreach ($nuevo_pedido->pedido_detalles as $item) {
            $productos_txt .= "\nCódigo de Producto: " . $item->producto->codigo .
                ", Producto: " . $item->producto->nombre .
                ", Precio: " . number_format($item->precio, 2, ".", ",") . " Bs." .
                ", Cantidad: " . $item->cantidad .
                ", Total: " . number_format($item->subtotal, 2, ".", ",");
        }

        $productos_txt .= "\n\nPedido Total: " . number_format($total, 2, ".", ",") . " Bs.";

        $mensaje = "Hola, revisé tu catálogo digital, me interesan los siguientes productos:" . $productos_txt;
        $whatsapp = "https://wa.me/" . $social->whatsapp . "?text=" . urlencode($mensaje);

        return response()->JSON([
            "message" => "Pedido creado exitosamente",
            "pedido_id" => $nuevo_pedido->id,
            "whatsapp" => $whatsapp
        ]);
    }
}
