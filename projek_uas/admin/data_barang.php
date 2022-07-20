<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
//melakukan pengalihan
header("location:../login/login.php");
}
include "../layout/header.php";
include "../config/koneksi.php";
$sql = mysqli_query($koneksi, "SELECT * FROM tb_barang");
?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
   <h1 class="h2">Data Barang</h1>
</div>
<?php if (isset($_GET['pesan'])) : ?>
    <div class="alert alert-success" role="alert">
       <?php echo $_GET['pesan']; ?>
    </div>
<?php endif; ?>
<a href="frm_tambah_barang.php" class="btn btn-sm btn-primary">Tambah Data</button></a>
<br> <br>
<div class="table-responsive">
    <table class="table table-striped table-bordered display nowrap"id="example" style="width:100%">
        <thead class="table-light">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Id</th>
                <th scope="col">nama barang</th>
                <th scope="col">Jumlah Barang</th>
                <th scope="col">Created At</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $no = 1;
        while ($rs = mysqli_fetch_array($sql)) : ?>
            <tr>
                <td><?= $no; ?></td>
                <td><?= $rs['id_pemasuk']; ?></td>
                <td><?= $rs['nama_barang']; ?></td>
                <td><?= $rs['jumlah_barang']; ?></td>
                <td><?= $rs['created_at']; ?></td>
                <td>
                    <a href="ubah_barang.php?id=<?= $rs['id_barang']; ?>" class=" btn btn-primary btn-sm">Ubah</a>
                    <a href="hapus_barang.php?id=<?= $rs['id_barang']; ?>" class=" btn btn-danger btn-sm">Hapus</a>
                </td>
            </tr>
        <?php
        $no++;
        endwhile;
        ?>
        </tbody>
    </table>
</div>
</main>
<?php
include "../layout/footer.php";
?>