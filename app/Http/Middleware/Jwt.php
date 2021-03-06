<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Lcobucci\JWT\Token\Plain;
use Illuminate\Support\Facades\Log;

use App\Globals\Jwt as JJWT;

class Jwt{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     * ex. Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsIkF1dGhvciI6bnVsbH0.eyJpc3MiOiJMYXJhdmVsIiwiYXVkIjoiaHR0cDovL3d3dy5nb3VxaS5jb20iLCJpYXQiOjE2MjYzOTk3NjQuOTY0NjY0LCJuYmYiOjE3ODQxNjYxNjQuOTY0NjY0LCJpZCI6MX0.aEdGV0IgW1Ybo3NILHGRY1fTCF8_MFZNapEXChawDVc
     */
    public function handle(Request $request, Closure $next){
        try{
            $token      = $request->header('authorization');
            if(!$token){
                $token  = $request->input('token');
            }
            $jwt        = JJWT::untoken($token);
            if($jwt instanceof Plain){
                $id         = $jwt->claims()->get('id');
                if($id > 0){
                    $request->merge(['_uid' => $id]);
                    return $next($request);
                }
            }
        }catch(\Exception $e){
            Log::error('JWT Middleware: ' . $e->getMessage());
        }

        return response()->json(['error' => 'Unauthorized', 'code' => 401], 401);
    }
}
