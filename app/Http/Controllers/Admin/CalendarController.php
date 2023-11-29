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

        return view('Admin.calendar.list', $data);
    }

    public function getEvents()
    {
        if (request()->ajax()) {
            $data = Schedule::whereDate('created_at', '>=', request()->start)
                ->whereDate('created_at', '<=', request()->end)
                ->get();
            foreach ($data as $key => $item) {
                $list[] =
                    [ 'id'    => $item->id,
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
        dd($request->all());
        switch ($request->type) {
            case 'add':
                $event = Schedule::create([
                    'title' => $request->title ?? '',
                    'start' => $request->start,
                    'phone' => $request->phone ?? '',
                    'name'  => $request->name ?? '',
                    'email' => $request->email ?? '',
                    'end'   => $request->end,
                ]);

                return response()->json($event);
                break;

            case 'update':
                $events = Schedule::find($request->id);
                $event  = Schedule::create([
                    'title' => $events->title ?? '',
                    'start' => $request->start,
                    'phone' => $events->phone ?? '',
                    'name'  => $events->name ?? '',
                    'email' => $events->email ?? '',
                    'end'   => $request->end,
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
