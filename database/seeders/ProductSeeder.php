<?php

namespace Database\Seeders;

use App\Models\Catalogs\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Product::factory(20)->create();
    }
}
