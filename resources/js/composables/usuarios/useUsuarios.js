import { onMounted, ref } from "vue";

const oUsuario = ref({
    id: 0,
    usuario: "",
    nombre: "",
    paterno: "",
    materno: "",
    correo: "",
    fono: "",
    password: "",
    acceso: 0,
    tipo: "",
    foto: "",
    fecha_registro: "",
    _method: "POST",
});

export const useUsuarios = () => {
    const setUsuario = (item = null, ver = false) => {
        if (item) {
            oUsuario.value.id = item.id;
            oUsuario.value.usuario = item.usuario;
            oUsuario.value.nombre = item.nombre;
            oUsuario.value.paterno = item.paterno;
            oUsuario.value.materno = item.materno;
            oUsuario.value.correo = item.correo;
            oUsuario.value.fono = item.fono;
            oUsuario.value.password = item.password;
            oUsuario.value.acceso = item.acceso;
            oUsuario.value.tipo = item.tipo;
            oUsuario.value.fecha_registro = item.fecha_registro;
            oUsuario.value._method = "PUT";
            return oUsuario;
        }
        return false;
    };

    const limpiarUsuario = () => {
        oUsuario.value.id = 0;
        oUsuario.value.usuario = "";
        oUsuario.value.nombre = "";
        oUsuario.value.paterno = "";
        oUsuario.value.materno = "";
        oUsuario.value.correo = "";
        oUsuario.value.fono = "";
        oUsuario.value.password = "";
        oUsuario.value.acceso = 0;
        oUsuario.value.tipo = "";
        oUsuario.value.foto = "";
        oUsuario.value.fecha_registro = "";
        oUsuario._method = "POST";
    };

    onMounted(() => {});

    return {
        oUsuario,
        setUsuario,
        limpiarUsuario,
    };
};
