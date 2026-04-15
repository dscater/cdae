<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Catalogo_{{ $catalogo->id }}</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 0.5cm;
            margin-bottom: 0.8cm;
            margin-left: 0.5cm;
            margin-right: 0.5cm;
            text-align: center;
        }

        .img_catalogo {
            max-height: 95%;
            width: 95%;
        }

        .siguiente {
            page-break-after: always;
        }

        .titulo {
            width: 100%;
            text-align: center;
            margin-top: -10px;
        }

        .codigo {
            text-align: left;
            padding-left: 17px;
        }
    </style>
</head>

<body>
    @php
        $cont = 0;
    @endphp
    @foreach ($productos as $item)
        {{-- <img class="img_catalogo" src="{{ $item->imagen_b64 }}" alt=""> --}}
        <div class="titulo">{{ $catalogo->nombre }}</div>
        <div class="codigo">{{ $item->codigo }}</div>
        <img class="img_catalogo" src="{{ public_path('imgs/productos/' . $item->imagen) }}" alt="">
        @php
            $cont++;
        @endphp
        @if ($cont < count($productos))
            <div class="siguiente"></div>
        @endif
    @endforeach
</body>

</html>
