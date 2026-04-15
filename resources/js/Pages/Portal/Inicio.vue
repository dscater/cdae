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
defineOptions({ layout: Portal });

// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import Compartir from "./Compartir.vue";
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
const url_assets = ref(propsPage.url_assets);

const props = defineProps({
    catalogos: Object,
    page: {
        type: Number,
        default: 1,
    },
    listCatalogos: {
        type: Array,
        default: [],
    },
});

const oCatalogo = ref({});
const paginaInput = ref(1);
const currentPage = computed(() => {
    paginaInput.value = Number(props.catalogos.current_page);
    return Number(props.catalogos.current_page);
});
const lastPage = computed(() => props.catalogos.last_page);
watch(
    () => props.catalogos,
    (newValue) => {
        if (newValue.data.length > 0) {
            oCatalogo.value = newValue.data[0];
        }
    },
);

const siguiente = () => {
    if (props.catalogos.current_page < props.catalogos.last_page) {
        cambiarPagina(props.catalogos.current_page + 1);
    }
};

const anterior = () => {
    if (props.catalogos.current_page > 1) {
        cambiarPagina(props.catalogos.current_page - 1);
    }
};

const inicio = () => cambiarPagina(1);
const final = () => cambiarPagina(props.catalogos.last_page);

const cambiarPagina = (pagina) => {
    router.get(
        route("portal"),
        {
            page: pagina,
        },
        {
            preserveState: true,
            replace: true,
        },
    );
};

const setIntervalOutPagina = ref(null);
const modificarPaginaInput = () => {
    clearInterval(setIntervalOutPagina.value);
    if (
        paginaInput.value &&
        paginaInput.value > 0 &&
        paginaInput.value < lastPage
    ) {
        setIntervalOutPagina.value = setTimeout(() => {
            cambiarPagina(paginaInput.value ?? 1);
        }, 170);
    }
};

// DRAG SWIPE
const totalPages = 5;
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

    const threshold = 20; // Sensibilidad

    if (diffX.value > threshold) {
        anterior();
    } else if (diffX.value < -threshold) {
        siguiente();
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

const muestra_compartir = ref(false);
const accion_compartir = ref(0);
const url_catalogo = ref("");
const compartirCatalogo = () => {
    muestra_compartir.value = true;
    url_catalogo.value = route("portal");
};

onMounted(() => {
    oCatalogo.value = props.catalogos.data[0];
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

const exportarPDF = async () => {
    const container = document.getElementById("pdf-container");

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
                <Compartir
                    :accion_formulario="accion_compartir"
                    :muestra_formulario="muestra_compartir"
                    :url_compartir="url_catalogo"
                    @cerrar-formulario="muestra_compartir = false"
                ></Compartir>
                <div class="mx-auto col-md-9 text-center">
                    Página
                    <input
                        type="text"
                        v-model="paginaInput"
                        class="nro_pagina"
                        @keyup="modificarPaginaInput"
                    />
                    de
                    {{ lastPage }}
                </div>
                <div
                    class="mx-auto col-md-9 text-center d-flex justify-content-center text-lg"
                    style="gap: 20px"
                >
                    <el-tooltip
                        class="box-item"
                        effect="dark"
                        content="Compartir Catálogo"
                        placement="bottom-start"
                    >
                        <a
                            href="#"
                            class="text-dark"
                            @click.prevent="compartirCatalogo"
                            ><i class="fa fa-share-alt"></i
                        ></a>
                    </el-tooltip>
                    <el-tooltip
                        class="box-item"
                        effect="dark"
                        content="Descargar Catálogo"
                        placement="bottom-start"
                    >
                        <a
                            href="#"
                            @click.prevent="exportarPDF"
                            class="text-dark"
                        >
                            <i class="fa fa-download"></i>
                        </a>
                    </el-tooltip>
                </div>
                <div class="menu_inicio">
                    <div class="contenedor_producto">
                        <div class="pagina_inicio" v-if="currentPage > 1">
                            <el-tooltip
                                class="box-item"
                                effect="dark"
                                content="Inicio"
                                placement="left-start"
                                ><i
                                    class="fa fa-angle-double-left"
                                    @click="inicio"
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
                                <i
                                    class="fa fa-angle-left"
                                    @click="anterior"
                                ></i>
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
                                <i
                                    class="fa fa-angle-right"
                                    @click="siguiente"
                                ></i
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
                                    @click="final"
                                ></i>
                            </el-tooltip>
                        </div>
                        <div
                            class="producto"
                            :style="{
                                backgroundImage: `url(${oCatalogo?.url_imagen})`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <P1
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 1"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P1>
                            <P2
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 2"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P2>
                            <P3
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 3"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P3>
                            <P4
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 4"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P4>
                            <P5
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 5"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P5>
                            <P6
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 6"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P6>
                            <P7
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 7"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P7>
                            <P8
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 8"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P8>
                            <P9
                                v-if="oCatalogo?.pagina_catalogo?.pagina == 9"
                                @agregar="agregarAlPedido"
                                :productos="oCatalogo.productos"
                            ></P9>
                            <div
                                class="capa"
                                @mousedown="handleStart"
                                @touchstart="handleStart"
                            ></div>
                        </div>
                    </div>
                </div>

                <div id="pdf-container" style="display: none">
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
                                v-if="catalogo?.pagina_catalogo?.pagina == 1"
                                :productos="catalogo.productos"
                            ></P1>
                            <P2
                                v-if="catalogo?.pagina_catalogo?.pagina == 2"
                                :productos="catalogo.productos"
                            ></P2>
                            <P3
                                v-if="catalogo?.pagina_catalogo?.pagina == 3"
                                :productos="catalogo.productos"
                            ></P3>
                            <P4
                                v-if="catalogo?.pagina_catalogo?.pagina == 4"
                                :productos="catalogo.productos"
                            ></P4>
                            <P5
                                v-if="catalogo?.pagina_catalogo?.pagina == 5"
                                :productos="catalogo.productos"
                            ></P5>
                            <P6
                                v-if="catalogo?.pagina_catalogo?.pagina == 6"
                                :productos="catalogo.productos"
                            ></P6>
                            <P7
                                v-if="catalogo?.pagina_catalogo?.pagina == 7"
                                :productos="catalogo.productos"
                            ></P7>
                            <P8
                                v-if="catalogo?.pagina_catalogo?.pagina == 8"
                                :productos="catalogo.productos"
                            ></P8>
                            <P9
                                v-if="catalogo?.pagina_catalogo?.pagina == 9"
                                :productos="catalogo.productos"
                            ></P9>
                            <div
                                class="capa"
                                @mousedown="handleStart"
                                @touchstart="handleStart"
                            ></div>
                        </div>
                    </template>
                </div>
            </div>
        </div>
    </div>
</template>
