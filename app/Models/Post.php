<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = ['id', 'title'];


    public function post_tags()
    {
        return $this->hasMany(PostTag::class, 'post_id', 'id');
    }
}
