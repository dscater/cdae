import { defineStore } from "pinia";
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
export const useCatalogoStore = defineStore("catalogo", {
    state: () => ({
        listProductos: localStorage.getItem("listProductos")
            ? JSON.parse(localStorage.getItem("listProductos"))
            : [],
    }),
    actions: {
        agregarProducto(producto) {
            if (this.listProductos.some((p) => p.id === producto.id)) {
                toast.warning("El producto ya está en el pedido");
                return;
            }
            this.listProductos.push(producto);
            localStorage.setItem(
                "listProductos",
                JSON.stringify(this.listProductos),
            );
            toast.success("Producto agregado al pedido");
        },
        quitarProducto(index) {
            this.listProductos.splice(index, 1);

            localStorage.setItem(
                "listProductos",
                JSON.stringify(this.listProductos),
            );
            toast.info("Producto eliminado del pedido");
        },
        vaciarPedido() {
            this.listProductos = [];
            localStorage.removeItem("listProductos");
            // toast.info("Pedido vaciado");
        },
    },
    getters: {
        getListaProductos() {
            return this.listProductos;
        },
    },
});
