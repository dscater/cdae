// useFlipbook.js
import { ref, computed } from "vue";

const currentPage = ref(0); // mejor empezar en 0
const lastPage = ref(0);
const total = ref(0);

export function useFlipbook() {
    const next = () => {
        if (!total.value) return;
        currentPage.value = (currentPage.value + 1) % total.value;
    };

    const prev = () => {
        if (!total.value) return;
        currentPage.value = (currentPage.value - 1 + total.value) % total.value;
    };

    const setCurrentPage = (value) => {
        currentPage.value = value;
    };

    const setTotal = (value) => {
        total.value = value;
    };

    const setLastPage = (value) => {
        lastPage.value = value;
    };

    const uiPage = computed({
        get() {
            return total.value ? currentPage.value + 1 : 0;
        },
        set(value) {
            if (!total.value) return;

            let page = Number(value) - 1;

            if (isNaN(page)) return;

            // circular
            page = (page + total.value) % total.value;

            currentPage.value = page;
        },
    });

    return {
        currentPage,
        uiPage,
        next,
        prev,
        setLastPage,
        setCurrentPage,
        setTotal,
        lastPage,
        total,
    };
}
