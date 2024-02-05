<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Http\Request;

class ScheduleController extends Controller
{
    public function index()
    {
        $data['title']            = "Scheduling";
        $data['locations']        = Location::all();
        $data['selectedlocation'] = \request()->user()['role_id'] == 3 ? Location::where('user_id', \request()->user()['id'])->first() : '';
        return view('admin.schedule.list', $data);
    }

    public function getEvents()
    {
        if (request()->ajax()) {
            $data = Schedule::where('location_id', \request()->locationId)
                ->whereDate('start_date', '>=', request()->start)
                ->whereDate('end_date', '<=', request()->end)
                ->get();
            $list = array();
            foreach ($data as $item) {
                $color = null;
                if ($item->title == 'Test') {
                    $color = '#924ACE';
                } else {
                    $color = '#ffff00';
                }
                $list[] =
                    [ 'id'    => $item->id,
                      'title' => !empty($item->employee) ? $item->employee->name . ' : ' . date('hA', strtotime($item->start_time)) . '-to-' . date('hA', strtotime($item->end_time)) : '',
                      'start' => $item->start_date,
                      'end'   => $item->end_date,
                      'color' => $color
                    ];
            }

            return response($list);
        }

    }

}
