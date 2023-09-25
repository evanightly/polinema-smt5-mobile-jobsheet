<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class CustomHostCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'start';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Override default host ip address';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Get the host argument from the command line
        $host = '192.168.0.16';

        // Validate the host argument
        if (filter_var($host, FILTER_VALIDATE_IP) === false) {
            // Show an error message and exit the command if the host is not a valid IP address
            $this->error('The host must be a valid IP address.');
            return 1;
        }

        // Get the port option from the config file or use the default value of 8000
        $port = config('app.port', 8000);

        // Show a success message and run the laravel serve command with the specified host and port
        $this->info("Changing the default host to {$host}...");
        $this->call('serve', ['--host' => $host, '--port' => $port]);
    }
}
