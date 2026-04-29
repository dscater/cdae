<script setup>
import MiModal from "@/Components/MiModal.vue";
import { useForm, usePage } from "@inertiajs/vue3";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
import { useCatalogoStore } from "@/stores/catalogo/catalogoStore";
const catalogoStore = useCatalogoStore();

const props = defineProps({
    muestra_formulario: {
        type: Boolean,
        default: false,
    },
    producto: {
        type: Object,
        default: null,
    },
});

const oProducto = ref(props.producto);
const muestra_form = ref(props.muestra_formulario);
const enviando = ref(false);
const oAgregar = ref({
    cantidad: 1,
});
watch(
    () => props.muestra_formulario,
    (newValue) => {
        muestra_form.value = newValue;
        if (muestra_form.value) {
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
        } else {
            oAgregar.value.cantidad = 1;
            document
                .getElementsByTagName("body")[0]
                .classList.remove("modal-open");
        }
    },
);
watch(
    () => props.producto,
    (newValue) => {
        oProducto.value = newValue;
    },
);

const tituloDialog = computed(() => {
    return `<i class="fa fa-cart-plus"></i> Agregar producto`;
});

const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando...`;
    }
    return `<i class="fa fa-cart-plus"></i> Agregar`;
});

const enviarFormulario = () => {
    enviando.value = true;
    catalogoStore.agregarProducto(oProducto.value, oAgregar.value.cantidad);

    enviando.value = false;
    emits("cerrar-formulario");
};

const emits = defineEmits(["cerrar-formulario", "envio-formulario"]);

watch(muestra_form, (newVal) => {
    if (!newVal) {
        emits("cerrar-formulario");
    }
});

const disminuir = () => {
    if (oAgregar.value.cantidad < 2) {
        return;
    }
    oAgregar.value.cantidad--;
};
const aumentar = () => {
    oAgregar.value.cantidad++;
};

const cerrarFormulario = () => {
    muestra_form.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

onMounted(() => {});
</script>

<template>
    <MiModal
        :open_modal="muestra_form"
        @close="cerrarFormulario"
        :size="'modal_agregar'"
        :footer="false"
        :close-esc="true"
        :header-class="'header_agregar p-0 d-flex justify-content-end'"
        :footer-class="'justify-content-end'"
        :body-class="'p-0 rounded position-relative'"
    >
        <template #header>
            <button
                type="button"
                class="btnCerrar btn btn-default btn-sm"
                @click.prevent="cerrarFormulario()"
            >
                <i class="fa fa-times"></i>
            </button>
        </template>
        <template #body>
            <div class="imagen_agregar">
                <img
                    :src="oProducto.url_imagen"
                    alt=""
                    class="imagenAgregar"
                    v-if="oProducto"
                />
            </div>

            <div class="container-fluid px-4">
                <form @submit.prevent="enviarFormulario()" v-if="oProducto">
                    <div class="row mb-3">
                        <div class="col-12">
                            <h4 class="h4 font-weight-bold mt-2">
                                {{ oProducto.nombre }}
                            </h4>
                        </div>
                        <div class="col-12">
                            <h4 class="h3 font-weight-bold w-100">
                                {{ oProducto.moneda }} {{ oProducto.precio }}
                            </h4>
                        </div>
                        <div class="col-md-7 mt-2">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button
                                        class="btn btn-default"
                                        @click.prevent="disminuir"
                                    >
                                        -
                                    </button>
                                </div>
                                <input
                                    type="number"
                                    step="1"
                                    class="form-control text-center"
                                    v-model="oAgregar.cantidad"
                                />
                                <div class="input-group-append">
                                    <button
                                        class="btn btn-default"
                                        @click.prevent="aumentar"
                                    >
                                        +
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 mt-2">
                            <button
                                type="button"
                                class="btn btn-primary w-100"
                                :disabled="enviando"
                                @click.prevent="enviarFormulario"
                                v-html="textBtn"
                            ></button>
                        </div>
                    </div>
                </form>
            </div>
        </template>
    </MiModal>
</template>
<style scoped>
.btnCerrar {
    position: relative;
    right: -10px;
    top: 10px;
    z-index: 10;
}

.imagen_agregar {
    width: 100%;
    text-align: center;
    padding: 10px;
}

.imagen_agregar img {
    border-radius: 10px;
    height: 350px;
    width: 100%;
    object-fit: fill;
}
</style>
