import { onMounted, ref } from "vue";

const oCatalogo = ref({
    id: 0,
    pagina_id: "",
    imagen: "",
    estado: 0,
    productos: [],
    _method: "POST",
});

export const useCatalogos = () => {
    const setCatalogo = (item = null) => {
        if (item) {
            oCatalogo.value.id = item.id;
            oCatalogo.value.pagina_id = item.pagina_id;
            oCatalogo.value.imagen = item.imagen;
            oCatalogo.value.url_imagen = item.url_imagen;
            oCatalogo.value.estado = item.estado;
            oCatalogo.value.productos = item.productos;
            oCatalogo.value._method = "PUT";
            return oCatalogo;
        }
        return false;
    };

    const limpiarCatalogo = () => {
        oCatalogo.value.id = 0;
        oCatalogo.value.pagina_id = "";
        oCatalogo.value.imagen = "";
        oCatalogo.value.estado = 0;
        oCatalogo.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oCatalogo,
        setCatalogo,
        limpiarCatalogo,
    };
};
