<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'id_number',
        'phone_one',
        'user_id',
        'phone_two',
        'notes',
        'is_regular_guard',
        'is_active',
    ];
}
