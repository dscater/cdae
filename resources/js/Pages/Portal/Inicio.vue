<script setup>
import Portal from "@/Layouts/Portal.vue";
import { Link, usePage } from "@inertiajs/vue3";
import { ref } from "vue";
defineOptions({ layout: Portal });
import { useConfiguracionStore } from "@/stores/configuracion/configuracionStore";
const configuracionStore = useConfiguracionStore();
const propsPage = usePage().props;
const url_assets = ref(propsPage.url_assets);

const props = defineProps({
    catalogos: Array,
    page: Number,
});
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="menu_inicio">
                    <div class="portada">
                        <img
                            :src="configuracionStore.oConfiguracion.url_portada"
                            alt=""
                        />
                    </div>
                    <div class="menu">
                        <div class="opcion" v-for="item in catalogos">
                            <Link
                                :href="
                                    route('portal.productos', { id: item.id })
                                "
                            >
                                <img
                                    :src="item.url_imagen"
                                    alt="Boton"
                                    v-if="item.tipo == 'imagen'"
                                />
                                <div
                                    v-else
                                    class="boton_menu_icono d-flex align-items-center justify-content-center"
                                >
                                    <span
                                        class="font-weight-bold text-lg mr-2"
                                        >{{ item.nombre }}</span
                                    >
                                    <i class="fa-2x" :class="item.imagen"></i>
                                </div>
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
