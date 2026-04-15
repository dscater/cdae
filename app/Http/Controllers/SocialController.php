<?php

namespace App\Http\Controllers;

use App\Http\Requests\SocialRequest;
use App\Models\Social;
use App\Services\SocialService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class SocialController extends Controller
{
    public function __construct(private SocialService $socialService) {}

    public function index(Request $request)
    {
        $social = Social::first();

        if (!$social) {
            $social = Social::create([
                "dir" => "",
                "whatsapp" => "",
                "facebook" => "",
                "tiktok" => "",
                "instagram" => "",
                "youtube" => "",
                "x" => "",
                "web" => "",
                "correo" => "",
            ]);
        }

        return Inertia::render("Admin/Socials/Index", compact("social"));
    }

    public function getSocial()
    {
        $social = Social::first();
        return response()->JSON([
            "social" => $social
        ], 200);
    }

    public function update(Social $social, SocialRequest $request)
    {
        DB::beginTransaction();
        try {
            $this->socialService->actualizar($request->validated(), $social);
            DB::commit();
            return redirect()->route("socials.index")->with("success", "Registro correcto");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Social $social) {}
}
