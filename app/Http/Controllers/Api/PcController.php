<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use App\Globals\Responses;
use App\Globals\Jwt;
use Illuminate\Support\Facades\Storage;

class PcController extends Controller{
	public function index(){

	}

	// 登录
	public function login(Request $request){
		$username 		= trim($request->input('username', ''));
		$password 		= trim($request->input('password', ''));
		$uuid 			= trim($request->input('uuid', ''));
		if(!$username || !$password || !$uuid){
			return Responses::error('错误!', []);
		}

		$admin 			= AdminUser::where('username', $username)->first();
		if(!$admin){
			return Responses::error('错误!!', []);
		}
		if(!password_verify($password, $admin->password)){
			return Responses::error('错误.', []);
		}
		if($admin->enttime && $admin->enttime <= time()){
			return Responses::error('授权已过期!', []);
		}

		$arr 			= [
			'id'			=> $admin->id,
			'username'		=> $username,
			'name'			=> $admin->name,
			'avatar'		=> $admin->avatar,
			'max_device'	=> $admin->max_device,
			'enttime'		=> $admin->enttime
		];
		$arr['token']		= Jwt::token($arr);
		return Responses::success($arr);
	}

	//下载pc端模板文件
	public function reses(Request $request){

	}

	//返回菜单js文件
	public function pcmenu(Request $request){
		$uid 		= $request->get('_uid');
		$mainCont 	= Storage::disk('local')->get('pcmenu/main.js');
		$arr 		= json_decode($mainCont, true);

		//配置信息
		$menu 		= Storage::disk('local')->get('pcmenu/config.js');
		$menu 		= $menu ? json_decode($menu, true) : [];
		$arr['menuInfo']	= array_merge($arr['menuInfo'], $menu);

		//原创视频
		$menu 		= Storage::disk('local')->get('pcmenu/makevideo.js');
		$menu 		= $menu ? json_decode($menu, true) : [];
		$arr['menuInfo']	= array_merge($arr['menuInfo'], $menu);

		//伪原创视频
		$menu 		= Storage::disk('local')->get('pcmenu/fakevideo.js');
		$menu 		= $menu ? json_decode($menu, true) : [];
		$arr['menuInfo']	= array_merge($arr['menuInfo'], $menu);

		if($uid == 1){
			$menu 		= Storage::disk('local')->get('pcmenu/exchange.js');
			$menu 		= $menu ? json_decode($menu, true) : [];
			$arr['menuInfo']	= array_merge($arr['menuInfo'], $menu);
		}
		header('Content-Type:application/json; charset=utf-8');
		exit(json_encode($arr, JSON_UNESCAPED_UNICODE));
	}
}
