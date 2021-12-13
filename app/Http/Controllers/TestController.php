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
use Nullix\CryptoJsAes\CryptoJsAes;

class TestController extends Controller{
    public function index(Request $request){
    	// dd(openssl_get_cipher_methods());
//     	$originalValue = 'abcdqwert'; // this could be any value
// 		$password = "654mca0l38b489d9f306a5b8e105334b";
// // 		$encrypted = CryptoJsAes::encrypt($originalValue, $password);
// // dd($encrypted);
// // 		$decrypted = CryptoJsAes::decrypt($encrypted, $password);
// 		$ency 	= Ens::encrypt($password, true);
// 		dd($ency);


    	$arr 	= [
    		'ws'	=> 'ws://192.168.31.172:11223/client',
    		'token'	=> Ens::encrypt(json_encode(['id' => 1, 'time' => time()])),
    		// 'token'	=> ['id' => 1, 'time' => time()],
    	];
    	$str 	= json_encode($arr);
    	$data 	= Ens::encrypt($str);
    	// dd(Ens::decrypt($entry));
    	// dd(base64_encode(openssl_encrypt($str,"AES-128-CBC",$key,true,$iv)));
    	// // $aes 	= new Ens($key);
    	// // dd($aes->encrypts($str));
    	// dd(Ens::encrypt($str));


    	// echo ($encryptToken);
    	// dd(Ens::decrypt($encryptToken));
    	// $data 		= json_encode($arr);
    	// $data 		= $encryptToken;
    	echo $data;



   //  	try {
   //  		$aarr 	= ['type'=>'doiyinyanghao', 'data'=>['config' => ['dianzan'=> 0.2,'seetime'=> [3, 8], 'comments_probability' => 0.1, 'comments' => ['不错哦','喜欢这个视频','怎么拍的?', '挺好的'], 'videos' => [1, 3]], 'quality'=>0, 'file' => 'robot.douyin', 'id' => 1, 'req_time' => time()], 'code' => 200, 'msg' => '', 'noreback' => false];
   //  		// $aarr 	= ['type'=>'stop', 'data'=>[1], 'code' => 200, 'msg' => '', 'noreback' => false];
   //  		$http = new GuzzleHttp\Client;
			// $response = $http->post('http://192.168.31.172:11223/servs', [
			//     'form_params' => [
			//     	'id'	=> 1,
			//     	'did'	=> '1,2,4,8,9,7,10',
			//         'type' 	=> 'zzz',
			//         'data' 	=> json_encode($aarr),
			//     ],
			// ]);
			// $res 	= (string)$response->getBody();
			// dd($res);
   //  	} catch (\Exception $e) {
   //  		echo $e->getMessage();
   //  	}

// 获取账号信息
   //  	try {
   //  		// $aarr 	= ['type'=>'getaccounts', 'data'=>['config' => [], 'quality'=>0, 'file' => 'getaccounts', 'id' => 7, 'req_time' => time()], 'code' => 200, 'msg' => '', 'noreback' => false];
   //  		$aarr 	= ['type'=>'exit', 'data'=>[1], 'code' => 200, 'msg' => '', 'noreback' => false];
   //  		$http = new GuzzleHttp\Client;
			// $response = $http->post('http://192.168.31.172:11223/servs', [
			//     'form_params' => [
			//     	'id'	=> 1,
			//     	'did'	=> '1,2,4,8,9,7,10',
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


// - [公司英文名字].福州质数空间信息科技有限公司, Fuzhou Zhishukongjian Information Technology Co.
// - Address: [ 福建省福州市台江区广达路68号金源大广场西区17层K单元(04) ]（公司注册地址）
// - Company Registration No.: [ Unit K, 17F, West Zone, Jinyuan Grand Plaza, No.68 Guangda Road, Taijiang District, Fuzhou City, Fujian Province, China (04)]
// - Name: 唐文达 Wenda Tang（负责人姓名）
// - Title:总经理 General Manager  （负责人职务）
// - Email:1254131@qq.com （负责人邮件）
// - Tel No.:13859959931 （负责人联系方式）
// - [合同签1年还是6个月]
// - Bank Name: _______中国民生银行______（银行名称）
// - Branch Name: _______福州分行营业部______（支行名称）
// - Bank Address: _______福州市鼓楼区湖东路282号(No.282, Hudong Road, Gulou District, Fuzhou)______（银行地址）
// - Account Name: _______福州质数空间信息科技有限公司(Fuzhou Zhishukongjian Information Technology Co.)______（账户名称）
// - Account Number: ______663056562_______（银行卡号）
// - Swift Code: ______MSBCCNBJ015_______


// - [公司英文名字].福州质数空间信息科技有限公司, Fuzhou Zhishukongjian Information Technology Co.
// - Address: [ 福建省福州市台江区广达路68号金源大广场西区17层K单元(04) ]（公司注册地址）
// - Company Registration No.: [ Unit K, 17F, West Zone, Jinyuan Grand Plaza, No.68 Guangda Road, Taijiang District, Fuzhou City, Fujian Province, China (04)]
// - Name: 唐文达 Wenda Tang
// - Title:总经理 General Manager 
// - Email:1254131@qq.com 
// - Tel No.:13859959931 
// - [合同签1年还是6个月]    /1 year
// - Bank Name: 中国民生银行/China Minsheng Bank
// - Branch Name: 福州分行营业部/Fuzhou Branch Sales Department
// - Bank Address: 福州市鼓楼区湖东路282号/ No.282, Hudong Road, Gulou District, Fuzhou
// - Account Name: 福州质数空间信息科技有限公司/ Fuzhou Zhishukongjian Information Technology Co.
// - Account Number: 663056562
// - Swift Code: MSBCCNBJ015