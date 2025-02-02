<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Job;
use App\Models\Location;
use App\Models\Monitoring;
use App\Models\MonitorLocation;
use App\Models\Schedule;
use App\Traits\ImageTrait;
use Illuminate\Http\Request;

class MonitoringController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ImageTrait;

    public function index()
    {
        $data['title'] = "Monitoring";
        return view('admin.monitoring.list', $data);
    }

    public function tableData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country  = new Monitoring();


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

        if ($request->user()['role_id'] != 1) {
            $country = $country->where('user_id', $request->user()['id']);
        }
        $response["recordsTotal"]    = $country->count();
        $response["recordsFiltered"] = $country->count();
        $country                     = $country->orderBy('id', 'DESC')->skip($request->start)->take($request->length)->get();
        foreach ($country as $record) {
            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.linkDetail', [ 'is_location' => 1, "url" => route('location.show', $record->location_id), "username" => $record->location->name ])->render(),
                $record->employee->name,
                view('admin.layout.defaultComponent.profileImage', [
                    'url' => asset('/storage/') . '/' . $record->images,
                ])->render(),
                date('d F Y h:i', strtotime($record->created_at)),
//                view('admin.layout.defaultComponent.editButton', [
//                    'editUrl' => route('assign-job.edit', $record->id)
//                ])->render(),

            ];
        }
        return response($response, 201);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title']    = 'Monitoring';
        $data['location'] = Location::all();
        return view('admin.monitoring.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'location_id' => 'required',
            'employee_id' => 'required',
            'image'       => 'required|mimes:jpeg,png,jpg,gif',
            'notes'       => 'nullable|string',
        ]);
        $id                        = MonitorLocation::where('location_id', $request->location_id)->first('id');
        $data                      = new Monitoring();
        $data->user_id             = $request->user()['id'];
        $data->location_id         = $request->location_id;
        $data->employee_id         = $request->employee_id;
        $data->monitor_location_id = !empty($id)?$id->id:0;
        if (!empty($request->hasFile("image"))) {
            $this->removeImage($data->image);
            $data->images = $this->imageUpload($request->file('image'), $data->getTable());
        }
        $data->notes = $request->notes;
        $data->save();

        return redirect()->route('monitoring.index')->with('msg', 'Images uploaded Successfully!');

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

        return view('admin.job.edit', $data);

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
        return redirect()->route('assign-job.index')->with('msg', 'Assign Job Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
