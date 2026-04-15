<script setup>
import MiModal from "@/Components/MiModal.vue";
import { useForm, usePage } from "@inertiajs/vue3";
import { useCatalogos } from "@/composables/catalogos/useCatalogos";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
const props = defineProps({
    muestra_formulario: {
        type: Boolean,
        default: false,
    },
    accion_formulario: {
        type: Number,
        default: 0,
    },
});

const { oCatalogo, limpiarCatalogo } = useCatalogos();
const accion_form = ref(props.accion_formulario);
const muestra_form = ref(props.muestra_formulario);
const enviando = ref(false);
let form = useForm(oCatalogo.value);
watch(
    () => props.muestra_formulario,
    (newValue) => {
        muestra_form.value = newValue;
        if (muestra_form.value) {
            cargarIconos();
            if (archivo.value) {
                archivo.value.value = null;
            }
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
            form = useForm(oCatalogo.value);
        } else {
            document
                .getElementsByTagName("body")[0]
                .classList.remove("modal-open");
        }
    },
);
watch(
    () => props.accion_formulario,
    (newValue) => {
        accion_form.value = newValue;
        if (accion_form.value == 0) {
            form["_method"] = "POST";
        }
    },
);

const { flash } = usePage().props;

function cargaArchivo(e, key) {
    form[key] = null;
    form[key] = e.target.files[0];
}

const tituloDialog = computed(() => {
    return accion_form.value == 0
        ? `<i class="fa fa-plus"></i> Nuevo Catálogo`
        : `<i class="fa fa-edit"></i> Editar Catálogo`;
});

