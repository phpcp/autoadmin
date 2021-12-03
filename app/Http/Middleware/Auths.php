<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Auths
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next){
        $token      = $request->header('token');
        return $next($request);
    }
}
