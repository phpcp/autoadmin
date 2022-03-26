<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {
	$router->get('/qrcode', 'HomeController@qrcode')->name('qrcode');
    $router->get('/', 'HomeController@index')->name('home');

    $router->resource('users', UsersController::class);
    $router->resource('devices', DevicesController::class);
    $router->resource('groups', GroupsController::class);
    $router->resource('accounts', AccountsController::class);
    $router->resource('group-accounts', GroupAccountController::class);
    $router->resource('group-devices', GroupDevicesController::class);
    // $router->resource('tasks', TaskListsController::class);
    $router->resource('account-videos', AccountVideoController::class);
    $router->resource('tkbtns', TkbtnsController::class);
    $router->resource('lang_to_text', LangToTextsController::class);

    $router->get('tasks/{id}/account', 'TaskListsController@accounttask')->name('accounttask');
    $router->any('tasks/cycle', 'TaskController@cycle')->name('cycle');
    $router->resource('tasks', TaskController::class);
    $router->resource('tklangs', TklangController::class);
    $router->resource('appversions', AppversionsController::class);
    $router->resource('tiktoks', TiktokversionsController::class);
    $router->resource('tasklogs', TasklogController::class);
    $router->resource('page', PageController::class);
});
