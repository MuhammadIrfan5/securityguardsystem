<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Eloquent\Factories\Sequence;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $roles = [
            ['name' => 'SuperAdmin'],
            ['name' => 'Admin'],
            ['name' => 'Client'],
            ['name' => 'Security Guard'],
            ['name' => 'User'],
        ];
        Role::insert($roles);

    }
}
