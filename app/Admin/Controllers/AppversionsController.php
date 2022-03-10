<?php

namespace App\Admin\Controllers;

use App\Models\Appversion;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Storage;

class AppversionsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '脚本版本管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Appversion());

        $grid->column('id', __('Id'));
        $grid->column('version', __('版本号'));
        $grid->column('version_name', __('版本名称'));
        $grid->column('url', __('下载地址'))->display(function($val){
            return $val ? Storage::url($val) : '无';
        })->downloadable();
        $grid->column('remark', __('备注'));
        $grid->column('must', __('是否强制更新'))->using(Appversion::$bool);

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Appversion::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('version', __('Version'));
        $show->field('version_name', __('Version name'));
        $show->field('url', __('Url'));
        $show->field('remark', __('Remark'));
        $show->field('must', __('Must'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Appversion());

        $form->number('version', __('版本号'));
        $form->text('version_name', __('版本名称'));
        $form->file('url', __('apk文件'))->removable()->move('apps');
        $form->textarea('remark', __('备注'))->rows(4);
        $form->switch('must', __('强制升级?'))->states(Appversion::$bool);

        return $form;
    }
}
