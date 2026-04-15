<?php

namespace App\Http\Controllers;

use App\Http\Requests\PaginaCatalogoStoreRequest;
use App\Http\Requests\PaginaCatalogoUpdateRequest;
use App\Models\PaginaCatalogo;
use App\Services\PaginaCatalogoService;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Inertia\Response as ResponseInertia;

class PaginaCatalogoController extends Controller
{
    public function __construct(private PaginaCatalogoService $pagina_catalogoService) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): ResponseInertia
    {
        return Inertia::render("Admin/PaginaCatalogos/Index");
    }

    /**
     * Listado de pagina_catalogos sin ids: 1 y 2
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "pagina_catalogos" => $this->pagina_catalogoService->listado()
        ]);
    }

    public function paginado(Request $request)
    {
        $perPage = $request->perPage;
        $page = (int)($request->input("page", 1));
        $search = (string)$request->input("search", "");
        $orderBy = $request->orderBy;
        $orderAsc = $request->orderAsc;

        $columnsSerachLike = [
            "codigo",
            "modelo",
            "marca",
            "talla",
            "nombre"
        ];
        $columnsFilter = [];
        $columnsBetweenFilter = [];
        $arrayOrderBy = [];
        if ($orderBy && $orderAsc) {
            $arrayOrderBy = [
                [$orderBy, $orderAsc]
            ];
        }

        $pagina_catalogos = $this->pagina_catalogoService->listadoPaginado($perPage, $page, $search, $columnsSerachLike, $columnsFilter, $columnsBetweenFilter, $arrayOrderBy);
        return response()->JSON([
            "data" => $pagina_catalogos->items(),
            "total" => $pagina_catalogos->total(),
            "lastPage" => $pagina_catalogos->lastPage()
        ]);
    }


    /**
     * Endpoint para obtener la lista de pagina_catalogos paginado para datatable
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function api(Request $request): JsonResponse
    {

        return response()->JSON([]);
    }

    /**
     * Registrar un nuevo pagina_catalogo
     *
     * @param PaginaCatalogoStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(PaginaCatalogoStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el PaginaCatalogo
            $this->pagina_catalogoService->crear($request->validated());
            DB::commit();
            return redirect()->route("pagina_catalogos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un pagina_catalogo
     *
     * @param PaginaCatalogo $pagina_catalogo
     * @return JsonResponse
     */
    public function show(PaginaCatalogo $pagina_catalogo): JsonResponse
    {
        return response()->JSON($pagina_catalogo);
    }

    public function byCodigo(Request $request): JsonResponse
    {
        try {
            $codigo = $request->codigo;
            $pagina_catalogo = PaginaCatalogo::where("codigo", $codigo)->get()->first();

            if (!$pagina_catalogo) {
                throw new Exception("No hay ningún pagina_catalogo con ese código");
            }

            if ($pagina_catalogo->status == 0) {
                throw new Exception("No se encontró el pagina_catalogo");
            }

            if ($pagina_catalogo->status == 2) {
                throw new Exception("El pagina_catalogo ya fue vendido");
            }

            return response()->JSON($pagina_catalogo);
        } catch (\Exception $e) {
            Log::debug("BB");
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }


    public function update(PaginaCatalogo $pagina_catalogo, PaginaCatalogoUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar pagina_catalogo
            $this->pagina_catalogoService->actualizar($request->validated(), $pagina_catalogo);
            DB::commit();
            return redirect()->route("pagina_catalogos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar pagina_catalogo
     *
     * @param PaginaCatalogo $pagina_catalogo
     * @return JsonResponse|Response
     */
    public function destroy(PaginaCatalogo $pagina_catalogo): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->pagina_catalogoService->eliminar($pagina_catalogo);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
