-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Apr 2024 pada 08.44
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk2424`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id` int(10) NOT NULL,
  `nama_album` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tdl_dibuat` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id`, `nama_album`, `deskripsi`, `tdl_dibuat`, `user_id`) VALUES
(3, 'Pemandangan Alam', 'Album Yang Digunakan Untuk Menyimpan Foto Tentang Pemandangan Alam', '2024-04-24 08:13:56', 1),
(4, 'Orang', 'Foto Orang', '2024-04-24 10:36:44', 1),
(5, 'Mobil', 'Tunjukan Pesona Mobil Kamu', '2024-04-24 10:38:15', 1),
(6, 'UKK', 'ukk', '2024-04-24 14:02:37', 1),
(7, 'Olahraga', 'Olahraga', '2024-04-25 08:56:51', 4),
(8, 'SekolahKU', 'Smkn 11 ', '2024-04-25 11:52:35', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `id` int(11) NOT NULL,
  `judul_foto` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tgl_unggahan` datetime NOT NULL,
  `lokasi_foto` varchar(255) NOT NULL,
  `album_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`id`, `judul_foto`, `deskripsi`, `tgl_unggahan`, `lokasi_foto`, `album_id`, `user_id`) VALUES
(8, 'Gunung', 'Saya Mengunjungi Gunung Bromo', '2024-04-25 13:30:22', '7.jpg', 3, 4),
(9, 'Gunung', 'Saya Mengunjungi Gunung Bromo', '2024-04-24 10:09:20', '2.jpeg', 3, 1),
(10, 'Gambar Orang Berbaju Kuning', 'Gambar Seseorang Berbaju Kuning Yang Berada Di Pantai', '2024-04-24 10:37:06', '3.jpg', 4, 1),
(11, 'GTR R34', 'Pesona Skyline R34', '2024-04-24 10:38:34', '12.jpg', 5, 1),
(12, 'Mazda RX 7', 'Pesona Mazda RX 7', '2024-04-24 10:39:08', '1.jpg', 5, 1),
(13, 'Gunung', 'Pesona Gunung', '2024-04-24 10:39:30', '16.jpg', 3, 1),
(14, 'Seseorang Memakai Seragam', 'Gambar Seseorang Remaja Memakai Seragam Putih', '2024-04-24 10:41:05', 'Gambar WhatsApp 2023-05-24 pukul 06.40.19.jpg', 4, 1),
(15, 'ukk', 'UKK', '2024-04-24 14:02:57', '17.jpg', 6, 1),
(16, 'Olahraga', 'Olahraga', '2024-04-25 08:57:10', '5.jpg', 7, 4),
(17, 'Sekokah', 'Sekolah', '2024-04-25 11:53:00', '19.jpg', 8, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `id` int(11) NOT NULL,
  `foto_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `isi_komentar` varchar(255) NOT NULL,
  `tgl_komentar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komentarfoto`
--

INSERT INTO `komentarfoto` (`id`, `foto_id`, `user_id`, `isi_komentar`, `tgl_komentar`) VALUES
(2, 8, 1, 'gunungnya bagus mas', '2024-04-24 10:27:15'),
(3, 9, 1, 'indahnya', '2024-04-24 12:08:40'),
(4, 15, 1, 'UKK', '2024-04-24 14:03:23'),
(5, 16, 4, 'qwer', '2024-04-25 08:57:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `id` int(11) NOT NULL,
  `foto_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `tgl_like` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `likefoto`
--

INSERT INTO `likefoto` (`id`, `foto_id`, `user_id`, `tgl_like`) VALUES
(2, 8, 1, '2024-04-24 10:25:16'),
(4, 9, 1, '2024-04-24 13:47:48'),
(6, 15, 3, '2024-04-24 14:04:38'),
(7, 15, 1, '2024-04-25 08:14:06'),
(10, 9, 4, '2024-04-25 13:30:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `nama_lengkap`, `alamat`) VALUES
(1, 'admin', '$2y$10$2buxDjrorjH8Nit2DXjTUuvUl3Wqg2qFrtMub2Rip7xVdYGoTQGQy', 'miko35292@gmail.com', 'Ryfaathir Rahman', 'Bakalan Krajan'),
(3, 'ukk', '$2y$10$EZbNVoXYY980lGJc2XJWYuy1ZoWG5Z6a/At2k3rw0iJ4zFdSGqnga', 'ukk@gmail.com', 'ukk', 'ukk'),
(4, 'farhan', '$2y$10$qymHBEXRoV7PnxP9iLwZeukPWYVR3IpUTDrFVwaoipyp7jN0FQBV6', 'farhan@gmail.com', 'Farhan', 'Malang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKalbum633422` (`user_id`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judul_foto` (`judul_foto`),
  ADD KEY `FKfoto129237` (`album_id`),
  ADD KEY `FKfoto381331` (`user_id`);

--
-- Indeks untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkomentarfo819838` (`user_id`),
  ADD KEY `FKkomentarfo294487` (`foto_id`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlikefoto918430` (`foto_id`),
  ADD KEY `FKlikefoto775695` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `nama_lengkap` (`nama_lengkap`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `FKalbum633422` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `FKfoto129237` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `FKfoto381331` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD CONSTRAINT `FKkomentarfo294487` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`),
  ADD CONSTRAINT `FKkomentarfo819838` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `FKlikefoto775695` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKlikefoto918430` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
