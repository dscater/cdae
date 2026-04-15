<script setup>
import Content from "@/Components/Content.vue";
import MiTable from "@/Components/MiTable.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { usePaginaCatalogos } from "@/composables/pagina_catalogos/usePaginaCatalogos";
import { useAxios } from "@/composables/axios/useAxios";
import { ref, onMounted, onBeforeMount } from "vue";
import { useAppStore } from "@/stores/aplicacion/appStore";
// import { useMenu } from "@/composables/useMenu";
import Formulario from "./Formulario.vue";
import { buttonProps } from "element-plus";
// const { mobile, identificaDispositivo } = useMenu();
const { props: props_page } = usePage();
const appStore = useAppStore();
onBeforeMount(() => {
    appStore.startLoading();
});

onMounted(() => {
    appStore.stopLoading();
});

const { setPaginaCatalogo, limpiarPaginaCatalogo } = usePaginaCatalogos();
const { axiosDelete } = useAxios();

const miTable = ref(null);
const headers = [
    {
        label: "NRO. PÁGINA",
        key: "pagina",
        sortable: true,
        width: "4%",
    },
    {
        label: "NRO. DESCRIPCIÓN",
        key: "descripcion",
        sortable: true,
    },
    {
        label: "NRO. PRODUCTOS",
        key: "productos",
        sortable: true,
    },
    {
        label: "REDES SOCIALES",
        key: "redes",
        sortable: true,
    },
    {
        label: "ACCIÓN",
        key: "accion",
        fixed: "right",
        width: "4%",
    },
];

const multiSearch = ref({
    search: "",
    filtro: [],
});

const accion_formulario = ref(0);
const muestra_formulario = ref(false);

const agregarRegistro = () => {
    limpiarPaginaCatalogo();
    accion_formulario.value = 0;
    muestra_formulario.value = true;
};

const updateDatatable = async () => {
    if (miTable.value) {
        await miTable.value.cargarDatos();
        muestra_formulario.value = false;
    }
};
</script>
<template>
    <Head title="Página de Catálogos"></Head>
    <Content>
        <template #header>
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Página de Catálogos</h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">
                            Página de Catálogos
                        </li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-8 my-1">
                        <div class="row justify-content-end">
                            <div class="col-md-5">
                                <div
                                    class="input-group"
                                    style="align-items: end"
                                >
                                    <input
                                        v-model="multiSearch.search"
                                        placeholder="Buscar"
                                        class="form-control border-1 border-right-0"
                                    />
                                    <div class="input-append">
                                        <button
                                            class="btn btn-default rounded-0 border-left-0"
                                            @click="updateDatos"
                                        >
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <MiTable
                            :tableClass="'bg-white mitabla'"
                            ref="miTable"
                            :cols="headers"
                            :api="true"
                            :url="route('pagina_catalogos.paginado')"
                            :numPages="5"
                            :per-page="10"
                            :multiSearch="multiSearch"
                            :syncOrderBy="'id'"
                            :syncOrderAsc="'DESC'"
                            table-responsive
                            :header-class="'bg__primary'"
                            fixed-header
                        >
                            <template #redes="{ item }">
                                <span
                                    class="text-md"
                                    :class="
                                        item.redes
                                            ? 'badge bg-success'
                                            : 'badge bg-gray'
                                    "
                                >
                                    {{ item.redes ? "SI" : "NO" }}
                                </span>
                            </template>
                            <template #accion="{ item }">
                                <template
                                    v-if="
                                        props_page.auth?.user.permisos == '*' ||
                                        props_page.auth?.user.permisos.includes(
                                            'pagina_catalogos.edit',
                                        )
                                    "
                                >
                                    <el-tooltip
                                        class="box-item"
                                        effect="dark"
                                        content="Ver Estructura"
                                        placement="left-start"
                                    >
                                        <button
                                            class="btn btn-primary"
                                            @click="
                                                setPaginaCatalogo(item);
                                                accion_formulario = 1;
                                                muestra_formulario = true;
                                            "
                                        >
                                            <i class="fa fa-image"></i></button
                                    ></el-tooltip>
                                </template>
                            </template>
                        </MiTable>
                    </div>
                </div>
            </div>
        </div>
        <Formulario
            :muestra_formulario="muestra_formulario"
            :accion_formulario="accion_formulario"
            @envio-formulario="updateDatatable"
            @cerrar-formulario="muestra_formulario = false"
        ></Formulario>
    </Content>
</template>
