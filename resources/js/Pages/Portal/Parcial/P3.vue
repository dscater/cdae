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
    grid-template-columns: 65% 1fr;
    grid-template-rows: 50% 50%;
}

.parent > div {
    padding: 12px 20px;
    box-sizing: border-box;
}

.div1 {
    grid-row: span 2 / span 2;
    padding: 0px 5px 0px 0px !important;
    position: relative;
}

.div1 .contenido {
    width: 100%;
    background-color: rgba(255, 255, 255, 0.5);
    position: absolute;
    left: 0;
    padding-left: 1rem;
    bottom: 0rem;
    grid-template-columns: 1fr 1fr !important;
    grid-template-rows: 1fr !important;
}

.div1 .contenido .parte1 .nombre {
    font-size: 1.5rem;
}
.div1 .contenido .parte1 .nombre,
.div1 .contenido .parte1 .descripcion {
    text-align: left;
}
.div1 .contenido .parte1 .descripcion {
    margin-top: 1rem;
}

.div1 .contenido .parte1,
.div1 .contenido .parte2 {
    display: grid;
    grid-column: 1fr;
    grid-template-rows: auto 3.5rem;
}
.div1 .contenido .parte2 {
    grid-template-rows: 2.3rem 3.5rem;
}

.div2 img,
.div3 img {
    height: 65%;
}

.div3 {
    grid-column-start: 2;
}
</style>
