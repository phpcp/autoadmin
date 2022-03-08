<?php
/**
 * 方法提供手机端脚本的一些api
 */
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Globals\Responses;
use App\Models\AdminUser;
use App\Models\Tiktok;
use App\Models\Device;
use App\Models\TiktokVersionButton;
use App\Models\LangToText;

class AutojsController extends Controller{
	// 登录脚本
	public function auth(Request $request){
		$account 	= $request->input('account');
		$password 	= $request->input('password');
		$imei 		= $request->input('imei');
		$info 		= $request->input('info');

		if(!$account || !$password || !$imei || !$info){
			return response()->json(['code' => 500, 'msg' => '非法请求', 'data' => []]);
		}
		$admin 		= AdminUser::where('username', $account)->first();
		if(!$admin){
			return response()->json(['code' => 500, 'msg' => '账号密码错误!', 'data' => []]);
		}
		if(!password_verify($password, $admin->password)){
			return response()->json(['code' => 500, 'msg' => '账号密码错误.', 'data' => []]);
		}
		if($admin->endtime && $admin->endtime < time()){
			return response()->json(['code' => 500, 'msg' => '您的授权已到期!', 'data' => []]);
		}
		$rs 		= Device::bind($imei, $admin, $info);
		if(!$rs instanceof Device){
			return Responses::error($rs);
		}

		$data		= [
			'token'		=> AdminUser::token($admin),
			'name'		=> $admin->name,
			'endtime'	=> $admin->enttime ? date('Y-m-d H:i:s', $admin->enttime) : '永久授权',
			'maxdevice'	=> $admin->max_device,
			'avatar'	=> $admin->avatar,
			'number'	=> $rs->user_num,
			'id'		=> $rs->id,
		];

		return response()->json(['code' => 200, 'data' => $data, 'msg' => '成功']);
	}

	// 脚本检查更新
	public function version(Request $request){
		$versionCode 	= $request->input('versionCode');
		$versionName 	= $request->input('versionName');
		$token 			= $request->input('token');

		$data 			= [
			'code' => 400,
			'data' => [
				'downloadurl' 	=> 'https://auto.mini.zhishukongjian.com/storage/app/dome_cat_1.0.0.apk',
				'appname'		=> 'dome_cat_1.0.0.apk',
				'remark' 		=> '新增tiktok最新版兼容',
				'infourl' 		=> ''
			],
			'msg' => '发现新版本,是否更新?'
		];
		return response()->json($data);
	}

	// tiktok检查升级
	public function tkversion(Request $request){
		$nowVersion 	= $request->input('tkversion');
		$token 			= $request->input('token');

		$last 			= Tiktok::last();
		if(!$last){
			return response()->json(['code' => 404, 'msg' => '当前没有tiktok可供下载!']);
		}

		$data 			= [
			'code' => 400,
			'data' => [],
			'msg' => '暂无更新!'
		];
		if($nowVersion < $last->version){
			$data['code']	= 200;
			$data['data'] 	= [
				'downloadurl' 	=> $last->url,
				'appname'		=> basename($last->url),
				'version'		=> $last->version,
				'remark' 		=> $last->remark,
				'oldversion'	=> $nowVersion,
			];
			$data['msg']	= '发现tiktok有更新,是否更新?';
		}
		return response()->json($data);
	}

	// 根据tiktok版本和语言 获取tiktok 按键id和文本
	public function tiktokBtns(Request $request){
		$token 		= $request->input('token');
		$id 		= (int)$request->input('id');
		$imei 		= $request->input('imei');
		if($id < 1 || !$imei){
			return response()->json(['code' => 500, 'msg' => '请先登录!', 'data' => []]);
		}


		$rs 		= Device::find($id);
		if(!$rs){
			return Responses::error('设备未绑定!', null, 500, 200);
		}
		if($rs->imei != $imei){
			return Responses::error('非法请求', null, 500, 200);
		}
		if(!$rs->soft_version || !$rs->soft_lang){
			return Responses::error('请在后台设置tiktok版本号和使用语言!', null, 500, 200);
		}
		$tmp 		= TiktokVersionButton::where('version', $rs->soft_version)->first();
		if(!$tmp || !$tmp->ids){
			return Responses::error('Tiktok版本 ' . $rs->soft_version . ' 目前不支持!', null, 500, 200);
		}
		$tkids 		= json_decode($tmp->ids, true);
		$tktxts 	= LangToText::where('lang', $rs->soft_lang)->where(function($query) use($rs){
			$query->whereRaw('version is null')->orWhere('version', $rs->soft_version);
		})->orderBy('version', 'asc')->pluck('val', 'key')->toArray();

		$data 		= [
			'buttonId'		=> $tkids,
			'buttonText'	=> $tktxts,
			'basicInfo'		=> ['appName' => 'TikTok'],
			'view'			=> [
				'home' => 'com.ss.android.ugc.aweme.main.MainActivity'
			],
			'tiktok_close'	=> [],
		];
		return response()->json(['code' => 200, 'msg' => '', 'data' => $data]);
	}
}