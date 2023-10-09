<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Session;

class CountryController extends Controller
{
    public function index()
    {
        return view('admin.country.country');
    }

    public function tableCountry(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $country = new Country();
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
                view('admin.defaultComponents.binaryStatusWithValue', ["status" => $record->status])->render(),
                view('admin.defaultComponents.editViewDelete', [
                    'deleteUrl' => route('deleteCountry', ['id' => $record->id])
                ])->render()
            ];
        }
        return response($response, 201);
    }

    public function createCountry(Request $request)
    {
        $country = new Country();
        $country['name'] = $request->name;
        $country['iso2'] = '';
        $country['iso3'] = '';
        $country['phone_code'] = '';
        $country['dialling_pattern'] = '';
        $country['region'] = '';
        $country['sub_region'] = '';
        $country['status'] = 'pending';
        $country->save();
        Session::flash('message', 'Country Added successfully');
        return redirect(route('Country'));
    }

    public function destroy(string $id)
    {
        $customer = Country::find($id);
        $customer->delete();
        Session::flash('info', 'Country deleted successfully');
        return redirect()->route('Country');
    }

}
