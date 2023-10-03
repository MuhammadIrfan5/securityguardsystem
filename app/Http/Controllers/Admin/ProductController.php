<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['activeMenu'] = 'Product';
        return view('admin.products.table', $data);
    }

    public function listData(Request $request)
    {
        $response = [
            "draw"            => $request->draw,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => [],
        ];
        $products = new Product();
        $response["recordsTotal"] = $products->count();
        $response["recordsFiltered"] = $products->count();
        /*Search function*/
        if (!empty($request->search["value"])) {
            $products = $products->where("title", "like", "%" . $request->search["value"] . "%");
            $products = $products->where("title", "unit", "%" . $request->search["value"] . "%");
            $products = $products->orWhere("created_at", "like", "%" . $request->search["value"] . "%");
        }
        /*ordering*/
//        $order = $request["order"][0]["column"];
//        $orderDir = $request["order"][0]["dir"];
//        switch ($order) {
//            case '0':
//                $products = $products->orderBy('id', $orderDir);
//                break;
//            case '1':
//                $products = $products->orderBy('title', $orderDir);
//                break;
//            case '2':
//                $products = $products->orderBy('image', $orderDir);
//                break;
//            case '3':
//                $products = $products->orderBy('status', $orderDir);
//                break;
//            case '4':
//                $products = $products->orderBy('created_at', $orderDir);
//                break;
//        }
        $products = $products->skip($request->start)->take($request->length)->get();
        foreach ($products as $record) {
            $response['data'][] = [
                '<input type="checkbox" class="checkbox" onclick="handleCheck(this)" value="' . $record->id . '">',
                $record->id,
                $record->title,
                $record->unit,
                date('d.m.Y H:i:s', strtotime($record->created_at)),
                view('admin.defaultComponents.editDelete', ["id" => $record->id])->render(),
            ];
        }
        return response($response, 201);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['activeMenu'] = 'Add Product';
        return view('admin.products.add', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => ['required', 'string', 'max:255'],
            'unit'  => ['required', 'string', 'max:255'],
        ]);

        $obj = new Product();

        $obj->title = $request->title;
        $obj->unit = $request->unit;
        $obj->save();


        return redirect()->route('products.index')->with('success', 'Added completed');
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
        $data['activeMenu'] = 'Edit Product';
        $data['value'] = Product::find($id);
        return view('admin.products.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => ['required', 'string', 'max:255'],
            'unit'  => ['required', 'string', 'max:255'],
        ]);
        $obj = Product::find($id);
        if (!empty($obj)) {
            if (!empty($request->title)) {
                $obj->title = $request->title;
            }
            if (!empty($request->unit)) {
                $obj->unit = $request->unit;
            }
            $obj->update();
        } else {
            return redirect()->route('products.index')->with('success', 'Data not found!');
        }

        return redirect()->route('products.index')->with('success', 'Added completed');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
