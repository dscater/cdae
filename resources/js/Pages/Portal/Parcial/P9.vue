<script setup>
import { watch, nextTick, onMounted } from "vue";
import "aos/dist/aos.css";
import AOS from "aos";
import { useSocialStore } from "@/stores/social/socialStore";
const socialStore = useSocialStore();
const props = defineProps({
    productos: {
        type: Array,
        default: [],
    },
});
socialStore.initSocial();

const formatUrl = (url) => {
    if (!url) return "#";
    return url.startsWith("http") ? url : `https://${url}`;
};

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
    <div class="p9 pagina">
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
                            <button
                                @click="agregarProducto(productos[3])"
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
                            <button
                                @click="agregarProducto(productos[4])"
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
                            <button
                                @click="agregarProducto(productos[5])"
                                data-aos="fade-up"
                                data-aos-duration="600"
                                data-aos-delay="200"
                            >
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img :src="productos[6].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[7].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[8].url_imagen" alt="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="nombre">{{ productos[6].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[6].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[6].moneda }} {{ productos[6].precio }}
                        </div>
                        <div class="accion">
                            <button
                                @click="agregarProducto(productos[6])"
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
                        <div class="nombre">{{ productos[7].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[7].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[7].moneda }} {{ productos[7].precio }}
                        </div>
                        <div class="accion">
                            <button
                                @click="agregarProducto(productos[7])"
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
                        <div class="nombre">{{ productos[8].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[8].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[8].moneda }} {{ productos[8].precio }}
                        </div>
                        <div class="accion">
                            <button
                                @click="agregarProducto(productos[8])"
                                data-aos="fade-up"
                                data-aos-duration="600"
                                data-aos-delay="200"
                            >
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a
                            :href="`https://wa.me/${socialStore.oSocial.whatsapp}?text=Hola%20deseo%20mas%20informacion`"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            <i class="fab fa-whatsapp"></i>
                            {{ socialStore.oSocial.whatsapp }}
                        </a>
                        <a
                            v-if="socialStore.oSocial.facebook"
                            :href="formatUrl(socialStore.oSocial.facebook)"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.facebook }}
                        </a>
                        <a
                            v-if="socialStore.oSocial.tiktok"
                            :href="formatUrl(socialStore.oSocial.tiktok)"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.tiktok }}
                        </a>
                        <a
                            v-if="socialStore.oSocial.instagram"
                            :href="formatUrl(socialStore.oSocial.instagram)"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.instagram }}
                        </a>
                    </td>
                    <td>
                        <a
                            v-if="socialStore.oSocial.youtube"
                            :href="formatUrl(socialStore.oSocial.youtube)"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.youtube }}
                        </a>
                        <a
                            v-if="socialStore.oSocial.x"
                            :href="formatUrl(socialStore.oSocial.x)"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.x }}
                        </a>
                        <a
                            v-if="socialStore.oSocial.web"
                            :href="formatUrl(socialStore.oSocial.web)"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.web }}
                        </a>
                        <a
                            v-if="socialStore.oSocial.correo"
                            :href="`mailto:${socialStore.oSocial.correo}`"
                            target="_blank"
                            class="text-sm text-dark d-block text-center m-1"
                        >
                            {{ socialStore.oSocial.correo }}
                        </a>
                    </td>
                    <td>
                        {{ socialStore.oSocial.dir }}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style scoped>
.p9 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}

.p9 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p9 table tbody tr td {
    padding: 0;
    position: relative;
}

.p9 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p9 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p9 table tbody tr td div.nombre {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p9 table tbody tr td div.descripcion,
.p9 table tbody tr td div.descripcion2 {
    width: 100%;
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.p9 table tbody tr td div.precio {
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
    margin-top: 40px;
    min-height: 40px;
}

.p9 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p9 table tbody tr:nth-child(1) td:nth-child(1),
.p9 table tbody tr:nth-child(1) td:nth-child(2),
.p9 table tbody tr:nth-child(1) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 2 */
.p9 table tbody tr:nth-child(2) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p9 table tbody tr:nth-child(2) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p9 table tbody tr:nth-child(2) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}

/* FILA 3 */
.p9 table tbody tr:nth-child(3) td:nth-child(1),
.p9 table tbody tr:nth-child(3) td:nth-child(2),
.p9 table tbody tr:nth-child(3) td:nth-child(3) {
    width: 181px;
    min-height: 180px;
    height: 200px;
}

/* FILA 4 */
.p9 table tbody tr:nth-child(4) div.nombre {
    font-weight: bold;
    font-size: 15pt;
}

.p9 table tbody tr:nth-child(4) div.descripcion {
    font-weight: normal;
    font-size: 12pt;
    min-height: auto;
    height: auto;
}

.p9 table tbody tr:nth-child(4) div.precio {
    font-weight: bold;
    font-size: 12pt;
    margin: 0;
}

/* FILA 5 */
.p9 table tbody tr:nth-child(5) td:nth-child(1) .contenido {
    height: 245px;
}

.p9 table tbody tr:nth-child(5) td:nth-child(2) .nombre,
.p9 table tbody tr:nth-child(5) td:nth-child(2) .precio,
.p9 table tbody tr:nth-child(5) td:nth-child(2) .accion,
.p9 table tbody tr:nth-child(5) td:nth-child(2) .descripcion,
.p9 table tbody tr:nth-child(5) td:nth-child(2) .descripcion2 {
    width: auto;
}

.p9 table tbody tr:nth-child(5) td:nth-child(2) .descripcion,
.p9 table tbody tr:nth-child(5) td:nth-child(2) .descripcion2 {
    margin-top: 10px;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
