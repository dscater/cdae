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
            </div>
            <div class="div2">
                <div class="nombre">{{ productos[0].nombre }}</div>
                <div class="descripcion">
                    {{ productos[0].producto_descripcions[0].descripcion }}
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
            </div>
            <div class="div3">
                <img :src="productos[1].url_imagen" alt="" />
            </div>
            <div class="div4">
                <img :src="productos[2].url_imagen" alt="" />
            </div>
            <div class="div5">
                <img :src="productos[3].url_imagen" alt="" />
            </div>
            <div class="div6">
                <div class="nombre">{{ productos[1].nombre }}</div>
                <div class="descripcion">
                    {{ productos[1].producto_descripcions[0].descripcion }}
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
            </div>
            <div class="div7">
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
            <div class="div8">
                <div class="nombre">{{ productos[3].nombre }}</div>
                <div class="descripcion">
                    {{ productos[3].producto_descripcions[0].descripcion }}
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
            </div>
            <div class="div9">
                <img :src="productos[4].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">
                        {{ productos[4].nombre }}
                    </div>
                    <div class="descripcion">
                        {{ productos[4].producto_descripcions[0].descripcion }}
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
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: 24% 25% 16% 35%;
    width: 100%;
    height: 100%;
}

.parent > div {
    padding: 12px 5px;
    box-sizing: border-box;
}

.div1 {
    padding-left: 16px !important;
    grid-column: span 2 / span 2;
}

.div2 {
    grid-column-start: 3;
}

.div3 {
    padding-left: 16px !important;
    grid-row-start: 2;
}

.div4 {
    grid-row-start: 2;
}

.div5 {
    grid-row-start: 2;
    padding-right: 16px !important;
}

.div7 {
    padding-left: 16px !important;
    grid-row-start: 3;
}

.div9 {
    grid-column: span 3 / span 3;
    padding: 0px !important;
    position: relative;
}

.contenido {
    position: absolute;
    top: 0;
    right: 0;
    width: 50%;
    text-align: center;
}
</style>
