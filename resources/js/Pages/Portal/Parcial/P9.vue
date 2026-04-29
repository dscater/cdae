<script setup>
import { watch, nextTick, onMounted } from "vue";
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

onMounted(async () => {});
</script>
<template>
    <div class="pagina">
        <div class="parent">
            <div class="div1">
                <img :src="productos[0].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">
                        {{ productos[0].nombre }}
                    </div>
                    <div class="descripcion">
                        {{ productos[0].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[0].moneda }} {{ productos[0].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[0])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div2">
                <img :src="productos[1].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[1].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[1].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[1].moneda }} {{ productos[1].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[1])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div3">
                <img :src="productos[2].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[2].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[2].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[2].moneda }} {{ productos[2].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[2])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div4">
                <img :src="productos[3].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[3].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[3].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[3].moneda }} {{ productos[3].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[3])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div5">
                <img :src="productos[4].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[4].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[4].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[4].moneda }} {{ productos[4].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[4])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div6">
                <img :src="productos[5].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[5].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[5].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[5].moneda }} {{ productos[5].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[5])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div7">
                <img :src="productos[6].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[6].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[6].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[6].moneda }} {{ productos[6].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[6])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div8">
                <img :src="productos[7].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[7].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[7].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[7].moneda }} {{ productos[7].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[7])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div9">
                <img :src="productos[8].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[8].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[8].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[8].moneda }} {{ productos[8].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[8])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div10">
                <div class="parte1">
                    <a
                        :href="`https://wa.me/${socialStore.oSocial.whatsapp}?text=Hola%20deseo%20mas%20informacion`"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fab fa-whatsapp"></i>
                        <span>
                            {{ socialStore.oSocial.whatsapp }}
                        </span>
                    </a>
                    <a
                        v-if="socialStore.oSocial.facebook"
                        :href="formatUrl(socialStore.oSocial.facebook)"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fab fa-facebook"></i>
                        <span>
                            {{ socialStore.oSocial.facebook }}
                        </span>
                    </a>
                    <a
                        v-if="socialStore.oSocial.tiktok"
                        :href="formatUrl(socialStore.oSocial.tiktok)"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fab fa-tiktok"></i>
                        <span>
                            {{ socialStore.oSocial.tiktok }}
                        </span>
                    </a>
                </div>
                <div class="parte2">
                    <a
                        v-if="socialStore.oSocial.instagram"
                        :href="formatUrl(socialStore.oSocial.instagram)"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fab fa-instagram"></i>
                        <span>
                            {{ socialStore.oSocial.instagram }}
                        </span>
                    </a>
                    <a
                        v-if="socialStore.oSocial.youtube"
                        :href="formatUrl(socialStore.oSocial.youtube)"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fab fa-youtube"></i>
                        <span>
                            {{ socialStore.oSocial.youtube }}
                        </span>
                    </a>
                    <a
                        v-if="socialStore.oSocial.x"
                        :href="formatUrl(socialStore.oSocial.x)"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fab fa-twitter"></i>
                        <span>
                            {{ socialStore.oSocial.x }}
                        </span>
                    </a>
                </div>
                <div class="parte3">
                    <a
                        v-if="socialStore.oSocial.web"
                        :href="formatUrl(socialStore.oSocial.web)"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fa fa-globe"></i>
                        <span>
                            {{ socialStore.oSocial.web }}
                        </span>
                    </a>
                    <a
                        v-if="socialStore.oSocial.correo"
                        :href="`mailto:${socialStore.oSocial.correo}`"
                        target="_blank"
                        class="text-sm text-dark d-block m-1"
                    >
                        <i class="fa fa-envelope"></i>
                        <span>
                            {{ socialStore.oSocial.correo }}
                        </span>
                    </a>
                </div>
                <div class="parte4">
                    <i class="fa fa-building mr-1"></i>
                    <span>
                        {{ socialStore.oSocial.dir }}
                    </span>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
.pagina {
    height: 100%;
    width: 100%;
    box-sizing: border-box;
}
.parent {
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: 29% 29% 29% 13%;

    gap: 10px 10px;
    padding: 10px;
}

.div1 img,
.div2 img,
.div3 img,
.div4 img,
.div5 img,
.div6 img,
.div7 img,
.div8 img,
.div9 img {
    height: 60%;
}

.div1 .contenido,
.div2 .contenido,
.div3 .contenido,
.div4 .contenido,
.div5 .contenido,
.div6 .contenido,
.div7 .contenido,
.div8 .contenido,
.div9 .contenido {
    position: relative;
}

.div1 .contenido .nombre,
.div2 .contenido .nombre,
.div3 .contenido .nombre,
.div4 .contenido .nombre,
.div5 .contenido .nombre,
.div6 .contenido .nombre,
.div7 .contenido .nombre,
.div8 .contenido .nombre,
.div9 .contenido .nombre {
    position: absolute;
    background-color: rgba(255, 255, 255, 0.5);
    top: -31px;
    left: 50%;
    line-height: 1rem;
    height: 2rem;
    transform: translate(-50%);
}

.div1 .contenido .descripcion,
.div2 .contenido .descripcion,
.div3 .contenido .descripcion,
.div4 .contenido .descripcion,
.div5 .contenido .descripcion,
.div6 .contenido .descripcion,
.div7 .contenido .descripcion,
.div8 .contenido .descripcion,
.div9 .contenido .descripcion {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: end;
}

.div10 {
    grid-column: span 3 / span 3;
    display: grid;
    grid-template-columns: 25% 25% 25% 25%;
}
.div10 a {
    display: flex;
    justify-content: start;
    align-items: center;
    width: 100%;
}

.div10 a i {
    margin-right: 5px;
}

@media (max-width: 900px) {
    .div10 a {
        text-align: center;
    }
    .div10 a span {
        display: none;
    }
}
</style>
