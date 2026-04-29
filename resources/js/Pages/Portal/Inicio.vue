<script setup>
import Portal from "@/Layouts/Portal.vue";
import { Link, router, usePage } from "@inertiajs/vue3";
import {
    nextTick,
    computed,
    onBeforeMount,
    onMounted,
    onUnmounted,
    ref,
    watch,
} from "vue";
import { usePdf } from "@/composables/usePdf";
const { triggerExport } = usePdf();
import { useFlipbook } from "@/composables/useFlipbook";
const { currentPage, next, prev, setLastPage, setCurrentPage, setTotal } =
    useFlipbook();
defineOptions({ layout: Portal });

// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import { useCatalogoStore } from "@/stores/catalogo/catalogoStore";
import Agregar from "./Agregar.vue";
const catalogoStore = useCatalogoStore();
import { useConfiguracionStore } from "@/stores/configuracion/configuracionStore";
import P1 from "./Parcial/P1.vue";
import P2 from "./Parcial/P2.vue";
import P3 from "./Parcial/P3.vue";
import P4 from "./Parcial/P4.vue";
import P5 from "./Parcial/P5.vue";
import P6 from "./Parcial/P6.vue";
import P7 from "./Parcial/P7.vue";
import P8 from "./Parcial/P8.vue";
import P9 from "./Parcial/P9.vue";
import html2pdf from "html2pdf.js";
const configuracionStore = useConfiguracionStore();
const propsPage = usePage().props;

const props = defineProps({
    listCatalogos: {
        type: Array,
        default: [],
    },
});

watch(triggerExport, async () => {
    await generarPdf();
});

const visibleItems = computed(() => {
    const total = props.listCatalogos.length;

    if (!total) return [];

    const prevIndex = (currentPage.value - 1 + total) % total;
    const currentIndex = currentPage.value % total;
    const nextIndex = (currentPage.value + 1) % total;

    return [
        props.listCatalogos[prevIndex],
        props.listCatalogos[currentIndex],
        props.listCatalogos[nextIndex],
    ];
});
const lastPage = computed(() => {
    return Number(props.listCatalogos.length - 1);
});

// DRAG SWIPE
const screenWidth = ref(0);
const startX = ref(0);
const diffX = ref(0);
const isDragging = ref(false);

// Inicia el rastreo
const handleStart = (e) => {
    isDragging.value = true;
    // Soporte para Touch y Mouse
    startX.value = e.touches ? e.touches[0].clientX : e.clientX;
    diffX.value = 0;

    // IMPORTANTE: Escuchar en window para no perder el evento al soltar
    window.addEventListener("mousemove", handleMove);
    window.addEventListener("mouseup", handleEnd);
    window.addEventListener("touchmove", handleMove, { passive: false });
    window.addEventListener("touchend", handleEnd);
};

const handleMove = (e) => {
    if (!isDragging.value) return;

    // Prevenir scroll vertical accidental en móviles mientras arrastras
    if (e.type === "touchmove") e.preventDefault();

    const currentX = e.touches ? e.touches[0].clientX : e.clientX;
    diffX.value = currentX - startX.value;
};
// Determina si se cambia de página al soltar
const handleEnd = () => {
    if (!isDragging.value) return;

    const threshold = 110; // Sensibilidad

    if (diffX.value > threshold) {
        prev();
    } else if (diffX.value < -threshold) {
        next();
    }

    // Limpieza
    isDragging.value = false;
    diffX.value = 0;

    // Remover los listeners globales
    window.removeEventListener("mousemove", handleMove);
    window.removeEventListener("mouseup", handleEnd);
    window.removeEventListener("touchmove", handleMove);
    window.removeEventListener("touchend", handleEnd);
};

const updateWidth = () => {
    screenWidth.value = window.innerWidth;
};
onMounted(() => {
    updateWidth();
    setTotal(props.listCatalogos.length);
    setLastPage(props.listCatalogos.length);
    window.addEventListener("resize", updateWidth);
});

onUnmounted(() => {
    window.removeEventListener("resize", updateWidth);
});

const listPedido = computed(() => catalogoStore.getListaProductos());
const muestra_agregar = ref(false);
const oProducto = ref(null);
const agregarAlPedido = (producto) => {
    oProducto.value = producto;
    muestra_agregar.value = true;
};

const enviadoAgregar = () => {
    oProducto.value = null;
    muestra_agregar.value = false;
};

const generarPdf = async () => {
    const container = document.getElementById("pdf-container");

    if (!container) return;

    // Mostrar temporalmente
    container.style.display = "block";

    await nextTick(); // importante (espera render Vue)

    await html2pdf()
        .set({
            margin: 0, //importante para ocupar toda la hoja
            filename: "catalogo.pdf",
            image: { type: "jpeg", quality: 1 },
            html2canvas: {
                scale: 2, // calidad
                useCORS: true,
            },
            jsPDF: {
                unit: "mm",
                format: "a4",
                orientation: "portrait",
            },
            pagebreak: {
                mode: ["css", "legacy"], // respeta page-break
            },
        })
        .from(container)
        .save();

    // Ocultar otra vez
    container.style.display = "none";
};

