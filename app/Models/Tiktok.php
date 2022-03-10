<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tiktok extends Model{
	public $timestamps = false;
    use HasFactory;

    //获取最新版本的TIKTOK信息
    public static function last(){
    	return self::orderByDesc('sorts')->orderByDesc('id')->first();
    }
}