const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando...`;
    }
    if (accion_form.value == 0) {
        return `<i class="fa fa-save"></i> Guardar`;
    }
    return `<i class="fa fa-edit"></i> Actualizar`;
});

const enviarFormulario = () => {
    enviando.value = true;
    let url =
        accion_form.value == 0
            ? route("catalogos.store")
            : route("catalogos.update", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: (response) => {
            console.log("correcto");
            const success =
                response.props.flash.success ?? "Proceso realizado con éxito";
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: `<strong>${success}</strong>`,
                confirmButtonText: `Aceptar`,
                customClass: {
                    confirmButton: "btn-alert-success",
                },
            });
            form.reset();
            limpiarCatalogo();
            emits("envio-formulario");
        },
        onError: (err, code) => {
            console.log(code ?? "");
            console.log(form.errors);
            if (form.errors) {
                const error =
                    "Existen errores en el formulario, por favor verifique";
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    html: `<strong>${error}</strong>`,
                    confirmButtonText: `Aceptar`,
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            } else {
                const error =
                    "Ocurrió un error inesperado contactese con el Administrador";
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    html: `<strong>${error}</strong>`,
                    confirmButtonText: `Aceptar`,
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            }
            console.log("error: " + err.error);
        },
        onFinish: () => {
            enviando.value = false;
        },
    });
};

const emits = defineEmits(["cerrar-formulario", "envio-formulario"]);

watch(muestra_form, (newVal) => {
    if (!newVal) {
        emits("cerrar-formulario");
    }
});

const archivo = ref(null);
const cargarArchivo = (e, key) => {
    form[key] = null;
    const file = e.target.files[0];
    if (file) {
        form[key] = e.target.files[0];
    }
};

const cerrarFormulario = () => {
    muestra_form.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

const listIconos = ref([]);
const cargarIconos = () => {
    axios.get(route("iconos.lista")).then((response) => {
        listIconos.value = response.data;
    });
};

const iconoSeleccionado = ref(null);
const busqueda = ref("");

// filtrar iconos (por nombre o clase)
const iconosFiltrados = computed(() => {
    if (!busqueda.value) return listIconos.value;

    return listIconos.value.filter(
        (i) =>
            i.nombre.toLowerCase().includes(busqueda.value.toLowerCase()) ||
            i.clase.toLowerCase().includes(busqueda.value.toLowerCase()),
    );
});

const seleccionarIcono = (icono) => {
    iconoSeleccionado.value = icono.clase;
    form.imagen = icono.clase;
};

onMounted(() => {});
</script>

<template>
    <MiModal
        :open_modal="muestra_form"
        @close="cerrarFormulario"
        :size="'modal-xl'"
        :header-class="'bg-principal'"
        :footer-class="'justify-content-end'"
    >
        <template #header>
            <h4 class="modal-title text-white" v-html="tituloDialog"></h4>
            <button
                type="button"
                class="close"
                @click.prevent="cerrarFormulario()"
            >
                <span aria-hidden="true">×</span>
            </button>
        </template>

        <template #body>
            <form @submit.prevent="enviarFormulario()">
                <p class="text-muted text-xs mb-0">
                    Todos los campos con
                    <span class="text-danger">(*)</span> son obligatorios.
                </p>
                <div class="row">
                    <div class="col-md-7 mt-2">
                        <label class="required">Nombre Menú</label>
                        <el-input
                            type="text"
                            :class="{
                                'parsley-error': form.errors?.nombre,
                            }"
                            v-model="form.nombre"
                            autosize
                        ></el-input>
                        <ul
                            v-if="form.errors?.nombre"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.nombre }}
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="required">Tipo de Imagen</label>
                        <br />
                        <el-switch
                            size="large"
                            active-text="CARGAR IMAGEN"
                            inactive-text="USAR ICONO"
                            v-model="form.tipo"
                            :active-value="'imagen'"
                            :inactive-value="'icono'"
                            style="
                                --el-switch-on-color: #257eb3;
                                --el-switch-off-color: #555555;
                            "
                        />
                    </div>
                    <div class="col-md-5 mt-2" v-if="form.tipo == 'imagen'">
                        <label class="required">Imagen del Botón</label
                        ><small class="text-muted"
                            >(Tamaño recomendado: 530px x 90px)</small
                        >
                        <input
                            type="file"
                            class="form-control"
                            :class="{
                                'parsley-error': form.errors?.imagen,
                            }"
                            ref="archivo"
                            @change="cargarArchivo($event, 'imagen')"
                        />
                        <ul
                            v-if="form.errors?.imagen"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.imagen }}
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-5 mt-2" v-if="form.tipo == 'icono'">
                        <label class="required">Seleccionar Icono</label>

                        <input
                            type="text"
                            class="form-control mb-2"
                            v-model="busqueda"
                            placeholder="Buscar icono..."
                        />

                        <!-- Preview -->
                        <div v-if="form.imagen" class="mb-2 text-center">
                            <small class="text-muted">Seleccionado:</small>
                            <div style="font-size: 30px">
                                <i :class="form.imagen"></i>
                            </div>
                        </div>

                        <!-- Grid de iconos -->
                        <div
                            style="
                                max-height: 220px;
                                overflow-y: auto;
                                border: 1px solid #ddd;
                                border-radius: 6px;
                                padding: 10px;
                            "
                        >
                            <div
                                class="d-flex flex-wrap gap-2"
                                style="gap: 10px"
                            >
                                <div
                                    style="cursor: pointer"
                                    v-for="icono in iconosFiltrados"
                                    :key="icono.clase"
                                    @click="seleccionarIcono(icono)"
                                    class="icon-item"
                                    :class="{
                                        'icon-selected':
                                            form.imagen === icono.clase,
                                    }"
                                    title="icono.nombre"
                                >
                                    <i :class="icono.clase"></i>
                                </div>
                            </div>
                        </div>
                        <ul
                            v-if="form.errors?.imagen"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.imagen }}
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="required">Permitir descarga</label>
                        <br />
                        <el-switch
                            size="large"
                            active-text="HABILITADO"
                            inactive-text="DESHABILITADO"
                            v-model="form.descargar"
                            :active-value="1"
                            :inactive-value="0"
                            style="
                                --el-switch-on-color: #13ce66;
                                --el-switch-off-color: #ff4949;
                            "
                        />
                    </div>
                </div>
            </form>
        </template>
        <template #footer>
            <button
                type="button"
                class="btn btn-default"
                @click.prevent="cerrarFormulario()"
            >
                Cerrar
            </button>
            <button
                type="button"
                class="btn btn-success"
                :disabled="enviando"
                @click.prevent="enviarFormulario"
                v-html="textBtn"
            ></button>
        </template>
    </MiModal>
</template>

<style scoped>
.icon-item {
    transition: all 0.3s;
    font-size: 1.3em;
}
.icon-item:hover {
    transform: translateY(-2px);
}
</style>
