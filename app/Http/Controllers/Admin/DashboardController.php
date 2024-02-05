<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdvanceSalary;
use App\Models\ApplyLeave;
use App\Models\Attendance;
use App\Models\City;
use App\Models\Country;
use App\Models\Loan;
use App\Models\Machine;
use App\Models\Product;
use App\Models\Travel;
use App\Models\User;

class DashboardController extends Controller
{
    public function dashboardIndex()
    {
        $data                 = array();
        $data['userCount']    =
            User::count();
        $data['managerCount'] = 0;
        User::where('role_id', 2)->count();
        $data['machineCount'] =
            City::count();
        $data['productCount'] =
            Country::count();
        
        $timezonelist = \DateTimeZone::listIdentifiers(\DateTimeZone::ALL);
        $response=[];
        foreach ($timezonelist as $item) {
            $date = new \DateTime("now", new \DateTimeZone($item) );
            $response['data'][] = $date;
        }
        return view('admin.dashboard', $data);
    }
}
