<!-- Binti Kholifah - 3121552804 -->

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $judul; ?></h1>

    <?php if (session()->get('message')) : ?>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            Data ruangan berhasil <strong><?= session('message') ?></strong>
        </div>
    <?php endif; ?>

    <div class="row">
        <div class="col-md-6">
            <?php
            if (session()->get('err')) {
                echo "<div class='alert alert-danger' role='alert'>" . session()->get('err') . "</div>";
                session()->remove('err');
            }
            ?>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalTambah">
                <i class="fas fa-plus"> Tambah Ruangan</i>
            </button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>NO.</th>
                            <th>KODE TEMPAT</th>
                            <th>NAMA TEMPAT</th>
                            <th>KAPASITAS</th>
                            <th>AKSI</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php $i = 1; ?>
                        <?php foreach ($ruangan as $row) : ?>
                            <tr>
                                <td scope="row"><?= $i; ?></td>
                                <td><?= $row['kd_ruang']; ?></td>
                                <td><?= $row['nm_ruang']; ?></td>
                                <td><?= $row['kapasitas']; ?></td>
                                <td>
                                    <button type="button" data-toggle="modal" data-target="#modalUbah" id="btn-edit" class="btn btn-sm btn-warning" data-id="<?= $row['kd_ruang']; ?>" data-kd="<?= $row['kd_ruang']; ?>" data-nama="<?= $row['nm_ruang']; ?>" data-kps="<?= $row['kapasitas']; ?>"><i class="fas fa-edit"></i></button>
                                    <button type="button" data-toggle="modal" data-target="#modalHapus" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt" id="btn-hapus"></i></button>
                                </td>
                            </tr>
                            <?php $i++; ?>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Modal Tambah-->
<div class="modal fade" id="modalTambah">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah <?= $judul; ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('ruangan/tambah') ?>" method="post">
                    <div class="form-group mb-0" style="margin-top: -18px;">
                        <label for="kd_ruang"></label>
                        <input type="text" name="kd_ruang" id="kd_ruang" class="form-control" placeholder="Masukkan Kode Ruang">
                    </div>
                    <div class="form-group mb-0">
                        <label for="nm_ruang"></label>
                        <input type="text" name="nm_ruang" id="nm_ruang" class="form-control" placeholder="Masukkan Nama Ruang">
                    </div>
                    <div class="form-group mb-0">
                        <label for="kapasitas"></label>
                        <input type="text" name="kapasitas" id="kapasitas" class="form-control" placeholder="Masukkan Jumlah Kapasitas">
                    </div>
            </div>
            <div class="modal-footer">
                <button type="reset" name="reset" class="btn btn-secondary">Hapus</button>
                <button type="submit" name="simpan" class="btn btn-primary">Simpan</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Hapus Data Ruangan -->
<div class="modal fade" id="modalHapus">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                Apakah Anda yakin ingin menghapus data?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tidak</button>
                <a href="/ruangan/hapus/<?= $row['kd_ruang']; ?>" type="button" class="btn btn-primary">Yakin</a>
            </div>
        </div>
    </div>
</div>

<!-- Modal Ubah-->
<div class="modal fade" id="modalUbah">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ubah <?= $judul; ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('ruangan/ubah') ?>" method="post">
                    <input type="hidden" name="id" id="id-ruangan">
                    <div class="form-group mb-0" style="margin-top: -40px;">
                        <label type="hidden" for="kd_ruang"></label>
                        <input type="hidden" name="kd_ruang" id="kd_ruang" class="form-control" placeholder="Masukkan Kode Ruang" value="<?= $row['kd_ruang']; ?>">
                    </div>
                    <div class="form-group mb-0">
                        <label for="nm_ruang">Nama Tempat</label>
                        <input type="text" name="nm_ruang" id="nm_ruang" class="form-control" placeholder="Masukkan Nama Ruang" value="<?= $row['nm_ruang']; ?>">
                    </div>
                    <div class="form-group mb-0">
                        <label for="kapasitas">Kapasitas</label>
                        <input type="text" name="kapasitas" id="kapasitas" class="form-control" placeholder="Masukkan Jumlah Kapasitas" value="<?= $row['kapasitas']; ?>">
                    </div>
            </div>
            <div class="modal-footer">
                <button type="reset" name="reset" class="btn btn-secondary">Hapus</button>
                <button type="submit" name="ubah" class="btn btn-primary">Ubah</button>
            </div>
            </form>
        </div>
    </div>
</div>