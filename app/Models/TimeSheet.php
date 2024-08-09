<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeSheet extends Model
{
    use HasFactory;

    protected $fillable = [
        'schedule_id',
        'employee_id',
        'location_id',
        'check_in_time',
        'check_out_time',
        'check_in_note',
        'check_out_note',
        'is_approved',
    ];
    public function getSchedule(){
        return $this->belongsTo(Schedule::class,'schedule_id');
    }
    public function employee()
    {
        return $this->belongsTo(Employee::class, 'employee_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }
}
