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
    <div class="p3 pagina">
        <table>
            <tbody>
                <tr>
                    <td rowspan="4">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${
                                    productos[0].url_imagen
                                })`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="parte1">
                                <div class="nombre">
                                    {{ productos[0].nombre }}
                                </div>
                                <div class="descripcion">
                                    {{
                                        productos[0].producto_descripcions[0]
                                            .descripcion
                                    }}
                                </div>
                            </div>
                            <div class="parte2">
                                <div class="precio">
                                    {{ productos[0].moneda }}
                                    {{ productos[0].precio }}
                                </div>
                                <div class="accion">
                                    <button
                                        @click="agregarProducto(productos[0])"
                                    >
                                        <i class="fa fa-cart-plus"></i>
                                        <span>Agregar</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <img :src="productos[1].url_imagen" alt="" />
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
                            <button @click="agregarProducto(productos[2])">
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
.p3 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}
.p3 table tbody tr td {
    padding: 0;
    position: relative;
}

.p3 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p3 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p3 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p3 table tbody tr td div.nombre {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p3 table tbody tr td div.descripcion {
    width: 100%;
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.p3 table tbody tr td div.precio {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
}

.p3 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p3 table tbody tr:nth-child(1) td:nth-child(1) {
    width: 60%;
    overflow: hidden;
}

.p3 table tbody tr:nth-child(1) td:nth-child(2) {
    height: 270px;
}

.p3 table tbody tr:nth-child(1) td:nth-child(1) .contenido {
    height: 100%;
    display: flex;
    align-items: end;
}

.p3 table tbody tr:nth-child(1) td:nth-child(1) .parte1 {
    padding-bottom: 45px;
    width: 50%;
}
.p3 table tbody tr:nth-child(1) td:nth-child(1) .parte2 {
    padding-bottom: 20px;
    width: 50%;
}

.p3 table tbody tr:nth-child(1) td:nth-child(2) div.accion button:hover {
    background-color: white;
}

/* FILA 2 */
.p3 table tbody tr:nth-child(2) td:nth-child(1) {
    text-align: left;
}

.p3 table tbody tr:nth-child(2) td .contenido .precio,
.p3 table tbody tr:nth-child(2) td .contenido .accion,
.p3 table tbody tr:nth-child(2) td .contenido .descripcion {
    text-align: right;
    padding-right: 40px;
}

/* FILA 3 */
.p3 table tbody tr:nth-child(3) td:nth-child(1) {
    text-align: left;
    height: 270px;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
