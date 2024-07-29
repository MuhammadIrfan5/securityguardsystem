<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Location;
use App\Models\Schedule;
use App\Models\TimeSheet;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

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
            "draw" => $request->draw,
            "recordsTotal" => 0,
            "recordsFiltered" => 0,
            "data" => [],
        ];

//        if (!empty($request->input('start_time')) && !empty($request->input('end_time'))) {
        if (!empty($request->daterange)) {
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

                $dates = explode(' - ', $request->daterange);
                $start = date('Y-m-d', strtotime($dates[0]));
                $end = date('Y-m-d', strtotime($dates[1]));
                dd($start,$end);
                $schedules = Schedule::where('location_id', $record->id)
                    ->whereBetween('start_date', [$start, $end])
//                    ->where(function ($query) use ($startTime, $endTime) {
//                        $query->whereBetween('start_time', [$startTime, $endTime])
//                        $query->where('start_time','>=', $startTime)
//                            ->orWhereBetween('end_time', [$startTime, $endTime])
//                        ;
//                    })
                    ->get();

                if ($schedules->count()) {
                    foreach ($schedules as $schedule) {
                        if (!empty($schedule->employee)) {
                            $inTimeButton = '';
                            $outTimeButton = '';

                            // "IN" time button
                            if ($schedule->start_time
//                                >= $startTime && $schedule->start_time <= $endTime
                            ) {
                                $inTimeButton = '<button onclick="loadDraftInModal(this)" value="' . $schedule->id . '" 
                                data-id="' . $schedule->employee_id . '" type="button" 
                                class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#basicModal1">'
                                    . $schedule->employee->name . '</button>';
                            }

                            // "OUT" time button
                            if ($schedule->end_time
//                                >= $startTime && $schedule->end_time <= $endTime
                            ) {
                                $outTimeButton = '<button onclick="loadDraftInModal1(this)" value="' . $schedule->id . '" 
                                data-id="' . $schedule->employee_id . '" type="button" 
                                class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#basicModal2">'
                                    . $schedule->employee->name . '</button>';
                            }

                            $number = $schedule->employee->phone_one;

                            if ($inTimeButton) {
                                $time .= '<ul><li>IN: '.$schedule->start_time . $inTimeButton . '  /  ' . $number . '</li></ul>';
                            }
                            if ($outTimeButton) {
                                $time .= '<ul><li>OUT: ' .$schedule->end_time.'  /  ' . $outTimeButton . '  /  ' . $number . '</li></ul>';
                            }

                            $obj = TimeSheet::where('schedule_id', $schedule->id)->first();

                            if ($obj) {
                                if ($inTimeButton) {
                                    $noteIN=json_decode($obj->notes,true)??[];

                                    $timeSheet .= '<ul><li>IN: ' . $obj->check_in_time . '</li></ul>';
                                    $timeSheetComment .= '<ul><li>' .$noteIN['check_in_note'] . '</li></ul>';
                                }
                                if ($outTimeButton) {
                                    $noteIN=json_decode($obj->notes,true)??[];

                                    $timeSheet .= '<ul><li>OUT: ' . $obj->check_out_time . '</li></ul>';
                                    $timeSheetComment .= '<ul><li>' . $noteIN['check_out_note'] ?? "" . '</li></ul>';
                                }
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
            'id' => 'required',
            'check_in' => 'nullable',
            'check_out' => 'nullable',
            'notes' => 'nullable',
        ]);

        /*GET Schedule*/
        $record = Schedule::find($request->id);

        $timesheet = TimeSheet::where('schedule_id', $record->id)
            ->where('location_id', $record->location_id)
            ->where('employee_id', $record->employee_id)
            ->first();
        if (!empty($timesheet)) {
            if (!empty($request->check_in)) {
                $timesheet->check_in_time = $request->check_in;
            }
            if (!empty($request->check_out)) {
                $timesheet->check_out_time = $request->check_out;
            }
            if (!empty($request->notes)) {
                $existingNotes = json_decode($timesheet->notes, true) ?? [];
                if (!empty($request->check_in)) {
                    $existingNotes['check_in_note'] = $request->notes;
                    $existingNotes['check_out_note'] = '';
                }
                if (!empty($request->check_out)) {
                    $existingNotes['check_out_note'] = $request->notes;
                }
                $timesheet->notes = json_encode($existingNotes);
            }
            $timesheet->update();
        } else {
            $data = new TimeSheet();
            $data->user_id = $request->user()['id'];
            $data->schedule_id = $record->id;
            $data->location_id = $record->location_id;
            $data->employee_id = $request->employee_id;
            $data->check_in_time = $request->check_in;
            $data->check_out_time = $request->check_out;
            if (!empty($request->notes)) {
                $existingNotes = json_decode($data->notes, true) ?? [];
                if (!empty($request->check_in)) {
                    $existingNotes['check_in_note'] = $request->notes;
                    $existingNotes['check_out_note'] = '';
                }
                if (!empty($request->check_out)) {
                    $existingNotes['check_out_note'] = $request->notes;
                }
                $data->notes = json_encode($existingNotes);
            }
            $data->save();
        }
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
                    'id' => $item->employee->id,
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
                    'id' => $item->id,
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