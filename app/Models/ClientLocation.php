<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientLocation extends Model
{
    use HasFactory;

    protected $fillable = [
        'location_id',
        'client_name',
        'client_designation',
        'client_email',
        'client_phone'
    ];
}
