<?php

namespace App\Admin\Controllers;

use App\Models\Task;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

use App\Models\Device;
use App\Models\Account;
use App\Models\AccountVideo;
use App\Models\TaskType;
use Encore\Admin\Facades\Admin;
use App\Models\GroupDevice;
use App\Models\DeviceToGroup;
use App\Models\GroupAccount;
use App\Models\AccountToGroup;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\MessageBag;
use App\Globals\WbApi;
use Illuminate\Support\Facades\Storage;
use App\Admin\Actions\Task\Send;
use App\Admin\Actions\Task\Period;

use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;
class TaskController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '任务';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $states = [
            'on'  => ['value' => 1, 'text' => '监听', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '失效', 'color' => 'default'],
        ];
        $labels = [
            -2 => 'danger',
            -1 => 'danger',
            0 => 'default',
            1 => 'info',
            2 => 'primary',
            3 => 'warning',
            10 => 'success',
        ];
        
        $grid = new Grid(new Task());
        $adminId    = Admin::user()->id;
        $grid->model()->where('admin_id', $adminId);
        $devices    = Device::myDevices($adminId);
        $accounts   = Account::where('admin_id', $adminId)->pluck('nickname', 'id')->toArray();

        $task_types     = TaskType::getLists()->toArray();

        $grid->column('id', __('Id'))->hide();
        // $grid->column('admin_id', __('Admin id'));
        // $grid->column('name', __('任务名称'))->filter();
        $grid->column('name', __('任务名称'))->filter()->editable()->copyable();
        $grid->column('task_id', __('任务类型'))->using($task_types)->filter($task_types);
        $grid->column('device_id', __('设备号'))->checkbox($devices)->filter($devices);
        $grid->column('account_id', __('账号'))->checkbox($accounts)->filter($accounts);
        // $grid->column('quality', __('权重'))->sortable()->editable();
        // $grid->column('starttime', __('开始时间'))->sortable();
        // $grid->column('endtime', __('结束时间'))->sortable();
        $grid->column('configs', __('配置'))->hide();
        $grid->column('errmsg', __('错误信息'))->hide();
        // $grid->column('status', __('任务状态'))->using(Task::$status)->label($labels);
        // $grid->column('active', __('是否有效'))->switch($states);
        $grid->column('media_num', __('单次视频发布数量'))->display(function ($media_num) {
            return $media_num == 0?'---':$media_num;
        });
        $grid->column('created_at', __('创建时间'))->display(function($val){
            return date('Y-m-d H:i:s', strtotime($val));
        });
        $grid->column('updated_at', __('更新时间'))->display(function($val){
            return date('Y-m-d H:i:s', strtotime($val));
        })->hide();

        $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->add(new Period);
            $actions->add(new Send);
        });
        // $grid->disableActions();
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
        // $show = new Show(Task::findOrFail($id));

        // $show->field('id', __('Id'));
        // $show->field('admin_id', __('Admin id'));
        // $show->field('task_id', __('Task id'));
        // $show->field('name', __('Name'));
        // $show->field('device_id', __('Device id'));
        // $show->field('account_id', __('Account id'));
        // $show->field('quality', __('Quality'));
        // $show->field('starttime', __('Starttime'));
        // $show->field('endtime', __('Endtime'));
        // $show->field('configs', __('Configs'));
        // $show->field('errmsg', __('Errmsg'));
        // $show->field('status', __('Status'));
        // $show->field('active', __('Active'));
        // $show->field('frequency', __('Frequency'));
        // $show->field('units', __('Units'));
        // $show->field('dg', __('Dg'));
        // $show->field('ag', __('Ag'));
        // $show->field('created_at', __('Created at'));
        // $show->field('updated_at', __('Updated at'));
        // $show->field('need_times', __('Need times'));
        // $show->field('run_times', __('Run times'));

        // return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form(){
        $form               = new Form(new Task());
        $form->model()->where('admin_id', Admin::user()->id);
        $adminId            = Admin::user()->id;
        $taskTypes          = TaskType::getLists()->toArray();
        $devices            = Device::myDevices($adminId);
        $deviceGroupsObj    = GroupDevice::where('admin_id', $adminId)->orderByDesc('orderby')->get();
        $deviceGroups       = [];
        foreach ($deviceGroupsObj as $value) {
            $deviceGroups[$value->id]   = $value->name . '(' . $value->devices . ')';
        }

        $accounts           = Account::where('admin_id', $adminId)->pluck('nickname', 'id');
        $accountGroupsObj   = GroupAccount::where('admin_id', $adminId)->orderByDesc('orderby')->get();
        $accountGroups      = [];
        foreach ($accountGroupsObj as $value) {
            $accountGroups[$value->id]   = $value->name . '(' . $value->accounts . ')';
        }

        $form->text('name', __('任务名称'))->required();
        $form->number('quality', __('任务权重'))->default(0);
        $form->select('task_id', __('任务类型'))->options($taskTypes)->required()->when(1, function(Form $form) use($deviceGroups, $devices){// 获取账号
            $form->multipleSelect('dg', __('设备组'))->options($deviceGroups);
            $form->multipleSelect('device_id', __('手机设备'))->options($devices);
        })->when(2, function(Form $form) use($devices, $accounts, $deviceGroups, $accountGroups){// 养号
            $form->multipleSelect('dg', __('设备组'))->options($deviceGroups);
            $form->multipleSelect('device_id', __('手机设备'))->options($devices);
            $form->multipleSelect('ag', __('账号组'))->options($accountGroups);
            $form->multipleSelect('account_id', __('账号列表'))->options($accounts);

            $form->embeds('configs', '', function ($form) use($devices, $accounts, $deviceGroups, $accountGroups){
                $form->number('minvideo', '最少视频')->default(3);
                $form->number('maxvideo', '最多视频')->default(10);
                $form->number('minseetime', '最短时长')->default(3);
                $form->number('maxseetime', '最多时长')->default(10);

                $form->rate('dianzan', '点赞概率')->default(10);
                $form->rate('comment_pro', '评论概率')->default(10);
                $form->textarea('commants', __('评论内容'))->placeholder('一行一个,随机选取!')->rows(14);
            });
        })->when(3, function(Form $form) use($devices, $accounts, $deviceGroups, $accountGroups){// 视频发布
            $form->number('media_num', __('单次发布数量'))->min(1)->default(1);
            $form->multipleSelect('dg', __('设备组'))->options($deviceGroups);
            $form->multipleSelect('device_id', __('手机设备'))->options($devices);
            $form->multipleSelect('ag', __('账号组'))->options($accountGroups);
            $form->multipleSelect('account_id', __('账号列表'))->options($accounts);
            $form->multipleFile('medias', __('视频'))->removable()->sortable();
            $form->textarea('commant', __('视频标题'))->placeholder('和视频顺序对应,如果不需要文案,则留空行')->rows(14);
        })->when(4, function(Form $form){// 关注
            $form->html('待开发...');
        });


        $form->saving(function($form){
            $adminId                    = Admin::user()->id;
            $form->model()->admin_id    = $adminId;

            $tskType                    = TaskType::find($form->task_id);

            $devices            = [];
            if($form->device_id){
                $form->device_id    = array_filter($form->device_id);
            }
            if(isset($form->dg)){
                $dg             = array_filter($form->dg);
                if(!empty($dg)){
                    $devices    = DeviceToGroup::whereIn('gid', $dg)->pluck('id')->toArray();
                }
                $devices            = array_merge($devices, array_filter($form->device_id));
                $devices            = array_unique($devices);
                $form->device_id    = $devices;
            }

            $accounts        = [];
            if($tskType && $tskType->isdevice != 1 && isset($form->account_id)){
                if($devices){
                    $accounts           = Account::whereIn('did', $devices)->where('status', 1)->pluck('id')->toArray();
                }
                if(isset($form->ag)){
                    if($form->task_id == 1){
                        $form->account_id   = [];
                    }else{
                        $ag             = array_filter($form->ag);
                        if(!empty($ag)){
                            $accounts   = array_merge($accounts, AccountToGroup::whereIn('gid', $ag)->pluck('id')->toArray());
                        }
                        $accounts           = array_filter(array_merge($accounts, $form->account_id));
                        $accounts           = array_unique($accounts);
                    }
                }
                if(!$accounts){
                    $error = new MessageBag([
                        'title'   => '错误',
                        'message' => '请选择账号!',
                    ]);
                    return back()->with(compact('error'));
                }
                $form->account_id   = $accounts;
            }
        });

        // $form->saved(function (Form $form) {
        //     if($form->task_id){
        //         $tskType                    = TaskType::find($form->task_id);
        //         $data   = [
        //             'configs'   => $form->configs,
        //             'quality'   => $form->quality,
        //             'file'      => $tskType->file,
        //             'id'        => $form->model()->id,
        //             'req_time'  => time(),
        //         ];
        //         $arr    = [
        //             'type'      => $tskType->type,
        //             'data'      => $data,
        //             'code'      => 200,
        //             'msg'       => '',
        //             'noreback'  => false,
        //         ];
        //         $accountsId         = array_filter($form->model()->account_id);
        //         if($accountsId){
        //             $devicesId      = Account::whereIn('id', $accountsId)->pluck('did', 'did')->toArray();
        //         }else{
        //             $devicesId      = $form->model()->device_id;
        //         }

        //         if(!$tskType){
        //             $error = new MessageBag([
        //                 'title'   => '错误',
        //                 'message' => '请选择任务类型!',
        //             ]);
        //             return back()->with(compact('error'));
        //         }
        //         // 除了基于设备的任务,其余的都是基于账号的任务
        //         if($tskType->isdevice != 1){
        //             if(!$accountsId){
        //                 $error = new MessageBag([
        //                     'title'   => '错误',
        //                     'message' => '当前任务设置没有账号!',
        //                 ]);
        //                 return back()->with(compact('error'));
        //             }
        //         }


        //         // 将配置按设备区分,并带上账号信息
        //         $acarr          = [];
        //         $accountObj     = Account::whereIn('id', $form->model()->account_id)->get()->toArray();
        //         if($tskType->model){// 有内置方法
        //             $rs         = call_user_func_array(['App\Models\TaskType', $tskType->model], [$form, $arr]);
        //             if($rs !== true){
        //                 $error = new MessageBag([
        //                     'title'   => '错误',
        //                     'message' => $rs,
        //                 ]);
        //                 return back()->with(compact('error'));
        //             }
        //         }else{
        //             $rs     = WbApi::send(Admin::user()->id, implode(',', $devicesId), $arr);
        //             $rs     = json_decode($rs, true);
        //             if($rs['code'] != 200){
        //                  $error = new MessageBag([
        //                     'title'   => '错误',
        //                     'message' => $rs['msg'],
        //                 ]);
        //                 return back()->with(compact('error'));
        //             }
        //         }
        //     }
        // });
        // $form->number('admin_id', __('Admin id'));
        // $form->number('task_id', __('Task id'));
        // $form->text('name', __('Name'));
        // $form->textarea('device_id', __('Device id'));
        // $form->textarea('account_id', __('Account id'));
        // $form->number('quality', __('Quality'));
        // $form->number('starttime', __('Starttime'));
        // $form->number('endtime', __('Endtime'));
        // $form->textarea('configs', __('Configs'));
        // $form->textarea('errmsg', __('Errmsg'));
        // $form->number('status', __('Status'));
        // $form->switch('active', __('Active'))->default(1);
        // $form->textarea('frequency', __('Frequency'));
        // $form->switch('units', __('Units'));
        // $form->textarea('dg', __('Dg'));
        // $form->textarea('ag', __('Ag'));
        // $form->number('need_times', __('Need times'));
        // $form->number('run_times', __('Run times'));

        return $form;
    }
    public function cycle(Content $content,Request $request)
    {
        if( !$request->isMethod('post') ){

            // $TaskRedisArray = [];
            // Redis::set('Task',json_encode($TaskRedisArray));
            // dd(1);
            $id = $request->t_id;
            if( empty( $id )){
                return redirect('/admin/tasks');
            }
            $Task = new Task();
            $Task = Task::where('id','=',$id)->first();
            if( !$Task ){
                return redirect('/admin/tasks');
            }
            $content->header('周期设置'); 
            $content->description($Task->name); 
            $form = new Form(new Task());
            $form->date('starttime', __('开始时间'))->required()->style('width','100%')->value($Task->starttime);
            $form->date('endtime', __('结束时间'))->required()->style('width','100%')->value($Task->endtime);

            $form->table('time_frame', __('时间范围'), function ($table) {
                $table->time('start','时间选择')->rules('required');
                // $table->timeRange('start', 'end', '时间范围')
            })->value($Task->time_frame);

            $form->hidden('t_id')->value($id);
            $form->setAction('cycle');          
            $form->footer(function ($footer) {
                $footer->disableReset();
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });
            $form->tools(function (Form\Tools $tools) {
                $tools->disableList();
                $tools->add('<a href="/admin/tasks" class="btn btn-sm  btn-default"><i class="fa fa-list"></i>&nbsp;&nbsp;列表</a>');
            });
            // $form->confirm('确定提交吗？');
            $content->body(view('task/add',  ['form' => str_replace('<h3 class="box-title">创建</h3>','<h3 class="box-title">《<span style="color:red">'.$Task->name.'</span>》--- 周期设置</h3>',$form->render())]));
            return $content;
        }else{
            $data = $request->all();
            if( empty($data['time_frame']) ){
                $error = new MessageBag([
                    'title'   => '错误~',
                    'message' => '时间不能为空!',
                ]);
                return back()->with(compact('error')); 
            }
            $starttime = $data['starttime'];
            $endtime = $data['endtime'];
            if (strtotime($starttime.' 00:00:00') > strtotime($endtime.' 23:59:59')) {
                $error = new MessageBag([
                    'title'   => '错误~',
                    'message' => '结束时间 不能大于 开始时间!',
                ]);
                return back()->with(compact('error')); 
            }

            $time = date('Y-m-d',time());
            if (strtotime($time.' 00:00:00') > strtotime($endtime.' 23:59:59')) {
                $error = new MessageBag([
                    'title'   => '错误~',
                    'message' => '结束时间 不能小于 当前时间！》》》'.$time,
                ]);
                return back()->with(compact('error')); 
            }

            $time_frame = $data['time_frame'];
            $timeFrameData = $this->dataGroup($time_frame,'_remove_');
            if( empty($timeFrameData[0])){
                $error = new MessageBag([
                    'title'   => '错误~',
                    'message' => '时间不能为空!',
                ]);
                return back()->with(compact('error')); 
            }
            $trueTime = $timeFrameData[0];

            $id = $data['t_id'];
            $Task = Task::find($id);
            $Task->starttime = $data['starttime'];
            $Task->endtime = $data['endtime'];
            $Task->time_frame = $timeFrameData[0];
            $res = $Task->save();
            $this->taskDistribution(1,$id);

            return redirect('/admin/tasks');
        }
    }
    public function taskDistribution($type,$data="")
    {
        switch ($type) {
            case '1':
                $TaskRedis = Redis::get('Task');
                $TaskRedisArray = [];
                if( !empty( $TaskRedis )){
                    //删除相关ID
                    $TaskRedisArray = json_decode($TaskRedis,true);
                    foreach ($TaskRedisArray as $key => $value) {
                        if( $value['data']['id'] == $data ){
                            unset($TaskRedisArray[$key]); 
                        }
                    }
                }
                $Task = Task::find($data);
                $admin = Admin::user()->id;
                $TaskText = $this->addRedis($Task,$admin);
                if( $TaskText ){
                    array_push($TaskRedisArray, $TaskText);
                }
                if( !empty($TaskRedisArray)){
                    $TaskRedisArray = array_merge($TaskRedisArray);
                }
                Redis::set('Task',json_encode($TaskRedisArray));
            break;
            case '2': 
                $TaskRedisArray = [];
                $Task = Task::get();
                foreach ($Task as $key => $value) {
                    $admin = $value->admin_id;
                    $TaskText = $this->addRedis($value,$admin);
                    if( $TaskText ){
                        array_push($TaskRedisArray, $TaskText);
                    }
                }
                if( !empty($TaskRedisArray)){
                    $TaskRedisArray = array_merge($TaskRedisArray);
                }
                Redis::set('Task',json_encode($TaskRedisArray));
            break;
            default:
                # code...
            break;
        }
    }
    public function addRedis($Task,$admin)
    {
        $time = time();
        $timeBegin = strtotime($Task['starttime'].' 00:00:00');
        $timeEnd = strtotime($Task['endtime'].' 23:59:59');
        if( $time >= $timeBegin && $time <= $timeEnd ){
            if( $Task->task_id ){
                if( $Task->time_frame ){
                    $tskType = TaskType::find($Task->task_id);
                    if( $tskType ){
                        foreach ($Task->time_frame as $key => $value){
                            $accountsId = array_filter($Task->account_id);
                            if($accountsId){
                                $devicesId = Account::whereIn('id', $accountsId)->pluck('did', 'did')->toArray();
                            }else{
                                $devicesId = $Task->device_id;
                            }
                            $arr    = [
                                'type'      => $tskType->type,
                                'data'      => [
                                    'configs'   => $Task->configs,
                                    'quality'   => $Task->quality,
                                    'file'      => $tskType->file,
                                    'id'        => $Task->id,
                                    'req_time'  => time(),
                                ],
                                'code'      => 200,
                                'msg'       => '',
                                'noreback'  => false,
                                'start'     =>  $value['start'],
                                'a_id'      =>  $admin,
                                'devicesId' =>  implode(',', $devicesId),
                            ];
                            $acarr  = [];
                            $accountObj = Account::whereIn('id', $Task->account_id)->get()->toArray();
                            if($tskType->model){
                                $is_arr = $this->call_user_func_array($tskType->model,$Task,$arr);
                                if( $is_arr != false ){
                                    return $is_arr;
                                }
                            }else{
                                return $arr;
                            }
                        }
                    }
                }
            }
        }
    }
    public function call_user_func_array($type,$Task,$arr)
    {
        switch ($type) {
            case 'videos':
                if(!empty($Task->medias)){
                    $acarr = [];
                    $accountObj = Account::whereIn('id', $Task->account_id)->get()->toArray();
                    if(!empty($accountObj)){
                        $medias = $Task->medias;
                        if( $Task->media_num != 0 ){
                            $media_num = $Task->media_num * count($accountObj);
                            $medias = array_slice($medias,0,$media_num);
                        }
                        $commants = explode("\r\n", $Task->commant);
                        $acarr = [];
                        $i = 0;
                        foreach($medias as $index => $media){
                            if(!isset($accountObj[$i])){
                                $i      = 0;
                            }
                            $acr        = $accountObj[$i];
                            $acarr[$acr['did']][]      = [
                                'uuid'      => $acr['uuid'],
                                'media'     => Storage::disk('admin')->url($media),
                                'commant'   => $commants[$index] ?? null,
                            ];
                            $i++;
                        }
                        $sendarr        = [];
                        foreach ($acarr as $key => $value) {
                            foreach($value as $k => $item){
                                $sendarr[$key][$item['uuid']][]     = [
                                    'media'     => $item['media'],
                                    'commant'   => $item['commant'],
                                ];
                            }
                        }
                        $arr['data']['configs'] = $sendarr;
                        return $arr;
                    }
                }
                return false;
            break;
            case 'raise':
                if($Task->account_id){
                    $accountObj = Account::where('admin_id', $arr['a_id'])->whereIn('id', $Task->account_id)->get()->toArray();
                    if( $accountObj ){
                        $sendArr = [];
                        foreach($accountObj as $item){
                            $sendArr[$item['did']][$item['id']]     = $item['nickname'];
                        }
                        $arr['data']['sendArr'] = [];
                        foreach($sendArr as $did => $item){
                            $array = [];
                            $array['accounts'] = array_values($item);
                            $array['did'] = $did;
                            array_push($arr['data']['sendArr'], $array);
                        }
                        return $arr;
                    }
                }
                return false;
            break;
            default:
                # code...
            break;
        }
    }
    /**
     * @description:根据数据 
     * @param {dataArr:需要分组的数据；keyStr:分组依据} 
     * @return: array
     */
    public function dataGroup(array $dataArr,$keyStr)
    {
        $newArr=[];
        foreach ($dataArr as $k => $val) {    
            $newArr[$val[$keyStr]][] = $val;
        }
        return $newArr;
    }
}
