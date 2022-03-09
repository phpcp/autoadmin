<?php

namespace App\Admin\Controllers;

use App\Models\Tkbtns;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TkbtnsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TikTok参数';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Tkbtns());
        $grid->column('id', __('Id'))->hide();
        $grid->column('type', __('类型'))->using(['1' => 'ID', '2' => 'TEXT']);
        $grid->column('varsion', __('TikTok—版本'));
        $grid->column('key', __('脚本端—KEY'));
        $grid->column('val', __('TikTok—ID/TEXT'));
        $grid->column('remark', __('备注'));
        $states = [
            'on'  => ['value' => 1, 'text' => '正常', 'color' => 'primary'],
            'off' => ['value' => 2, 'text' => '禁用', 'color' => 'default'],
        ];
        $grid->column('status', __('状态'))->switch($states)->sortable();

        $grid->filter(function($filter){
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('type', __('类型'))->radio([
                    1 => 'ID',
                    2 => 'TEXT',
                ]);
                $filter->equal('status', __('状态'))->radio([
                    1 => '正常',
                    2 => '禁用',
                ]);
                $filter->like('varsion', __('TikTok—版本'));
            });
            $filter->column(1/2, function ($filter) {
                $filter->like('key', __('脚本端—KEY'));
                $filter->like('val', __('TikTok—ID/TEXT'));
            });
        });
        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
        });
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
        $show = new Show(Tkbtns::findOrFail($id));
        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('email_verified_at', __('Email verified at'));
        $show->field('password', __('Password'));
        $show->field('remember_token', __('Remember token'));
        $show->field('max_device', __('Max device'));
        $show->field('endtime', __('Endtime'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Tkbtns());

        $form->radio('type', __('类型'))->options(['1' => 'ID', '2'=> 'TEXT'])->default('1')->required();
        $form->text('varsion', __('TikTok—版本'))->required();
        $form->text('key', __('脚本端—KEY'))->required();
        $form->text('val', __('TikTok—ID/TEXT'))->required();
        $form->textarea('remark', __('备注'));
        $form->radio('status', __('状态'))->options(['1' => '正常', '2'=> '禁用'])->default('1')->required();

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
