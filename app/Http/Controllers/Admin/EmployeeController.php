<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\EmployeeCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['title'] = "Employee";
        return view('admin.employee.list', $data);
    }

    public function tableData(Request $request)
    {
        $response                 = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country                  = new Employee();
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
                view('Admin.layout.defaultComponent.linkDetail', [ 'is_location' => 1, "url" => route('employee.show', $record->id), "username" => $record->name ])->render(),
                $record->id_number,
                $record->phone_one,
                $record->expiry_date,
//                view('admin.layout.defaultComponent.status', [ "boolean" => $record->is_regular_guard ])->render(),
                view('admin.layout.defaultComponent.approved', [ "boolean" => $record->is_active ])->render(),
                view('admin.layout.defaultComponent.editButton', [
                    'editUrl' => route('employee.edit', $record->id)
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
        $data['title']      = 'Employee';
        $data['categories'] = EmployeeCategory::all();
        return view('admin.employee.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validate  = [
            'name'         => 'required|string',
            'id_number'    => 'required|unique:employees,id_number',
            'phone_one'    => 'required|string',
            'guard_number' => 'required|string',
            'issue_date'   => 'required|string',
            'expiry_date'  => 'required|string',
            'category_id'  => 'required|string',
            'pay_rate'     => 'required|string',
            'manager_name' => 'required|string',
            'notes'        => 'nullable|string',
        ];
        $validator = Validator::make($request->all(), $validate);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors());
        } else {
            $data = [
                'name'             => $request->name,
                'id_number'        => $request->id_number,
                'phone_one'        => $request->phone_one,
                'guard_number'     => $request->guard_number,
                'issue_date'       => $request->issue_date,
                'pay_rate'         => $request->pay_rate,
                'expiry_date'      => $request->expiry_date,
                'category_id'      => $request->category_id,
                'manager_name'     => $request->manager_name,
                'user_id'          => $request->user()['id'],
                'phone_two'        => !empty($request->phone_two) ? $request->phone_two : '',
                'notes'            => !empty($request->notes) ? $request->notes : '',
                'is_active'        => 0,

            ];
            $data = Employee::create($data);
            return redirect()->route('employee.index')->with('msg', $data->code . ' Employee Added Successfully!');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {

        $data['activeMenu'] = 'Employee';
        $data['data']       = Employee::find($id);
        return view('admin.employee.detail', $data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data['title']  = 'Employee';
        $data['categories'] = EmployeeCategory::all();
        $data['record'] = Employee::find($id);
        return view('admin.employee.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = Employee::find($id);
        if (!empty($request->name)) {
            $data->name = $request->name;
        }
        if (!empty($request->id_number)) {
            $data->id_number = $request->id_number;
        }
        if (!empty($request->category_id)) {
            $data->category_id = $request->category_id;
        }
        if (!empty($request->expiry_date)) {
            $data->expiry_date = $request->expiry_date;
        }
        if (!empty($request->phone_one)) {
            $data->phone_one = $request->phone_one;
        }
        if (!empty($request->phone_two)) {
            $data->phone_two = $request->phone_two;
        }
        if (!empty($request->notes)) {
            $data->notes = $request->notes;
        }
            $data->is_active = (int)$request->is_active;

        $data->save();

        Session::flash('message', 'Employee Updated successfully');
        return redirect(route('employee.index'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
