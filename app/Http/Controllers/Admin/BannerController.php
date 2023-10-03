<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Session;

class BannerController extends Controller
{
    public function index(){
        return view('admin.banner.bannerTable');
    }
    public function tableBanner(Request $request)
    {

        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $banners = new Banner();
        $response["recordsTotal"] = $banners->count();
//
//        if (!empty($request->startDate)) {
//            $banners = $banners->whereDate('start_date','>=', $request->startDate. ' 00:00:00');
//        }
//        if (!empty($request->endDate)) {
//            $banners = $banners->whereDate('end_date','<=', $request->endDate.' 23:59:59');
//        }
//        if (!empty($request->booker_id)) {
//            $banners = $banners->where('booker_id', $request->booker_id);
//        }


        /*Sorting*/
        switch ('id') {
            case 'id':
                $banners = $banners->orderBy('id', 'desc');
                break;
            default:
                break;
        }


        /*Search function*/
        if (!empty($request->search["value"])) {
            $banners = $banners->where("id", "like", "%" . $request->search["value"] . "%");
            $banners = $banners->orWhere("name", "like", "%" . $request->search["value"] . "%");
            $banners = $banners->orWhere("image", "like", "%" . $request->search["value"] . "%");
            $banners = $banners->orWhere("is_allowed", "like", "%" . $request->search["value"] . "%");
            $banners = $banners->orWhere("created_at", "like", "%" . $request->search["value"] . "%");
        }
        $response["recordsFiltered"] = $banners->count();
        /*ordering*/
//        $order = $request["order"][0]["column"]??0;
//        $orderDir = $request["order"][0]["dir"]??"desc";
//        switch ($order) {
//            case '0':
//                $banners = $banners->orderBy('id', $orderDir);
//                break;
//            case '1':
//                $banners = $banners->orderBy('booker_id', $orderDir);
//                break;
//            case '2':
//                $banners = $banners->orderBy('start_date', $orderDir);
//                break;
//            case '3':
//                $banners = $banners->orderBy('end_date', $orderDir);
//                break;
//            case '4':
//                $banners = $banners->orderBy('target', $orderDir);
//                break;
//            case '5':
//                $banners = $banners->orderBy('achieved', $orderDir);
//                break;
//            case '5':
//                $banners = $banners->orderBy('created_at', $orderDir);
//                break;
//        }
        $banners = $banners->skip($request->start)->take($request->length)->get();
        foreach ($banners as $record) {
            $response['data'][] = [
                '<input type="checkbox" class="checkbox" onclick="handleCheck(this)" value="'.$record->id.'">',
                $record->name,
                view('admin.defaultComponents.banner',["banner"=>$record->image])->render(),
//                '<img src="'.$record->image.'" style="border-radius:2px;height: 70px;" class="img-preview"/>',
                view('admin.defaultComponents.allowed',["allowed"=>$record->is_allowed])->render(),
                $record->created_at->format('M d, Y'),
                view('admin.defaultComponents.editViewDelete', [
                    'deleteUrl' => route('BannerDelete', ['id' => $record->id])
                ])->render()
            ];
        }
        return response($response, 201);
    }

    public function BannerCreate (Request $request)
    {
        $banner = new Banner();

        if ($request->file('banner')) {
            $file = $request->file('banner');
            $timestamp = str_replace([' ', ':'], '-', Carbon::now()->toDateTimeString());
            $image = $timestamp . '-' . str_replace([' ', ':'], '-', $file->getClientOriginalName());
            $file->move(public_path('/Banners/'), $image);
            $image_url = url('/Banners') . '/' . $image;
        }

        $banner->name = $request->title;
        $banner->image = $image_url ?? '';
        $notification = $banner->save();
        Session::flash('message', 'Banner Added successfully');
        return redirect(route('Banner'));
    }


    public function deleteBanner(Request $request)
    {
        $booker = Banner::find($request->id);
        $booker->delete();
        Session::flash('info', 'Banner deleted successfully');
        return redirect()->route('Banner');
    }

    public function PDF(Request $request)
    {

//        $filter = json_decode($request, true);
        $banners = new Banner();
//        if (!empty($filter['booker_id'])) {
//            $bookers = $bookers->where('id', $filter['booker_id']);
//        }
//        if (!empty($filter['startDate'])) {
//            $bookers = $bookers->whereDate('created_at', '>=', $filter['startDate'] . ' 00:00:00');
//        }
//        if (!empty($filter['endDate'])) {
//            $bookers = $bookers->whereDate('created_at', '<=', $filter['endDate'] . ' 23:59:59');
//        }
//        if (!empty($filter['region'])) {
//            $bookers = $bookers->where('region', "like", "%" . $filter['region'] . "%");
//        }
//        if (!empty($filter['job_status'])) {
//            $bookers = $bookers->where('job_status', $filter['job_status']);
//        }
        $data['banners'] = $banners->get();
        $pdf = PDF::loadView('admin.banner.export', $data)->setPaper('A4', "landscape");
        return $pdf->download('SOS-Banners ('. \Carbon\Carbon::now()->format('d F Y').').pdf');

//        return Excel::download(new AdvanceSalary(), 'invoices.pdf', \Maatwebsite\Excel\Excel::MPDF);
    }

}
