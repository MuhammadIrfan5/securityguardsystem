<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Job;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class TimeSheetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = "Time Sheet";
        return view('admin.timesheet.list', $data);
    }

    public function tableData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $records  = new Schedule();

        /*Search function*/
        if (!empty($request->search["value"])) {
            $records = $records->where("id", "like", "%" . $request->search["value"] . "%");
            $records = $records->orWhere("name", "like", "%" . $request->search["value"] . "%");
        }
        $records = $records->where('employee_id', '!=', '')
            ->whereDate('start_date', '>=', Carbon::today())
            ->whereDate('end_date', '<=', Carbon::tomorrow());

        $response["recordsTotal"]    = $records->count();
        $response["recordsFiltered"] = $records->count();

        $records = $records->orderBy('id', 'DESC')->skip($request->start)->take($request->length)->get();
        foreach ($records as $record) {

            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.linkDetail',
                    [ 'is_location' => 1,
                      "url"         => route('location.show', $record->location_id),
                      "username"    => $record->location->name
                    ]
                )->render(),
                $record->employee->name,
                $record->type . '-' . $record->time,
                $record->notes ?? '',
                view('admin.layout.defaultComponent.approved', [ "boolean" => $record->is_approved ?? 0 ])->render(),
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('time-sheet.edit', $record->id)
                ])->render(),
            ];
        }
        return response($response);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title']     = 'Time Sheet';
        $data['locations'] = Location::all();
        return view('admin.timesheet.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'location_id' => 'required',
            'employee_id' => 'required',
            'time'        => 'required',
            'type'        => 'required',
        ]);

        /*GET EMPLOYEE*/
        $record = Employee::find($request->employee_id);

        $data                 = new Job();
        $data->location_id    = $request->location_id;
        $data->employee_id    = $request->employee_id;
        $data->time           = $request->time;
        $data->type           = $request->type;
        $data->calling_number = $record->phone_one;
        $data->save();

        return redirect()->route('time-sheet.index')->with('msg', 'Time-Sheet Successfully!');

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
        $data['title']    = 'Assign Job';
        $data['location'] = Location::all();
        $data['employee'] = Employee::all();
        $data['data']     = Schedule::find($id);

        return view('admin.timesheet.edit', $data);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = Job::find($id);
        if (!empty($data)) {
            if (!empty($request->location_id)) {
                $data->location_id = $request->location_id;
            }
            if (!empty($request->employee_id)) {
                $data->employee_id = $request->employee_id;
            }
            if (!empty($request->check_in)) {
                $data->check_in = $request->check_in;
            }
            if (!empty($request->calling_number)) {
                $data->calling_number = $request->calling_number;
            }
            if (!empty($request->is_approved)) {
                $data->is_approved = (int)$request->is_approved;
            }
            $data->update();
        }
        return redirect()->route('time-sheet.index')->with('msg', 'Assign Job Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function getEmployees(Request $request)
    {
        $list     = array();
        $id       = $request->location_id;
        $employee = Schedule::
        select('id', 'employee_id')
            ->
            where('location_id', $id)
            ->whereNotNull('employee_id')
            ->whereDate('start_date', '>=', date('Y-m-d'))
            ->whereDate('end_date', '<=', Carbon::tomorrow())
            ->get();
        if (count($employee) > 0) {
            foreach ($employee as $item) {
                $list[] = [
                    'id'   => $item->employee->id,
                    'name' => $item->employee->name,
                ];
            }
        }
        return $list;
    }

    /*AJAX API*/

    private function getDailyAttendance($locationId, $startTime, $endTime)
    {
        $currentDateTime = new \DateTime();

        $startTime = !empty($startTime) ? $startTime : $currentDateTime->format('H:i');
        $endTime   = !empty($endTime) ? $endTime : $currentDateTime->format('H:i');

        $item = Schedule::where('location_id', $locationId)
            ->whereTime('start_time', '>', $startTime)
            ->whereTime('end_time', '<', $endTime)
            ->whereDate('start_date', '>=', date('Y-m-d'))
            ->whereDate('end_date', '<=', date('Y-m-d'))
            ->get();
        // You can now use $orders as the collection of orders for the current week
        return $item;
    }

}
