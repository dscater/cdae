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
                    <div class="parte1">
                        <div class="nombre">
                            {{ productos[6].nombre }}
                        </div>
                    </div>
                    <div class="parte2">
                        <div class="descripcion">
                            {{
                                productos[6].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[6].moneda }}
                            {{ productos[6].precio }}
                        </div>
                        <div class="accion">
                            <button @click="agregarProducto(productos[6])">
                                <span>Agregar</span>
                                <i class="fa fa-cart-plus"></i>
                            </button>
                        </div>
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
    grid-template-rows: 41% 41% 18%;
    gap: 0px 7px;
}

.parent > div {
    padding: 5px 0px;
    box-sizing: border-box;
}

.parent > .div1,
.parent > .div4 {
    padding-left: 20px;
}

.parent > .div3,
.parent > .div6 {
    padding-right: 20px;
}

.div1 img,
.div2 img,
.div3 img,
.div4 img,
.div5 img,
.div6 img {
    height: 63%;
}

.div7 {
    grid-column: span 3 / span 3;
    padding: 10px 0px 0px 0px !important;
    position: relative;
    max-height: 100%;
}

.div7 .contenido {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-columns: 1fr 40% !important;
    grid-template-rows: 1fr auto !important;
}

.div7 .contenido .parte1 {
    height: 100%;
    display: flex;
    align-items: end;
    grid-column: 1;
    grid-row: 2;
    padding-left: 20px;
}

.div7 .contenido .parte1 .nombre {
    background-color: rgba(255, 255, 255, 0.5);
    font-size: 1.3rem;
    text-align: left;
}

.div7 .contenido .parte2 {
    grid-column: 2;
    grid-row: 1/3;
    background-color: rgba(255, 255, 255, 0.5);
    padding-top: 20px;
    padding-bottom: 20px;
    height: 100%;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
}
</style>
