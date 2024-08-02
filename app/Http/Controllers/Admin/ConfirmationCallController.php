<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ConfirmationCall;
use App\Models\Location;
use App\Models\Schedule;
use App\Models\TimeSheet;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class ConfirmationCallController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = "Confirmation Call";
        return view('admin.confirmationCall.list', $data);
    }

    public function tableData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        if ($request->daterange) {
            $dates = explode(' - ', $request->daterange ?? []);
            $start = date('Y-m-d', strtotime($dates[0]));
            $end = date('Y-m-d', strtotime($dates[1]));

            $records = new TimeSheet();

            $records = $records->whereNull('check_out_time')
                ->whereHas('getSchedule', function ($q) use ($start, $end) {
                    $q->whereBetween('start_date', [$start, $end]);
                })->orderBy('id', 'DESC')->skip($request->start)->take($request->length)->get();
            $response["recordsTotal"] = $records->count();
            $response["recordsFiltered"] = $records->count();

            $today = now()->format('l');
            foreach ($records as $record) {
                $scheduleList = collect(json_decode($record->location->schedule_list, true));
                $formattedSchedule = $scheduleList->filter(function ($schedule) use ($today) {
                    return $schedule['day'] === $today;
                })->map(function ($schedule) {
                    return $schedule['day'] . ': ' . $schedule['start_time'] . ' - ' . $schedule['end_time'];
                })->implode('<br>');
                $response['data'][] = [
                    'id'         => $record->id,
                    'customer'   => view('admin.layout.defaultComponent.linkDetail',
                        ['is_location' => 1,
                         "url"         => route('location.show', $record->location_id),
                         "username"    => $record->location->name
                        ]
                    )->render(),
                    'guard_id'   => $record->employee->id_number,
                    'guard_name' => $record->employee->name,
                    'timings'    => $formattedSchedule,
                    'phone'      => $record->employee->phone_one,
                    'gate_combo' => '',
                    'post_phone' => '',
                    'call_time'  => '',
                    'status'     => $record->status,
                    'note'       => $record->note,
                ];
            }
        }
        return response($response, 201);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title'] = 'Confirmation Call';
        $data['location'] = Location::all();
        return view('admin.confirmationCall.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, $id)
    {
        // Validate the incoming request data
        $request->validate([
            'call_time' => 'nullable|date_format:H:i',
            'status'    => 'nullable|boolean',
            'note'      => 'nullable|string|max:255',
        ]);

        // Find the guard record by its ID
        $guard = TimeSheet::findOrFail($id);

        $confirmationCall = ConfirmationCall::where([
            'time_sheet_id' => $guard->id,
            'schedule_id'   => $guard->schedule_id,
            'location_id'   => $guard->location_id,
            'employee_id'   => $guard->employee_id,
        ])->first();
        if (!empty($confirmationCall)) {
            if ($request->has('call_time')) {
                $guard->call_time = $request->input('call_time');
            }
            if ($request->has('status')) {
                $guard->status = $request->input('status');
            }
            if ($request->has('note')) {
                $guard->note = $request->input('note');
            }
        } else {
            $confirmationCall = new ConfirmationCall();
            $confirmationCall->time_sheet_id = $guard->id;
            $confirmationCall->schedule_id = $guard->schedule_id;
            $confirmationCall->location_id = $guard->location_id;
            $confirmationCall->employee_id = $guard->employee_id;
            if ($request->has('call_time')) {
                $guard->call_time = $request->input('call_time');
            }
            if ($request->has('status')) {
                $guard->status = $request->input('status');
            }
            if ($request->has('note')) {
                $guard->note = $request->input('note');
            }
        }

        // Save the changes to the database
        $guard->save();

        // Return a response
        return response()->json(['message' => 'Data updated successfully']);
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
        $data['title'] = 'Confirmation Call';
        $data['data'] = TimeSheet::find($id);
        return view('admin.confirmationCall.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = TimeSheet::find($id);
        if (!empty($data)) {
            $data->is_approved = $request->is_approved;

            if (!empty($request->notes)) {
                $data->notes = $request->notes;
            }
            $data->update();
        }
        return redirect()->route('confirmation-call.index')->with('msg', 'Status Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
