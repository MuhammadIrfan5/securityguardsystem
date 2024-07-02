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

//    public function tableData(Request $request)
//    {
//        $response = [
//            "draw"            => $request->draw,
//            "recordsTotal"    => 0,
//            "recordsFiltered" => 0,
//            "data"            => [],
//        ];
//        if (!empty(request()->input('start_time'))) {
//            $records = new Location();
//
//            $response["recordsTotal"] = $records->count();
//            $response["recordsFiltered"] = $records->count();
//
//            $records = $records->orderBy('id', 'ASC')
//                ->skip($request->start)->take($request->length)
//                ->get();
//            $startTime = request()->input('start_time');
//            $endTime = request()->input('end_time');
//
//            foreach ($records as $record) {
//                $time = '';
//                $number = '';
//                $matchType = '';
//                $times = '';
//                $timeSheet = '';
//                $timesheetTime = '';
//                $timesheetNotes = '';
//
//
//                $schedules = new Schedule();
//                if (!empty(request()->input('start_time')) && request()->input('end_time')) {
//                    $schedules = $schedules->where('location_id', $record->id)
//                        ->whereDate('start_date', '>=', Carbon::today())
//                        ->whereDate('end_date', '<=', Carbon::tomorrow())
//                        ->where(function($query) use ($startTime, $endTime) {
//                            $query->whereBetween('start_time', [$startTime, $endTime])
//                                ->orWhereBetween('end_time', [$startTime, $endTime]);
//                        })
//                        ->get();
//                }
//                if ($schedules->count()) {
//                    foreach ($schedules as $schedule) {
//                        if (!empty($schedule->employee)) {
//                            if ($schedule->start_time >= $startTime && $schedule->start_time <= $endTime) {
//                                $matchType = 'IN';
//                                $times = '<button
//                                        onclick="loadDraftInModal(this)"
//                                        value="' . $schedule->id . '"
//                                        data-id="' . $schedule->employee_id . '"
//                                        type="button" class="btn btn-success btn-sm"
//                                        data-bs-toggle="modal" data-bs-target="#basicModal">
//                                    ' . $schedule->employee->name . '
//                </button>';
//                                $number = $schedule->employee->phone_one;
//                                $obj=TimeSheet::where('schedule_id',$schedule->id)->first();
//                                if($obj){
//                                    $timesheetTime=$obj->check_out_time;
//                                    $timesheetNotes=$obj->notes;
//                                    $timeSheet.= '<ul>
//                    <li>' . $timesheetTime .' / '.$timesheetNotes. '</li>
//                </ul>
//                <td>';
//                                }
//                            }
//                            elseif ($schedule->end_time >= $startTime && $schedule->end_time <= $endTime)
//                            {
//                                $matchType = 'OUT';
//                                $times = '<button
//                                        onclick="loadDraftInModal(this)"
//                                        value="' . $schedule->id . '"
//                                        data-id="' . $schedule->employee_id . '"
//                                        type="button" class="btn btn-success btn-sm"
//                                        data-bs-toggle="modal" data-bs-target="#basicModal">
//                                    ' . $schedule->employee->name . '
//                </button>';
//                                $number = $schedule->employee->phone_one;
//                                $obj=TimeSheet::where('schedule_id',$schedule->id)->first();
//                                if($obj){
//                                    $timesheetTime=$obj->check_out_time;
//                                    $timesheetNotes=$obj->notes;
//                                }
//
//                            }
//                            $time .= '<ul>
//                    <li>' . $matchType . ': ' . $times . '  /  ' . $number . '</li>
//                </ul>
//                <td>';
//                        }
//                    }
//                    $response['data'][] = [
//                        $record->id,
//                        view('admin.layout.defaultComponent.linkDetail',
//                            [
//                                'is_location' => 1,
//                                "url"         => route('location.show', $record->id),
//                                "username"    => $record->name
//                            ]
//                        )->render(),
//                        $time,
//                        $timeSheet
//                    ];
//                }
//            }
//        }
//        return response($response);
//    }

    public function tableData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];

        if (!empty($request->input('start_time')) && !empty($request->input('end_time'))) {
            $startTime = $request->input('start_time');
            $endTime = $request->input('end_time');

            $records = Location::orderBy('id', 'ASC')
                ->skip($request->start)
                ->take($request->length)
                ->get();

            $response["recordsTotal"] = $records->count();
            $response["recordsFiltered"] = $records->count();

            foreach ($records as $record) {
                $time = '';
                $timeSheet = '';
                $timeSheetComment = '';

                $schedules = Schedule::where('location_id', $record->id)
                    ->whereDate('start_date', '>=', Carbon::today())
                    ->whereDate('end_date', '<=', Carbon::tomorrow())
                    ->where(function($query) use ($startTime, $endTime) {
                        $query->whereBetween('start_time', [$startTime, $endTime])
                            ->orWhereBetween('end_time', [$startTime, $endTime]);
                    })
                    ->get();

                if ($schedules->count()) {
                    foreach ($schedules as $schedule) {
                        if (!empty($schedule->employee)) {
                            $matchType = ($schedule->start_time >= $startTime && $schedule->start_time <= $endTime) ? 'IN' : 'OUT';

                            $times = '<button onclick="loadDraftInModal(this)" value="' . $schedule->id . '" data-id="' . $schedule->employee_id . '" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#basicModal">' . $schedule->employee->name . '</button>';

                            $number = $schedule->employee->phone_one;

                            $time .= '<ul><li>' . $matchType . ': ' . $times . '  /  ' . $number . '</li></ul>';

                            $obj = TimeSheet::where('schedule_id', $schedule->id)->first();

                            if ($obj) {
                                $timesheetTime = $matchType == 'IN' ? $obj->check_in_time : $obj->check_out_time;
                                $timesheetNotes = $obj->notes;

                                $timeSheet .= '<ul><li>' . $matchType . ': ' . $timesheetTime
                                    .
//                                    '  /  ' . $number .
                                    '</li></ul>';
                                $timeSheetComment .= '<ul><li>' . $timesheetNotes . '</li></ul>';
                            }
                        }
                    }

                    $response['data'][] = [
                        $record->id,
                        view('admin.layout.defaultComponent.linkDetail', [
                            'is_location' => 1,
                            'url' => route('location.show', $record->id),
                            'username' => $record->name
                        ])->render(),
                        $time,
                        $timeSheet,
                        $timeSheetComment,
                    ];
                }
            }
        }

        return response()->json($response);
    }




    public function updatedtableData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];

        // Initialize total minutes
        $total_minutes = 0;

        $data = Schedule::where('location_id', $request->location_id)
            ->whereDate('start_date', '>=', Carbon::today())
            ->whereDate('end_date', '<=', Carbon::tomorrow())
            ->pluck('id')
            ->toArray();

        $records = TimeSheet::whereIn('schedule_id', $data);

        $response["recordsTotal"] = $records->count();
        $response["recordsFiltered"] = $records->count();

        $records = $records->orderBy('id', 'ASC')
            ->skip($request->start)
            ->take($request->length)
            ->get();

        foreach ($records as $record) {
            if (!empty($record->check_out_time)) {
                $start_datetime = Carbon::createFromFormat('H:i', $record->check_in_time);
                $end_datetime = Carbon::createFromFormat('H:i', $record->check_out_time);

                $difference = $start_datetime->diff($end_datetime);

                // Add the difference in minutes to the total
                $total_minutes += $difference->format('%i') + ($difference->format('%h') * 60);
            }
            // Build time HTML
            $time = '<ul>
            <li>' . $record->getSchedule->employee->name . '</li>
            <li> Start time   : ' . $record->getSchedule->start_time . '</li>
            <li>End time ' . $record->getSchedule->end_time . '</li>
        </ul>';

            // Render edit button
            $editButton = view('admin.layout.defaultComponent.editButton', [
                'editUrl' => route('time-sheet.edit', $record->id)
            ])->render();

            // Populate response data
            $response['data'][] = [
                $record->id,
                $time,
                $record->employee->name,
                $record->check_in_time,
                $record->check_out_time,
                $record->notes,
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => url('edit-verify-record?id=' . $record->id)
                ])->render()

            ];
        }

        // Calculate total hours
        $response['totalHours'] = floor($total_minutes / 60) . ':' . ($total_minutes % 60);

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
        $data->employee_id = $request->employee_id;
        $data->check_in_time = $request->check_in;
        $data->check_out_time = $request->check_out;
        $data->notes = $request->notes;
        $data->save();
        return true;

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

    public function editVerifyRecord(Request $request)
    {
        $data['title'] = 'Time Sheet';
        $data['data'] = TimeSheet::find($request->id);
        $data['employee'] = Employee::all();
        $data['locations'] = Location::all();

        return view('admin.timesheet.editVerifyRecord', $data);

    }

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
     * Update the specified resource in storage.
     */
    public function updateVerifyRecord(Request $request)
    {
        $data = TimeSheet::find($request->id);
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
        return redirect()->route('time-sheet.edit', $data->location_id)->with('msg', 'Time Sheet Updated Successfully!');
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
