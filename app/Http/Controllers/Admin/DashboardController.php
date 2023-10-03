<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdvanceSalary;
use App\Models\ApplyLeave;
use App\Models\Attendance;
use App\Models\Loan;
use App\Models\Machine;
use App\Models\Product;
use App\Models\Travel;
use App\Models\User;

class DashboardController extends Controller
{
    public function dashboardIndex()
    {
        $data = array();
        $data['userCount'] = 0;
//            User::count();??
        $data['managerCount'] = 0;
//            User::whereIn('role', ['shift-manager', 'unit-manager'])->count();
        $data['machineCount'] = 0;
//            Machine::count();
        $data['productCount'] = 0;
//        Product::count();
//        $travel = Travel::all();
//        $user = User::all();
//        $data['total'] = $attendance->count() + $travel->count() + $loan->count() + $advanceSalary->count();
//        $data['totalPending'] = $attendance->where('status', 'pending')->count() + $travel->where('status', 'pending')->count() + $loan->where('status', 'pending')->count() + $advanceSalary->where('status', 'pending')->count();
//        $data['totalApproved'] = $attendance->where('status', 'approved')->count() + $travel->where('status', 'approved')->count() + $loan->where('status', 'approved')->count() + $advanceSalary->where('status', 'approved')->count();
//        $data['totalRejected'] = $attendance->where('status', 'rejected')->count() + $travel->where('status', 'rejected')->count() + $loan->where('status', 'rejected')->count() + $advanceSalary->where('status', 'rejected')->count();
//
//        $data['advanceSalary'] = $advanceSalary;
//        $data['attendance'] = $attendance;
//        $data['loan'] = $loan;
//        $data['travel'] = $travel;
//        $data['user'] = $user;

        return view('admin.dashboard.dashboard', $data);
    }
}
