<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Category;
use App\Models\Post;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Create some users with passwords
        User::create([
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'password' => bcrypt('password123') // Ensure you hash the password
        ]);

        User::create([
            'name' => 'Jane Doe',
            'email' => 'jane@example.com',
            'password' => bcrypt('password123') // Ensure you hash the password
        ]);

        // Create some categories
        Category::create(['name' => 'Technology']);
        Category::create(['name' => 'Lifestyle']);

        // Create some posts
        Post::create([
            'title' => 'First Post',
            'content' => 'This is the content of the first post.',
            'user_id' => 1,
            'category_id' => 1,
        ]);

        Post::create([
            'title' => 'Second Post',
            'content' => 'This is the content of the second post.',
            'user_id' => 2,
            'category_id' => 2,
        ]);

        Post::create([
            'title' => 'Third Post',
            'content' => 'This is the content of the third post.',
            'user_id' => 1,
            'category_id' => 1,
        ]);

        Post::create([
            'title' => 'Fourth Post',
            'content' => 'This is the content of the fourth post.',
            'user_id' => 2,
            'category_id' => 2,
        ]);

        Post::create([
            'title' => 'Fifth Post',
            'content' => 'This is the content of the fifth post.',
            'user_id' => 1,
            'category_id' => 1,
        ]);

        Post::create([
            'title' => 'Sixth Post',
            'content' => 'This is the content of the sixth post.',
            'user_id' => 2,
            'category_id' => 2,
        ]);

        Post::create([
            'title' => 'Seventh Post',
            'content' => 'This is the content of the seventh post.',
            'user_id' => 1,
            'category_id' => 1,
        ]);
    }
}
