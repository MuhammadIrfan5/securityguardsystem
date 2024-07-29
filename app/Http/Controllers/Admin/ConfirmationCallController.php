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

            /*Search function*/
            $records->whereNull('check_out_time');
            $response["recordsTotal"] = $records->count();
            $response["recordsFiltered"] = $records->count();

            $records = $records->whereBetween('start_date', [$start, $end])
                ->orderBy('id', 'DESC')->skip($request->start)->take($request->length)->get();
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
                    'edit'       => view('admin.layout.defaultComponent.editButton', [
                        'editUrl' => route('location.edit', $record->id)
                    ])->render(),
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
    public function store(Request $request)
    {
        $request->validate([
            'location_id' => 'required',
            'employee_id' => 'required',
            'status'      => 'required|string',
            'notes'       => 'nullable|string',
        ]);
        $data = new ConfirmationCall();
        $data->user_id = $request->user()['id'];
        $data->location_id = $request->location_id;
        $data->schedule_id = $request->schedule_id;
        $data->employee_id = $request->employee_id;
        $data->status = $request->status;
        $data->notes = $request->notes;
        $data->call_time = $request->call_time;
        $data->save();

        return redirect()->route('confirmation-call.index')->with('msg', 'Confirmation call updated Successfully!');
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
