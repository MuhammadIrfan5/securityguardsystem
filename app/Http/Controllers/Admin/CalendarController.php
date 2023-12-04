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
        $data['locations'] =Location::all();
        return view('admin.calendar.list', $data);
    }

    public function getEvents()
    {
        if (request()->ajax()) {
            $data = Schedule::where('location_id',\request()->locationId)->whereDate('created_at', '>=', request()->start)
                ->whereDate('created_at', '<=', request()->end)
                ->get();
            $list=array();
            foreach ($data as $item) {
                $list[] =
                    [ 'id'    => $item->id,
                      'title' => $item->employee->name . date('hA', strtotime($item->start_time)) . '-to-' . date('hA', strtotime($item->end_time)),
                      'start' => $item->start_date,
                      'end'   => $item->end_date
                    ];
            }

            return response($list);
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
                    'start_time'  => $request->startTime,
                    'end_time'    => $request->endTime,
                    'comments'    => $request->comments ?? "",
                    'created_by'  => $request->user()['id'],
                ]);

                return response()->json($event);
                break;
            case 'update':
                $events = Schedule::find($request->id);
                $event  = Schedule::create([
                    'location_id' => $events->location_id,
                    'employee_id' => $events->employee_id,
                    'start_date'  => $request->start,
                    'end_date'    => $request->end,
                    'start_time'  => $events->start_time,
                    'end_time'    => $events->end_time,
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
        $data['days']     = [ 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday' ];
        return response($data);
    }
}
