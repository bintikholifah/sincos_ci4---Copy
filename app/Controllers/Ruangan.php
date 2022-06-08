<?php

namespace App\Controllers;

// Binti Kholifah - 3121552804

use CodeIgniter\Controller;
use App\Models\M_Ruangan;
use Config\Services;

class Ruangan extends Controller
{
    public function __construct()
    {
        $this->model = new M_Ruangan;
        helper('sn');
        $this->input = Services::request();
    }
    public function index()
    {
        $data = [
            'judul' => 'Data Ruangan Coworking Space',
            'brand' => 'SInCos',
            'ruangan' => $this->model->getAllData()
        ];
        // Load View
        tampilan('ruangan/index', $data);
    }
    public function tambah()
    {
        if (isset($_POST['simpan'])) {
            $val = $this->validate([
                'kd_ruang' => [
                    'label' => 'Kode Ruangan',
                    'rules' => 'required|is_unique[tb_ruang.kd_ruang]'
                ],
                'nm_ruang' => [
                    'label' => 'Nama Ruangan',
                    'rules' => 'required'
                ],
                'kapasitas' => [
                    'label' => 'Kapasitas',
                    'rules' => 'required|numeric'
                ]
            ]);

            if (!$val) {
                session()->setFlashdata('err', \Config\Services::validation()->listErrors());

                $data = [
                    'judul' => 'Data Ruangan Coworking Space',
                    'brand' => 'SInCos',
                    'ruangan' => $this->model->getAllData()
                ];

                // Load View
                tampilan('ruangan/index', $data);
            } else {
                $data = [
                    'kd_ruang' => $this->input->getPost('kd_ruang'),
                    'nm_ruang' => $this->input->getPost('nm_ruang'),
                    'kapasitas' => $this->input->getPost('kapasitas')
                ];

                // Insert Data
                $success = $this->model->tambah($data);
                if ($success) {
                    session()->setFlashdata('message', 'ditambahkan');
                    return redirect()->to('/ruangan');
                }
            }
        } else {
            return redirect()->to('/ruangan');
        }
    }

    public function hapus($id)
    {
        $success = $this->model->hapus($id);
        if ($success) {
            session()->setFlashdata('message', 'dihapus');
            return redirect()->to('/ruangan');
        }
    }

    public function ubah()
    {
        if (isset($_POST['ubah'])) {
            $id = $this->input->getPost('kd_ruang');
            $kode = $this->input->getPost('kd_ruang');
            $db_kode = $this->model->getAllData($id)['kd_ruang'];
            // $nama = $this->input->getPost('nm_ruang');
            // $kapasitas = $this->input->getPost('kapasitas');

            if ($kode === $db_kode) {
                $val = $this->validate([
                    'kd_ruang' => [
                        'label' => 'Kode Ruangan',
                        'rules' => 'required'
                    ],
                    'nm_ruang' => [
                        'label' => 'Nama Ruangan',
                        'rules' => 'required'
                    ],
                    'kapasitas' => [
                        'label' => 'Kapasitas',
                        'rules' => 'required|numeric'
                    ]
                ]);
            } else {
                $val = $this->validate([
                    'kd_ruang' => [
                        'label' => 'Kode Ruangan',
                        'rules' => 'required|is_unique[tb_ruang.kd_ruang]'
                    ],
                    'nm_ruang' => [
                        'label' => 'Nama Ruangan',
                        'rules' => 'required'
                    ],
                    'kapasitas' => [
                        'label' => 'Kapasitas',
                        'rules' => 'required|numeric'
                    ]
                ]);
            }

            // var_dump($db_kode);
            // die;

            if (!$val) {
                session()->setFlashdata('err', \Config\Services::validation()->listErrors());

                $data = [
                    'judul' => 'Data Ruangan Coworking Space',
                    'brand' => 'SInCos',
                    'ruangan' => $this->model->getAllData()
                ];

                // Load View
                tampilan('ruangan/index', $data);
            } else {
                $id = $this->input->getPost('kd_ruang');

                $data = [
                    'kd_ruang' => $this->input->getPost('kd_ruang'),
                    'nm_ruang' => $this->input->getPost('nm_ruang'),
                    'kapasitas' => $this->input->getPost('kapasitas')
                ];

                // Update Data
                $success = $this->model->ubah($data, $id);
                if ($success) {
                    session()->setFlashdata('message', 'diubah');
                    return redirect()->to('/ruangan');
                }
            }
        } else {
            return redirect()->to('/ruangan');
        }
    }
}
