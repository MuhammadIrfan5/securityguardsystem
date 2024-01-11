<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPrivilege extends Model
{
    use HasFactory;

    protected $fillable = [
        'privilege_id',
        'user_id',
        'role_id',
        'assign_by'
    ];

    static function get_single_privilige($user_id, $privilige_url)
    {

        if (request()->user()['role_id'] == 1) {
            return true;
        } else {
            $privilige = Privilege::where('privilige_url', $privilige_url)->first();
            if ($privilige != null) {
                $check = new UserPrivilege();
                $check = $check->select('role_id', 'user_id', 'privilege_id')
                    ->where('user_id', $user_id)
                    ->where('privilege_id', $privilige->id)
                    ->first();
                if ($check != null) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    }

    public function get_user_priviliges($role_id, $user_id)
    {
        $check = new UserPrivilege();
        $check = $check->join('privileges', 'user_privileges.privilege_id', '=', 'privileges.id')
            ->select('user_privileges.privilege_id', 'privileges.privilige_url', 'user_privileges.role_id', 'user_privileges.admin_id')
            ->where('role_id', $role_id)
            ->where('admin_id', $user_id)
            ->get();
        if ($check != null) {
            return $check;
        } else {
            return false;
        }
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id', 'id');
    }

    public function privilige()
    {
        return $this->belongsTo(Privilege::class, 'privilege_id', 'id');
    }

    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id', 'id');
    }
}
