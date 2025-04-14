<?php

namespace App\Http\Controllers\API\Catalogs;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Catalogs\Product;
use App\Http\Resources\Catalogs\ProductResource;
// use App\Models\Transactions\Transaction;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ProductController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $perPage = request('perPage', 10);
        $searchParam = request('query', '');
        $sortField = request('sortField', 'id');
        $sortDirection = request('sortDesc', 'asc');
        $filtersArray = request('filters', []);

        $products = Product::filter($filtersArray)->search(trim($searchParam))->orderBy($sortField, $sortDirection)->paginate($perPage);
        return ProductResource::collection($products);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        // validar request
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'nullable',
            'price' => 'required|numeric',
            'cost' => 'required|numeric',
            'stock' => 'required|numeric',
            'category_id' => 'required|numeric',
            'unit_id' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return $this->handleError($validator->errors());
        }

        DB::beginTransaction();
        try {
            // guardar producto
            $product = Product::create($request->all());

            /* if ($request->stock > 0) {
                // guardar stock por tienda
                $product->stocks()->create([
                    'stock' => $request->stock,
                    'store_id' => auth()->user()->store_id,
                    'product_id' => $product->id,
                ]);

                // guardar en "transactions"
                Transaction::create([
                    'type' => 'initial',
                    'quantity' => $request->stock,
                    'store_id' => auth()->user()->store_id,
                    'product_id' => $product->id,
                    'user_id' => auth()->user()->id,
                ]);
            } */

            DB::commit();
            return $this->handleResponse(new ProductResource($product));

        } catch (QueryException $e) {
            DB::rollback();
            return $this->handleError($e);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return new ProductResource($product);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|unique:products,name,'.$product->id,
            'category_id' => 'required',
            'unit_id' => 'required',
            'price' => 'required',
            'cost' => 'required',
            'status' => 'required|string|max:1',
        ]);

        if ($validator->fails()) {
            return $this->handleError($validator->errors());       
        }
        
        $product->update($request->all());
        return $this->handleResponse(new ProductResource($product), 'Producto actualizado exitosamente.', 202);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        // Si el producto tiene stock, no se puede eliminar
        if ($product->stocks()->where('stock', '>', 0)->count() > 0) {
            return $this->handleError('No se puede eliminar un producto que tenga stock.');
        }
        /* // Si el producto tiene transacciones, no se puede eliminar
        else if ($product->transactions()->count() > 0) {
            return $this->handleError('No se puede eliminar un producto que tenga transacciones.');
        } */
        else {
            try {
                $product->delete();
                return $this->handleResponse(new ProductResource($product), 'Producto eliminado exitosamente.', 202);
            } catch (QueryException $e) {
                return $this->handleError($e->errorInfo);
            }
        }
    }
}
