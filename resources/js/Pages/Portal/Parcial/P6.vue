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
                    <div class="nombre">
                        {{ productos[0].nombre }}
                    </div>
                    <div class="descripcion">
                        {{ productos[0].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="descripcion2">
                        {{ productos[0].producto_descripcions[1].descripcion }}
                    </div>
                    <div class="descripcion3">
                        {{ productos[0].producto_descripcions[2].descripcion }}
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
            <div class="div2">
                <img :src="productos[1].url_imagen" alt="" />
                <div class="contenido">
                    <div class="nombre">
                        {{ productos[1].nombre }}
                    </div>
                    <div class="descripcion">
                        {{ productos[1].producto_descripcions[0].descripcion }}
                    </div>

                    <div class="precio">
                        {{ productos[1].moneda }}
                        {{ productos[1].precio }}
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
                <div class="contenido">
                    <div class="nombre">{{ productos[2].nombre }}</div>
                    <div class="descripcion">
                        {{ productos[2].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="descripcion2">
                        {{ productos[2].producto_descripcions[0].descripcion }}
                    </div>
                    <div class="descripcion3">
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
                <img :src="productos[2].url_imagen" alt="" />
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
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: 40% 20% 40%;
    gap: 15px 0px;
}

.div1 {
    grid-column: span 2 / span 2;
    position: relative;
}

.div1 .contenido {
    height: 100%;
    background-color: rgba(255, 255, 255, 0.5);
    padding: 14px 0px;
    width: 40%;
    position: absolute;
    top: 0;
    right: 0;
    display: grid;
    grid-template-columns: 1fr 35%;
    grid-template-rows: auto auto auto auto auto;
}
.div1 .contenido .descripcion {
    margin-bottom: 10px;
}

.div1 .contenido .descripcion2 {
    margin-bottom: 10px;
}
.div1 .contenido .descripcion3 {
    display: flex;
    height: 100%;
    justify-content: center;
    align-items: end;
}

.div2 {
    grid-column: span 2 / span 2;
    grid-row-start: 2;
    position: relative;
}

.div2 .contenido {
    width: 40%;
    height: 100%;
    position: absolute;
    background-color: rgba(255, 255, 255, 0.5);
    left: 50%;
    top: 0;
    transform: translateX(-50%);
}

.div3 .contenido {
    padding: 10px 50px;
    padding-top: 15px;
}
.div3 .contenido .nombre {
    margin-bottom: 20px;
}

.div3 .contenido .descripcion,
.div3 .contenido .descripcion2 {
    margin-bottom: 20px;
}
</style>
