<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ConfirmationCall;
use App\Models\Location;
use App\Models\TimeSheet;
use Illuminate\Http\Request;

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
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $records                  = new TimeSheet();
        $response["recordsTotal"] = $records->count();

        /*Sorting*/
        switch ('id') {
            case 'id':
                $records = $records->orderBy('id', 'desc');
                break;
            default:
                break;
        }
        /*Search function*/
        if (!empty($request->search["value"])) {
            $records = $records->where("id", "like", "%" . $request->search["value"] . "%");
            $records = $records->orWhere("name", "like", "%" . $request->search["value"] . "%");
        }
        $response["recordsFiltered"] = $records->count();
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
        $records = $records->whereNotNull([ 'check_in_time', 'check_out_time' ]);
        $records = $records->skip($request->start)->take($request->length)->get();
        foreach ($records as $record) {
            $button             = \App\Models\UserPrivilege::get_single_privilige(auth()->id(), '/confirmation-call/{confirmation-call}/edit') == true ? view('admin.layout.defaultComponent.editButton', [
                'editUrl' => route('confirmation-call.edit', $record->id)
            ])->render() : '';
            $time               = '<ul>
                    <li>Check-In:' . $record->check_in_time . '</li>
                    <li>Check-Out:' . $record->check_out_time . '</li>
                </ul>';
            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.linkDetail',
                    [ 'is_location' => 1,
                      "url"         => route('location.show', $record->location_id),
                      "username"    => $record->location->name
                    ]
                )->render(),
                $record->employee->name,
                $time,
                $record->notes,
                view('admin.layout.defaultComponent.approved', [ "boolean" => $record->is_approved ])->render(),
                $button,
            ];
        }
        return response($response, 201);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title']    = 'Confirmation Call';
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
        $data              = new ConfirmationCall();
        $data->user_id     = $request->user()['id'];
        $data->location_id = $request->location_id;
        $data->employee_id = $request->employee_id;
        $data->status      = $request->status;
        $data->notes       = $request->notes;
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
        $data['data']  = TimeSheet::find($id);
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
