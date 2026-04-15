<script setup>
const props = defineProps({
    productos: {
        type: Array,
        default: [],
    },
});
</script>
<template>
    <div class="p4 pagina">
        <table>
            <tbody>
                <tr>
                    <td>
                        <img :src="productos[0].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[1].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[2].url_imagen" alt="" />
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
                    <td>
                        <div class="nombre">{{ productos[1].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[1].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[1].moneda }} {{ productos[1].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
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
                <tr>
                    <td>
                        <img :src="productos[3].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[4].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[5].url_imagen" alt="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="nombre">{{ productos[3].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[3].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[3].moneda }} {{ productos[3].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="nombre">{{ productos[4].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[4].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[4].moneda }} {{ productos[4].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="nombre">{{ productos[5].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[5].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[5].moneda }} {{ productos[5].precio }}
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
                    <td colspan="3">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${
                                    productos[4].url_imagen
                                })`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="nombre">
                                {{ productos[4].nombre }}
                            </div>
                            <div class="descripcion">
                                {{
                                    productos[4].producto_descripcions[0]
                                        .descripcion
                                }}
                            </div>
                            <div class="precio">
                                {{ productos[4].moneda }}
                                {{ productos[4].precio }}
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
.p4 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}

.p4 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p4 table tbody tr td {
    padding: 0;
    position: relative;
}

.p4 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p4 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p4 table tbody tr td div.nombre {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p4 table tbody tr td div.descripcion {
    width: 100%;
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
    min-height: 80px;
}

.p4 table tbody tr td div.precio {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
    margin-top: 40px;
    min-height: 40px;
}

.p4 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p4 table tbody tr:nth-child(1) td:nth-child(1),
.p4 table tbody tr:nth-child(1) td:nth-child(2),
.p4 table tbody tr:nth-child(1) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 2 */
.p4 table tbody tr:nth-child(2) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p4 table tbody tr:nth-child(2) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p4 table tbody tr:nth-child(2) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}

/* FILA 3 */
.p4 table tbody tr:nth-child(3) td:nth-child(1),
.p4 table tbody tr:nth-child(3) td:nth-child(2),
.p4 table tbody tr:nth-child(3) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 4 */
.p4 table tbody tr:nth-child(4) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p4 table tbody tr:nth-child(4) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p4 table tbody tr:nth-child(4) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}

/* FILA 5 */
.p4 table tbody tr:nth-child(5) td .contenido {
    position: relative;
    width: 100%;
    height: 245px;
}

.p4 table tbody tr:nth-child(5) td .contenido .nombre,
.p4 table tbody tr:nth-child(5) td .contenido .precio,
.p4 table tbody tr:nth-child(5) td .contenido .accion,
.p4 table tbody tr:nth-child(5) td .contenido .descripcion {
    position: absolute;
    right: 20px;
    width: auto;
}

.p4 table tbody tr:nth-child(5) td .contenido .nombre {
    width: auto;
    left: 40px;
    text-align: left;
    bottom: 40px;
}

.p4 table tbody tr:nth-child(5) td .contenido .descripcion {
    top: 20%;
}

.p4 table tbody tr:nth-child(5) td .contenido .precio {
    top: 40%;
}

.p4 table tbody tr:nth-child(5) td .contenido .accion {
    bottom: 10px;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
