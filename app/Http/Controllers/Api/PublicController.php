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
use App\Models\Tiktok;
use App\Globals\Wbapi;
use Illuminate\Support\Facades\Storage;

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
		$imei 		= $rrrs['imei'] ?? null;
		$version 	= $rrrs['version'] ?? null;
		$lang 		= $rrrs['lang'] ?? null;
		$token 		= $rrrs['token'] ?? null;
		if(!$imei || !$token){
			return Responses::error('错误.', 405);
		}
		$token 	= Ens::decrypt($token);
		$token 	= json_decode($token, true);
		if(!isset($token['id']) || !isset($token['login'])){
			return Responses::error('请登录!', null, 401, 401);
		}
		$user 		= AdminUser::find($token['id']);
		if($user->endtime && $user->endtime < time()){
			return Responses::error('您的授权已过期!', null, 200, 401);
		}

		if(!$version){
			$tk 		= Tiktok::last();
			$version 	= $tk ? $tk->version : '';
		}
		$rs 		= Device::bind($imei, $user, null, strtolower($version));
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}
		// if(!$rs->soft_version || !$rs->soft_lang){
		// 	return Responses::error('请先确定tiktok版本号和使用语言!', null, 500, 200);
		// }
		// $tmp 		= TiktokVersionButton::where('version', $rs->soft_version)->first();
		// if(!$tmp || !$tmp->ids){
		// 	return Responses::error('版本 ' . $rs->soft_version . ' 目前不支持!', null, 500, 200);
		// }
		// $tkids 		= json_decode($tmp->ids, true);
		// $tktxts 	= LangToText::where('lang', $rs->soft_lang)->where(function($query) use($rs){
		// 	$query->whereRaw('version is null')->orWhere('version', $rs->soft_version);
		// })->orderBy('version', 'asc')->pluck('val', 'key')->toArray();


		return Responses::success([
			'num' 			=> $rs->user_num,
			'id' 			=> $user->id,
			'did' 			=> $rs->id,
			// 'appversion' 	=> $rs->soft_version,
			// 'applang' 		=> $rs->soft_lang,
			'avatar'		=> $user->avatar,
			'username'		=> $user->username,
			'maxdevice'		=> $user->max_device,
			'havdevices'	=> Device::where('admin_id', $user->id)->count(),
			'islock'		=> $user->lock ? true : false,
			'addtime'		=> date('Y-m-d H:i:s', strtotime($user->created_at)),
			'groups'		=> $user->groups,
			// 'tkids'			=> $tkids,
			// 'tktxts'		=> $tktxts,
			// 'accounts'		=> Account::where('did', $rs->id)->count(),
			// 'close_txt'		=> $close_txt,
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
			// $binded 	= Device::where('admin_id', $user->id)->where('imei', '!=', $imei)->count();
			// if($binded >= $user->max_device){
			// 	return Responses::error('设备绑定已达上限!', null, 401, 200);
			// }
			// Device::bind($imei, $user, $info, strtolower($version), strtolower($lang));
			$deviceRow 		= Device::bind($imei, $user, [], strtolower($version), strtolower($lang));
			if(!$deviceRow instanceof Device){
				return Responses::error($deviceRow);
			}
		}else{
			$version 	= $deviceRow->soft_version;
			$lang 		= $deviceRow->soft_lang;
		}
		// if(!$version || !$lang){
		// 	return Responses::error('请现在后台设置tk对应的版本和语言! 编号: ' . $deviceRow->user_num);
		// }

		$token 		= AdminUser::token($user);
		return Responses::success([
			'token' 		=> $token,
        	'appdatasApi' => route('appdata'),
			// 'appversion' 	=> $version,
			// 'applang'		=> $lang,
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

	// 返回前端脚本需要的app参数
	public function appdata(Request $request){

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
		if(!$token){
			return Responses::error('非法请求!', null, 500, 500);
		}
		$req 	= json_decode(Ens::decrypt($token), true);
		if(!$req){
			$token 	= base64_decode($token);
			$req 	= json_decode(Ens::decrypt($token), true);
		}
		if(!isset($req['id']) || !isset($req['time']) && $req['id'] < 1){
			return Responses::error('非法请求!', null, 500, 500);
		}
		// if((time() - $req['time']) >= env('QRCODE_TIMEOUT', 180)){
		// 	return Responses::error('页面已过期,请重新请求!', null, 401, 200);
		// }
		$user 		= AdminUser::find($req['id']);
		if(!$user){
			return Responses::error('非法请求!', null, 401, 200);
		}
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
		$token 		= $request->get('token');
		// $token 	= $request->input('token');
		if(!$token){
			return Responses::error('非法请求!', null, 401, 200);
		}
		$req 	= json_decode(Ens::decrypt($token), true);
		if(!$req){
			$token 	= base64_decode($token);
			$req 	= json_decode(Ens::decrypt($token), true);
		}
		if(!isset($req['id']) || !isset($req['time']) && $req['id'] < 1){
			return Responses::error('非法请求!!', null, 500, 500);
		}
		$user 		= AdminUser::find($req['id']);
		if(!$user){
			return Responses::error('用户不存在!', null, 401, 200);
		}
		return $request->file('uploadfile')->store('public/autouploaded');
	}

	// 向手机端发送任务
	public function start(Request $request){
		// Wbapi::send();
		$token 			= $request->input('token');
		$media 			= $request->input('path');
		$account_id 	= $request->input('account_id');
		$desc 			= $request->input('descript');
		if(!$token || !$media || !$account_id){
			return Responses::error('非法请求!', null, 500, 500);
		}
		$req 	= json_decode(Ens::decrypt($token), true);
		if(!$req){
			$token 	= base64_decode($token);
			$req 	= json_decode(Ens::decrypt($token), true);
		}
		// $rrrs 			= json_decode(Ens::decrypt($token), true);
		$adminId		= $req['id'] ?? null;
		if(!$adminId){
			return Responses::error('非法请求!', null, 500, 501);
		}

		$user 			= AdminUser::find($adminId);
		if(!$user){
			return Responses::error('非法请求!!', null, 401, 401);
		}
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

	//从pc端的任务像手机端发送
	public function signle(Request $request){
		$token 			= $request->input('token');
		$accounts 		= $request->input('accounts');
		$videos 		= $request->input('videos');
		// var_dump($videos);
		// return;
		if(!$token){
			return Responses::error('非法请求.', null, 401, 200);
		}
		$req 	= json_decode(Ens::decrypt($token), true);
		if(!$req){
			$token 	= base64_decode($token);
			$req 	= json_decode(Ens::decrypt($token), true);
		}
		if(!isset($req['id']) || !isset($req['time']) && $req['id'] < 1){
			return Responses::error('非法请求!', null, 500, 500);
		}
		$user 		= AdminUser::find($req['id']);
		if(!$user){
			return Responses::error('用户不存在!', null, 401, 200);
		}
		if(!$accounts || !is_array($accounts)){
			return Responses::error('非法请求!!', null, 500, 500);
		}
		if(!$videos || !is_array($videos)){
			return Responses::error('非法请求!!!', null, 500, 500);
		}
		if(count($videos) < count($accounts)){
			return Responses::error('视频不够发!!', null, 500, 500);
		}
		$accounts 	= Account::select('accounts.id as aid', 'accounts.uuid as uuid', 'devices.id as did')
						->whereIn('accounts.id', $accounts)
						->where('accounts.admin_id', $user->id)
						->where('devices.admin_id', $user->id)
						->leftJoin('devices', 'accounts.did', '=', 'devices.id')
						->get()->toArray();
		if(count($accounts) < 1){
			return Responses::error('找不到账号!!', null, 500, 500);
		}
		$confis 	= [];
		// $accLen 	= count($accounts);
		// $videoLen 	= count($videos);
		// $onAccountVideos 	= (int)($videoLen / $accLen);//一个账号分配多少视频
		// foreach($accounts as $item){
		// 	$confis[$item->did][$item->nickname]
		// }

		$tmpAccounts 	= [];
		foreach($videos as $item){
			if(count($tmpAccounts) < 1){
				$tmpAccounts 	= $accounts;
			}
			if(!isset($confis[$tmpAccounts[0]['did']])){
				$confis[$tmpAccounts[0]['did']] 	= [];
			}
			if(!isset($confis[$tmpAccounts[0]['did']][$tmpAccounts[0]['uuid']])){
				$confis[$tmpAccounts[0]['did']][$tmpAccounts[0]['uuid']] 	= [];
			}
			$item['media']		= Storage::url($item['media']);
			$item['uuid']		= $tmpAccounts[0]['uuid'];
			$confis[$tmpAccounts[0]['did']][$tmpAccounts[0]['uuid']][] 		= $item;
			unset($tmpAccounts[0]);
			$tmpAccounts 	= array_values($tmpAccounts);
		}
		$resps 	= [];
		$base 	= [
			'type'      => 'post',
			'data'      => [
				'quality'   => 99,
				'file'      => 'post',
				'id'        => 0,
				'title'     => '来自客户端自动发布',
				'req_time'  => time(),
			],
			'code'      => 200,
			'msg'       => '',
			'noreback'  => false,
        ];
		foreach($confis as $did => $arr){
			$err 			= $base;
			$err['data']['confis']	= $arr;
			// var_dump($err);
			$resps[] 		= WbApi::send($user->id, $did, $err);
		}
		// var_dump($resps);
		return Responses::success($resps);
	}

	// 通过adminid返回ws和token
	public function getbyid($id, Request $request){
		$imei 	= $request->input('imei');
		if(!$imei){
			return Responses::error('非法请求!', null, 500, 200);
		}
		$user 	= AdminUser::find($id);
		if(!$user){
			return Responses::error('任务发布失败!', null, 500, 200);
		}
		if($user->endtime && $user->endtime < time()){
			return Responses::error('授权已过期!', null, 500, 200);
		}

		$version 	= null;
		$lang 		= null;
		$deviceRow 	= Device::where('admin_id', $user->id)->where('imei', $imei)->first();
		if(!$deviceRow){
			$deviceRow 		= Device::bind($imei, $user, [], strtolower($version), strtolower($lang));
			if(!$deviceRow instanceof Device){
				return Responses::error($deviceRow);
			}
		}else{
			$version 	= $deviceRow->soft_version;
			$lang 		= $deviceRow->soft_lang;
		}
		if(!$version || !$lang){
			return Responses::error('请现在后台设置tk对应的版本和语言! 编号: ' . $deviceRow->user_num);
		}

		$token 		= AdminUser::token($user);
		return Responses::success([
			'token' 		=> $token,
			'appversion' 	=> $version,
			'applang'		=> $lang,
		]);
	}
}
