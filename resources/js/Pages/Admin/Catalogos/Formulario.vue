<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import {
    watch,
    ref,
    computed,
    defineEmits,
    onMounted,
    nextTick,
    onBeforeMount,
} from "vue";
import Formulario from "../PaginaCatalogos/Formulario.vue";
import { usePaginaCatalogos } from "@/composables/pagina_catalogos/usePaginaCatalogos";
const { oPaginaCatalogo, setPaginaCatalogo, limpiarPaginaCatalogo } =
    usePaginaCatalogos();
const props = defineProps({
    catalogo: {
        type: Object,
        default: {
            id: 0,
        },
    },
});

let form = useForm(props.catalogo);
watch(
    () => props.catalogo,
    (newValue) => {
        form = useForm(newValue);
    },
);

const enviando = ref(false);
const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando...`;
    }
    if (form.id == 0) {
        return `<i class="fa fa-save"></i> Guardar`;
    }
    return `<i class="fa fa-edit"></i> Actualizar`;
});

const enviarFormulario = () => {
    enviando.value = true;
    let url =
        form.id == 0
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

const archivo = ref(null);
const cargarArchivoProducto = (e, index) => {
    form.productos[index]["imagen"] = null;
    const file = e.target.files[0];
    if (file) {
        form.productos[index]["imagen"] = file;
    }
};

const cargarArchivoFondo = (e, key) => {
    form[key] = null;
    const file = e.target.files[0];
    if (file) {
        form[key] = file;
    }
};

const listPaginaCatalogos = ref([]);
const cargarCatalogoPaginas = () => {
    axios.get(route("pagina_catalogos.listado")).then((response) => {
        listPaginaCatalogos.value = response.data.pagina_catalogos;

        if (form.id != 0) {
            asignaPaginaCatalogoEdit(form.pagina_id);
        }
        // pruebas();
    });
};
const asignaPaginaCatalogoEdit = (value) => {
    const item = listPaginaCatalogos.value.filter(
        (elem) => elem.id == value,
    )[0];
    setPaginaCatalogo(item);
};

const asignaPaginaCatalogo = (value) => {
    const item = listPaginaCatalogos.value.filter(
        (elem) => elem.id == value,
    )[0];
    if (!item) {
        limpiarPaginaCatalogo();
        return;
    }
    setPaginaCatalogo(item);
    generarProductos();
};

const muestra_estructura = ref(false);
const verEstructura = (item) => {
    muestra_estructura.value = true;
};

const generarProductos = () => {
    form.productos = [];
    for (let i = 1; i <= oPaginaCatalogo.value.productos; i++) {
        agregarProducto();
    }
};
const agregarProducto = () => {
    let descripcions = [];
    for (let i = 1; i <= oPaginaCatalogo.value.descripcion; i++) {
        descripcions.push({
            id: 0,
            producto_id: "",
            descripcion: "",
        });
    }
    form.productos.push({
        id: 0,
        catalogo_id: "",
        codigo: "",
        nombre: "",
        moneda: "Bs.",
        precio: 100,
        imagen: "",
        producto_descripcions: [...descripcions],
    });
};

onBeforeMount(() => {
    cargarCatalogoPaginas();
});

const pruebas = () => {
    form.pagina_id = 1;
    asignaPaginaCatalogo(1);
};
onMounted(() => {});
</script>

<template>
    <form @submit.prevent="enviarFormulario()">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">
                            <i class="fa fa-list"></i> Datos del Catálogo
                        </h4>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-md-6 mt-2">
                                <Formulario
                                    :muestra_formulario="muestra_estructura"
                                    :accion_formulario="1"
                                    @cerrar-formulario="
                                        muestra_estructura = false
                                    "
                                ></Formulario>
                                <label class="required"
                                    >Seleccionar Página de Catálogo</label
                                >
                                <div class="input-group">
                                    <div class="form-control border-0 p-0">
                                        <el-select
                                            type="text"
                                            class="el-select-input-group-left"
                                            v-model="form.pagina_id"
                                            placeholder="- Seleccione -"
                                            size="large"
                                            no-data-text="Sin datos"
                                            no-match-text="Sin resultados"
                                            filterable
                                            @change="asignaPaginaCatalogo"
                                        >
                                            <el-option
                                                v-for="item in listPaginaCatalogos"
                                                :key="item.id"
                                                :value="item.id"
                                                :label="`Página ${item.pagina}`"
                                            ></el-option>
                                        </el-select>
                                    </div>
                                    <div class="input-group-append">
                                        <button
                                            :disabled="oPaginaCatalogo.id == 0"
                                            type="button"
                                            class="btn btn-default"
                                            title="Estructura"
                                            @click.prevent="verEstructura"
                                        >
                                            <i class="fa fa-image"></i>
                                        </button>
                                    </div>
                                </div>

                                <ul
                                    v-if="form.errors?.pagina_id"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.pagina_id }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6 mt-2">
                                <label class="required">Estado</label>
                                <br />
                                <el-switch
                                    size="large"
                                    active-text="PÚBLICO"
                                    inactive-text="DESHABILITADO"
                                    v-model="form.estado"
                                    :active-value="1"
                                    :inactive-value="0"
                                    style="
                                        --el-switch-on-color: #13ce66;
                                        --el-switch-off-color: #ff4949;
                                    "
                                />
                            </div>
                            <div class="col-md-5 mt-2">
                                <label class="required">Imagen de Fondo</label
                                ><small class="text-muted"
                                    >(Tamaño recomendado: A4)</small
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'parsley-error': form.errors?.imagen,
                                    }"
                                    ref="archivo"
                                    @change="
                                        cargarArchivoFondo($event, 'imagen')
                                    "
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12" v-for="(item, index) in form.productos">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">
                            <i class="fa fa-image"></i> Producto {{ index + 1 }}
                        </h4>
                    </div>
                    <div class="card-body pt-1">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Código</label>
                                <input
                                    type="text"
                                    v-model="item.codigo"
                                    class="form-control"
                                />
                            </div>
                            <div class="col-md-4">
                                <label>Nombre</label>
                                <input
                                    type="text"
                                    v-model="item.nombre"
                                    class="form-control"
                                />
                            </div>
                            <div class="col-md-4">
                                <label>Texto moneda</label>
                                <input
                                    type="text"
                                    v-model="item.moneda"
                                    class="form-control"
                                />
                            </div>
                            <div class="col-md-4">
                                <label>Precio</label>
                                <input
                                    type="number"
                                    step="0.01"
                                    v-model="item.precio"
                                    class="form-control"
                                />
                            </div>
                            <div class="col-md-4">
                                <label>Imagen</label>
                                <input
                                    type="file"
                                    class="form-control"
                                    @change="
                                        cargarArchivoProducto($event, index)
                                    "
                                />
                            </div>
                            <div
                                class="col-12 mt-2"
                                v-for="(
                                    descripcion, index_desc
                                ) in item.producto_descripcions"
                            >
                                <label>Descripción {{ index_desc + 1 }}</label>
                                <el-input
                                    type="textarea"
                                    v-model="descripcion.descripcion"
                                    autosize
                                ></el-input>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <ul
                    v-if="form.errors?.productos"
                    class="d-block text-danger list-unstyled"
                >
                    <li class="parsley-required">
                        {{ form.errors?.productos }}
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt-2 mb-3">
            <div class="col-md-3">
                <button
                    type="button"
                    class="btn btn-success w-100"
                    :disabled="enviando"
                    @click.prevent="enviarFormulario"
                    v-html="textBtn"
                ></button>
            </div>
        </div>
    </form>
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
