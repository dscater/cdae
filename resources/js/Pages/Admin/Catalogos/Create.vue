<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useCatalogos } from "@/composables/catalogos/useCatalogos";
import { useAxios } from "@/composables/axios/useAxios";
import { ref, onMounted, onBeforeMount } from "vue";
import { useAppStore } from "@/stores/aplicacion/appStore";
import Formulario from "./Formulario.vue";
const { props: props_page } = usePage();
const appStore = useAppStore();
onBeforeMount(() => {
    appStore.startLoading();
});
const { oCatalogo, setCatalogo, limpiarCatalogo } = useCatalogos();

onMounted(() => {
    limpiarCatalogo();
    appStore.stopLoading();
});
</script>
<template>
    <Head title="Nuevo Catálogo"></Head>
    <Content>
        <template #header>
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Nuevo Catálogo</h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item">
                            <Link :href="route('catalogos.index')"
                                >Catálogos</Link
                            >
                        </li>
                        <li class="breadcrumb-item active">Nuevo</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>
        <div class="row">
            <div class="col-md-12">
                <Formulario :catalogo="oCatalogo"></Formulario>
            </div>
        </div>
    </Content>
</template>
