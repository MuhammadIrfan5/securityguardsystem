<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    use HasFactory;
    public function employee()
    {
        return $this->belongsTo(Employee::class,'employee_id');
    }
    public function location()
    {
        return $this->belongsTo(Location::class,'location_id');
    }
    public function scheduleDays()
    {
        return $this->hasMany(ScheduleDay::class,'schedule_id');
    }
}
