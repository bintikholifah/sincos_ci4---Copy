<?php

namespace App\Controllers;

// Binti Kholifah - 3121552804

class Home extends BaseController
{
    public function __construct()
    {
        helper('sn');
    }
    public function index()
    {
        $data = [
            'judul' => 'Sistem Informasi Peminjaman Coworking Space',
            'brand' => 'SInCos'
        ];

        tampilan('home/index', $data);
    }
}
