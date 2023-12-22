<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

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
        $startOfWeek          = Carbon::now();
        $endOfWeek            = Carbon::now();
        $currentWeekStartDate = $startOfWeek->startOfWeek(Carbon::SUNDAY); // Set the week start day to Sunday
        $currentWeekEndDate   = $endOfWeek->endOfWeek(Carbon::SATURDAY);   // Set the week end day to Saturday
        $data['locations']    = Schedule::whereNotBetween('created_at', [ $currentWeekStartDate, $currentWeekEndDate ])->get();
        $data['title']        = "Reschedule";

        return view('admin.reschedule.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $type    = $request->previous_date;
        $records = Schedule::whereIn('id', $request->location_id)->get();
        foreach ($records as $record) {
            $data = $this->getLastWeekScheduled($record, $type);
            if (!empty($data['item'])) {
                $start_time           = date('d-m-Y', strtotime($data['startDate']));
                $end_time             = date('d-m-Y', strtotime($data['endDate']));
                $newdata              = new Schedule();
                $newdata->location_id = $data['item']->location_id;
                $newdata->employee_id = $data['item']->employee_id;
                $newdata->start_date  = $start_time;
                $newdata->end_date    = $end_time;
                $newdata->comments    = !empty($data['item']) ? $data['item']->comments : "";
                $data->created_by     = $request->user()['id'];

                $newdata->save();
                $days = $data['item']->scheduleDays;

                $scheduleDays = [];

                foreach ($days as $v) {
                    $scheduleDays[] = [
                        "day"        => $v->day,
                        "start_time" => $v->start_time,
                        "end_time"   => $v->end_time,
                    ];
                }
                $newdata->scheduleDays()->createMany($scheduleDays);
            }
        }
        return redirect()->route('schedule.index')->with('msg', 'Reschedule  Successfully!');
    }

    private function getLastWeekScheduled($scheduleObj, $type)
    {
        $startOfWeek          = Carbon::now();
        $endOfWeek            = Carbon::now();
        $currentWeekStartDate = $startOfWeek->startOfWeek(Carbon::SUNDAY)->subWeek(); // Set the week start day to Sunday
        $currentWeekEndDate   = $endOfWeek->endOfWeek(Carbon::SATURDAY)->subWeek();   // Set the week end day to Saturday
        $data['item']         = Schedule::where('location_id', $scheduleObj->location_id)->whereBetween('created_at', [ $currentWeekStartDate, $currentWeekEndDate ])
            ->first();
        $startOfWeeks         = Carbon::now();
        $endOfWeeks           = Carbon::now();
        $data['startDate']    = $startOfWeeks->startOfWeek(Carbon::SUNDAY); // Set the week start day to Sunday
        $data['endDate']      = $endOfWeeks->endOfWeek(Carbon::SATURDAY);   // Set the week end day to Saturday
        // You can now use $orders as the collection of orders for the current week
        return $data;
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
