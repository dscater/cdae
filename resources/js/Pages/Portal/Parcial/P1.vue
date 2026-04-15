<script setup>
const props = defineProps({
    productos: {
        type: Array,
        default: [],
    },
});

const emits = defineEmits(["agregar"]);
const agregarProducto = (item) => {
    emits("agregar", item);
};
</script>
<template>
    <div class="p1 pagina">
        <table>
            <tbody>
                <tr>
                    <td colspan="2">
                        <img :src="productos[0].url_imagen" alt="" />
                    </td>
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
                            <button @click="agregarProducto(productos[0])">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img :src="productos[1].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[2].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[3].url_imagen" alt="" />
                    </td>
                </tr>
                <tr>
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
                            <button @click="agregarProducto(productos[1])">
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
                            <button @click="agregarProducto(productos[2])">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
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
                            <button @click="agregarProducto(productos[3])">
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
                                <button @click="agregarProducto(productos[4])">
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
.p1 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}

.p1 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p1 table tbody tr td {
    padding: 0;
    position: relative;
}

.p1 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p1 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p1 table tbody tr td div.nombre {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p1 table tbody tr td div.descripcion {
    width: 100%;
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
    min-height: 80px;
}

.p1 table tbody tr td div.precio {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
    margin-top: 40px;
    min-height: 40px;
}

.p1 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p1 table tbody tr:nth-child(1) td:nth-child(1) {
    width: 70%;
    height: 221px;
    overflow: hidden;
}

.p1 table tbody tr:nth-child(1) td:nth-child(2) {
    vertical-align: top;
}
.p1 table tbody tr:nth-child(1) td:nth-child(2) div {
    position: absolute;
}

.p1 table tbody tr:nth-child(1) td:nth-child(2) div.descripcion {
    top: 24%;
}

.p1 table tbody tr:nth-child(1) td:nth-child(2) div.precio {
    bottom: 60px;
}
.p1 table tbody tr:nth-child(1) td:nth-child(2) div.accion {
    bottom: 20px;
}

/* FILA 2 */
.p1 table tbody tr:nth-child(2) td:nth-child(1),
.p1 table tbody tr:nth-child(2) td:nth-child(2),
.p1 table tbody tr:nth-child(2) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 3 */
.p1 table tbody tr:nth-child(3) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p1 table tbody tr:nth-child(3) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p1 table tbody tr:nth-child(3) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}
/* FILA 4 */
.p1 table tbody tr:nth-child(4) td .contenido {
    position: relative;
    width: 100%;
    height: 245px;
}

.p1 table tbody tr:nth-child(4) td .contenido .nombre,
.p1 table tbody tr:nth-child(4) td .contenido .precio,
.p1 table tbody tr:nth-child(4) td .contenido .accion,
.p1 table tbody tr:nth-child(4) td .contenido .descripcion {
    position: absolute;
    width: auto;
    right: 20px;
}

.p1 table tbody tr:nth-child(4) td .contenido .descripcion {
    top: 20%;
}

.p1 table tbody tr:nth-child(4) td .contenido .precio {
    top: 40%;
}

.p1 table tbody tr:nth-child(4) td .contenido .accion {
    bottom: 10px;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
