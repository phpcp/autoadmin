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
		$arr['menuInfo']	= [[
				'title' 	=> '系统配置',
				'icon'		=> 'fa fa-address-book',
				'href'		=> '',
				'target'	=> '_self',
				'child'		=> [[
						'title' 	=> '服务端配置',
						'icon'		=> 'fa fa-server',
						'href'		=> 'static/layer/pages/config/server.html',
						'target'	=> '_self'
					],[
						'title' 	=> '接口配置',
						'icon'		=> 'fa fa-random',
						'href'		=> 'static/layer/pages/config/baidu.html',
						'target'	=> '_self'
					],[
						'title' 	=> '代理配置',
						'icon'		=> 'fa fa-send',
						'href'		=> 'static/layer/pages/config/proxy.html',
						'target'	=> '_self'
					],
				],
			],[
				'title' 	=> '原创视频',
				'icon'		=> 'fa fa-address-book',
				'href'		=> '',
				'target'	=> '_self',
				'child'		=> [[
					'title' 	=> '素材管理',
					'icon'		=> 'fa fa-video-camera',
					'href'		=> '',
					'target'	=> '_self',
					'child'		=> [[
								'title' 	=> 'BGM管理',
								'icon'		=> 'fa fa-music',
								'href'		=> 'static/layer/pages/videos/bgm.html',
								'target'	=> '_self'
							],[
								'title' 	=> '转场素材',
								'icon'		=> 'fa fa-refresh',
								'href'		=> 'static/layer/pages/videos/transit.html',
								'target'	=> '_self'
							],[
								'title' 	=> '画中画素材',
								'icon'		=> 'fa fa-clipboard',
								'href'		=> 'static/layer/pages/videos/logos.html',
								'target'	=> '_self'
							],[
								'title' 	=> 'Logo素材',
								'icon'		=> 'fa fa-language',
								'href'		=> 'static/layer/pages/videos/logos.html',
								'target'	=> '_self'
							]
						],
					],[
						'title' 	=> '开始制作',
						'icon'		=> 'fa fa-play',
						'href'		=> 'static/layer/pages/videos/maker.html',
						'target'	=> '_self'
					],
				],
			],[
				'title' 	=> '视频去重',
				'icon'		=> 'fa fa-address-book',
				'href'		=> '',
				'target'	=> '_self',
				'child'		=> [[
						'title' 	=> '三方用户',
						'icon'		=> 'fa fa-user',
						'href'		=> 'static/layer/pages/fakes/users.html',
						'target'	=> '_self'
					],[
						'title' 	=> '已下载视频',
						'icon'		=> 'fa fa-cloud-download',
						'href'		=> 'static/layer/pages/fakes/downloaded.html',
						'target'	=> '_self'
					],[
						'title' 	=> '去重模板',
						'icon'		=> 'fa fa-file-video-o',
						'href'		=> 'static/layer/pages/fakes/fakeframe.html',
						'target'	=> '_self'
					],[
						'title' 	=> '开始制作',
						'icon'		=> 'fa fa-play',
						'href'		=> 'static/layer/pages/fakes/maker.html',
						'target'	=> '_self'
					],
				],
			]
		];
		if($uid == 1){
			$arr['menuInfo'][]	= [
				'title' 	=> '量化交易',
				'icon'		=> 'fa fa-address-book',
				'href'		=> '',
				'target'	=> '_self',
				'child'		=> [[
						'title' 	=> '交易所配置',
						'icon'		=> 'fa fa-cog',
						'href'		=> 'admin/accounts/configs',
						'target'	=> '_self'
					],[
						'title' 	=> '账户信息',
						'icon'		=> 'fa fa-suitcase',
						'href'		=> 'admin/accounts/balance',
						'target'	=> '_self'
					],[
						'title' 	=> '历史订单',
						'icon'		=> 'fa fa-history',
						'href'		=> 'admin/accounts/orderhis',
						'target'	=> '_self'
					],[
						'title' 	=> '持仓信息',
						'icon'		=> 'fa fa-cube',
						'href'		=> 'admin/accounts/positions',
						'target'	=> '_self'
					],[
						'title' 	=> '市场信息',
						'icon'		=> 'fa fa-cubes',
						'href'		=> 'static/layer/pages/exchange/markets.html',
						'target'	=> '_self'
					],[
						'title' 	=> '策略制定',
						'icon'		=> 'fa fa-street-view',
						'href'		=> 'static/layer/pages/exchange/strategy.html',
						'target'	=> '_self'
					],[
						'title' 	=> '交易信息',
						'icon'		=> 'fa fa-line-chart',
						'href'		=> 'static/layer/pages/exchange/strategy.html',
						'target'	=> '_self'
					],
				],
			];
		}
		header('Content-Type:application/json; charset=utf-8');
		exit(json_encode($arr, JSON_UNESCAPED_UNICODE));
	}
}
