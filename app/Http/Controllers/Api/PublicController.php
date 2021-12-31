<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Globals\Ens;
use App\Globals\Responses;
use App\Models\AdminUser;
use App\Models\Device;
use App\Models\TiktokVersionButton;
use App\Models\LangToText;

class PublicController extends Controller{
	// public function scan(Request $request){
	// 	$token 	= $request->input('token');
	// 	if(!$token){
	// 		return Responses::error('错误!', 405);
	// 	}
	// 	$rrrs 	= json_decode(Ens::decrypt(base64_decode($token)), true);
	// 	$info 	= $rrrs['info'] ?? null;
	// 	$imei 	= $rrrs['imei'] ?? null;
	// 	$token 	= $rrrs['token'] ?? null;
	// 	if(!$info || !$imei || !$token){
	// 		return Responses::error('错误!', 405);
	// 	}

	// 	$token 	= Ens::decrypt($token);
	// 	$token 	= json_decode($token, true);
	// 	if(!isset($token['id']) || !isset($token['time'])){
	// 		return Responses::error('请登录!', null, 401, 401);
	// 	}
	// 	if(time()-$token['time'] >= Ens::$timeout){
	// 		return Responses::error('二维码过期!', null, 200, 403);
	// 	}

	// 	$user 		= AdminUser::find($token['id']);
	// 	if($user->endtime && $user->endtime < time()){
	// 		return Responses::error('您的授权已到期!', null, 200, 401);
	// 	}

	// 	$rs 		= Device::bind($imei, $user, $info);
	// 	if(!$rs instanceof Device){
	// 		return Responses::error($rs);
	// 	}

	// 	$user->updated_at 	= date('Y-m-d H:i:s');
	// 	$user->save();
	// 	$newToken 	= base64_encode(Ens::encrypt(json_encode(['id' => $user->id, 'login' => time()])));
	// 	return Responses::success(['token' => $newToken, 'num' => $rs->user_num, 'id' => $user->id, 'did' => $rs->id]);
	// }
	public function connect(Request $request){
		$token 	= $request->input('token');
		if(!$token){
			return Responses::error('错误!', 405);
		}
		$rrrs 	= json_decode(Ens::decrypt(base64_decode($token)), true);
		// file_put_contents(__DIR__ . '/1.txt', json_encode($rrrs));
		$info 	= $rrrs['info'] ?? null;
		$imei 	= $rrrs['imei'] ?? null;
		$token 	= $rrrs['token'] ?? null;
		if(!$info || !$imei || !$token){
			return Responses::error('错误.', 405);
		}
		$token 	= Ens::decrypt($token);
		$token 	= json_decode($token, true);
		if(!isset($token['id']) || !isset($token['login'])){
			return Responses::error('请登录!', null, 401, 401);
		}
		$user 		= AdminUser::find($token['id']);
		if($user->endtime && $user->endtime < time()){
			return Responses::error('您的授权已到期!', null, 200, 401);
		}

		$rs 		= Device::bind($imei, $user, $info);
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}

		return Responses::success(['num' => $rs->user_num, 'id' => $user->id, 'did' => $rs->id]);
	}

	// 权限验证
	public function auth(Request $request){
		$token 	= $request->input('token');
		if(!$token){
			return Responses::error('非法请求.', null, 500, 500);
		}
		$req 	= json_decode(Ens::decrypt($token), true);
		if(!isset($req['id']) || !isset($req['time']) && $req['id'] < 1){
			return Responses::error('非法请求!' . json_encode($req), null, 500, 500);
		}
		if((time() - $req['time']) >= env('QRCODE_TIMEOUT', 180)){
			return Responses::error('二维码已过期!', null, 401, 200);
		}

		$user 		= AdminUser::find($req['id']);
		if($user->endtime && $user->endtime <= time()){
			return Responses::error('您的授权已到期!', null, 401, 200);
		}
		$binded 	= Device::where('admin_id', $user->id)->count();
		if($binded >= $user->max_device){
			return Responses::error('设备绑定已达上限!', null, 401, 200);
		}
		$token 		= AdminUser::token($user);
		return Responses::success(['token' => $token, 'versionapi' => url('api/mksureversion'),'closetxtapi' => url('api/getCloseTxt')]);
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

	// 确定tiktok版本
	public function tiktokVersion(Request $request){
		$version 		= $request->input('version');
		if(!$version){
			return Responses::success(TiktokVersionButton::pluck('mainId', 'version')->toArray());
		}else{
			$row 		= TiktokVersionButton::where('version', $version)->first();
			if(!$row){
				return Responses::error('错误!');
			}else{
				$data 	= json_decode($row->ids, true);
				$
				return Responses::success($data);
			}
		}
	}
}
