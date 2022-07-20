-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2022 pada 07.55
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek_uas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `id_pemasuk` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `id_pemasuk`, `nama_barang`, `jumlah_barang`, `created_at`) VALUES
(9, 2, 'mobil', 3, '2022-07-19 02:56:20'),
(13, 6, 'minyak sawit', 4, '2022-07-19 03:53:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasanganproduk`
--

CREATE TABLE `tb_pemasanganproduk` (
  `id_pemasangan` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasuk`
--

CREATE TABLE `tb_pemasuk` (
  `id_pemasuk` int(11) NOT NULL,
  `nama_pemasuk` varchar(50) NOT NULL,
  `tlp_pemasuk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pemasuk`
--

INSERT INTO `tb_pemasuk` (`id_pemasuk`, `nama_pemasuk`, `tlp_pemasuk`) VALUES
(2, 'novita', '081917781084'),
(6, 'rahmat', '0819177882114');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `total_bayar` decimal(10,0) NOT NULL,
  `tgl_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembelianproduk`
--

CREATE TABLE `tb_pembelianproduk` (
  `id_pembeli` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_registrasi` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `harga`, `created_at`) VALUES
(2, 'motor', '1', '0000-00-00 00:00:00'),
(3, 'kayu', '1', '0000-00-00 00:00:00'),
(5, 'kelapa sawit', '1', '0000-00-00 00:00:00'),
(7, 'ayam', '1', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_registrasi`
--

CREATE TABLE `tb_registrasi` (
  `id_registrasi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `no_tlp` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_registrasi`
--

INSERT INTO `tb_registrasi` (`id_registrasi`, `id_user`, `nama_lengkap`, `nik`, `jenis_kelamin`, `no_tlp`, `alamat`, `username`, `password`, `created_at`) VALUES
(7, 1, 'Baiq indri astuti', '2545945845548958', 'perempuan', '081917781084', 'braim', 'indri baiq', 'indri astuti', '0000-00-00 00:00:00'),
(8, 1, 'abdul hamid', '2545945845548958', 'laki-laki', '087757015444', 'jangkih jawe', 'abdul hamid', 'dulha', '0000-00-00 00:00:00'),
(9, 1, 'laili', '2545945845548958', 'perempuan', '087757015444', 'grentuk', 'laili', 'lail', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`) VALUES
(1, 'wire', 'wire', 'b891b62ab9be7813b9c97aec94a62fff');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_pemasuk` (`id_pemasuk`);

--
-- Indeks untuk tabel `tb_pemasanganproduk`
--
ALTER TABLE `tb_pemasanganproduk`
  ADD PRIMARY KEY (`id_pemasangan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- Indeks untuk tabel `tb_pemasuk`
--
ALTER TABLE `tb_pemasuk`
  ADD PRIMARY KEY (`id_pemasuk`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- Indeks untuk tabel `tb_pembelianproduk`
--
ALTER TABLE `tb_pembelianproduk`
  ADD PRIMARY KEY (`id_pembeli`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_registrasi` (`id_registrasi`);

--
-- Indeks untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  ADD PRIMARY KEY (`id_registrasi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_pemasanganproduk`
--
ALTER TABLE `tb_pemasanganproduk`
  MODIFY `id_pemasangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_pemasuk`
--
ALTER TABLE `tb_pemasuk`
  MODIFY `id_pemasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pembelianproduk`
--
ALTER TABLE `tb_pembelianproduk`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  MODIFY `id_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_pemasuk`) REFERENCES `tb_pemasuk` (`id_pemasuk`);

--
-- Ketidakleluasaan untuk tabel `tb_pemasanganproduk`
--
ALTER TABLE `tb_pemasanganproduk`
  ADD CONSTRAINT `tb_pemasanganproduk_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `tb_pembayaran` (`id_pembayaran`),
  ADD CONSTRAINT `tb_pemasanganproduk_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `tb_pembelianproduk` (`id_pembeli`);

--
-- Ketidakleluasaan untuk tabel `tb_pembelianproduk`
--
ALTER TABLE `tb_pembelianproduk`
  ADD CONSTRAINT `tb_pembelianproduk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id_produk`),
  ADD CONSTRAINT `tb_pembelianproduk_ibfk_2` FOREIGN KEY (`id_registrasi`) REFERENCES `tb_registrasi` (`id_registrasi`);

--
-- Ketidakleluasaan untuk tabel `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  ADD CONSTRAINT `tb_registrasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
