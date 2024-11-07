<?php

namespace Database\Seeders;

use App\Models\Product;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    public function run()
    {
        // Instantiate Faker
        $faker = Faker::create();

        // Seed 30 mobile-related products
        foreach (range(1, 30) as $index) {
            $image = ""; // Placeholder image URL

            Product::create([
                'product_id' => 'P' . Str::random(6), // Random product_id (e.g., P8HX34)
                'name' => $faker->company . ' Mobile', // Mobile phone brand and model
                'description' => $faker->sentence(10), // Fake product description
                'price' => $faker->randomFloat(2, 100, 1000), // Price between $100 and $1000
                'stock' => $faker->randomNumber(3), // Random stock between 0 and 999
                'image' => $image, // Use the placeholder image
            ]);
        }

        // Optionally, you can also generate specific categories for mobile-related products
    }
}
