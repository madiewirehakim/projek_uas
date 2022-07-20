<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
//melakukan pengalihan
header("location:../login/login.php");
}
include "../config/koneksi.php";

$nama_barang = $_POST['nama_barang'];
//$jumlah_barang = $_POST['jumlah_barang'];
$created_at = $_POST['created_at'];
$barang = $_POST['id_barang'];

$insert_data = mysqli_query($koneksi, "INSERT INTO tb_barang (nama_barang,jumlah_barang,created_at,id_barang)
 Values ('$nama_barang','$jumlah_barang','$created_at','$barang')");

//if ($insert_data) {
    header('location:data_barang.php?pesan=Data Berhasil Di simpan');
//} else {
    //header('location:data_barang.php?pesan=Data Gagal Di simpan');
    echo ("ERROR" . mysqli_error($koneksi));
//}
?>