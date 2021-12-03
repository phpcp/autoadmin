<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DouyinController extends Controller{
    public function doiyinyanghao(Request $request){
    	file_put_contents(__DIR__ . '/1.txt', json_encode($request->all()));
    }
}
