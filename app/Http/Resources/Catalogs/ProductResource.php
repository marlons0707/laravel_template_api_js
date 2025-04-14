<?php

namespace App\Http\Resources\Catalogs;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Catalogs\Unit;
use App\Models\Catalogs\Category;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'unit_id' => $this->unit_id,
            'unit' => Unit::find($this->unit_id)->name,
            'category_id' => $this->category_id,
            'category' => Category::find($this->category_id)->name,
            'description' => $this->description,
            'price' => $this->price,
            'cost' => $this->cost,
            'stock' => $this->stock,
            'image_path' => $this->image,
            'status' => $this->status,
            'created_at' => $this->created_at->format('d/m/Y h:i:s'),
            'updated_at' => $this->updated_at->format('d/m/Y h:i:s'),
        ];
    }
}
