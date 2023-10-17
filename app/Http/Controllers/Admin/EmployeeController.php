<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
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
                '<input type="checkbox" class="checkbox" onclick="handleCheck(this)" value="' . $record->id . '">',
                $record->name,
                $record->id_number,
                $record->phone_one,
                $record->phone_two,
                view('Admin.layout.defaultComponent.status', [ "boolean" => $record->is_regular_guard ])->render(),
                $record->notes,
                view('Admin.layout.defaultComponent.editButton', [
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
        $data['title'] = 'Employee';
        return view('admin.employee.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validate  = [
            'name'      => 'required|string',
            'id_number' => 'required|unique:employees,id_number',
            'phone_one' => 'required|string',
            'notes'     => 'nullable|string',
        ];
        $validator = Validator::make($request->all(), $validate);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors());
        } else {
            $data = [
                'name'             => $request->name,
                'id_number'        => $request->id_number,
                'phone_one'        => $request->phone_one,
                'user_id'          => $request->user()['id'],
                'phone_two'        => !empty($request->phone_two) ? $request->phone_two : '',
                'notes'            => !empty($request->notes) ? $request->notes : '',
                'is_regular_guard' => $request['is_regular_guard'] == 1 ? 1 : 0,
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data['title'] = 'Employee';
        $data['record']=Employee::find($id);
        return view('admin.employee.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data=Employee::find($id);
        if(!empty($request->name)){
            $data->name=$request->name;
        }
        if(!empty($request->id_number)){
            $data->id_number=$request->id_number;
        }
        if(!empty($request->phone_one)){
            $data->phone_one=$request->phone_one;
        }
        if(!empty($request->phone_two)){
            $data->phone_two=$request->phone_two;
        }
        if(!empty($request->notes)){
            $data->notes=$request->notes;
        }
        if(!empty($request->is_regular_guard)){
            $data->is_regular_guard=(int)$request->is_regular_guard;
        }
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
