<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Job;
use App\Models\Location;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

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
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country                  = new Job();
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
            $response['data'][] = [
                $record->id,
                $record->employee->name,
                $record->location->name,
                $record->check_in,
                $record->calling_number,
                view('admin.layout.defaultComponent.approved', [ "boolean" => $record->is_approved ])->render(),
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('assign-job.edit', $record->id)
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
        $data['title']    = 'Time Sheet';
        $data['location'] = Location::all();
        $data['employee'] = Employee::all();
        return view('admin.timesheet.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'location_id'    => 'required',
            'employee_id'    => 'required',
            'check_in'       => 'required',
            'calling_number' => 'required',
        ]);

        $data                 = new Job();
        $data->location_id    = $request->location_id;
        $data->employee_id    = $request->employee_id;
        $data->check_in       = $request->check_in;
        $data->calling_number = $request->calling_number;
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
        $data['data']     = Job::find($id);

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
}
