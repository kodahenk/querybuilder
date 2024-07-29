<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class UserRole extends Model
{
    protected $fillable = ['role'];

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }
}
