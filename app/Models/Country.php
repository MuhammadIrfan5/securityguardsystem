<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable=[
        'name',
        'iso2',
        'iso3',
        'phone_code',
        'dialling_pattern',
        'region',
        'sub_region',
        'status',
    ];
}
