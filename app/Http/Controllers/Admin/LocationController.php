<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ClientLocation;
use App\Models\Location;
use App\Models\LocationType;
use App\Models\MonitorLocation;
use App\Models\TimeZone;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = "Location";
        return view('admin.location.list', $data);
    }

    public function tableData(Request $request)
    {
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country                  = new Location();
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
            $mainCategory = '';
            if ($record->maintype->parent_id != 0) {
                $mainCategory = LocationType::find($record->maintype->parent_id)['type'];
            }
            $response['data'][] = [
                $record->id,
                view('Admin.layout.defaultComponent.linkDetail', [ 'is_location' => 1, "url" => route('location.show',$record->id), "username" => $record->name ])->render(),
                $record->address,
                $record->timezone,
                "<li>$record->coverage_start_time</li>" . "<li>$record->coverage_end_time</li>",
                $mainCategory . ' (' . $record->maintype->type . ")",
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('location.edit', $record->id)
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
        $data                 = array();
        $data['locationType'] = array();
        $data['title']        = 'Location';
        $locationType         = LocationType::where('parent_id', '!=', 0)->get()->toArray();
        $locationType2        = LocationType::where('id', 1)->get()->toArray();
        $datalocationType     = array_merge($locationType, $locationType2);
        foreach ($datalocationType as $item) {
            $parentName             = LocationType::find($item['parent_id']);
            $data['locationType'][] = [
                'id'   => $item['id'],
                'type' => !empty($parentName) ? $parentName->type . ' (' . $item['type'] . ")" : $item['type']
            ];
        }
        $data['timeZone'] = TimeZone::all();
        return view('admin.location.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'                => 'required',
            'address'             => 'required',
            'timezone_id'         => 'required',
            'coverage_start_time' => 'required',
            'coverage_end_time'   => 'required',
            'locationType_id'     => 'required',
        ]);

        $data                      = new Location();
        $data->name                = $request->name;
        $data->user_id             = $request->user()['id'];
        $data->address             = $request->address;
        $data->timezone_id         = $request->timezone_id;
        $data->license_number      = $request->license_number;
        $data->timezone            = TimeZone::find($request->timezone_id)['timezone'];
        $data->coverage_start_time = date('h:i:s', strtotime($request->coverage_start_time));
        $data->coverage_end_time   = date('h:i:s', strtotime($request->coverage_end_time));
        $data->location_type       = $request->locationType_id;
        $data->location_sub_type   = '';
        $data->save();

        if (!empty($request->client['client_name'])) {
            ClientLocation::create([
                'location_id'        => $data->id,
                'client_name'        => $request->client['client_name'],
                'client_designation' => $request->client['client_designation'],
                'client_email'       => $request->client['client_email'],
                'client_phone'       => $request->client['client_phone']
            ]);
        }
        if (!empty($request->monitor['number_of_camera'])) {
            MonitorLocation::create([
                'location_id'         => $data->id,
                'number_of_camera'    => $request->monitor['number_of_camera'],
                'camera_tower_number' => $request->monitor['camera_tower_number'],
                'nvr'                 => $request->monitor['nvr'],
            ]);
            $data->is_monitoring=1;
            $data->update();
        }
        return redirect()->route('location.index')->with('msg', 'Location Added Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data['activeMenu']='Location';
        $data['data']=Location::find($id);
        return view('admin.location.detail',$data);
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
