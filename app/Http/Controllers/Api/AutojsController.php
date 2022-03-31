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
use App\Models\Appversion;
use Illuminate\Support\Facades\Storage;
use App\Models\Tkbtns;

use GeoIp2\Database\Reader;
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
		$versionCode 	= (int)$request->input('versionCode', 0);
		$versionName 	= $request->input('versionName');
		$token 			= $request->input('token');
		if(!AdminUser::verfyToken($token)){
			return response()->json(['code' => 401, 'msg' => '请先登录!', 'data' => []]);
		}

		$lastVersion 	= Appversion::orderByDesc('id')->first();
		if(!$lastVersion){
			return Responses::error('暂无版本');
		}
		if($lastVersion->version > $versionCode){
			$data 			= [
				'code' => 200,
				'data' => [
					'downloadurl' 	=> Storage::disk('admin')->url($lastVersion->url),
					'appname'		=> basename($lastVersion->url),
					'remark' 		=> $lastVersion->remark,
					'infourl' 		=> '',
				],
				'msg' => '发现新版本,是否更新?'
			];
		}else{
			$data 			= [
				'code' => 400,
				'data' => [],
				'msg' => '恭喜您已经升级到最新版'
			];
		}
		return response()->json($data);
	}

	// tiktok检查升级
	public function tkversion(Request $request){
		$nowVersion 	= $request->input('tkversion');
		$token 			= $request->input('token');
		if(!AdminUser::verfyToken($token)){
			return response()->json(['code' => 401, 'msg' => '请先登录!', 'data' => []]);
		}

		$last 			= Tiktok::last();
		if(!$last){
			return response()->json(['code' => 404, 'msg' => '当前没有tiktok可供下载!']);
		}

		$data 			= [
			'code' => 400,
			'data' => [],
			'msg' => "版本暂无更新!\r\n如版本不匹配,脚本将无法正常运行.如果因tiktok版本问题导致脚本无法正常运行,请在后台下载最新版,并设置对应设备tiktok版本!",
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
		if(!AdminUser::verfyToken($token)){
			return response()->json(['code' => 401, 'msg' => '请先登录!', 'data' => '']);
		}

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
		// $tmp 		= TiktokVersionButton::where('version', $rs->soft_version)->first();
		// if(!$tmp || !$tmp->ids){
		// 	return Responses::error('Tiktok版本 ' . $rs->soft_version . ' 目前不支持!', null, 500, 200);
		// }
		// $tkids 		= json_decode($tmp->ids, true);
		$tmp  = Tkbtns::where('status', 1)->where('version', $rs->soft_version)->select('key','val','type')->get()->toArray();
		if( empty($tmp)){
			return Responses::error('Tiktok版本 ' . $rs->soft_version . ' 目前不支持!', null, 500, 200);
		}
		
		$tktxtsObj 	= LangToText::where('lang', $rs->soft_lang)->where(function($query) use($rs){
			$query->whereRaw('version is null')->orWhere('version', $rs->soft_version);
		})->orderBy('version', 'asc')->get();//->pluck('val', 'key')->toArray();

		
		$tkids  	= [];
        $view 		= [];
        $closes		= [
        	'id'	=> [],
        	'txt'	=> [],
        ];
        $tktxts 	= [];

        foreach($tktxtsObj as $item){
        	if($item->type == 1){
        		$closes['txt'][] 	= $item->val;
        	}else{
        		$tktxts[$item->key]	= $item->val;
        	}
        }

        foreach ($tmp as $key => $value) {
            if( $value['type'] == 1 ){
                $tkids[$value['key']] 	= $value['val'];
            }else if($value['type'] == 2){
                $view[$value['key']] 	= $value['val'];
            }elseif($value['type'] == 3){
            	$closes['id'][] 		= $value['val'];
            }
        }
		$data 		= [
			'buttonId'		=> $tkids,
			'buttonText'	=> $tktxts,
			'basicInfo'		=> ['appName' => 'TikTok'],
			// 'view'			=> [
			// 	'home' => 'com.ss.android.ugc.aweme.main.MainActivity'
			// ],
			'view'			=> $view,
			'tiktok_close'	=> $closes,
		];
		return response()->json(['code' => 200, 'msg' => '', 'data' => $data]);
	}

	// 修改设备id
	public function changedevicenum(Request $request){
		$num 	= $request->input('num');
		$token 	= $request->input('token');
		$did 	= $request->input('id');

		if(!AdminUser::verfyToken($token)){
			return response()->json(['code' => 401, 'msg' => '请先登录!', 'data' => '']);
		}
		$device 	= Device::find($did);
		if(!$device){
			return response()->json(['code' => 500, 'msg' => '设备不存在!', 'data' => '']);
		}
		if($device->user_num == $num){
			return response()->json(['code' => 500, 'msg' => '未更改!', 'data' => '']);
		}
		$device->user_num 	= $num;
		if($device->save()){
			return response()->json(['code' => 200, 'msg' => '修改成功!', 'data' => ['number' => $device->user_num]]);
		}
		return response()->json(['code' => 500, 'msg' => '系统错误!', 'data' => '']);
	}

	//获取当前设备ip
	public function whereisme(Request $request){
		$ip 		= $request->getClientIp();
		$location = '';
        $GeoIp = $this->GeoIp($ip);
        if( $GeoIp['code'] == 0 ){
            $IpData = $GeoIp['data'];
            if( !empty( $IpData['country'] ) ){
                $country = $IpData['country']['names'];
                if( !empty($country['zh-CN'] )){
                    $location = $country['zh-CN'];
                }else if( empty( $country['en'] )){
                    $location = $country['en'];
                }else{
                    $location = $IpData['country']['iso_code'];
                }
            }
            if( !empty($IpData['city']) ){
                $city = $IpData['city']['names'];
                !empty($location)?$location = $location.' - ':'';
                if( !empty($city['zh-CN'] )){
                    $location = $location.$city['zh-CN'];
                }else if( empty( $city['en'] )){
                    $location = $location.$city['en'];
                }
            }
        }
		$arr 		= [
			'ip'		=> $ip,
			'location'	=> $location
		];
		// return Responses::error('错误!');
		return Responses::success($arr, '更新成功!');
	}
	public function GeoIp($ip = '')
    {
        $ip = empty($ip)?$_SERVER["REMOTE_ADDR"]:$ip;
        $reader = new Reader(public_path().'/GeoLite2-City.mmdb');
        try {
            $record = $reader->city($ip);
            $array = json_decode(json_encode($record),TRUE);
            // dd($array['city']);                          //城市
            // dd($array['continent']);                     //州
            // dd($array['country']);                       //国家
            // dd($array['location']);                      //坐标/时区
            // dd($array['registered_country']);            //注册国家
            // dd($array['subdivisions']);                  //归属地 
            // dd($array['traits']);                        //互联网协议地址
            $response = [
                'code' => 0,
                'data'  => $array,
                'msg'=> '获取成功！'
            ];
            return $response;
        } catch (\GeoIp2\Exception\AddressNotFoundException $e) {
            $response = [
                'code' => 1,
                'data'  => [],
                'msg'=> '输入IP没有找到记录！'
            ];
            return $response;
        } catch (\MaxMind\Db\InvalidDatabaseExceptionn $e) {
            $response = [
                'code' => 1,
                'data'  => [],
                'msg'=> '数据库无效或损坏！'
            ];
            return $response;
        }catch ( \Exception $e ){
            $response = [
                'code' => 1,
                'data'  => [],
                'msg'=> '其他错误！'
            ];
            return $response;
        }
    }
}
