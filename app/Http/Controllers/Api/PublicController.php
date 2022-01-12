<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Globals\Ens;
use App\Globals\Responses;
use App\Models\AdminUser;
use App\Models\Device;
use App\Models\Task;
use App\Models\TiktokVersionButton;
use App\Models\LangToText;
use App\Models\Account;
use App\Globals\Wbapi;

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
		$rrrs 		= json_decode(Ens::decrypt(base64_decode($token)), true);
		// file_put_contents(__DIR__ . '/1.txt', json_encode($rrrs) . "\r\n" . $token);
		$info 		= $rrrs['info'] ?? null;
		$imei 		= $rrrs['imei'] ?? null;
		$version 	= $rrrs['version'] ?? null;
		$lang 		= $rrrs['lang'] ?? null;
		$token 		= $rrrs['token'] ?? null;
		if(!$info || !$imei || !$token){
			return Responses::error('错误.', 405);
		}
		if(!$version || !$lang || !is_string($version) ||!is_string($lang)){
			return Responses::error('app信息缺失!.', 405);
		}
		$token 	= base64_decode($token);
		$token 	= Ens::decrypt($token);
		$token 	= json_decode($token, true);
		if(!isset($token['id']) || !isset($token['login'])){
			return Responses::error('请登录!', null, 401, 401);
		}
		$user 		= AdminUser::find($token['id']);
		if($user->endtime && $user->endtime < time()){
			return Responses::error('您的授权已到期!', null, 200, 401);
		}

		$rs 		= Device::bind($imei, $user, $info, strtolower($version), strtolower($lang));
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}
		if(!$rs->soft_version || !$rs->soft_lang){
			return Responses::error('请先确定tiktok版本号和使用语言!', null, 500, 200);
		}
		$tmp 		= TiktokVersionButton::where('version', $rs->soft_version)->first();
		if(!$tmp || !$tmp->ids){
			return Responses::error('版本 ' . $rs->soft_version . ' 目前不支持!', null, 500, 200);
		}
		$tkids 		= json_decode($tmp->ids, true);
		$tktxts 	= LangToText::where('lang', $rs->soft_lang)->where(function($query) use($rs){
			$query->whereRaw('version is null')->orWhere('version', $rs->soft_version);
		})->orderBy('version', 'asc')->pluck('val', 'key')->toArray();


		$close_txt 	= [
			'我知道了',
			'以后再说',
			'拒绝',
			'同意',
			'始终允许',
			'好的',
			'跳过广告',
			'取消'
		];
		return Responses::success([
			'num' 			=> $rs->user_num,
			'id' 			=> $user->id,
			'did' 			=> $rs->id,
			'appversion' 	=> $rs->soft_version,
			'applang' 		=> $rs->soft_lang,
			'tkids'			=> $tkids,
			'tktxts'		=> $tktxts,
			'accounts'		=> Account::where('did', $rs->id)->count(),
			'close_txt'		=> $close_txt,
		]);
	}

	// 权限验证
	public function auth(Request $request){
		$token 	= $request->input('token');
		$imei 	= $request->input('imei');
		if(!$token || !$imei){
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

		$version 	= null;
		$lang 		= null;
		$deviceRow 	= Device::where('admin_id', $user->id)->where('imei', $imei)->first();
		if(!$deviceRow){
			$binded 	= Device::where('admin_id', $user->id)->where('imei', '!=', $imei)->count();
			if($binded >= $user->max_device){
				return Responses::error('设备绑定已达上限!', null, 401, 200);
			}
		}else{
			$version 	= $deviceRow->soft_version;
			$lang 		= $deviceRow->soft_lang;
		}

		$token 		= AdminUser::token($user);
		return Responses::success([
			'token' 		=> $token,
			'versionapi' 	=> url('api/mksureversion'),
			'closetxtapi' 	=> url('api/getCloseTxt'),
			'appversion' 	=> $version,
			'applang'		=> $lang,
		]);
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
		
		return Responses::success(['list' => $arr]);
	}

	// 确定tiktok版本
	public function tiktokVersion(Request $request){
		$version 		= $request->input('version');
		$lang 			= $request->input('lang');
		$imei 			= $request->input('imei');
		if(!$version){
			return Responses::success(TiktokVersionButton::pluck('mainId', 'version')->toArray());
		}else{
			$row 		= TiktokVersionButton::where('version', $version)->first();
			if(!$row){
				return Responses::error('错误!');
			}else{
				$txts 	= [

				];
				$data 	= json_decode($row->ids, true);
				$arr 	= [
					'list'	=> $data,
					'txts'	=> $txts,
				];
				return Responses::success($arr);
			}
		}
	}

	// 提供给pc端的接口, 显示当前账号
	public function topcaccounts(Request $request){
		$token 	= $request->input('token');
		$req 	= json_decode(Ens::decrypt($token), true);
		if(!isset($req['id']) || !isset($req['time']) && $req['id'] < 1){
			return Responses::error('非法请求!', null, 500, 500);
		}
		// if((time() - $req['time']) >= env('QRCODE_TIMEOUT', 180)){
		// 	return Responses::error('页面已过期,请重新请求!', null, 401, 200);
		// }

		$user 		= AdminUser::find($req['id']);
		if($user->endtime && $user->endtime <= time()){
			return Responses::error('您的授权已到期!', null, 401, 200);
		}
		$accounts 		= Account::select('accounts.id', 'accounts.uuid', 'accounts.avatar', 'accounts.nickname', 'devices.user_num')->where('accounts.admin_id', $user->id)->rightJoin('devices', 'accounts.did', '=', 'devices.id')->get();
		$accountsArr 	= [];
		foreach($accounts as $item){
			$accountsArr[] 	= ['name' => $item->nickname . ' ('.$item->uuid.')', 'avatar' => $item->avatar, 'id' => $item->id, 'user_num' => $item->user_num];
		}
		return Responses::success($accountsArr);
	}

	// 接收文件上传
	public function uploaded(Request $request){
		return $request->file('uploadfile')->store('autouploaded');
	}

	// 像手机端发送任务
	public function start(Request $request){
		// Wbapi::send();
		$token 			= $request->input('token');
		$media 			= $request->input('path');
		$account_id 	= $request->input('account_id');
		$desc 			= $request->input('descript');
		if(!$token || !$media || !$account_id){
			return Responses::error('非法请求!', null, 500, 500);
		}
		$rrrs 			= json_decode(Ens::decrypt($token), true);
		$adminId		= $rrrs['id'] ?? null;
		if(!$adminId){
			return Responses::error('非法请求!', null, 500, 501);
		}

		$user 			= AdminUser::find($adminId);
		if($user->endtime && $user->endtime <= time()){
			return Responses::error('您的授权已到期!', null, 401, 401);
		}
		$accountData 	= Account::select('did', 'nickname', 'uuid')
							->where('id', $account_id)->first();

		$taskConfig 		= [
			'media'			=> $media,
			'content'		=> $desc
		];
		$task 				= new Task;
		$task->admin_id 	= Admin::user()->id;
		$task->task_id 		= 3;
		$task->name 		= 'auto';
		$task->device_id 	= $accountData->did;
		$task->account_id 	= $account_id;
		$task->quality 		= 10;
		$task->configs 		= json_encode($taskConfig);
		$task->runtype 		= 0;
		if($task->save()){
			Wbapi::send($task->admin_id, $task->device_id, $taskConfig);
		}else{
			return Responses::error('任务发布失败!', null, 500, 500);
		}

		// $task->save();
		// 		$taskData 		= [
		// 	'admin_id'	=> Admin::user()->id,
		// 	'task_id'	=> 3,
		// 	'name'		=> 'auto',
		// 	'device_id'	=> $accountData->did,
		// 	'account_id'=> $account_id,
		// 	'quality'	=> 10,
		// 	'configs'	=> [],
		// 	'runtype'	=> 0,
		// ];
	}
}
