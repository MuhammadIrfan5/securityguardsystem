<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Privilege;
use App\Models\User;
use App\Models\UserPrivilege;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PrivilegeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = "Privilege";
        return view('admin.privilege.list', $data);
    }

    public function tableData(Request $request)
    {
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country                  = new UserPrivilege();
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
                '<input type="checkbox" class="checkbox" onclick="handleCheck(this)" value="' . $record->id . '">',
                $record->name,
                view('admin.layout.defaultComponent.active', [ "boolean" => $record->is_active ])->render(),
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
        $data['activeMenu'] = 'Add Privilege';
        $data['users']      = User::where('role_id', '!=', 1)->get();
        $data['priviliges'] = Privilege::where('id', '!=', 1)->get();
        return view('pages.privilege.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $user  = array();
        $admin = User::find($request->user_id);
        foreach ($request->privilige_id as $item) {
            $check = UserPrivilege::where('user_id', $request->admin_id)
                ->where('privilege_id', $item)->first();
            if ($check == null) {
                $user[] = [
                    'privilege_id' => $item,
                    'user_id'      => $request->user_id,
                    'role_id'      => $admin['role_id'],
                    'assign_by'    => $request->user()['name'],
                ];
            }
        }
        $users = UserPrivilege::insert($user);
        Session::flash('msg', 'Permissions Given Successfully!');
        return redirect()->route('privilege.index');
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
        $UserPrivilege = UserPrivilege::find($id);
        $UserPrivilege->delete();
        Session::flash('msg', 'Permissions Deleted Successfully!');
        return redirect()->route('privilege.index');

    }
}
