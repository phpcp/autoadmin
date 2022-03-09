<?php

namespace App\Admin\Controllers;

use App\Models\LangToText;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LangToTextsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TikTok参数--TEXT';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new LangToText());
        $grid->column('id', __('Id'));
        $grid->column('version', __('TikTok—版本'));
        $grid->column('lang', __('语言-ISO'));
        $grid->column('key', __('脚本端—KEY'));
        $grid->column('val', __('TikTok—TEXT'));
        
        $grid->filter(function($filter){
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->like('lang', __('语言-ISO'));
                $filter->like('version', __('TikTok—版本'));
            });
            $filter->column(1/2, function ($filter) {
                $filter->like('key', __('脚本端—KEY'));
                $filter->like('val', __('TikTok—TEXT'));
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
        $show = new Show(LangToText::findOrFail($id));
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
        $form = new Form(new LangToText());
        $form->text('lang', __('语言-ISO'))->required();
        $form->text('version', __('TikTok—版本'));
        $form->text('key', __('脚本端—KEY'))->required();
        $form->text('val', __('TikTok—TEXT'))->required();
        
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
