<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Device;
use App\Models\Account;

class DevicesController extends Controller{
    //
    public function deviceusers(Request $request){
    	file_put_contents(__DIR__ . '/1.txt', json_encode($request->all()));
    	$data 		= $request->input('data');
    	$uid 		= $request->input('uid');
    	$did 		= $request->input('did');

    	if(!$uid || !$did){
    		return false;
    	}
    	if(empty($data)){
    		return false;
    	}

    	$arr 	= [];
    	Device::where('id', $did)->update(['status' => 0]);
    	foreach($data as $item){
    		$dyid 	= $item['uid'] ?? 0;
    		if(!$dyid){
    			continue;
    		}
    		if(Account::where('uid', $dyid)->count() > 0){
    			$item['status'] 	= 1;
    			Account::where('uid', $dyid)->update($item);
    		}else{
    			$arr[] 	= array_merge($item, ['aid' => $uid, 'did' => $did, 'created_at' => date('Y-m-d H:i:s')]);
    		}
    	}
    	if(!empty($arr)){
    		Account::insert($arr);
    	}
    	Device::where('id', $did)->update(['accounts' => Account::where('did', $did)->count()]);
    }
}
