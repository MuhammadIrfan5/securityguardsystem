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
        if (!is_dir($backupDirectory)) {
            mkdir($backupDirectory, 0755, true);
        }

        $filename = $backupDirectory . '/' . date('Y-m-d_His') . '.sql';

        // Use Laravel's built-in database utilities to perform the backup
        $database = config('database.connections.mysql.database');
        $username = config('database.connections.mysql.username');
        $password = config('database.connections.mysql.password');
        $host = config('database.connections.mysql.host');

        $command = sprintf(
            'mysqldump -u%s -p%s -h%s %s > %s',
            escapeshellarg($username),
            escapeshellarg($password),
            escapeshellarg($host),
            escapeshellarg($database),
            escapeshellarg($filename)
        );

        // Use Laravel's database connection to execute the command
        DB::connection()->getPdo()->exec($command);

        $this->info("Database backup saved to: {$filename}");
    }
}
