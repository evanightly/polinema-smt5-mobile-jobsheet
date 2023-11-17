<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    use HasFactory;

    // Mendefinisikan nama table yang digunakan
    protected $fillable = [
        'nama',
        'email',
        'password',
        'kelas',
        'jurusan',
        'alamat',
        'no_telp',
    ];
}
