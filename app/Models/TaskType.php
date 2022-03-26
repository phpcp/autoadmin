<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Form;
use Encore\Admin\Facades\Admin;
use App\Globals\WbApi;
use Illuminate\Support\Facades\Storage;

class TaskType extends Model{
    use HasFactory;

    public static function getLists(){
    	return self::orderByDesc('orderby')->pluck('title', 'id');
    }

    // 发布视频格式化配置参数
    public static function videos(Model $model, $arr){
    	if(empty($model->medias)){
    		return '请上传视频!';
    	}
    	$acarr          = [];
        $accountObj     = Account::whereIn('id', $model->account_id)->get()->toArray();
        if(empty($accountObj)){
            return '找不到发布账号!';
        }

    	$medias         = $model->medias;
        $commants       = explode("\r\n", $model->commant);

        $acarr          = [];
        $i              = 0;
        foreach($medias as $index => $media){
            if(!isset($accountObj[$i])){
                $i      = 0;
            }
            $acr        = $accountObj[$i];
            $acarr[$acr['did']][]      = [
                'uuid'      => $acr['uuid'],
                'media'     => Storage::disk('admin')->url($media),
                'commant'   => $commants[$index] ?? null,
            ];
            $i++;
        }
        $sendarr        = [];
        foreach ($acarr as $key => $value) {
            foreach($value as $k => $item){
                $sendarr[$key][$item['uuid']][]     = [
                    'media'     => $item['media'],
                    'commant'   => $item['commant'],
                ];
            }
        }

        $arr['data']['configs'] = $sendarr;
        $rs     = WbApi::send(Admin::user()->id, null, $arr);
        $rs     = json_decode($rs, true);
        if($rs['code'] != 200){
            return $rs['msg'];
        }
        return true;
    }

    // 养号
    public static function raise(Model $model, $arr){
    	if(!$model->account_id){
    		return '请设置账号!';
    	}

    	$accountObj     = Account::where('admin_id', Admin::user()->id)->whereIn('id', $model->account_id)->get()->toArray();
    	if(!$accountObj){
    		return '未发现账号!';
    	}

        if(isset($arr['data']['configs']['commants'])){
            $arr['data']['configs']['commants']     = explode("\r\n", $arr['data']['configs']['commants']);
        }else{
            $arr['data']['configs']['commants']     = [];
        }
    	$sendArr 		= [];
    	foreach($accountObj as $item){
    		$sendArr[$item['did']][$item['id']] 	= $item['unique_id'];//$item['nickname'];
    	}

    	$msg 			= [];
    	foreach($sendArr as $did => $item){
    		$arr['data']['accounts'] 	= array_values($item);
    		$rs     = WbApi::send(Admin::user()->id, $did, $arr);
            if($rs != null){
        		$rs     = json_decode($rs, true);
    	        if($rs['code'] != 200){
    	            $msg[] 	= $rs['msg'];
    	        }
            }else{
                return 'ws未启动...';
            }
    	}
    	if($msg){
    		return implode('<br>', $msg);
    	}
    	return true;
    }

    // 关注用户
    public static function follow(Model $model, $arr){
        if(!$model->account_id){
            return '请设置账号!';
        }
        $accountObj     = Account::where('admin_id', Admin::user()->id)->whereIn('id', $model->account_id)->get()->toArray();
        if(!$accountObj){
            return '未发现账号!';
        }

        $sendArr        = [];
        foreach($accountObj as $item){
            $sendArr[$item['did']][$item['id']]     = $item['unique_id'];//$item['nickname'];
        }

        $msg            = [];
        foreach($sendArr as $did => $item){
            $arr['data']['accounts']    = array_values($item);
            dd($arr);
            $rs     = WbApi::send(Admin::user()->id, $did, $arr);
            if($rs != null){
                $rs     = json_decode($rs, true);
                if($rs['code'] != 200){
                    $msg[]  = $rs['msg'];
                }
            }else{
                return 'ws未启动...';
            }
        }
        if($msg){
            return implode('<br>', $msg);
        }
        return true;
    }
}
