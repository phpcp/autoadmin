<?php

namespace App\Admin\Controllers;

use App\Models\Group;
use App\Models\GroupAccount;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class GroupsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '账号分组管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $states = [
            'on'  => ['value' => 1, 'text' => '启用', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '关闭', 'color' => 'default'],
        ];
        $grid = new Grid(new Group());
        $grid->disableExport();
        $grid->model()->where('uid', Admin::user()->id)->orderByDesc('status')->orderByDesc('orderby');

        // $grid->column('id', __('Id'));
        // $grid->column('uid', __('Uid'));
        $grid->column('name', __('分组名称'))->editable()->filter();
        $grid->column('accounts', __('账号数量'))->sortable();
        $grid->column('orderby', __('排序'))->editable()->sortable();
        $grid->column('status', __('状态'))->switch($states);

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
        $show = new Show(Group::findOrFail($id));

        $show->field('id', __('Id'));
        // $show->field('uid', __('Uid'));
        $show->field('name', __('分组名称'));
        $show->field('orderby', __('排序'));
        $show->field('status', __('状态'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Group());

        // $form->number('uid', __('Uid'));
        $form->text('name', __('分组名称'));
        $form->number('orderby', __('排序'));
        $form->switch('status', __('状态'))->default(1);

        $form->saving(function (Form $form) {
            $form->model()->uid  = Admin::user()->id;
        });

        return $form;
    }
}
