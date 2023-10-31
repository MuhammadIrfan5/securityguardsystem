<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MonitorLocation extends Model
{
    use HasFactory;

    protected $fillable = [
        'location_id',
        'number_of_camera',
        'camera_tower_number',
        'nvr'
    ];
}
