<?php

namespace Database\Factories;

use App\Models\Catalogs\Category;
use App\Models\Catalogs\Unit;
use App\Models\Catalogs\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => ucfirst($this->faker->unique()->word),
            'description' => $this->faker->sentence,
            'category_id' => Category::factory(),
            'unit_id' => Unit::factory(),
            'price' => $this->faker->randomFloat(2, 1, 1000),
            'cost' => $this->faker->randomFloat(2, 1, 1000),
            'image_path' => $this->faker->imageUrl(640, 480, 'products', true, 'Faker'),
            'stock' => $this->faker->numberBetween(0, 100),
            'status' => $this->faker->randomElement(['Y', 'N']),
        ];
    }
}
