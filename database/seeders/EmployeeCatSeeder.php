<?php

namespace Database\Seeders;

use App\Models\EmployeeCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class EmployeeCatSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = [
            ['name' => 'Regular'],
            ['name' => 'Shack'],
        ];
        EmployeeCategory::insert($roles);
    }
}
