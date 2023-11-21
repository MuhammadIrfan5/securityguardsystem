<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Session;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index()
    {
        $data['title'] = "Schedule";
        return view('admin.schedule.list', $data);
    }

    public function tableData(Request $request)
    {
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $records                  = new location();
        $response["recordsTotal"] = $records->count();

        /*Sorting*/
        switch ('id') {
            case 'id':
                $records = $records->orderBy('id', 'desc');
                break;
            default:
                break;
        }
        /*Search function*/
        if (!empty($request->search["value"])) {
            $records = $records->where("id", "like", "%" . $request->search["value"] . "%");
            $records = $records->orWhere("name", "like", "%" . $request->search["value"] . "%");
        }
        $response["recordsFiltered"] = $records->count();
        /*ordering*/
//        $order = $request["order"][0]["column"]??0;
//        $orderDir = $request["order"][0]["dir"]??"desc";
//        switch ($order) {
//            case '0':
//                $loans = $loans->orderBy('id', $orderDir);
//                break;
//            case '1':
//                $loans = $loans->orderBy('booker_id', $orderDir);
//                break;
//            case '2':
//                $loans = $loans->orderBy('start_date', $orderDir);
//                break;
//            case '3':
//                $loans = $loans->orderBy('end_date', $orderDir);
//                break;
//            case '4':
//                $loans = $loans->orderBy('target', $orderDir);
//                break;
//            case '5':
//                $loans = $loans->orderBy('achieved', $orderDir);
//                break;
//            case '5':
//                $loans = $loans->orderBy('created_at', $orderDir);
//                break;
//        }
        $records = $records->skip($request->start)->take($request->length)->get();
        foreach ($records as $record) {
            $timeDate      = '';
            $employeePhone = '';
            $employeeName  = '';
            $button        = '';
            $scheduled     = $this->getCurrentWeekScheduled($record->id);
            if (!empty($scheduled)) {
                $employeePhone = $scheduled->employee->phone_one;
                $employeeName  = $scheduled->employee->name;
                $dates         = $scheduled->scheduleDays;
                $timeDate      = view('admin.layout.defaultComponent.dateTime', [
                    'date' => $scheduled->start_date . ' to ' . $scheduled->end_date,
                    'list' => $dates,
                ])->render();
                $button        = view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('schedule.edit', $scheduled->id)
                ])->render();
            }
            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.locationDetail', [
                    'name'    => $record->name,
                    'address' => $record->address,
                ])->render(),
                $employeeName,
                $timeDate,
                $employeePhone,
                $button
            ];
        }
        return response($response, 201);
    }

    private function getCurrentWeekScheduled($locationId)
    {
        $startOfWeek          = Carbon::now();
        $endOfWeek            = Carbon::now();
        $currentWeekStartDate = $startOfWeek->startOfWeek(Carbon::SUNDAY); // Set the week start day to Sunday
        $currentWeekEndDate   = $endOfWeek->endOfWeek(Carbon::SATURDAY);   // Set the week end day to Saturday
        $item                 = Schedule::where('location_id', $locationId)->whereBetween('created_at', [ $currentWeekStartDate, $currentWeekEndDate ])
            ->first();
        // You can now use $orders as the collection of orders for the current week
        return $item;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title'] = "Schedule";

        $data['location'] = Location::all();
        $data['employee'] = Employee::all();
        return view('admin.schedule.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'location_id' => 'required',
            'employee_id' => 'required',
        ]);

        $days                = $request->days;
        $request->start_time = array_filter($request->start_time);
        $start_time          = collect($request->start_time)->values()->all();
        $request->end_time   = array_filter($request->end_time);
        $end_time            = collect($request->end_time)->values()->all();

        $dateTime = explode(' - ', $request->input('dateRange'));

        $data              = new Schedule();
        $data->location_id = $request->location_id;
        $data->employee_id = $request->employee_id;
        $data->start_date  = $dateTime[0];
        $data->end_date    = $dateTime[1];
        $data->comments    = $request->comments ?? "";
        $data->created_by  = $request->user()['id'];
        $data->save();

        $scheduleDays = [];

        foreach ($days as $key => $v) {
            $scheduleDays[] = [
                "day"        => $v,
                "start_time" => $start_time[$key],
                "end_time"   => $end_time[$key],
            ];
        }
        $data->scheduleDays()->createMany($scheduleDays);

        return redirect()->route('schedule.index')->with('msg', 'Schedule created Successfully!');

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {

        $data['record']   = Schedule::find($id);
        $data['title']    = "Schedule";
        $data['location'] = Location::all();
        $data['employee'] = Employee::all();
        return view('admin.schedule.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'location_id' => 'nullable',
            'employee_id' => 'nullable',
            'notes'       => 'nullable',
        ]);
        $data = Schedule::find($id);
        if (!empty($request->location_id)) {
            $data->location_id = $request->location_id;
        }
        if (!empty($request->employee_id)) {
            $data->employee_id = $request->employee_id;
        }

        $data->save();

        Session::flash('message', 'Schedule Updated successfully');
        return redirect(route('schedule.index'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

}
