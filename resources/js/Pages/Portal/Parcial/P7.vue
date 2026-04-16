<script setup>
import { watch, nextTick, onMounted } from "vue";
import "aos/dist/aos.css";
import AOS from "aos";
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
    <div class="p7 pagina">
        <div
            class="contenido"
            :style="{
                backgroundImage: `url(${productos[0].url_imagen})`,
                backgroundSize: '100% 100%',
                backgroundRepeat: 'no-repeat',
                backgroundPosition: 'center',
            }"
        >
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
        </div>
    </div>
</template>
<style scoped>
.contenido {
    min-height: 800px;
    display: flex;
    flex-direction: column;
    justify-content: end;
    align-items: end;
    padding-bottom: 10px;
}

.contenido div.accion {
    text-align: center;
}

.contenido div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}
.contenido button span {
    font-size: 10pt;
    margin-left: 7px;
}

.contenido div.nombre {
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.contenido div.descripcion {
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.contenido div.precio {
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
}

.contenido .nombre,
.contenido .descripcion,
.contenido .descripcion2,
.contenido .descripcion3,
.contenido .accion,
.contenido .precio {
    text-align: center;
    width: 38%;
}

.contenido .descripcion,
.contenido .descripcion2,
.contenido .descripcion3 {
    margin-top: 20px;
}

img {
    min-height: 300px;
    object-fit: fill;
    height: 100%;
    width: 100%;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
