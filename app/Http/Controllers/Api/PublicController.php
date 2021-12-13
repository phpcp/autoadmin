<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Globals\Ens;
use App\Globals\Responses;
use App\Models\User;
use App\Models\Device;

class PublicController extends Controller{
	public function scan(Request $request){
		$token 	= $request->input('token');
		if(!$token){
			return Responses::error('错误!', 405);
		}
		$rrrs 	= json_decode(Ens::decrypt(base64_decode($token)), true);
		$info 	= $rrrs['info'] ?? null;
		$imei 	= $rrrs['imei'] ?? null;
		$token 	= $rrrs['token'] ?? null;
		if(!$info || !$imei || !$token){
			return Responses::error('错误!', 405);
		}

		$token 	= Ens::decrypt($token);
		$token 	= json_decode($token, true);
		if(!isset($token['id']) || !isset($token['time'])){
			return Responses::error('请登录!', null, 401, 401);
		}
		if(time()-$token['time'] >= Ens::$timeout){
			return Responses::error('二维码过期!', null, 200, 403);
		}

		$user 		= User::find($token['id']);
		if($user->endtime && $user->endtime < time()){
			return Responses::error('您的授权已到期!', null, 200, 401);
		}

		$rs 		= Device::bind($imei, $user, $info);
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}

		$user->updated_at 	= date('Y-m-d H:i:s');
		$user->save();
		$newToken 	= base64_encode(Ens::encrypt(json_encode(['id' => $user->id, 'login' => time()])));
		return Responses::success(['token' => $newToken, 'num' => $rs->user_num, 'id' => $user->id, 'did' => $rs->id]);
	}
	public function connect(Request $request){
		$token 	= $request->input('token');
		if(!$token){
			return Responses::error('错误!', 405);
		}
		$rrrs 	= json_decode(Ens::decrypt(base64_decode($token)), true);
		$info 	= $rrrs['info'] ?? null;
		$imei 	= $rrrs['imei'] ?? null;
		$token 	= $rrrs['token'] ?? null;
		if(!$info || !$imei || !$token){
			return Responses::error('错误!', 405);
		}
		$token 	= Ens::decrypt(base64_decode($token));
		$token 	= json_decode($token, true);
		if(!isset($token['id']) || !isset($token['login'])){
			return Responses::error('请登录!', null, 401, 401);
		}
		$user 		= User::find($token['id']);
		if($user->endtime && $user->endtime < time()){
			return Responses::error('您的授权已到期!', null, 200, 401);
		}

		$rs 		= Device::bind($imei, $user, $info);
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}

		return Responses::success(['num' => $rs->user_num, 'id' => $user->id, 'did' => $rs->id]);
	}

	//
	public function closetxt(Request $request){
		$arr 	= [
			'我知道了',
			'以后再说',
			'拒绝',
			'同意',
			'始终允许',
			'好的',
			'跳过广告',
			'取消'
		];
		return Responses::success($arr);
	}
}
