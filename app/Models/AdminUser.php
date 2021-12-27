<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Globals\Ens;

class AdminUser extends Model{
    use HasFactory;

    public static function token(self $user){
    	$arr 		= [
			'id'		=> $user->id,
			'name'		=> $user->username,
			'login'		=> time(),
		];
		$loginToken = Ens::encrypt(json_encode($arr));
		$arr 		= [
			'ws'	=> env('WS_LINK_URL'),
			'token'	=> $loginToken,
		];
		return Ens::encrypt(json_encode($arr));
    }

    // 解析token并返回 AdminUser 实例
    public static function unToken(string $token){

    }
}
