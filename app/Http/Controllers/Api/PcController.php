<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use App\Globals\Responses;
use App\Globals\Jwt;

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
		$jsFile 	= file_get_contents(__DIR__ . '/menu.js');
		$arr 		= json_decode($jsFile, true);
		$arr['menuInfo']	= [
			[
				"title" 	=> "常规管理",
	            "icon"		=> "fa fa-address-book",
	            "href"		=> "",
	            "target"	=> "_self",
			]
		];
		// header('Content-Type:application/json; charset=utf-8');
		exit(json_encode($arr));
	}
}
