import { onMounted, ref } from "vue";

const oPaginaCatalogo = ref({
    id: 0,
    pagina: "",
    descripcion: "",
    productos: "",
    redes: "",
    url_pagina: "",
    _method: "POST",
});

export const usePaginaCatalogos = () => {
    const setPaginaCatalogo = (item = null) => {
        if (item) {
            oPaginaCatalogo.value.id = item.id;
            oPaginaCatalogo.value.pagina = item.pagina;
            oPaginaCatalogo.value.descripcion = item.descripcion;
            oPaginaCatalogo.value.productos = item.productos;
            oPaginaCatalogo.value.redes = item.redes;
            oPaginaCatalogo.value.url_pagina = item.url_pagina;
            oPaginaCatalogo.value._method = "PUT";
            return oPaginaCatalogo;
        }
        return false;
    };

    const limpiarPaginaCatalogo = () => {
        oPaginaCatalogo.value.id = 0;
        oPaginaCatalogo.value.pagina = "";
        oPaginaCatalogo.value.descripcion = "";
        oPaginaCatalogo.value.productos = "";
        oPaginaCatalogo.value.redes = "";
        oPaginaCatalogo.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oPaginaCatalogo,
        setPaginaCatalogo,
        limpiarPaginaCatalogo,
    };
};
