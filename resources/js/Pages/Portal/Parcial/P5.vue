<script setup>
const props = defineProps({
    productos: {
        type: Array,
        default: [],
    },
});
</script>
<template>
    <div class="p5 pagina">
        <table>
            <tbody>
                <tr>
                    <td colspan="3">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${
                                    productos[0].url_imagen
                                })`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="nombre">
                                {{ productos[0].nombre }}
                            </div>
                            <div class="descripcion">
                                {{
                                    productos[0].producto_descripcions[0]
                                        .descripcion
                                }}
                            </div>
                            <div class="descripcion2">
                                {{
                                    productos[0].producto_descripcions[1]
                                        .descripcion
                                }}
                            </div>
                            <div class="precio">
                                {{ productos[0].moneda }}
                                {{ productos[0].precio }}
                            </div>
                            <div class="accion">
                                <button @click="alert('asdasd')">
                                    <i class="fa fa-cart-plus"></i>
                                    <span>Agregar</span>
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img :src="productos[1].url_imagen" alt="" />
                    </td>
                    <td>
                        <img :src="productos[2].url_imagen" alt="" />
                    </td>
                    <td rowspan="3">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${productos[3].url_imagen})`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="nombre">
                                {{ productos[3].nombre }}
                            </div>
                            <div class="descripcion">
                                {{
                                    productos[3].producto_descripcions[0]
                                        .descripcion
                                }}
                            </div>
                            <div class="descripcion2">
                                {{
                                    productos[3].producto_descripcions[1]
                                        .descripcion
                                }}
                            </div>
                            <div class="precio">
                                {{ productos[3].moneda }}
                                {{ productos[3].precio }}
                            </div>
                            <div class="accion">
                                <button @click="alert('asdasd')">
                                    <i class="fa fa-cart-plus"></i>
                                    <span>Agregar</span>
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="nombre">{{ productos[1].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[1].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[1].moneda }} {{ productos[1].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="nombre">{{ productos[2].nombre }}</div>
                        <div class="descripcion">
                            {{
                                productos[2].producto_descripcions[0]
                                    .descripcion
                            }}
                        </div>
                        <div class="precio">
                            {{ productos[2].moneda }} {{ productos[2].precio }}
                        </div>
                        <div class="accion">
                            <button @click="alert('asdasd')">
                                <i class="fa fa-cart-plus"></i>
                                <span>Agregar</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div
                            class="contenido"
                            :style="{
                                backgroundImage: `url(${
                                    productos[4].url_imagen
                                })`,
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                backgroundPosition: 'center',
                            }"
                        >
                            <div class="nombre">
                                {{ productos[4].nombre }}
                            </div>
                            <div class="descripcion">
                                {{
                                    productos[4].producto_descripcions[0]
                                        .descripcion
                                }}
                            </div>
                            <div class="descripcion2">
                                {{
                                    productos[4].producto_descripcions[1]
                                        .descripcion
                                }}
                            </div>
                            <div class="precio">
                                {{ productos[4].moneda }}
                                {{ productos[4].precio }}
                            </div>
                            <div class="accion">
                                <button @click="alert('asdasd')">
                                    <i class="fa fa-cart-plus"></i>
                                    <span>Agregar</span>
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style scoped>
.p5 table {
    border-collapse: separate;
    border-spacing: 5px;
    width: 100%;
    height: 100%;
}
.p5 table tbody tr td {
    padding: 0;
    position: relative;
}

.p5 table tbody tr td div.accion {
    width: 100%;
    text-align: center;
}

.p5 table tbody tr td div.accion button {
    font-size: 13pt;
    border: solid 1px var(--principal);
    border-radius: 20px;
    padding: 10px;
}

.p5 div.accion button span {
    font-size: 10pt;
    margin-left: 7px;
}

.p5 table tbody tr td div.nombre {
    text-align: center;
    font-weight: bold;
    font-size: 15pt;
}

.p5 table tbody tr td div.descripcion {
    text-align: center;
    font-weight: normal;
    font-size: 12pt;
}

.p5 table tbody tr td div.precio {
    text-align: center;
    font-weight: bold;
    font-size: 12pt;
}

.p5 table tbody img {
    width: 100%;
    height: 100%;
    object-fit: fill;
}

/* FILA 1 */
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido {
    min-height: 200px;
}

.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .nombre,
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion,
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion2,
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .accion,
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .precio {
    position: absolute;
}

.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .nombre,
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion {
    left: 0;
    bottom: 60px;
    text-align: left;
    padding-left: 50px;
}

.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion {
    bottom: 20px;
}

.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion2,
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .precio {
    right: 20px;
}
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .precio {
    bottom: 60px;
}
.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .descripcion2 {
    bottom: 83px;
}

.p5 table tbody tr:nth-child(1) td:nth-child(1) .contenido .accion {
    right: 0px;
    bottom: 10px;
    padding-right: 20px;
    text-align: right;
}

.p5 table tbody tr:nth-child(1) td:nth-child(1) img {
    min-height: 300px;
    object-fit: fill;
    height: 100%;
    width: 100%;
}

/* FILA 2 */
.p5 table tbody tr:nth-child(2) td:nth-child(1),
.p5 table tbody tr:nth-child(2) td:nth-child(2) {
    width: 188px;
    min-height: 150px;
}

.p5 table tbody tr:nth-child(2) td:nth-child(1) img,
.p5 table tbody tr:nth-child(2) td:nth-child(2) img {
    min-height: 150px;
}

.p5 table tbody tr:nth-child(2) td:nth-child(3) {
    width: 30%;
}
.p5 table tbody tr:nth-child(2) td:nth-child(3) .contenido {
    height: 100%;
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: end;
    align-items: end;
    padding-bottom: 10px;
}

.p5 table tbody tr:nth-child(2) td:nth-child(3) .contenido .nombre,
.p5 table tbody tr:nth-child(2) td:nth-child(3) .contenido .descripcion,
.p5 table tbody tr:nth-child(2) td:nth-child(3) .contenido .descripcion2,
.p5 table tbody tr:nth-child(2) td:nth-child(3) .contenido .precio,
.p5 table tbody tr:nth-child(2) td:nth-child(3) .contenido .accion {
    margin-top: 10px;
    width: 100%;
    text-align: center;
}

/* FILA 4 */
.p5 table tbody tr:nth-child(4) td:nth-child(1) .contenido {
    min-height: 220px;
    display: flex;
    flex-direction: column;
    justify-content: end;
    align-items: end;
    padding-bottom: 10px;
}
.p5 table tbody tr:nth-child(4) td:nth-child(1) img {
    min-height: 220px;
}

.p5 table tbody tr:nth-child(4) td:nth-child(1) .contenido .nombre,
.p5 table tbody tr:nth-child(4) td:nth-child(1) .contenido .descripcion,
.p5 table tbody tr:nth-child(4) td:nth-child(1) .contenido .descripcion2,
.p5 table tbody tr:nth-child(4) td:nth-child(1) .contenido .precio,
.p5 table tbody tr:nth-child(4) td:nth-child(1) .contenido .accion {
    width: 50%;
    margin-top: 10px;
    text-align: center;
}

@media (max-width: 990px) {
    button span {
        display: none;
    }
}
</style>
