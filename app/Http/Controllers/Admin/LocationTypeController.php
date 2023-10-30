<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\LocationType;
use Illuminate\Http\Request;

class LocationTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = 'Location Type list';
        return view('Admin.locationType.list', $data);
    }

    public function tableData(Request $request)
    {
        if ($request->ajax()) {

            $response                    = [
                "draw"            => $request->draw,
                "recordsTotal"    => 0,
                "recordsFiltered" => 0,
                "data"            => [],
            ];
            $data                        = new LocationType();
            $response["recordsTotal"]    = $data->count();
            $response["recordsFiltered"] = $data->count();

            /*Sorting*/
            switch ('id') {
                case 'id':
                    $data = $data->orderBy('id', 'desc');
                    break;
                default:
                    break;
            }


            /*Search function*/
            if (!empty($request->search["value"])) {
                $data = $data->where("name", "like", "%" . $request->search["value"] . "%");
                $data = $data->orWhere("description", "like", "%" . $request->search["value"] . "%");
                $data = $data->orWhere("created_at", "like", "%" . $request->search["value"] . "%");
            }
            /*ordering*/
            // $order = $request["order"][0]["column"];
            // $orderDir = $request["order"][0]["dir"];
            // switch ($order){
            //     case '0':
            //         $data = $data->orderBy('id',$orderDir);
            //         break;
            //     case '1':
            //         $data = $data->orderBy('title',$orderDir);
            //         break;
            //     case '2':
            //         $data = $data->orderBy('image',$orderDir);
            //         break;
            //     case '3':
            //         $data = $data->orderBy('status',$orderDir);
            //         break;
            //     case '4':
            //         $data = $data->orderBy('created_at',$orderDir);
            //         break;
            // }
            $data = $data->skip($request->start)->take($request->length)->get();
            foreach ($data as $record) {
                $response['data'][] = [
                    '<input type="checkbox" class="checkbox" onclick="handleCheck(this)" value="' . $record->id . '">',
                    $record->parent_id != '0' ? $record->maintype->type : '',
                    $record->type,
                    view('Admin.layout.defaultComponent.active', [ "boolean" => $record->is_active ])->render(),
                    view('Admin.layout.defaultComponent.editButton', [
                        'editUrl' => route('locationType.edit', $record->id)
                    ])->render(),
                ];
            }
            return response($response, 201);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['title'] = 'Location Type';
        $data['type']  = LocationType::where('parent_id', 0)->get();
        return view('Admin.locationType.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        $data            = new LocationType();
        $data->type      = $request->name;
        $data->parent_id = !empty($request->parent_id) ? $request->parent_id : 0;
        $data->is_active = 1;
        $data->save();

        return redirect()->route('locationType.index')->with('msg', 'location Type Added Successfully!');

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
