<script setup>
import Portal from "@/Layouts/Portal.vue";
import { usePage, router, Link } from "@inertiajs/vue3";
import {
    computed,
    onBeforeUnmount,
    onMounted,
    onUnmounted,
    ref,
    watch,
} from "vue";
import { useCatalogoStore } from "@/stores/catalogo/catalogoStore";
const catalogoStore = useCatalogoStore();
defineOptions({ layout: Portal });
const propsPage = usePage().props;
const url_assets = ref(propsPage.url_assets);
const enviando = ref(false);
const txtBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spinner fa-spin"></i> Creando pedido...`;
    } else {
        return `<i class="fab fa-whatsapp"></i> Realizar pedido por WhatsApp`;
    }
});
const crearPedido = () => {
    Swal.fire({
        title: "¿Quierés realizar el pedido?",
        html: `<strong>${catalogoStore.listProductos.length} productos agregados</strong>`,
        showCancelButton: true,
        confirmButtonText: "Si, realizar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
        customClass: {
            confirmButton: "btn-success",
        },
    }).then(async (result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            enviando.value = true;
            axios
                .post(route("portal.crearPedido"), {
                    productos: catalogoStore.listProductos,
                })
                .then((res) => {
                    Swal.fire("¡Pedido realizado con éxito!", "", "success");
                    Swal.fire({
                        icon: "success",
                        title: "¡Pedido realizado con éxito!",
                        text: ``,
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: `Aceptar`,
                    });
                    catalogoStore.vaciarPedido();
                    // console.log(res.data);
                    window.open(res.data.whatsapp, "_blank");
                })
                .catch((err) => {
                    Swal.fire("Error al realizar el pedido", "", "error");
                })
                .finally(() => {
                    enviando.value = false;
                });
        }
    });
};

const quitar = (index) => {
    Swal.fire({
        title: "¿Quierés quitar este producto?",
        html: ``,
        showCancelButton: true,
        confirmButtonText: "Si, quitar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
        customClass: {
            confirmButton: "btn-danger",
        },
    }).then(async (result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            catalogoStore.quitarProducto(index);
        }
    });
};

const total = computed(() => {
    const suma_total = catalogoStore.listProductos.reduce((value, item) => {
        return value + item.subtotal;
    }, 0);
    return suma_total;
});

const actualizaCantidad = (e, index) => {
    const cantidad = e.target.value;
    catalogoStore.actualizarCantidad(index, cantidad);
};

onMounted(() => {});

onBeforeUnmount(() => {});
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="mx-auto col-md-9 text-center mt-3">
                    <Link class="text-dark" :href="route('portal')"
                        ><i class="fa fa-arrow-left"></i> Volver al Inicio</Link
                    >
                </div>
                <div class="row">
                    <div class="col-12 text-center text-muted">
                        <h5 class="mt-2 mb-0 h3">Mi Pedido</h5>
                        {{ catalogoStore.listProductos.length }} Productos
                        agregados
                    </div>
                </div>
                <div
                    class="menu_inicio"
                    v-if="catalogoStore.listProductos.length > 0"
                >
                    <table class="table table-bordered">
                        <thead>
                            <th>N°</th>
                            <th></th>
                            <th>Producto</th>
                            <th>C/U Bs.</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <template
                                v-if="catalogoStore.listProductos.length > 0"
                            >
                                <tr
                                    v-for="(
                                        item, index
                                    ) in catalogoStore.listProductos"
                                >
                                    <td>
                                        {{ index + 1 }}
                                    </td>
                                    <td>
                                        <img
                                            :src="item.producto.url_imagen"
                                            alt=""
                                            height="90px"
                                        />
                                    </td>
                                    <td>{{ item.producto.nombre }}</td>
                                    <td>{{ item.producto.precio }}</td>
                                    <td>
                                        <input
                                            type="number"
                                            class="form-control"
                                            v-model="item.cantidad"
                                            @change="
                                                actualizaCantidad($event, index)
                                            "
                                            @keyup="
                                                actualizaCantidad($event, index)
                                            "
                                        />
                                    </td>
                                    <td>{{ item.subtotal }}</td>
                                    <td>
                                        <button
                                            class="btn btn-danger"
                                            @click="quitar(index)"
                                        >
                                            X
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="text-right font-weight-bold text-lg"
                                        colspan="5"
                                    >
                                        TOTAL
                                    </td>
                                    <td class="font-weight-bold text-lg">
                                        {{ total }}
                                    </td>
                                </tr>
                            </template>
                            <template v-else>
                                <tr>
                                    <td colspan="5">
                                        No se agregó ningún Producto
                                    </td>
                                </tr>
                            </template>
                        </tbody>
                    </table>
                </div>
                <div
                    class="enviar_pedido mt-1"
                    v-if="catalogoStore.listProductos.length > 0"
                >
                    <button
                        class="btn btn-success w-100"
                        @click="crearPedido"
                        :disabled="enviando"
                        v-html="txtBtn"
                    ></button>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
.productos {
    padding: 10px;
    height: 100%;
    overflow: auto;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.productos .producto {
    border: solid 1px #ccc;
    border-radius: 15px;
    display: block;
    height: auto;
    position: relative;
}
.productos .producto img {
    width: 100%;
}

.quitarProducto {
    position: absolute;
}
</style>
