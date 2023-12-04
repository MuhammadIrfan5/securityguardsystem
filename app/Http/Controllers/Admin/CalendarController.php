<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Http\Request;

class CalendarController extends Controller
{
    public function index()
    {
        $data['title'] = "Scheduling";

        return view('admin.calendar.list', $data);
    }

    public function getEvents()
    {
        if (request()->ajax()) {
            $data = Schedule::whereDate('created_at', '>=', request()->start)
                ->whereDate('created_at', '<=', request()->end)
                ->get();
            foreach ($data as $key => $item) {
                $list[] =
                    ['id'    => $item->id,
                     'title' => 'SOHAIL' . $key,
                     'start' => $item->start_date,
                     'end'   => $item->end_date
                    ];
            }

            return response()->json($list);
        }

    }

    public function addEvent(Request $request)
    {
        switch ($request->type) {
            case 'add':
                $event = Schedule::create([
                        'location_id' => $request->location,
                        'employee_id' => $request->employee,
                        'start_date'  => $request->start,
                        'end_date'    => $request->end,
                        'comments'    => $request->comments ?? "",
                        'created_by'  => $request->user()['id'],
                ]);

                return response()->json($event);
                break;

            case 'update':
                $events = Schedule::find($request->id);
                $event = Schedule::create([
                    'location_id' => $events->location_id,
                    'employee_id' => $events->employee_id,
                    'start_date'  => $events->start_date,
                    'end_date'    => $events->end_date,
                    'comments'    => $events->comments ?? "",
                    'created_by'  => $request->user()['id'],
                ]);
                return response()->json($event);
                break;

            case 'delete':
                $event = Schedule::find($request->id)->delete();

                return response()->json($event);
                break;

            default:
                # code...
                break;
        }

    }

    public function getLocations()
    {
        $data['location'] = Location::all();
        $data['employee'] = Employee::all();
        $data['days'] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
        return response($data);
    }
}
