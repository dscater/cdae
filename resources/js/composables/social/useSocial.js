import { useSocialStore } from "@/stores/social/socialStore";
import axios from "axios";
import { storeToRefs } from "pinia";
import { onMounted } from "vue";

export const useSocial = () => {
    const store_social = useSocialStore();
    const { oSocial } = storeToRefs(store_social);

    const getSocial = async (id) => {
        try {
            const response = await axios.get(route("socials.getSocial", id), {
                headers: { Accept: "application/json" },
            });
            store_social.setSocial(response.data.social);
            return response.data.social;
        } catch (error) {
            console.error("Error al obtener la configuración:", error);
            throw error; // Puedes manejar el error según tus necesidades
        }
    };

    onMounted(() => {
        getSocial();
    });

    return {
        // propiedades
        oSocial,
        // metodos
        getSocial,
    };
};
