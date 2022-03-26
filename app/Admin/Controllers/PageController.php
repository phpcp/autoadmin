<?php

namespace App\Admin\Controllers;

use App\Models\TiktokPage;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PageController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TikTok页面管理';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TiktokPage());
        $grid->column('id', __('Id'));
        $grid->column('name', __('页面名称'));
        $grid->column('sort', __('排序'));
        $states = [
            'on'  => ['value' => 1, 'text' => '正常', 'color' => 'primary'],
            'off' => ['value' => 2, 'text' => '禁用', 'color' => 'default'],
        ];
        $grid->column('status', __('状态'))->switch($states)->sortable();
        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
        });
        return $grid;
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new TiktokPage());

        $form->text('name', __('页面名称'))->required();
        $form->radio('status', __('状态'))->options(['1' => '正常', '2'=> '禁用'])->default('1')->required();
        $form->number('sort', __('排序'))->min(1)->default(1);
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });
        $form->footer(function ($footer) {
            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });
        return $form;
    }
}
