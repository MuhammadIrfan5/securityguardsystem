<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Http\Request;

class RescheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title'] = "Reschedule";
        $data['locations'] = Schedule::select('location_id')->get();

        return view('admin.reschedule.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $records=Schedule::with('scheduleDays')->whereIn('id',$request->location_id)->get();
        dd($records);
        $days = $request->days;
        $start_time = $request->start_time;
        $end_time = $request->end_time;

        $dateTime = explode(' - ', $request->input('dateRange'));

        $data = new Schedule();
        $data->location_id = $request->location_id;
        $data->employee_id = $request->employee_id;
        $data->start_date = $dateTime[0];
        $data->end_date = $dateTime[1];
        $data->comments = $request->comments ?? "";
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
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
