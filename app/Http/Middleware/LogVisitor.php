<?php

namespace App\Http\Middleware;


use Jenssegers\Agent\Agent;
use App\Models\Visitante;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class LogVisitor
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $agent = new Agent();

        if (!cache()->has('visit_' . $request->ip())) {
            cache()->put('visit_' . $request->ip(), true, 300);
            Visitante::create([
                'ip' => $request->ip(),
                'user_agent' => $request->userAgent(),
                'browser' => $agent->browser(),
                'platform' => $agent->platform(),
                'device' => $agent->isMobile() ? 'Mobile' : ($agent->isTablet() ? 'Tablet' : 'Desktop'),
                'url' => $request->fullUrl(),
                'referer' => $request->headers->get('referer'),
            ]);
        }
        return $next($request);
    }
}
