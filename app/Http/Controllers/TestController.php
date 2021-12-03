<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh;
use Endroid\QrCode\Label\Alignment\LabelAlignmentCenter;
use Endroid\QrCode\Label\Font\NotoSans;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;

use App\Globals\Ens;
use GuzzleHttp;

class TestController extends Controller{
    public function index(Request $request){
    	$encryptToken 	= Ens::encrypt(['id' => 1, 'time' => time()]);
    	$arr 	= [
    		'ws'	=> 'ws://192.168.31.172:11223/client',
    		'token'	=> $encryptToken,
    	];
    	// echo ($encryptToken);
    	// dd(Ens::decrypt($encryptToken));
    	$data 		= json_encode($arr);
    	// $data 		= $encryptToken;
    	echo $data;



   //  	try {
   //  		$aarr 	= ['type'=>'doiyinyanghao', 'data'=>['config' => ['dianzan'=> 0.2,'seetime'=> [3, 20], 'comments_probability' => 0.1, 'comments' => ['不错哦','喜欢这个视频','怎么拍的?', '挺好的'], 'videos' => [10, 50]], 'quality'=>2, 'file' => 'robot.douyin', 'id' => 1, 'req_time' => time()], 'code' => 200, 'msg' => '', 'noreback' => false];
   //  		// $aarr 	= ['type'=>'stop', 'data'=>[1], 'code' => 200, 'msg' => '', 'noreback' => false];
   //  		$http = new GuzzleHttp\Client;
			// $response = $http->post('http://192.168.31.172:11223/servs', [
			//     'form_params' => [
			//     	'id'	=> 1,
			//     	'did'	=> '8,9,7,10',
			//         'type' 	=> 'zzz',
			//         'data' 	=> json_encode($aarr),
			//     ],
			// ]);
			// $res 	= (string)$response->getBody();
			// dd($res);
   //  	} catch (\Exception $e) {
   //  		echo $e->getMessage();
   //  	}
		


    	$result = Builder::create()
		    ->writer(new PngWriter())
		    ->writerOptions([])
		    ->data($data)
		    ->encoding(new Encoding('UTF-8'))
		    ->errorCorrectionLevel(new ErrorCorrectionLevelHigh())
		    ->size(300)
		    ->margin(10)
		    ->roundBlockSizeMode(new RoundBlockSizeModeMargin())
		    // ->logoPath(__DIR__.'/assets/symfony.png')
		    ->labelText('打开手机端扫码')
		    ->labelFont(new NotoSans(20))
		    ->labelAlignment(new LabelAlignmentCenter())
		    ->build();
		return '<img src="' . $result->getDataUri() . '" /> <a href="">断开连接</a>';
    }
}
