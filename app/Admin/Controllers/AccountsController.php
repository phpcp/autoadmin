<?php

namespace App\Admin\Controllers;

use App\Models\Account;
use App\Models\Device;
use App\Models\GroupAccount;
use App\Models\AccountToGroup;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh;
use Endroid\QrCode\Label\Alignment\LabelAlignmentCenter;
use Endroid\QrCode\Label\Font\NotoSans;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;
use App\Globals\Ens;
use App\Admin\Actions\Account\Task;

class AccountsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Account';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $statusLabel = [
            0 => 'default',
            1 => 'success',
        ];
        $status     = [
            0 => '退出',
            1 => '正常',
        ];
        $uid  = Admin::user()->id;
        $grid = new Grid(new Account());
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->model()->where('admin_id', $uid);

        $devicesObj     = Device::where('admin_id', $uid)->get();
        $devices        = [];
        $deviceFilers   = [];
        foreach($devicesObj as $item){
            $devices[$item->id]                 = json_decode($item->info, true);
            $devices[$item->id]['user_num']     = $item->user_num;
            $deviceFilers[$item->id]            = '编号:' . $item->user_num . '('.($devices[$item->id]['brand'] ?? null).') - 账号数: ' . $item->accounts;
            // $deviceFilers[$item->id]['counts']  = $item->accounts;
        }

        $groups     = GroupAccount::where('admin_id', $uid)->pluck('name', 'id')->toArray();
        // dd($devices);

        $grid->column('id', __('Id'))->hide();
        $grid->column('did', __('登录手机'))->display(function($id) use($devices){
            // $row    = Device::find($id);
            if(!isset($devices[$id])){
                return '账号不存在...';
            }
            return '编号: ' . ($devices[$id]['user_num']) . '<br>' . ($devices[$id]['brand'] ?? null);
        })->filter($deviceFilers);
        $grid->column('groups', __('所属组'))->checkbox($groups)->filter($groups);
        $grid->column('avatar', __('头像'))->image(40,40);
        $grid->column('uuid', __('账号ID'))->filter()->hide();
        $grid->column('nickname', __('账号昵称'))->filter();
        $grid->column('follower_count', __('粉丝数'))->label()->sortable();
        $grid->column('aweme_count', __('作品数'))->label()->sortable();
        $grid->column('total_favorited', __('获赞数'))->label()->sortable();
        $grid->column('favoriting_count', __('点赞数'))->label()->sortable();
        $grid->column('following_count', __('关注数'))->label()->sortable();
        $grid->column('region', __('地区'));
        $grid->column('status', __('状态'))->display(function($status){
            return $status == 1 ? '正常' : '退出';
        })->label($statusLabel)->filter($status);
        // $grid->column('qrcode', __('二维码'))->display(function(){
        //     $arr    = [
        //         'ws'    => 'ws://auto.mini.zhishukongjian.com:9130/client',
        //         'token' => Ens::encrypt(json_encode(['id' => 1, 'time' => time()])),
        //         // 'token'  => ['id' => 1, 'time' => time()],
        //     ];
        //     $str    = json_encode($arr);
        //     $data   = Ens::encrypt($str);
        //     $result = Builder::create()
        //         ->writer(new PngWriter())
        //         ->writerOptions([])
        //         ->data($data)
        //         ->encoding(new Encoding('UTF-8'))
        //         ->errorCorrectionLevel(new ErrorCorrectionLevelHigh())
        //         ->size(300)
        //         ->margin(10)
        //         ->roundBlockSizeMode(new RoundBlockSizeModeMargin())
        //         // ->logoPath(__DIR__.'/assets/symfony.png')
        //         ->labelText('打开手机端扫码')
        //         ->labelFont(new NotoSans(20))
        //         ->labelAlignment(new LabelAlignmentCenter())
        //         ->build();
        //     return $result->getDataUri();
        // })->image();
        $grid->column('shareUrl', __('分享链接'))->hide();
        // $grid->disableActions();
        // $grid->batchActions(function ($batch) {
        //     $batch->disableDelete();
        // });
        // $grid->column('updated_at', __('Updated at'));
        // $grid->column('created_at', __('Created at'));
        $grid->actions(function ($actions) {
            // $actions->add(new Task);
        });

        return $grid;
    }
// Angelia19970526
    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Account::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('did', __('Did'));
        $show->field('uuid', __('Uuid'));
        $show->field('avatar', __('Avatar'));
        $show->field('username', __('Username'));
        $show->field('fensi', __('Fensi'));
        $show->field('zuopin', __('Zuopin'));
        $show->field('dianzan', __('Dianzan'));
        $show->field('guanzhu', __('Guanzhu'));
        $show->field('updated_at', __('Updated at'));
        $show->field('created_at', __('Created at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Account());

        // $form->number('did', __('Did'));
        // $form->text('uuid', __('Uuid'));
        // $form->image('avatar', __('Avatar'));
        $form->number('groups', __('所属组'));
        // $form->text('username', __('Username'));
        // $form->number('fensi', __('Fensi'));
        // $form->number('zuopin', __('Zuopin'));
        // $form->number('dianzan', __('Dianzan'));
        // $form->number('guanzhu', __('Guanzhu'));
        $form->saved(function(Form $form){
            AccountToGroup::where('id', $form->model()->id)->delete();
            $arr    = [];
            if($form->groups){
                foreach($form->groups as $item){
                    $arr[]  = ['id' => $form->model()->id, 'gid' => $item];
                }
                AccountToGroup::insert($arr);
            }
            GroupAccount::countAccount(Admin::user()->id);
        });

        return $form;
    }
}
