<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'active',
        'notifications'
    ];

    public function scopeFilter($query, $filtersArray)
    {
        if (!empty($filtersArray)) {
            $filtersArray = json_decode($filtersArray, true);

            foreach ($filtersArray as $key => $filter) {
                if ($filter['value'] != '') {
                    $query->where($filter['field'], '=', $filter['value']);
                }
            }
        }
    }

    public function scopeSearch($query, $term)
    {
        $term = "%$term%";
        $query->where(function($query) use ($term) {
            $query->where('email', 'LIKE', $term)
                  ->orWhere('name', 'LIKE', $term);
        });
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
