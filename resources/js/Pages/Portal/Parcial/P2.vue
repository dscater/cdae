<script setup>
const props = defineProps({
    productos: {
        type: Array,
        default: [],
    },
});
</script>
<template>
    <div class="p2 pagina">
        <table>
            <tbody>
                <tr>
                    <td>
                        <img :src="productos[0].url_imagen" alt="" />
                    </td>
                    <td rowspan="4">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${productos[1].url_imagen})`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="parte1">
                                <div class="nombre">
                                    {{ productos[1].nombre }}
                                </div>
                                <div class="descripcion">
                                    {{
                                        productos[1].producto_descripcions[0]
                                            .descripcion
                                    }}
                                </div>
                            </div>
                            <div class="parte2">
                                <div class="precio">
                                    {{ productos[1].moneda }}
                                    {{ productos[1].precio }}
                                </div>
                                <div class="accion">
                                    <button @click="alert('asdasd')">
                                        <i class="fa fa-cart-plus"></i>
                                        <span>Agregar</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="nombre">{{ productos[0].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[0].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[0].moneda }} {{ productos[0].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img :src="productos[2].url_imagen" alt="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="nombre">{{ productos[2].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[2].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[2].moneda }} {{ productos[2].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr class="fila5">
                    <td colspan="2">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${
                                    productos[3].url_imagen
                                })`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="nombre">
                                {{ productos[3].nombre }}
                            </div>
                            <div class="descripcion">
                                {{
                                    productos[3].producto_descripcions[0]
                                        .descripcion
                                }}
                            </div>
                            <div class="precio">
                                {{ productos[3].moneda }}
                                {{ productos[3].precio }}
                            </div>
                            <div class="accion">
                                <button @click="alert('asdasd')">
                                    <i class="fa fa-cart-plus"></i>
                                    <span>Agregar</span>
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style scoped>
.p2 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}
.p2 table tbody tr td {
    padding: 0;
    position: relative;
}

.p2 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p2 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p2 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p2 table tbody tr td div.nombre {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p2 table tbody tr td div.descripcion {
    width: 100%;
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.p2 table tbody tr td div.precio {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
}

.p2 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p2 table tbody tr:nth-child(1) td:nth-child(1) {
    width: 35%;
    min-height: 221px;
    overflow: hidden;
}
.p2 table tbody tr:nth-child(1) td:nth-child(1) img,
.p2 table tbody tr:nth-child(3) td:nth-child(1) img {
    min-height: 190px;
}

.p2 table tbody tr:nth-child(1) td:nth-child(2) .contenido {
    display: flex;
    height: 100%;
    width: 100%;
    position: relative;
    align-items: end;
}
.p2 table tbody tr:nth-child(1) td:nth-child(2) .contenido .parte1,
.p2 table tbody tr:nth-child(1) td:nth-child(2) .contenido .parte2 {
    padding-bottom: 20px;
}
.p2 table tbody tr:nth-child(1) td:nth-child(2) .contenido .parte1 .nombre {
    padding-bottom: 30px;
}

.p2 table tbody tr:nth-child(1) td:nth-child(2) div {
    width: 100%;
    text-align: center;
}
.p2 table tbody tr:nth-child(1) td:nth-child(2) div.accion button:hover {
    background-color: white;
}

/* FILA 5 */

.p2 table tbody tr:nth-child(5) td .contenido {
    height: 143px;
    width: 100%;
}

.p2 table tbody tr:nth-child(5) td .contenido .nombre {
    text-align: left;
    padding-left: 30px;
}
.p2 table tbody tr:nth-child(5) td .contenido .precio,
.p2 table tbody tr:nth-child(5) td .contenido .accion,
.p2 table tbody tr:nth-child(5) td .contenido .descripcion {
    text-align: right;
    padding-right: 40px;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
