<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title inertia>{{ config('app.name', 'Laravel') }}</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.adobe.com/fonts/myriad-variable">

    <style>
        /* Font Pacifico  */
        @font-face {
            font-family: "Epunda_Slab";
            src: url("/webfonts/Epunda_Slab/EpundaSlab-VariableFont_wght.ttf") format("truetype");
            font-weight: 100 900;
            font-style: normal;
            font-display: swap;
        }

        @font-face {
            font-family: "Epunda_Slab";
            src: url("/webfonts/Epunda_Slab/EpundaSlab-Italic-VariableFont_wght.ttf") format("truetype");
            font-weight: 100 900;
            font-style: italic;
            font-display: swap;
        }

        /* Font Montserrat  */
        @font-face {
            font-family: "Montserrat";
            src: url("/webfonts/Montserrat/Montserrat-VariableFont_wght.ttf") format("truetype");
            font-weight: 100 900;
            font-style: normal;
            font-display: swap;
        }

        @font-face {
            font-family: "Montserrat";
            src: url("/webfonts/Montserrat/Montserrat-Italic-VariableFont_wght.ttf") format("truetype");
            font-weight: 100 900;
            font-style: italic;
            font-display: swap;
        }

        @font-face {
            font-family: "Myriad Variable Concept";
            src: url("https://db.onlinewebfonts.com/t/3a86b8ec8855002aad8b288eaba8915d.eot");
            src: url("https://db.onlinewebfonts.com/t/3a86b8ec8855002aad8b288eaba8915d.eot?#iefix")format("embedded-opentype"),
                url("https://db.onlinewebfonts.com/t/3a86b8ec8855002aad8b288eaba8915d.woff2")format("woff2"),
                url("https://db.onlinewebfonts.com/t/3a86b8ec8855002aad8b288eaba8915d.woff")format("woff"),
                url("https://db.onlinewebfonts.com/t/3a86b8ec8855002aad8b288eaba8915d.ttf")format("truetype"),
                url("https://db.onlinewebfonts.com/t/3a86b8ec8855002aad8b288eaba8915d.svg#Myriad Variable Concept")format("svg");
        }

        .nombre,
        .descripcion,
        .descripcion2,
        .descripcion3,
        .precio {
            font-family: "Myriad Variable Concept" !important;
        }
    </style>
    <link rel="stylesheet" href="{{ asset('css/paginas/1.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/2.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/3.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/4.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/5.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/6.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/7.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/8.css') }}">
    <link rel="stylesheet" href="{{ asset('css/paginas/9.css') }}">

    {{-- CSS --}}
    @routes
    @vite(['resources/js/app.js', "resources/js/Pages/{$page['component']}.vue"])
    @inertiaHead
</head>

<body class="app-blank layout-fixed layout-navbar-fixed">
    @inertia
</body>

</html>
