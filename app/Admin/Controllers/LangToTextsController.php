<?php

namespace App\Admin\Controllers;

use App\Models\LangToText;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\Tiktok;
use App\Models\Tklang;

class LangToTextsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TikTok文本管理';

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
        $grid->column('type', __('类型'))->using(LangToText::$types);
        $grid->column('image', __('示例'))->image();
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
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $tiktoks    = Tiktok::pluck('version', 'version');
        $tklangs    = Tklang::pluck('lang_text', 'iso');
        $form = new Form(new LangToText());
        $form->radio('type', __('类型'))->options(LangToText::$types)->default(0);
        $form->select('lang', __('语言-ISO'))->required()->options($tklangs);
        $form->select('version', __('TikTok—版本'))->options($tiktoks);
        $form->text('key', __('脚本端—KEY'))->required();
        $form->text('val', __('TikTok—TEXT'))->required();
        $form->image('image', __('示例'));
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
