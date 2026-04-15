<?php

namespace App\Http\Controllers;

use App\Http\Requests\CatalogoStoreRequest;
use App\Http\Requests\CatalogoUpdateRequest;
use App\Models\Catalogo;
use App\Services\CatalogoService;
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

class CatalogoController extends Controller
{
    public function __construct(private CatalogoService $catalogoService) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): ResponseInertia
    {
        return Inertia::render("Admin/Catalogos/Index");
    }

    /**
     * Listado de catalogos sin ids: 1 y 2
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "catalogos" => $this->catalogoService->listado()
        ]);
    }

    public function paginado(Request $request)
    {
        $perPage = $request->perPage;
        $page = (int)($request->input("page", 1));
        $search = (string)$request->input("search", "");
        $orderByCol = $request->orderByCol;
        $desc = $request->desc;

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
        if ($orderByCol && $desc) {
            $arrayOrderBy = [
                [$orderByCol, $desc]
            ];
        }

        $catalogos = $this->catalogoService->listadoPaginado($perPage, $page, $search, $columnsSerachLike, $columnsFilter, $columnsBetweenFilter, $arrayOrderBy);
        return response()->JSON([
            "data" => $catalogos->items(),
            "total" => $catalogos->total(),
            "lastPage" => $catalogos->lastPage()
        ]);
    }


    /**
     * Endpoint para obtener la lista de catalogos paginado para datatable
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function api(Request $request): JsonResponse
    {

        return response()->JSON([]);
    }

    /**
     * Registrar un nuevo catalogo
     *
     * @param CatalogoStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(CatalogoStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el Catalogo
            $this->catalogoService->crear($request->validated());
            DB::commit();
            return redirect()->route("catalogos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un catalogo
     *
     * @param Catalogo $catalogo
     * @return JsonResponse
     */
    public function show(Catalogo $catalogo): JsonResponse
    {
        return response()->JSON($catalogo);
    }

    public function byCodigo(Request $request): JsonResponse
    {
        try {
            $codigo = $request->codigo;
            $catalogo = Catalogo::where("codigo", $codigo)->get()->first();

            if (!$catalogo) {
                throw new Exception("No hay ningún catalogo con ese código");
            }

            if ($catalogo->status == 0) {
                throw new Exception("No se encontró el catalogo");
            }

            if ($catalogo->status == 2) {
                throw new Exception("El catalogo ya fue vendido");
            }

            return response()->JSON($catalogo);
        } catch (\Exception $e) {
            Log::debug("BB");
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }


    public function update(Catalogo $catalogo, CatalogoUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar catalogo
            $this->catalogoService->actualizar($request->validated(), $catalogo);
            DB::commit();
            return redirect()->route("catalogos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar catalogo
     *
     * @param Catalogo $catalogo
     * @return JsonResponse|Response
     */
    public function destroy(Catalogo $catalogo): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->catalogoService->eliminar($catalogo);
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
