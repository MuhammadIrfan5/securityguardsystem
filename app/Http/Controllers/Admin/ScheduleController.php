<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Location;
use App\Models\Schedule;
use Illuminate\Http\Request;

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
        $country                  = new Schedule();
        $response["recordsTotal"] = $country->count();

        /*Sorting*/
        switch ('id') {
            case 'id':
                $country = $country->orderBy('id', 'desc');
                break;
            default:
                break;
        }
        /*Search function*/
        if (!empty($request->search["value"])) {
            $country = $country->where("id", "like", "%" . $request->search["value"] . "%");
            $country = $country->orWhere("name", "like", "%" . $request->search["value"] . "%");
        }
        $response["recordsFiltered"] = $country->count();
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
        $country = $country->skip($request->start)->take($request->length)->get();
        foreach ($country as $record) {
            $dates=$record->scheduleDays;
            $days=implode(',',$dates->pluck('day')->toArray());
            $response['data'][] = [
                $record->id,
                $record->employee->name,
                $record->location->name,
                view('admin.layout.defaultComponent.dateTime', [
                    'first_value' => $dates[0]->start_time,
                    'second_value' => $dates[0]->end_time,
                    'days' => $days,
                ])->render(),
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('role.edit', $record->id)
                ])->render(),
            ];
        }
        return response($response, 201);
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

        $days     = $request->days;
        $checkIn  = $request->check_in;
        $checkOut = $request->check_out;

        $data              = new Schedule();
        $data->location_id = $request->location_id;
        $data->employee_id = $request->employee_id;
        $data->comments    = $request->comments??"";
        $data->save();

        $scheduleDays = [];

        foreach ($days as $key => $v) {
            $dateTime = explode(' - ', $request->input('datetimes')[$key]);
            $scheduleDays[] = [
                "day"        => $v,
                "start_time" => $dateTime[0],
                "end_time"   => $dateTime[1],
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
