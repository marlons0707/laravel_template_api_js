<?php

namespace Database\Seeders;

use App\Models\Catalogs\Unit;
use Illuminate\Database\Seeder;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Unit::factory(10)->create();
    }
}
