<script setup>
import { watch, nextTick, onMounted } from "vue";
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

onMounted(async () => {});
</script>
<template>
    <div class="p8 pagina">
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
                        <div class="descripcion2">
                            {{
                                productos[0].producto_descripcions[1]
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
                    <td>
                        <div class="nombre">{{ productos[1].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[1].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="descripcion2">
                            {{
                                productos[1].producto_descripcions[1]
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
                        <div class="descripcion2">
                            {{
                                productos[2].producto_descripcions[1]
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
                        <div class="descripcion2">
                            {{
                                productos[3].producto_descripcions[1]
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
                    <td>
                        <div class="nombre">{{ productos[4].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[4].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="descripcion2">
                            {{
                                productos[4].producto_descripcions[1]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[4].moneda }} {{ productos[4].precio }}
                        </div>
                        <div class="accion">
                            <button @click="agregarProducto(productos[4])">
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
                        <div class="descripcion2">
                            {{
                                productos[5].producto_descripcions[1]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[5].moneda }} {{ productos[5].precio }}
                        </div>
                        <div class="accion">
                            <button @click="agregarProducto(productos[5])">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
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
                        ></div>
                    </td>
                    <td>
                        <div class="nombre">
                            {{ productos[4].nombre }}
                        </div>
                        <div class="descripcion">
                            {{
                                productos[4].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="descripcion2">
                            {{
                                productos[4].producto_descripcions[1]
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
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style scoped>
.p8 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}

.p8 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p8 table tbody tr td {
    padding: 0;
    position: relative;
}

.p8 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p8 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p8 table tbody tr td div.nombre {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p8 table tbody tr td div.descripcion,
.p8 table tbody tr td div.descripcion2 {
    width: 100%;
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.p8 table tbody tr td div.precio {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
    margin-top: 40px;
    min-height: 40px;
}

.p8 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p8 table tbody tr:nth-child(1) td:nth-child(1),
.p8 table tbody tr:nth-child(1) td:nth-child(2),
.p8 table tbody tr:nth-child(1) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 2 */
.p8 table tbody tr:nth-child(2) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p8 table tbody tr:nth-child(2) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p8 table tbody tr:nth-child(2) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}

/* FILA 3 */
.p8 table tbody tr:nth-child(3) td:nth-child(1),
.p8 table tbody tr:nth-child(3) td:nth-child(2),
.p8 table tbody tr:nth-child(3) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 4 */
.p8 table tbody tr:nth-child(4) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p8 table tbody tr:nth-child(4) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p8 table tbody tr:nth-child(4) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}

/* FILA 5 */
.p8 table tbody tr:nth-child(5) td:nth-child(1) .contenido {
    height: 245px;
}

.p8 table tbody tr:nth-child(5) td:nth-child(2) .nombre,
.p8 table tbody tr:nth-child(5) td:nth-child(2) .precio,
.p8 table tbody tr:nth-child(5) td:nth-child(2) .accion,
.p8 table tbody tr:nth-child(5) td:nth-child(2) .descripcion,
.p8 table tbody tr:nth-child(5) td:nth-child(2) .descripcion2 {
    width: auto;
}

.p8 table tbody tr:nth-child(5) td:nth-child(2) .descripcion,
.p8 table tbody tr:nth-child(5) td:nth-child(2) .descripcion2 {
    margin-top: 10px;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
