<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\PostUserRequest;
use App\Models\City;
use App\Models\Country;
use App\Models\Role;
use App\Models\State;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title']   = 'Users';
        $data['country'] = Country::all();
        $data['city']    = City::all();
        return view('admin.user.list', $data);
    }

    public function tableData(Request $request)
    {
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country                  = new User();
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
                $record->role->name,
                $record->city->name,
                $record->first_name,
                $record->last_name,
                $record->email,
                $record->phone1,
                $record->address,
                $record->dob,
                view('admin.layout.defaultComponent.profileImage', [ "url" => $record->image ])->render(),
//                date('d.m.Y H:i:s', strtotime($record->created_at)),
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('users.edit', $record->id)
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
        $data['title']   = 'User';
        $data['country'] = Country::all();
        $data['city']    = City::paginate(10);
        $data['state']   = State::all();
        $data['role']    = Role::where('is_active', 1)->get();
        return view('admin.user.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PostUserRequest $request)
    {
        $profile_image = '';
        if ($request->hasFile('image')) {
            $image     = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('uploads/user/'), $imageName);

            $profile_image = 'uploads/user' . $imageName;
        }
        $data                    = new User();
        $data['role_id']         = $request->role_id;
        $data['country_id']      = $request->country_name;
        $data['city_id']         = $request->city_name;
        $data['state_id']        = $request->state_id;
        $data['first_name']      = $request->first_name;
        $data['last_name']       = $request->last_name;
        $data['middle_name']     = $request->middle_name;
        $data['phone1']          = $request->phone1;
        $data['phone2']          = $request->phone2;
        $data['email']           = $request->email;
        $data['secondary_email'] = $request->secondary_email;
        $data['gender']          = $request->gender;
        $data['admin_approved']  = 1;
        $data['address']         = $request->address;
        $data['dob']             = $request->dob;
        $data['password']        = Hash::make($request->password);
        $data['image']           = $profile_image;
        $data->save();
        Session::flash('message', 'User Added successfully');
        return redirect(route('users.index'));
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

        $data['value']   = User::find($id);
        $data['title']   = 'User';
        $data['country'] = Country::all();
        $data['city']    = City::paginate(10);
        $data['state']   = State::all();
        $data['role']    = Role::where('is_active', 1)->get();
        return view('admin.user.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = User::find($id);
        if ($request->role_id) {
            $data['role_id'] = $request->role_id;
        }
        if ($request->country_name) {
            $data['country_id'] = $request->country_name;
        }
        if ($request->password) {
            $data['password'] = Hash::make($request->password);
        }
        if ($request->city_name) {
            $data['city_id'] = $request->city_name;
        }
        if ($request->state_id) {
            $data['state_id'] = $request->state_id;
        }
        if ($request->first_name) {
            $data['first_name'] = $request->first_name;
        }
        if ($request->last_name) {
            $data['last_name'] = $request->last_name;
        }
        if ($request->middle_name) {
            $data['middle_name'] = $request->middle_name;
        }
        if ($request->phone1) {
            $data['phone1'] = $request->phone1;
        }
        if ($request->phone2) {
            $data['phone2'] = $request->phone2;
        }
        if ($request->email) {
            $data['email'] = $request->email;
        }
        if ($request->secondary_email) {
            $data['secondary_email'] = $request->secondary_email;
        }
        if ($request->gender) {
            $data['gender'] = $request->gender;
        }
        if ($request->address) {
            $data['address'] = $request->address;
        }
        if ($request->dob) {
            $data['dob'] = $request->dob;
        }
        $data->save();
        Session::flash('msg', 'User Updated successfully');
        return redirect(route('users.index'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public
    function destroy(string $id)
    {
        //
    }
}
