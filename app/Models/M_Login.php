<?php

namespace App\Models;

use CodeIgniter\Model;

class M_Login extends Model
{
    public function cek_login($username, $password)
    {
        return $this->db->table('tb_admin')
            ->where(array('user' => $username, 'pass' => $password))
            ->get()->getRowArray();
    }
}
