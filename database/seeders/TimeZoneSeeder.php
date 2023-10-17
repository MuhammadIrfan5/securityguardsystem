<?php

namespace Database\Seeders;

use App\Models\TimeZone;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TimeZoneSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $timezonelist = \DateTimeZone::listIdentifiers(\DateTimeZone::ALL);
        foreach ($timezonelist as $item) {
            TimeZone::create(['timezone'=>$item]);
        }
    }
}
