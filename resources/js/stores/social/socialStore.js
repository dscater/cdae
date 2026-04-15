import axios from "axios";
import { defineStore } from "pinia";
export const useSocialStore = defineStore("social", {
    state: () => ({
        oSocial: {
            whatsapp: "",
            facebook: "",
            tiktok: "",
            instagram: "",
            youtube: "",
            x: "",
            web: "",
            correo: "",
        },
    }),
    actions: {
        initSocial() {
            axios
                .get(route("socials.getSocial"))
                .then((response) => {
                    this.setSocial(response.data.social);
                })
                .catch((error) => {
                    console.log("Error al cargar la configuración");
                })
                .finally(() => {
                    console.log("Configuración cargada");
                });
        },
        setSocial(value) {
            this.oSocial = { ...value };
        },
    },
    getters: {
        getSocial() {
            return this.oSocial;
        },
    },
});
