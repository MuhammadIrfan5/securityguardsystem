<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Job;
use App\Models\Location;
use App\Models\Schedule;
use App\Models\TimeSheet;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Ramsey\Uuid\Type\Time;

class TimeSheetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = "Verify Records";
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
        $records = new Location();

        /*Search function*/
        if (!empty($request->search["value"])) {
            $records = $records->where("id", "like", "%" . $request->search["value"] . "%");
            $records = $records->orWhere("name", "like", "%" . $request->search["value"] . "%");
        }
        $response["recordsTotal"] = $records->count();
        $response["recordsFiltered"] = $records->count();

        $records = $records->orderBy('id', 'ASC')
            ->skip($request->start)->take($request->length)
            ->get();
        foreach ($records as $record) {
            $schedules = Schedule::where('location_id', $record->id)->whereDate('start_date', '>=', Carbon::today())
                ->whereDate('end_date', '<=', Carbon::tomorrow())->get();
            $time = '';
            foreach ($schedules as $schedule) {
                if (!empty($schedule->employee)) {
                    $time .= '<ul>
                    <li>' . $schedule->employee->name . ' : ' . $schedule->start_time . '</li>
                    <li>' . $schedule->employee->name . ' : ' . $schedule->end_time . '</li>
                </ul>';
                } else {
                    $time .= '<ul>
                    <li>Check-In:</li>
                    <li>Check-Out:</li>
                </ul>';
                }
            }

            $editButton = view('admin.layout.defaultComponent.editButton', [
                'editUrl' => route('time-sheet.edit', $record->id)
            ])->render();

            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.linkDetail',
                    [
                        'is_location' => 1,
                        "url"         => route('location.show', $record->id),
                        "username"    => $record->name
                    ]
                )->render(),
                $time,
                count($schedules) > 0 ? $editButton : ''
            ];
        }
        return response($response);
    }
    public function updatedtableData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $data = new Schedule();

        /*Search function*/
        $data=$data->where('location_id', \request()->location_id)->whereDate('start_date', '>=', Carbon::today())
            ->whereDate('end_date', '<=', Carbon::tomorrow())->pluck('id')->toArray();

        $records=TimeSheet::whereIn('schedule_id',$data);

        $response["recordsTotal"] = $records->count();
        $response["recordsFiltered"] = $records->count();

        $records = $records->orderBy('id', 'ASC')
            ->skip($request->start)->take($request->length)
            ->get();
        foreach ($records as $record) {
                    $time = '<ul>
                    <li> Start time   : ' . $record->start_time . '</li>
                    <li>End time ' . $record->end_time . '</li>
                </ul>';

            $editButton = view('admin.layout.defaultComponent.editButton', [
                'editUrl' => route('time-sheet.edit', $record->id)
            ])->render();

            $response['data'][] = [
                $record->id,
                $record->employee->name,
                $time,
            ];
        }
        return response($response);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title'] = 'Verify Records';
        $data['data'] = Schedule::find(\request()->id);
        $data['employee'] = Employee::all();
        $data['locations'] = Location::all();
        return view('admin.timesheet.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'id'        => 'required',
            'check_in'  => 'required',
            'check_out' => 'nullable',
            'notes'     => 'nullable',
        ]);

        /*GET EMPLOYEE*/
        $record = Schedule::find($request->id);

        $data = new TimeSheet();
        $data->user_id = $request->user()['id'];
        $data->schedule_id = $record->id;
        $data->location_id = $record->location_id;
        $data->employee_id = $record->employee_id;
        $data->check_in_time = $request->check_in;
        $data->check_out_time = $request->check_out;
        $data->notes = $request->notes;
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
        $data['title'] = 'Time Sheet';
        $data['location'] = Location::find($id);
        $data['employee'] = Employee::all();
        $data['data'] = Schedule::where('location_id', $id)->whereDate('start_date', '>=', Carbon::today())
            ->whereDate('end_date', '<=', Carbon::tomorrow())->get();

        return view('admin.timesheet.editDetail', $data);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = TimeSheet::find($id);
        if (!empty($data)) {
            if (!empty($request->check_in)) {
                $data->check_in_time = $request->check_in;
            }
            if (!empty($request->check_out)) {
                $data->check_out_time = $request->check_out;
            }
            if (!empty($request->notes)) {
                $data->notes = $request->notes;
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
        $list = array();
        $id = $request->location_id;
        $employee = Schedule::
        select('id', 'employee_id')
            ->where('employee_id', '!=', '')
            ->where('location_id', $id)
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

    public function getEmployeeByLocation(Request $request)
    {
        $list = array();
        $id = $request->location_id;
        $employee = Employee::
        select('id', 'name')
            ->wheredoesntHave('schedules', function ($q) use ($id) {
                $q->where('id', $id)
                    ->whereDate('start_date', '>=', date('Y-m-d'))
                    ->whereDate('end_date', '<=', Carbon::tomorrow());
            })
            ->get();
        if (count($employee) > 0) {
            foreach ($employee as $item) {
                $list[] = [
                    'id'   => $item->id,
                    'name' => $item->name,
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
        $endTime = !empty($endTime) ? $endTime : $currentDateTime->format('H:i');

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
