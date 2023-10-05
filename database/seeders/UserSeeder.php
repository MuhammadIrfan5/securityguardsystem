<?php

namespace Database\Seeders;

use Faker\Provider\PhoneNumber;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'image'      => '',
            'country_id' => 1,
            'state_id'   => 1,
            'city_id'    => 1,
            'phone1'     => PhoneNumber::randomNumber(),
            'email'      => 'admin@gmail.com',
            'address'    => '',
            'role_id'    => 1,
            'password'   => Hash::make('admin'),
            'first_name' => ('admin'),
            'last_name'  => ('admin'),
            'dob'        => ('admin'),
        ]);
    }
}
