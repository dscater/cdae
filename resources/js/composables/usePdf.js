// composables/usePdf.js
import { ref } from "vue";

const triggerExport = ref(0);

export function usePdf() {
    const exportPdf = () => {
        triggerExport.value++;
    };

    return {
        triggerExport,
        exportPdf,
    };
}
