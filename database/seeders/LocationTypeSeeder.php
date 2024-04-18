<?php

namespace Database\Seeders;

use App\Models\LocationType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LocationTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = [
            [ 'type' => 'Commercial', 'parent_id' => '0', 'is_active' => 1 ],
            [ 'type' => 'Construction', 'parent_id' => '0', 'is_active' => 1 ],
            [ 'type' => 'Los Angeles A', 'parent_id' => '2', 'is_active' => 1 ],
            [ 'type' => 'Los Angeles B', 'parent_id' => '2', 'is_active' => 1 ],
            [ 'type' => 'North', 'parent_id' => '2', 'is_active' => 1 ],
            [ 'type' => 'Mendota', 'parent_id' => '2', 'is_active' => 1 ],
            [ 'type' => 'San Diego', 'parent_id' => '2', 'is_active' => 1 ],
        ];
        LocationType::insert($roles);
    }
}
