<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ClientLocation;
use App\Models\Location;
use App\Models\LocationType;
use App\Models\MonitorLocation;
use App\Models\TimeZone;
use App\Models\User;
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
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country = new Location();
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
        if ($request->user()['role_id'] != 1) {
            $country = $country->where('user_id', $request->user()['id']);
        }
        $country = $country->skip($request->start)->take($request->length)->get();
        foreach ($country as $record) {
            $mainCategory = '';
            if ($record->maintype->parent_id != 0) {
                $mainCategory = LocationType::find($record->maintype->parent_id)['type'];
            }
            $schedules = array();
            if ($record->schedule_list) {
                foreach (json_decode($record->schedule_list) as $item) {
                    $schedules[] = [
                        "<li>$item->day</li>" .
                        "<li>$item->start_time</li>" .
                        "<li>$item->end_time</li>"
                    ];
                }
            }

            $response['data'][] = [
                $record->id,
                view('admin.layout.defaultComponent.linkDetail', ['is_location' => 1, "url" => route('location.show', $record->id), "username" => $record->name])->render(),
                $record->address,
                $record->timezone,
                $schedules,
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
        $data = array();
        $data['locationType'] = array();
        $data['title'] = 'Location';
        $data['users'] = User::where('role_id', 3)->get();
        $locationType = LocationType::where('parent_id', '!=', 0)->get()->toArray();
        $locationType2 = LocationType::where('id', 1)->get()->toArray();
        $datalocationType = array_merge($locationType, $locationType2);
        foreach ($datalocationType as $item) {
            $parentName = LocationType::find($item['parent_id']);
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
            'name'            => 'required',
            'address'         => 'required',
            'timezone_id'     => 'required',
            'user_id'         => 'required|not_in:0',
            'locationType_id' => 'required',
        ]);

        $start_time = array_filter($request->start_time);
        $start_time = array_values($start_time);
        $end_time = array_filter($request->end_time);
        $end_time = array_values($end_time);
        foreach (\request()->days as $key => $day) {
            $schedules[] = [
                'day'        => $day,
                'start_time' => $start_time[$key],
                'end_time'   => $end_time[$key],
            ];
        }

        $data = new Location();
        $data->name = $request->name;
        $data->user_id = $request->user_id;
        $data->address = $request->address;
        $data->timezone_id = $request->timezone_id;
        $data->license_number = $request->license_number;
        $data->timezone = TimeZone::find($request->timezone_id)['timezone'];
        $data->coverage_start_time = date('h:i:s', strtotime($request->coverage_start_time));
        $data->coverage_end_time = date('h:i:s', strtotime($request->coverage_end_time));
        $data->location_type = $request->locationType_id;
        $data->location_sub_type = '';
        $data->schedule_list = json_encode($schedules);
        $data->save();

        $clientLocation = array();
        $count = 0;
        foreach ($request->client as $key => $item) {
            if (count($request->client['client_name']) >= $count + 1) {
                $clientLocation[] = [
                    'location_id'        => $data->id,
                    'client_name'        => $request->client['client_name'][$count],
                    'client_designation' => $request->client['client_designation'][$count],
                    'client_email'       => $request->client['client_email'][$count],
                    'client_phone'       => $request->client['client_phone'][$count]
                ];
            }
            $count++;
        }
        ClientLocation::insert($clientLocation);

        if (!empty($request->monitor['number_of_camera'])) {
            MonitorLocation::create([
                'location_id'         => $data->id,
                'number_of_camera'    => $request->monitor['number_of_camera'],
                'camera_tower_number' => $request->monitor['camera_tower_number'],
                'nvr'                 => $request->monitor['nvr'],
            ]);
            $data->is_monitoring = 1;
            $data->update();
        }
        return redirect()->route('location.index')->with('msg', 'Location Added Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data['activeMenu'] = 'Location';
        $data['data'] = Location::find($id);
        return view('admin.location.detail', $data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data = array();
        $location = Location::find($id);
        $data['locationType'] = array();
        $data['title'] = 'Location';
        $data['users'] = User::where('role_id', 3)->get();
        $locationType = LocationType::where('parent_id', '!=', 0)->get()->toArray();
        $locationType2 = LocationType::where('id', 1)->get()->toArray();
        $datalocationType = array_merge($locationType, $locationType2);
        foreach ($datalocationType as $item) {
            $parentName = LocationType::find($item['parent_id']);
            $data['locationType'][] = [
                'id'   => $item['id'],
                'type' => !empty($parentName) ? $parentName->type . ' (' . $item['type'] . ")" : $item['type']
            ];
        }
        $selectedDays = array();
        $selectedStartTime = array();
        $selectedEndTime = array();
        foreach (json_decode($location->schedule_list) as $item) {
            array_push($selectedDays, $item->day);
            array_push($selectedStartTime, $item->start_time);
            array_push($selectedEndTime, $item->end_time);
        }
        $data['selectedDays'] = $selectedDays;
        $data['selectedStartTime'] = $selectedStartTime;
        $data['selectedEndTime'] = $selectedEndTime;
        $data['data'] = $location;
        $data['timeZone'] = TimeZone::all();
        return view('admin.location.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
//        dd($request->all());
        $request->validate([
            'name'            => 'nullable',
            'address'         => 'nullable',
            'timezone_id'     => 'nullable',
            'user_id'         => 'nullable|not_in:0',
            'locationType_id' => 'nullable',
        ]);

        $start_time = array_filter($request->start_time);
        $start_time = array_values($start_time);
        $end_time = array_filter($request->end_time);
        $end_time = array_values($end_time);
        foreach (\request()->days as $key => $day) {
            $schedules[] = [
                'day'        => $day,
                'start_time' => $start_time[$key],
                'end_time'   => $end_time[$key],
            ];
        }
        $data = Location::find($id);
        $data->name = $request->name;
        $data->address = $request->address;
        $data->timezone_id = $request->timezone_id;
        $data->license_number = $request->license_number;
        $data->timezone = TimeZone::find($request->timezone_id)['timezone'];
        $data->coverage_start_time = date('h:i:s', strtotime($request->coverage_start_time));
        $data->coverage_end_time = date('h:i:s', strtotime($request->coverage_end_time));
        $data->location_type = $request->locationType_id;
        $data->location_sub_type = '';
        $data->schedule_list = json_encode($schedules);
        $data->save();

//        $clientLocation = array();
//        $count = 0;
//        foreach ($request->client as $key => $item) {
//            if (count($request->client['client_name']) >= $count + 1) {
//                $clientLocation[] = [
//                    'location_id'        => $data->id,
//                    'client_name'        => $request->client['client_name'][$count],
//                    'client_designation' => $request->client['client_designation'][$count],
//                    'client_email'       => $request->client['client_email'][$count],
//                    'client_phone'       => $request->client['client_phone'][$count]
//                ];
//            }
//            $count++;
//        }
//        dd($request->client,$clientLocation);
//        ClientLocation::insert($clientLocation);

        if (!empty($request->monitor['number_of_camera'])) {
            MonitorLocation::create([
                'location_id'         => $data->id,
                'number_of_camera'    => $request->monitor['number_of_camera'],
                'camera_tower_number' => $request->monitor['camera_tower_number'],
                'nvr'                 => $request->monitor['nvr'],
            ]);
            $data->is_monitoring = 1;
            $data->update();
        }
        return redirect()->route('location.index')->with('msg', 'Location updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
