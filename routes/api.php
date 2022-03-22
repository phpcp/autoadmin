<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use Nullix\CryptoJsAes\CryptoJsAes;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/**
 * 固定参数
 * @param type 		执行类型, string
 * @param data 		执行参数, object
 * @param code 		状态码, int
 * @param msg 		提示信息, string
 * @param noreback	是否需要回执, bool
 */

/**
 * 任务状态
 * -2 	-- 任务未执行完被停止
 * -1 	-- 执行失败
 *  0 	-- 待执行
 *  1 	-- 执行中
 *  2 	-- 任务被挂起
 *  3	-- 已发送等待手机端执行
 *  10 	-- 执行成功
 */

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([
	'namespace'		=> 'App\\Http\\Controllers\\Api',
	'name'			=> 'api.'
],function(){
	Route::post('/auth', 'PublicController@auth')->name('auth');
	Route::post('/connect', 'PublicController@connect')->name('connect');
	// Route::post('/setvl', 'PublicController@setvl')->name('setvl');
	Route::post('/mksureversion', 'PublicController@tiktokVersion')->name('mksureversion');
	// Route::post('/scan', 'PublicController@scan')->name('scan');
	Route::post('/doiyinyanghao', 'DouyinController@doiyinyanghao')->name('doiyinyanghao');
	Route::post('/getCloseTxt', 'PublicController@closetxt')->name('closetxt');
	Route::post('/deviceLoginUsers', 'DevicesController@deviceusers')->name('deviceusers');
	Route::post('/topcaccounts', 'PublicController@topcaccounts')->name('topcaccounts');
	Route::post('/uploaded', 'PublicController@uploaded')->name('uploaded');
	Route::post('/start', 'PublicController@start')->name('start');
	Route::post('/signle', 'PublicController@signle')->name('signle');

	Route::post('/getbyid/{id}', 'PublicController@getbyid')->name('getbyid')->where('id', '[0-9]+');
	//接收任务结果
	Route::post('/receiveTaskRes', 'TasksController@receiveTaskRes')->name('receiveTaskRes');
	Route::post('/appdata', 'PublicController@appdata')->name('appdata');

	Route::post('/checkversion', 'AutojsController@version')->name('checkversion');
	Route::post('/tkversion', 'AutojsController@tkversion')->name('tkversion');
	Route::post('/authv2', 'AutojsController@auth')->name('authv2');
	Route::post('/tkdts', 'AutojsController@tiktokBtns')->name('tkdts');
	Route::post('/changedevicenum', 'AutojsController@changedevicenum')->name('changedevicenum');
	Route::post('/whereisme', 'AutojsController@whereisme')->name('whereisme');


	Route::post('/accounts', 'AutojsbackController@accounts')->name('accounts');
	Route::post('/raise', 'AutojsbackController@raise')->name('raise');
	Route::post('/post', 'AutojsbackController@post')->name('post');


	// PC端
	Route::group([
		'prefix'		=> 'pc/',
		'name'			=> 'pc.'
	],function(){
		Route::post('/index', 'PcController@index')->name('index');
		Route::post('/login', 'PcController@login')->name('login');
		Route::group([
			'middleware'    => ['jwt'],
		],function(){
			Route::post('info', 'PcController@info')->name('info');
			Route::post('menu', 'PcController@pcmenu')->name('menu');
		});
	});
});
