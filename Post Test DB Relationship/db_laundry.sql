-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Sep 2022 pada 04.54
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nama_outlet` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id`, `id_user`, `nama_outlet`, `alamat`, `nomor_telepon`, `created_at`, `updated_at`) VALUES
(1, 1, 'Atop Clean', 'Margonda', '081219470569', '2022-09-16 02:20:52', '2022-09-16 02:20:52'),
(2, 2, 'Ronaldo Clean', 'Manchester', '023419420263', '2022-09-16 02:20:52', '2022-09-16 02:20:52'),
(3, 3, 'Messi Clean', 'Paris', '082219320543', '2022-09-16 02:20:52', '2022-09-16 02:20:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` int(10) NOT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'Baju', '200000', '100000', '2022-09-16 02:13:55', '2022-09-16 02:13:55'),
(2, 'Celana', '200000', '100000', '2022-09-16 02:13:55', '2022-09-16 02:13:55'),
(3, 'Alat Mandi', '150000', '30000', '2022-09-16 02:13:55', '2022-09-16 02:13:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `id_user`, `no_telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, '081219470569', 'Nilam 3', '2022-09-16 02:22:53', '2022-09-16 02:22:53'),
(2, 2, '08321947238', 'Manchester', '2022-09-16 02:22:53', '2022-09-16 02:22:53'),
(3, 3, '081219470569', 'Paris', '2022-09-16 02:22:53', '2022-09-16 02:22:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(10) NOT NULL,
  `id_pesanan` int(10) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jumlah_paket` varchar(255) DEFAULT NULL,
  `subtotal` varchar(255) DEFAULT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `tanggal_bayar`, `jumlah_paket`, `subtotal`, `bukti_transfer`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-05-12', '3', '40000', 'bukti.png', '2022-09-16 02:27:13', '2022-09-16 02:27:13'),
(2, 2, '2022-05-13', '2', '20000', 'bukti.png', '2022-09-16 02:27:13', '2022-09-16 02:27:13'),
(3, 3, '2022-05-10', '5', '20000', 'bukti.png', '2022-09-16 02:27:13', '2022-09-16 02:27:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_outlet` int(10) DEFAULT NULL,
  `id_paket` int(10) DEFAULT NULL,
  `status_pesanan` enum('diproses','selesai') DEFAULT NULL,
  `status_pembayaran` enum('lunas','belum lunas') DEFAULT NULL,
  `tanggal_pemesanan` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_user`, `id_outlet`, `id_paket`, `status_pesanan`, `status_pembayaran`, `tanggal_pemesanan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'diproses', 'lunas', '2022-05-15', '2022-09-16 02:25:08', '2022-09-16 02:25:08'),
(2, 2, 2, 2, 'selesai', 'lunas', '2022-05-18', '2022-09-16 02:25:08', '2022-09-16 02:25:08'),
(3, 2, 2, 2, 'diproses', 'lunas', '2022-05-20', '2022-09-16 02:25:08', '2022-09-16 02:25:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `level` enum('admin','petugas','pelanggan') DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `level`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'altop', 'altop@gmail.com', 'altop', 'admin', '2022-09-16 02:16:34', '1234', '0219312905', '2022-09-16 02:16:34', '2022-09-16 02:16:34'),
(2, 'ronaldo', 'ronaldo@gmail.com', 'ronaldo', 'petugas', '2022-09-16 02:16:34', '1234', '0231323505', '2022-09-16 02:16:34', '2022-09-16 02:16:34'),
(3, 'messi', 'messi@gmail.com', 'messi', 'admin', '2022-09-16 02:16:34', '1234', '1218217905', '2022-09-16 02:16:34', '2022-09-16 02:16:34');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `outlet_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id`),
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
