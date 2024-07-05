<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Image;
class Post extends Model
{
    use HasFactory;
    protected $fillable=[
        'product_name',
        'product_price',
        'product_desccription',
    ];

    public function images(){
        return $this->hasMany(Image::class);
    }

}
