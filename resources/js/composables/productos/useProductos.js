import { onMounted, ref } from "vue";

const oProducto = ref({
    id: 0,
    catalogo_id: "",
    nombre: "",
    codigo: "",
    precio: "",
    imagen: "",
    estado: "PÚBLICO",
    _method: "POST",
});

export const useProductos = () => {
    const setProducto = (item = null) => {
        if (item) {
            oProducto.value.id = item.id;
            oProducto.value.nombre = item.nombre;
            oProducto.value.codigo = item.codigo;
            oProducto.value.precio = item.precio;
            oProducto.value.catalogo_id = item.catalogo_id;
            oProducto.value.estado = item.estado;
            oProducto.value._method = "PUT";
            return oProducto;
        }
        return false;
    };

    const limpiarProducto = () => {
        oProducto.value.id = 0;
        oProducto.value.catalogo_id = "";
        oProducto.value.nombre = "";
        oProducto.value.codigo = "";
        oProducto.value.precio = "";
        oProducto.value.imagen = "";
        oProducto.value.estado = "PÚBLICO";
        oProducto.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oProducto,
        setProducto,
        limpiarProducto,
    };
};
