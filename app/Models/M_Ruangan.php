<?php

namespace App\Models;

// Binti Kholifah - 3121552804

use CodeIgniter\Model;

class M_Ruangan extends Model
{
    protected $table = 'tb_ruang';

    public function __construct()
    {
        $this->db = db_connect();
        $this->builder = $this->db->table($this->table);
    }

    public function getAllData($id = null)
    {
        if ($id == null) {
            return $this->builder->get()->getResultArray();
        } else {
            $this->builder->where('kd_ruang', $id);
            return $this->builder->get()->getRowArray();
        }
    }


    public function getDataById($id)
    {
    }

    public function tambah($data)
    {
        return $this->builder->insert($data);
    }

    public function hapus($id)
    {
        return $this->builder->delete(['kd_ruang' => $id]);
    }

    public function ubah($data, $id)
    {
        return $this->builder->update($data, ['kd_ruang' => $id]);
    }
}
