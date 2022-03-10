<?php

namespace App\Admin\Controllers;

use App\Models\Tiktok;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TiktokversionsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Tiktok版本管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Tiktok());

        $grid->column('id', __('Id'));
        $grid->column('version', __('版本号'));
        $grid->column('remark', __('备注'));
        $grid->column('url', __('下载地址'))->downloadable();

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
        $show = new Show(Tiktok::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('version', __('版本号'));
        $show->field('remark', __('备注'));
        $show->field('url', __('下载地址'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Tiktok());

        $form->text('version', __('版本号'));
        $form->textarea('remark', __('备注'));
        $form->file('url', __('Tiktok安装包'))->move('apps');

        return $form;
    }
}
