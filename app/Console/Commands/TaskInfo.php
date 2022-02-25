<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class TaskInfo extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:TaskInfo';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // $r = Illuminate\Support\Facades\Redis::get('Task');
        // dd($r);
        $TaskController = new \App\Admin\Controllers\TaskController();
        $TaskController->taskDistribution(2);
        return Command::SUCCESS;
    }
}
