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
        'expiry_date',
        'address',
        'category_id',
        'user_id',
        'phone_two',
        'guard_number',
        'issue_date',
        'pay_rate',
        'notes',
        'is_regular_guard',
        'is_active',
        'manager_name',
    ];

    public function schedules(){
        return $this->hasMany(Schedule::class,'employee_id');
    }
}
