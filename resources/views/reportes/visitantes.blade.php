<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Visitantes</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 9pt;
        }

        table tbody tr td {
            font-size: 8pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            height: 70px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 250px;
            text-align: center;
            margin: auto;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
            text-align: center;
            margin: auto;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .bg-principal {
            background: #153f59;
            color: white;
        }

        .img_celda img {
            width: 45px;
        }

        .bold {
            font-weight: bold;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    <div class="encabezado">
        <div class="logo">
            <img src="{{ $configuracion->first()->logo_b64 }}">
        </div>
        <h2 class="titulo">
            {{ $configuracion->first()->nombre_sistema }}
        </h2>
        <h4 class="texto">VISITANTES DEL CATÁLOGO</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>
    <table border="1">
        <thead class="bg-principal">
            <tr>
                <th width="3%">N°</th>
                <th>IP</th>
                <th>MÓVIL</th>
                <th>PC</th>
                <th>CHROME</th>
                <th>FIREFOX</th>
                <th>FACEBOOK</th>
                <th>INSTAGRAM</th>
                <th>X</th>
                <th>YOUTUBE</th>
                <th>GOOGLE</th>
            </tr>
        </thead>
        <tbody>
            @php
                $cont = 1;
            @endphp
            @foreach ($visitantes as $visitante)
                <tr>
                    <td class="centreado">{{ $cont++ }}</td>
                    <td class="">{{ $visitante->ip }}</td>
                    <td class="">{{ $visitante->movil }}</td>
                    <td class="">{{ $visitante->pc }}</td>
                    <td class="">{{ $visitante->chrome }}</td>
                    <td class="">{{ $visitante->firefox }}</td>
                    <td class="">{{ $visitante->facebook }}</td>
                    <td class="">{{ $visitante->instagram }}</td>
                    <td class="">{{ $visitante->x }}</td>
                    <td class="">{{ $visitante->youtube }}</td>
                    <td class="">{{ $visitante->google }}</td>
                </tr>
            @endforeach
            <tr>
                <td class="bold" colspan="2">
                    TOTALES
                </td>
                <td class="bold">{{ $totales['total_movil'] }}</td>
                <td class="bold">{{ $totales['total_pc'] }}</td>
                <td class="bold">{{ $totales['total_chrome'] }}</td>
                <td class="bold">{{ $totales['total_firefox'] }}</td>
                <td class="bold">{{ $totales['total_facebook'] }}</td>
                <td class="bold">{{ $totales['total_instagram'] }}</td>
                <td class="bold">{{ $totales['total_x'] }}</td>
                <td class="bold">{{ $totales['total_youtube'] }}</td>
                <td class="bold">{{ $totales['total_google'] }}</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
