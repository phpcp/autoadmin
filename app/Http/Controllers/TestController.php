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
