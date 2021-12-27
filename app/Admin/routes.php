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
    $router->resource('tasks', TaskListsController::class);
});
