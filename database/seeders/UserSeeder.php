<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::factory(10)->create();

        DB::table('users')->insert([
            [
                'name' => 'Marlon Saravia',
                'user' => 'marlons',
                'email' => 'marlons0707@gmail.com',
                'email_verified_at' => now(),
                'role' => 'admin',
                'notifications' => 'Y',
                'password' => bcrypt('12345'),
                'remember_token' => Str::random(10),
                'active' => 'Y',
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}
