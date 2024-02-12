<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;
    public function maintype(){
        return $this->belongsTo(LocationType::class,'location_type');
    }
    public function clientDetail(){
        return $this->hasMany(ClientLocation::class,'location_id');
    }
    public function monitoring(){
        return $this->hasOne(MonitorLocation::class,'location_id');
    }
}
