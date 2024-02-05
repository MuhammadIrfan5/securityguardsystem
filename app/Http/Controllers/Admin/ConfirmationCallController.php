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
        $records = new Schedule();

        /*Search function*/
        if (!empty($request->search["value"])) {
            $records = $records->where("id", "like", "%" . $request->search["value"] . "%");
            $records = $records->orWhere("name", "like", "%" . $request->search["value"] . "%");
        }
        $records = $records
            ->where('employee_id', '!=', '')
            ->whereDate('start_date', '>=', Carbon::today())
            ->whereDate('end_date', '<=', Carbon::tomorrow());

        $response["recordsTotal"] = $records->count();
        $response["recordsFiltered"] = $records->count();

        $records = $records->orderBy('id', 'DESC')->skip($request->start)->take($request->length)->get();

        foreach ($records as $record) {
            $item = TimeSheet::where([
                'schedule_id' => $record->id,
            ])
                ->whereNotNull('check_in_time')
                ->whereNotNull('check_out_time')
                ->first();
            $button = '';
            $time = '';
            if (!empty($item)) {
                $button = \App\Models\UserPrivilege::get_single_privilige(auth()->id(), '/confirmation-call/{confirmation-call}/edit') == true ? view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('confirmation-call.edit', $item->id)
                ])->render() : '';
                $time = '<ul>
                    <li>Check-In:' . $item->check_in_time . '</li>
                    <li>Check-Out:' . $item->check_out_time . '</li>
                </ul>';
            }

            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.linkDetail',
                    ['is_location' => 1,
                     "url"         => route('location.show', $record->location_id),
                     "username"    => $record->location->name
                    ]
                )->render(),
                $record->employee->name,
                $time,
                $item->notes??'',
                view('admin.layout.defaultComponent.approved', ["boolean" => $item->is_approved])->render(),
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
        $data->employee_id = $request->employee_id;
        $data->status = $request->status;
        $data->notes = $request->notes;
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
