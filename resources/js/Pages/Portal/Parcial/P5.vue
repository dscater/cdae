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
                        <div class="descripcion2">
                            {{
                                productos[0].producto_descripcions[1]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[0].moneda }}
                            {{ productos[0].precio }}
                        </div>
                        <div class="accion">
                            <button @click="agregarProducto(productos[0])">
                                <span>Agregar</span>
                                <i class="fa fa-cart-plus"></i>
                            </button>
                        </div>
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
                    <div class="nombre">
                        {{ productos[3].nombre }}
                    </div>
                    <div class="descripcion">
                        {{ productos[3].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="descripcion2">
                        {{ productos[3].producto_descripcions[1].descripcion }}
                    </div>
                    <div class="precio">
                        {{ productos[3].moneda }}
                        {{ productos[3].precio }}
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
    grid-template-rows: 34% 34% 32%;
}

.parent > div {
    padding: 10px 0px;
    box-sizing: border-box;
}

.div1 {
    grid-column: span 3 / span 3;
    padding: 10px 0px 0px 0px !important;
    position: relative;
}

.div1 .contenido {
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    grid-template-columns: 1fr 40% !important;
    grid-template-rows: 60% 40% !important;
}

.parte1,
.parte2 {
    height: 100%;
    grid-row: 2;
    background-color: rgba(255, 255, 255, 0.5);
    padding-bottom: 20px;
}

.div1 .contenido .parte1 {
    display: grid;
    padding-left: 40px;
    align-items: end;
    align-content: end;
    grid-template-columns: 1fr;
    grid-template-rows: auto auto;
}

.div1 .contenido .parte1 .nombre {
    font-size: 1.3rem;
    text-align: left;
}

.div1 .contenido .parte1 .descripcion {
    text-align: left;
}

.div1 .contenido .parte2 {
    height: 100%;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
}

.div2 img,
.div3 img {
    height: 55%;
}

.div2 {
    padding-left: 10px !important;
    padding-right: 5px !important;
}
.div3 {
    padding-right: 10px !important;
    padding-left: 5px !important;
}
.div5 {
    padding-right: 10px !important;
}
.div4,
.div5 {
    padding-bottom: 0px !important;
}

.div1 {
    grid-column: span 3 / span 3;
}

.div2 {
    grid-row-start: 2;
}

.div3 {
    grid-row-start: 2;
}

.div4 {
    grid-row: span 2 / span 2;
    grid-row-start: 2;
    position: relative;
}

.div4 .contenido {
    width: 100%;
    background-color: rgba(255, 255, 255, 0.5);
    position: absolute;
    left: 0;
    bottom: 0;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: auto 1fr;
    padding-bottom: 20px;
}

.div4 .contenido .descripcion {
    margin-bottom: 14px;
}

.div5 {
    grid-column: span 2 / span 2;
    position: relative;
}

.div5 .contenido {
    background-color: rgba(255, 255, 255, 0.5);
    height: 100%;
    padding: 14px 0px;
    width: 50%;
    position: absolute;
    top: 0;
    right: 0;
    display: grid;
    grid-template-columns: 1fr 35%;
    grid-template-rows: auto auto auto auto auto;
}
.div5 .contenido .descripcion {
    margin-bottom: 10px;
}
.div5 .contenido .descripcion2 {
    display: flex;
    height: 100%;
    justify-content: center;
    align-items: end;
}
</style>
