<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserTwoFactor extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'opt_number',
        'ip_address',
        'browser',
        'version',
        'platform',
        'is_mobile',
        'is_desktop',
    ];
}
