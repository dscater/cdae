<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Pedido_{{ $nuevo_pedido->id }}</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.3cm;
            margin-left: 0.3cm;
            margin-right: 0.3cm;
        }

        .img_catalogo {
            max-height: 100%;
            width: 100%;
            height: auto;
        }

        .siguiente {
            page-break-after: always;
        }
    </style>
</head>

<body>
    @php
        $cont = 0;
    @endphp
    @foreach ($nuevo_pedido->pedido_detalles as $item)
        {{-- <img class="img_catalogo" src="{{ $item->imagen_b64 }}" alt=""> --}}
        <img class="img_catalogo" src="{{ public_path('imgs/productos/' . $item->producto->imagen) }}" alt="">
        @php
            $cont++;
        @endphp
        @if ($cont < count($nuevo_pedido->pedido_detalles) - 1)
            <div class="siguiente"></div>
        @endif
    @endforeach
</body>

</html>
