import { onMounted, ref } from "vue";

const oPaginaCatalogo = ref({
    id: 0,
    nombre: "",
    tipo: "imagen",
    imagen: "",
    descargar: 1,
    _method: "POST",
});

export const usePaginaCatalogos = () => {
    const setPaginaCatalogo = (item = null) => {
        if (item) {
            oPaginaCatalogo.value.id = item.id;
            oPaginaCatalogo.value.nombre = item.nombre;
            oPaginaCatalogo.value.tipo = item.tipo;
            oPaginaCatalogo.value.descargar = item.descargar;
            oPaginaCatalogo.value._method = "PUT";
            return oPaginaCatalogo;
        }
        return false;
    };

    const limpiarPaginaCatalogo = () => {
        oPaginaCatalogo.value.id = 0;
        oPaginaCatalogo.value.nombre = "";
        oPaginaCatalogo.value.tipo = "imagen";
        oPaginaCatalogo.value.imagen = "";
        oPaginaCatalogo.value.descargar = 1;
        oPaginaCatalogo.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oPaginaCatalogo,
        setPaginaCatalogo,
        limpiarPaginaCatalogo,
    };
};
