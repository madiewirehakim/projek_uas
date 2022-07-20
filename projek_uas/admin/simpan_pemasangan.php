<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
//melakukan pengalihan
header("location:../login/login.php");
}
include "../config/koneksi.php";
$nama_barang = $_POST['nama_barang'];
//$tgl_bayar = $_POST['tgl_bayar'];


//$insert_data = mysqli_query($koneksi, "INSERT INTO tb_barang (nama_barang,jumlah_barang,id_barang) Values('$nama_barang','$jumlah_barang','$created_at')");

//if ($insert_data) {
    header('location:data_pemasanganproduk.php?pesan=Data Berasil Di simpan');
//} else {
    echo ('ERROR' . mysqli_error($koneksi));
    //header('location:data_pemasuk.php?pesan=Data Gagal Di simpan');
    
//}?>