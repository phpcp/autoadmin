<?php

namespace App\Admin\Controllers;

use App\Models\Tklang;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TklangController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TikTok 语种';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Tklang());

        $grid->column('id', __('Id'));
        $grid->column('lang_text', __('语言'));
        $grid->column('iso', __('ISO'));

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
        $show = new Show(Tklang::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('lang_text', __('语言'));
        $show->field('iso', __('Iso'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Tklang());

        $form->text('lang_text', __('语言'));
        $form->text('iso', __('Iso'));

        return $form;
    }
}
