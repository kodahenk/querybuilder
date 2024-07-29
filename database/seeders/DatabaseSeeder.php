<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use App\Models\Comment;
use App\Models\Like;
use App\Models\UserRole;
use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        // Create 10 users with passwords
        for ($i = 0; $i < 10; $i++) {
            User::create([
                'name' => $faker->name,
                'email' => $faker->unique()->safeEmail,
                'password' => bcrypt('password123') // Ensure you hash the password
            ]);
        }

        // Create 15 categories
        for ($i = 0; $i < 15; $i++) {
            Category::create([
                'name' => $faker->word
            ]);
        }

        // Create 10 user roles
        for ($i = 0; $i < 10; $i++) {
            UserRole::create([
                'role' => $faker->word
            ]);
        }

        // Create 50 tags
        for ($i = 0; $i < 50; $i++) {
            Tag::create([
                'name' => $faker->word
            ]);
        }

        // Create 200 posts
        $userIds = User::all()->pluck('id')->toArray();
        $categoryIds = Category::all()->pluck('id')->toArray();
        $tagIds = Tag::all()->pluck('id')->toArray();

        if (!empty($userIds) && !empty($categoryIds)) {
            for ($i = 0; $i < 200; $i++) {
                $post = Post::create([
                    'title' => $faker->sentence,
                    'content' => $faker->paragraph,
                    'user_id' => $faker->randomElement($userIds),
                    'category_id' => $faker->randomElement($categoryIds),
                ]);

                // Attach random tags to the post if there are tags available
                if (!empty($tagIds)) {
                    $post->tags()->attach($faker->randomElements($tagIds, $faker->numberBetween(1, 3)));
                }
            }
        }

        // Create 500 comments
        $postIds = Post::all()->pluck('id')->toArray();
        if (!empty($postIds)) {
            for ($i = 0; $i < 500; $i++) {
                Comment::create([
                    'content' => $faker->sentence,
                    'user_id' => $faker->randomElement($userIds),
                    'post_id' => $faker->randomElement($postIds),
                ]);
            }
        }

        // Create 300 likes
        if (!empty($postIds)) {
            for ($i = 0; $i < 300; $i++) {
                Like::create([
                    'user_id' => $faker->randomElement($userIds),
                    'post_id' => $faker->randomElement($postIds),
                ]);
            }
        }

        // Attach roles to users
        $roles = UserRole::all()->pluck('id')->toArray();
        if (!empty($roles)) {
            foreach ($userIds as $userId) {
                User::find($userId)->roles()->attach($faker->randomElements($roles, $faker->numberBetween(1, 3)));
            }
        }
    }
}
