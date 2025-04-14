<?php

namespace App\Models\Catalogs;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Database\Factories\ProductFactory;


class Product extends Model
{
    use HasFactory;
    
    protected static function newFactory()
    {
        return ProductFactory::new();
    }

    protected $fillable = [
        'name',
        'description',
        'unit_id',
        'category_id',
        'price',
        'cost',
        'image_path',
        'stock',
        'status',
    ];

    public function scopeFilter($query, $filtersArray)
    {
        if (!empty($filtersArray)) {
            $filtersArray = json_decode($filtersArray, true);

            foreach ($filtersArray as $key => $filter) {
                if ($filter['value'] != '') {
                    $query->where($filter['field'], '=', $filter['value']);
                }
            }
        }
    }

    public function scopeSearch($query, $term)
    {
        $term = "%$term%";
        $query->where(function($query) use ($term) {
            $query->where('name', 'LIKE', $term);
        });
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }
}
