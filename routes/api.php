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
	Route::post('/mksureversion', 'PublicController@tiktokVersion')->name('mksureversion');
	// Route::post('/scan', 'PublicController@scan')->name('scan');
	Route::post('/doiyinyanghao', 'DouyinController@doiyinyanghao')->name('doiyinyanghao');
	Route::post('/getCloseTxt', 'PublicController@closetxt')->name('closetxt');
	Route::post('/deviceLoginUsers', 'DevicesController@deviceusers')->name('deviceusers');
});
