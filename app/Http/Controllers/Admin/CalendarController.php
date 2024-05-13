<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Location;
use App\Models\Schedule;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CalendarController extends Controller
{
    public function index()
    {
        $data['title']            = "Scheduling";
        $data['locations']        = Location::all();
        $data['selectedlocation'] = \request()->user()['role_id'] == 3 ? Location::where('user_id', \request()->user()['id'])->first() : '';
        return view('admin.calendar.list', $data);
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

    public function addEvent(Request $request)
    {
        $startDate = Carbon::parse($request->input('start'));
        $endDate   = Carbon::parse($request->input('end'));

        $dates     = [];
        $lastIndex = $endDate->diffInDays($startDate);

        while ($startDate->lte($endDate)) {
            $dates[] = $startDate->toDateString();
            $startDate->addDay();
        }
        switch ($request->type) {

            case 'add':
                foreach ($dates as $key => $item) {
                    $nextDate = date('Y-m-d', strtotime("+1 day", strtotime($item)));
                    if ($lastIndex != $key) {
                        $location = Location::find($request->location);
                        $event    = Schedule::create([
                            'user_id'     => $location->user_id,
                            'location_id' => $request->location,
                            'employee_id' => '',
                            'start_date'  => $item,
                            'end_date'    => $nextDate,
                            'start_time'  => $request->startTime,
                            'end_time'    => $request->endTime,
                            'comments'    => $request->comments ?? "",
                            'created_by'  => $request->user()['id'],
                        ]);
                    }
                }
                return response()->json($event);
                break;
            case 'update':
                $events = Schedule::find($request->id);
                $check  = Schedule::
                where('start_date', $request->start)
                    ->where('end_date', $request->end)
                    ->where('employee_id', $events->employee_id)
                    ->where('location_id', $events->location_id)
                    ->first();
                if (empty($check)) {
                    $event            = Schedule::create([
                        'location_id' => $events->location_id,
                        'employee_id' => $events->employee_id ?? '',
                        'start_date'  => $request->start,
                        'end_date'    => $request->end,
                        'start_time'  => $events->start_time,
                        'end_time'    => $events->end_time,
                        'comments'    => $events->comments ?? "",
                        'created_by'  => $request->user()['id'],
                    ]);
                    $event['success'] = true;

                } else {
                    $event['success'] = false;
                }
                return response()->json($event);
                break;
            case 'updateSingle':
                $event = Schedule::find($request->id);
                if (!empty($event)) {
                    $event->employee_id = $request->employee_id;
                }
                $event->update();
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

    public function getEmployee(Request $request)
    {
        $data      = array();
        $employees = Schedule::where('location_id', $request->locationId)
            ->where('employee_id','!=','')
            ->whereDate('start_date', '>=', date('Y-m-d'))
            ->whereDate('end_date', '<=', date('Y-m-d', strtotime('tomorrow')))
            ->get();
        foreach ($employees as $item) {
            $data['employee'][] = [
                'id'          => $item->employee_id,
                'name'        => $item->employee->name,
                'schedule_id' => $item->id,
            ];
        }
        return response($data);
    }

    public function getEdit(Request $request)
    {
        $today = Carbon::today();

        $data['record']   = Schedule::find($request->id);
        $data['employee'] = Employee::whereDoesntHave('schedules', function ($query) use ($today) {
            $query
                ->whereDate('start_date', '>=', date('Y-m-d'))
                ->whereDate('end_date', '<=', date('Y-m-d', strtotime('tomorrow')));
        })->get();

        return response($data);
    }
}
