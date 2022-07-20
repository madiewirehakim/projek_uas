<?php
// session_start();
// if ($_SESSION['status'] != "sudah_login") {
// //melakukan pengalihan
// header("location:../login/login.php");
// }
include "../layout/header.php";
include "../config/koneksi.php";
$id = $_GET['id'];
$query = mysqli_query($koneksi, "SELECT * FROM tb_registrasi where id_registrasi=$id");
$rs = mysqli_fetch_assoc($query);
?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

        <h1 class="h2">Form Ubah Registrasi</h1>
    </div>
<!-- <canvas class="my-4 w-100" id="myChart" width="900" height="380">
</canvas> -->
<!-- <h4>Data Jadwal Kegiatan</h4> -->
    <div class="table-responsive">
        <form action="simpan_ubah_registrasi.php" method="POST">
            <div class="col-6">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nama Lengkap</label>
                    <input class="form-control" name="nama_lengkap" value="<?= $rs['nama_lengkap']; ?>">
                    <input type="hidden" name="id_registrasi" value="<?= $rs['id_registrasi']; ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nik</label>
                    <input class="form-control" name="nik" value="<?= $rs['nik']; ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Jenis Kelamin</label>
                    <input type="radio" name="jenis_kelamin" value="perempuan">Perempuan
                <input type="radio" name="jenis_kelamin" value="laki-laki">Laki-Laki
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">No tlp</label>
                    <input class="form-control" name="no_tlp" value="<?= $rs['no_tlp']; ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Alamat</label>
                    <input class="form-control" name="alamat" value="<?= $rs['alamat']; ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Username</label>
                    <input class="form-control" name="username" value="<?= $rs['username']; ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Password</label>
                    <input class="form-control" name="password" value="<?= $rs['password']; ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Created At</label>
                    <input class="form-control" name="created_at" value="<?= $rs['created_at']; ?>">
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-sm btn-primary">Simpan</button>
                </div>
            </div>
        </form>
    </div>
</main>
<?php
include "../layout/footer.php";