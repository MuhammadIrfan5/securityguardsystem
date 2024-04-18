<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class BackupDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:backup';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(){
        $backupDirectory = storage_path('app/backups');

        // Create the directory if it doesn't exist
//        if (!is_dir($backupDirectory)) {
//            mkdir($backupDirectory, 0755, true);
//        }

        $filename = $backupDirectory . '/' . date('Y-m-d_His') . '.sql';

        // Use Laravel's built-in database utilities to perform the backup
        $database = config('database.connections.mysql.database');
        $username = config('database.connections.mysql.username');
        $password = config('database.connections.mysql.password');
        $filename = $backupDirectory . '/' . date('Y-m-d_His') . '.sql';

        exec("mysqldump -u{$username} -p{$password} {$database} > {$filename}");

        $this->info("Database backup saved to: {$filename}");

        $this->info("Database backup saved to: {$filename}");
    }
}
