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
    <div class="pagina">
        <div class="parent">
            <div class="div1">
                <img :src="productos[0].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">{{ productos[0].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[0].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="descripcion2">
                        {{ productos[0].producto_descripcions[1].descripcion }}
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
                    <div class="descripcion2">
                        {{ productos[1].producto_descripcions[1].descripcion }}
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
                    <div class="descripcion2">
                        {{ productos[2].producto_descripcions[1].descripcion }}
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
                    <div class="descripcion2">
                        {{ productos[3].producto_descripcions[1].descripcion }}
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
                    <div class="descripcion2">
                        {{ productos[4].producto_descripcions[1].descripcion }}
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
                    <div class="descripcion2">
                        {{ productos[5].producto_descripcions[1].descripcion }}
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
            </div>
            <div class="div8">
                <div class="contenido">
                    <div class="nombre">
                        {{ productos[4].nombre }}
                    </div>
                    <div class="descripcion">
                        {{ productos[4].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="descripcion2">
                        {{ productos[4].producto_descripcions[1].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[4].moneda }}
                        {{ productos[4].precio }}
                    </div>
                    <div class="accion">
                        <button @click="agregarProducto(productos[4])">
                            <span>Agregar</span>
                            <i class="fa fa-cart-plus"></i>
                        </button>
                    </div>
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
    grid-template-rows: 33% 33% 34%;
    gap: 10px 10px;
    padding: 10px;
}

.div1 img,
.div2 img,
.div3 img,
.div4 img,
.div5 img,
.div6 img {
    height: 60%;
}

.div1 .contenido,
.div2 .contenido,
.div3 .contenido,
.div4 .contenido,
.div5 .contenido,
.div6 .contenido {
    grid-template-rows: auto !important;
}
.div4,
.div5,
.div6 {
    margin-top: 10px;
}

.div1 .contenido .descripcion,
.div2 .contenido .descripcion,
.div3 .contenido .descripcion,
.div4 .contenido .descripcion,
.div5 .contenido .descripcion,
.div6 .contenido .descripcion,
.div1 .contenido .descripcion2,
.div2 .contenido .descripcion2,
.div3 .contenido .descripcion2,
.div4 .contenido .descripcion2,
.div5 .contenido .descripcion2,
.div6 .contenido .descripcion2 {
    font-size: 0.8rem;
}
.div1 .contenido .nombre,
.div2 .contenido .nombre,
.div3 .contenido .nombre,
.div4 .contenido .nombre,
.div5 .contenido .nombre,
.div6 .contenido .nombre {
    font-size: 1rem;
}
.div1 .contenido .precio,
.div2 .contenido .precio,
.div3 .contenido .precio,
.div4 .contenido .precio,
.div5 .contenido .precio,
.div6 .contenido .precio {
    font-size: 1rem;
}

.div7 {
    margin-top: 15px;
    grid-column: span 2 / span 2;
}

.div8 {
    margin-top: 15px;
    grid-column-start: 3;
}

.div8 .contenido {
    padding: 10px 20px;
    padding-top: 15px;
}
.div8 .contenido .nombre {
    margin-bottom: 20px;
}

.div8 .contenido .descripcion,
.div8 .contenido .descripcion2 {
    margin-bottom: 20px;
}
</style>
