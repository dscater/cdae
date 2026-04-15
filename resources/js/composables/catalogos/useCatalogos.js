import { onMounted, ref } from "vue";

const oCatalogo = ref({
    id: 0,
    nombre: "",
    tipo: "imagen",
    imagen: "",
    descargar: 1,
    _method: "POST",
});

export const useCatalogos = () => {
    const setCatalogo = (item = null) => {
        if (item) {
            oCatalogo.value.id = item.id;
            oCatalogo.value.nombre = item.nombre;
            oCatalogo.value.tipo = item.tipo;
            oCatalogo.value.descargar = item.descargar;
            oCatalogo.value._method = "PUT";
            return oCatalogo;
        }
        return false;
    };

    const limpiarCatalogo = () => {
        oCatalogo.value.id = 0;
        oCatalogo.value.nombre = "";
        oCatalogo.value.tipo = "imagen";
        oCatalogo.value.imagen = "";
        oCatalogo.value.descargar = 1;
        oCatalogo.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oCatalogo,
        setCatalogo,
        limpiarCatalogo,
    };
};