onBeforeMount(() => {});

onUnmounted(() => handleEnd());
</script>
<template>
    <div class="container">
        <Agregar
            :muestra_formulario="muestra_agregar"
            :producto="oProducto"
            @envio-formulario="enviadoAgregar"
            @cerrar-formulario="muestra_agregar = false"
        ></Agregar>
        <div class="row">
            <div class="col-12 mt-3">
                <div class="menu_inicio">
                    <div class="contenedor_principal">
                        <div class="pagina_inicio" v-if="currentPage > 1">
                            <el-tooltip
                                class="box-item"
                                effect="dark"
                                content="Inicio"
                                placement="left-start"
                                ><i
                                    class="fa fa-angle-double-left"
                                    @click="setCurrentPage(0)"
                                ></i
                            ></el-tooltip>
                        </div>
                        <div class="pagina_anterior" v-if="currentPage > 1">
                            <el-tooltip
                                class="box-item"
                                effect="dark"
                                content="Anterior"
                                placement="left-start"
                            >
                                <i class="fa fa-angle-left" @click="prev"></i>
                            </el-tooltip>
                        </div>
                        <div
                            class="pagina_siguiente"
                            v-if="currentPage < lastPage"
                        >
                            <el-tooltip
                                class="box-item"
                                effect="dark"
                                content="Siguiente"
                                placement="right-start"
                            >
                                <i class="fa fa-angle-right" @click="next"></i
                            ></el-tooltip>
                        </div>
                        <div
                            class="pagina_ultimo"
                            v-if="currentPage < lastPage"
                        >
                            <el-tooltip
                                class="box-item"
                                effect="dark"
                                content="Final"
                                placement="right-start"
                            >
                                <i
                                    class="fa fa-angle-double-right"
                                    @click="setCurrentPage(lastPage)"
                                ></i>
                            </el-tooltip>
                        </div>
                        <div class="contenedor_producto">
                            <div
                                v-for="(currentItem, i) in visibleItems"
                                :key="currentItem.id"
                                class="producto con_animacion"
                                :style="{
                                    transform: `translateX(${(i - 1) * 100 + (diffX / screenWidth) * 100}%)`,
                                    transition: isDragging
                                        ? 'none'
                                        : 'transform 0.35s ease',
                                    backgroundImage: `url(${currentItem?.url_imagen})`,
                                    backgroundSize: '100% 100%',
                                    backgroundRepeat: 'no-repeat',
                                    backgroundPosition: 'center',
                                }"
                            >
                                <P1
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        1
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P1>
                                <P2
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        2
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P2>
                                <P3
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        3
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P3>
                                <P4
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        4
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P4>
                                <P5
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        5
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P5>
                                <P6
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        6
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P6>
                                <P7
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        7
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P7>
                                <P8
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        8
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P8>
                                <P9
                                    v-if="
                                        currentItem?.pagina_catalogo?.pagina ==
                                        9
                                    "
                                    @agregar="agregarAlPedido"
                                    :productos="currentItem.productos"
                                ></P9>
                                <div
                                    class="capa"
                                    @mousedown="handleStart"
                                    @touchstart="handleStart"
                                ></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="pdf-container" style="display: none">
                    <div class="contenedor_producto_imp">
                        <template v-for="catalogo in listCatalogos">
                            <div
                                class="producto"
                                :style="{
                                    backgroundImage: `url(${catalogo?.url_imagen})`,
                                    backgroundSize: '100% 100%',
                                    backgroundRepeat: 'no-repeat',
                                    backgroundPosition: 'center',
                                }"
                            >
                                <P1
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 1
                                    "
                                    :productos="catalogo.productos"
                                ></P1>
                                <P2
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 2
                                    "
                                    :productos="catalogo.productos"
                                ></P2>
                                <P3
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 3
                                    "
                                    :productos="catalogo.productos"
                                ></P3>
                                <P4
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 4
                                    "
                                    :productos="catalogo.productos"
                                ></P4>
                                <P5
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 5
                                    "
                                    :productos="catalogo.productos"
                                ></P5>
                                <P6
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 6
                                    "
                                    :productos="catalogo.productos"
                                ></P6>
                                <P7
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 7
                                    "
                                    :productos="catalogo.productos"
                                ></P7>
                                <P8
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 8
                                    "
                                    :productos="catalogo.productos"
                                ></P8>
                                <P9
                                    v-if="
                                        catalogo?.pagina_catalogo?.pagina == 9
                                    "
                                    :productos="catalogo.productos"
                                ></P9>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped></style>
