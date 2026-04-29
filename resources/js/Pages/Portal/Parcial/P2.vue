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
                    <div class="parte1">
                        <div class="nombre">{{ productos[1].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[1].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                    </div>
                    <div class="parte2">
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
                            <i class="fa fa-cart-plus"></i>
                            <span>Agregar</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="div4">
                <img :src="productos[3].url_imagen" alt="" />
                <div class="contenido">
                    <div class="parte1">
                        <div class="nombre">
                            {{ productos[3].nombre }}
                        </div>
                    </div>
                    <div class="parte2">
                        <div class="descripcion">
                            {{
                                productos[3].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[3].moneda }}
                            {{ productos[3].precio }}
                        </div>
                        <div class="accion">
                            <button @click="agregarProducto(productos[3])">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
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
    display: grid;
    grid-template-columns: 1fr 63%;
    grid-template-rows: 42% 42% 16%;
    width: 100%;
    height: 100%;
}

.parent > div {
    padding: 12px 20px;
    box-sizing: border-box;
}

.div1 img,
.div3 img {
    height: 58%;
}

.div2 {
    grid-row: span 2 / span 2;
    padding: 0px 0px 15px 0px !important;
    position: relative;
}

.div2 .contenido {
    background-color: rgba(255, 255, 255, 0.5);
    width: 100%;
    position: absolute;
    left: 0;
    padding-left: 1rem;
    padding-top: 0.5rem;
    bottom: 1rem;
    grid-template-columns: 1fr 1fr !important;
    grid-template-rows: 1fr !important;
}

.div2 .contenido .parte1 .nombre {
    font-size: 1.5rem;
}
.div2 .contenido .parte1 .nombre,
.div2 .contenido .parte1 .descripcion {
    text-align: left;
}
.div2 .contenido .parte1,
.div2 .contenido .parte2 {
    display: grid;
    grid-column: 1fr;
    grid-template-rows: 2rem 3.5rem;
}
.div2 .contenido .parte2 {
    grid-template-rows: 2.3rem 3.5rem;
}

.div4 {
    grid-column: span 2 / span 2;
    grid-row-start: 3;
    padding: 0 !important;
    position: relative;
}

.div4 .contenido {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-columns: 1fr 35% !important;
    grid-template-rows: auto 1fr !important;
}
.div4 .contenido .parte1 {
    grid-row: 1;
    grid-column: 1;
    padding-left: 30px;
}

.div4 .contenido .parte2 {
    grid-row: 1 / 3;
    grid-column: 2;
}

.div4 .contenido .parte1 {
    background-color: rgba(255, 255, 255, 0.5);
}

.div4 .contenido .parte1 .nombre {
    font-size: 1.3rem;
    text-align: left;
}

.div4 .contenido .parte2 {
    background-color: rgba(255, 255, 255, 0.7);
    padding-top: 20px;
    height: 100%;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
}
</style>
