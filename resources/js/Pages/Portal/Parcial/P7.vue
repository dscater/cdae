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
    grid-template-columns: 100%;
    grid-template-rows: 100%;
}

.div1 {
    position: relative;
}

.div1 .contenido {
    width: 38%;
    padding: 10px 0px;
    position: absolute;
    background-color: rgba(255, 255, 255, 0.5);
    right: 4%;
    bottom: 20%;
    display: grid;
    grid-template-columns: auto 20%;
    grid-template-rows: auto auto auto auto auto auto;
}

.div1 .contenido .nombre,
.div1 .contenido .descripcion,
.div1 .contenido .descripcion2 {
    margin-bottom: 20px;
}
.div1 .contenido .nombre {
    margin-bottom: 8px;
}
.div1 .contenido .descripcion3 {
    height: 100%;
    display: flex;
    align-items: end;
    justify-content: center;
}
</style>
