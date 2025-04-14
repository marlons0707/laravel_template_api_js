<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name', 150)->unique()->comment('Product name');
            $table->text('description')->nullable()->comment('Detailed product description');
            $table->foreignId('category_id')->constrained('categories')->onDelete('cascade')->comment('Category reference');
            $table->foreignId('unit_id')->constrained('units')->onDelete('cascade')->comment('Unit reference');
            $table->decimal('price', 10, 2)->default(0.00)->comment('Selling price');
            $table->decimal('cost', 10, 2)->default(0.00)->comment('Cost price');
            $table->string('image_path', 255)->nullable()->default(null)->comment('Path to the product image');
            $table->unsignedInteger('stock')->default(0)->comment('Available stock quantity');
            $table->enum('status', ['Y', 'N'])->default('Y')->comment('Product status: Y for active, N for inactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
