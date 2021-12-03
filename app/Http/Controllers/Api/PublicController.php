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
		$imei 	= $request->input('imei');
		$info 	= $request->input('info');
		if(!$token || !$info || !$imei){
			return Responses::error('错误!', 405);
		}
		$info 	= base64_decode($info, true);
		// $imei 	= $info['imei'];
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
			return Responses::error('您的授权已到期!');
		}

		$rs 		= Device::bind($imei, $user, $info);
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}

		$user->updated_at 	= date('Y-m-d H:i:s');
		$user->save();
		$newToken 	= Ens::encrypt(['id' => $user->id, 'login' => time()], true);
		return Responses::success(['token' => $newToken, 'num' => $rs->user_num ? $rs->user_num : $rs->number, 'id' => $user->id, 'did' => $rs->id]);
	}
	public function connect(Request $request){
		$token 	= $request->input('token');
		$imei 	= $request->input('imei');
		$info 	= $request->input('info');
		if(!$token || !$info || !$imei){
			return Responses::error('错误!', null, 405, 405);
		}
		$info 	= base64_decode($info, true);
		$token 	= Ens::decrypt($token, true);
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

		return Responses::success(['num' => $rs->user_num ? $rs->user_num : $rs->number, 'id' => $user->id, 'did' => $rs->id]);
	}
}
