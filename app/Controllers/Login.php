<?php

namespace App\Controllers;

// Binti Kholifah - 3121552804

use CodeIgniter\Controller;
use App\Models\M_Login;
use Config\Services;

class Login extends BaseController
{
    public function __construct()
    {
        helper('sn');
    }

    public function index()
    {
        echo view('v_login');
    }
}
