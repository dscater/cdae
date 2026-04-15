<script setup>
import Portal from "@/Layouts/Portal.vue";
import { usePage, router, Link } from "@inertiajs/vue3";
import Compartir from "./Compartir.vue";

import { useCatalogoStore } from "@/stores/catalogo/catalogoStore";
const catalogoStore = useCatalogoStore();
import {
    computed,
    onBeforeUnmount,
    onMounted,
    onUnmounted,
    ref,
    watch,
} from "vue";
defineOptions({ layout: Portal });
const propsPage = usePage().props;
const url_assets = ref(propsPage.url_assets);

const props = defineProps({
    catalogo: Object,
    producto: Object,
});

const muestra_compartir = ref(false);
const accion_compartir = ref(0);
const url_catalogo = ref("");
const compartirCatalogo = () => {
    muestra_compartir.value = true;
    url_catalogo.value = route("portal.productos", props.catalogo.id);
};

const oProducto = ref({});
onMounted(() => {
    oProducto.value = props.producto;
});

const listPedido = computed(() => catalogoStore.getListaProductos());
const agregarAlPedido = () => {
    catalogoStore.agregarProducto(oProducto.value);
};

onBeforeUnmount(() => {});
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <Compartir
                    :accion_formulario="accion_compartir"
                    :muestra_formulario="muestra_compartir"
                    :url_compartir="url_catalogo"
                    @cerrar-formulario="muestra_compartir = false"
                ></Compartir>
                <div class="mx-auto col-md-9 text-center mt-3" v-if="catalogo">
                    <Link
                        class="text-dark"
                        :href="route('portal.productos', catalogo.id)"
                        ><i class="fa fa-arrow-left"></i> Volver a
                        Catálogo</Link
                    >
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
                    <template v-if="catalogo.descargar == 1">
                        <el-tooltip
                            class="box-item"
                            effect="dark"
                            content="Descargar Catálogo"
                            placement="bottom-start"
                        >
                            <a
                                :href="
                                    route(
                                        'portal.descargar_catalogo',
                                        catalogo.id,
                                    )
                                "
                                target="_blank"
                                class="text-dark"
                                ><i class="fa fa-download"></i
                            ></a>
                        </el-tooltip>
                    </template>
                    <el-tooltip
                        class="box-item"
                        effect="dark"
                        content="Agregar al Pedido"
                        placement="bottom-start"
                    >
                        <button class="btn btn-sm" @click="agregarAlPedido">
                            <i class="fa fa-plus fa-lg"></i>
                        </button>
                    </el-tooltip>
                </div>

                <div class="menu_inicio">
                    <div class="contenedor_producto">
                        <div
                            class="producto"
                            :style="{
                                backgroundImage: `url(${producto.url_imagen})`,
                                backgroundSize: 'contain',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        ></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped></style>
