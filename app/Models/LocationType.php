<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationType extends Model
{
    use HasFactory;
    public function maintype(){
        return $this->belongsTo(LocationType::class,'parent_id');
    }
}
