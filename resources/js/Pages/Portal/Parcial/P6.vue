<script setup>
import { watch, nextTick, onMounted } from "vue";
import "aos/dist/aos.css";
import AOS from "aos";
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

onMounted(async () => {
    AOS.init({
        duration: 800,
        easing: "ease-in-out",
        mirror: false,
        startEvent: "load", // inicia al cargar
        once: true, // solo una vez
        offset: 0, // sin esperar scroll
    });
    await nextTick();
    AOS.refreshHard();
});
</script>
<template>
    <div class="p6 pagina">
        <table>
            <tbody>
                <tr>
                    <td colspan="2">
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
                            <div class="nombre">
                                {{ productos[0].nombre }}
                            </div>
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
                            <div class="descripcion3">
                                {{
                                    productos[0].producto_descripcions[2]
                                        .descripcion
                                }}
                            </div>
                            <div class="precio">
                                {{ productos[0].moneda }}
                                {{ productos[0].precio }}
                            </div>
                            <div class="accion">
                                <button
                                    @click="agregarProducto(productos[0])"
                                    data-aos="fade-up"
                                    data-aos-duration="600"
                                    data-aos-delay="200"
                                >
                                    <i class="fa fa-cart-plus"></i>
                                    <span>Agregar</span>
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${
                                    productos[1].url_imagen
                                })`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="nombre">
                                {{ productos[1].nombre }}
                            </div>
                            <div class="descripcion">
                                {{
                                    productos[1].producto_descripcions[0]
                                        .descripcion
                                }}
                            </div>

                            <div class="precio">
                                {{ productos[1].moneda }}
                                {{ productos[1].precio }}
                            </div>
                            <div class="accion">
                                <button
                                    @click="agregarProducto(productos[1])"
                                    data-aos="fade-up"
                                    data-aos-duration="600"
                                    data-aos-delay="200"
                                >
                                    <i class="fa fa-cart-plus"></i>
                                    <span>Agregar</span>
                                </button>
                            </div>
                        </div>
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
                        <div class="descripcion2">
                            {{
                                productos[2].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="descripcion3">
                            {{
                                productos[2].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[2].moneda }} {{ productos[2].precio }}
                        </div>
                        <div class="accion">
                            <button
                                @click="agregarProducto(productos[2])"
                                data-aos="fade-up"
                                data-aos-duration="600"
                                data-aos-delay="200"
                            >
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <img :src="productos[2].url_imagen" alt="" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style scoped>
.p6 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}
.p6 table tbody tr td {
    padding: 0;
    position: relative;
}

.p6 table tbody tr td div.accion {
    text-align: center;
}

.p6 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p6 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p6 table tbody tr td div.nombre {
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p6 table tbody tr td div.descripcion {
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.p6 table tbody tr td div.precio {
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
}

.p6 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido {
    min-height: 270px;
    display: flex;
    flex-direction: column;
    justify-content: end;
    align-items: end;
    padding-bottom: 10px;
}

.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .nombre,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion2,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion3,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .accion,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .precio {
    text-align: center;
    width: 38%;
}

.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion2,
.p6 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion3 {
    margin-top: 8px;
}

.p6 table tbody tr:nth-child(1) td:nth-child(1) img {
    min-height: 300px;
    object-fit: fill;
    height: 100%;
    width: 100%;
}

/* FILA 2 */
.p6 table tbody tr:nth-child(2) td:nth-child(1) .contenido {
    width: 100%;
    min-height: 150px;
}

/* FILA 3 */
.p6 table tbody tr:nth-child(3) td:nth-child(2) {
    min-height: 300px;
    width: 65%;
}
.p6 table tbody tr:nth-child(3) td:nth-child(2) img {
    min-height: 300px;
}

.p6 table tbody tr:nth-child(3) td:nth-child(1) .descripcion,
.p6 table tbody tr:nth-child(3) td:nth-child(1) .descripcion2,
.p6 table tbody tr:nth-child(3) td:nth-child(1) .descripcion3 {
    margin-top: 16px;
    width: 100%;
    text-align: center;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
