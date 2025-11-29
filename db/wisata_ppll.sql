-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2025 at 09:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata_ppll`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` enum('superadmin','admin') DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`, `email`, `level`) VALUES
(1, 'superadmin', 'superadmin', 'superadmin', 'superadmin@gmail.com', 'superadmin'),
(2, 'admin', 'admin', 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_wisata`
--

CREATE TABLE `kategori_wisata` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_wisata`
--

INSERT INTO `kategori_wisata` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Bukit'),
(2, 'Pantai');

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id_wisata` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `nama_wisata` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `lokasi_wisata` varchar(255) DEFAULT NULL,
  `jam_operasi` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id_wisata`, `id_kategori`, `nama_wisata`, `deskripsi`, `lokasi_wisata`, `jam_operasi`, `harga`, `latitude`, `longitude`) VALUES
(1, 1, 'Bukit Arosbaya', 'Formasi batu kapur dan pemandangan alam yang indah, populer untuk hiking ringan.', 'Arosbaya, Bangkalan', NULL, NULL, -6.9474130, 112.8595340),
(2, 1, 'Bukit Jaddih', 'Bukit kapur dengan pemandangan tebing kapur yang unik dan spot foto menarik.', 'Socah, Bangkalan', NULL, NULL, -7.0822830, 112.7595400),
(3, 1, 'Bukit Geger', 'Bukit dengan area perbukitan dan pemandangan laut dari ketinggian.', 'Geger, Bangkalan', NULL, NULL, -7.0288890, 112.9330560),
(4, 2, 'Pantai Rongkang', 'Pantai dengan batu-batu besar dan pemandangan ombak yang dramatis.', 'Kwanyar, Bangkalan', NULL, NULL, -7.1644380, 112.8419530),
(5, 2, 'Pantai Siring Kemuning', 'Pantai dengan pasir putih dan lokasi yang cocok untuk piknik keluarga.', 'Tanjung Bumi, Bangkalan', NULL, NULL, -6.8849340, 113.0527800),
(6, 2, 'Pantai Rindu', 'Pantai populer dengan pemandangan laut yang luas dan area rekreasi.', 'Labang, Bangkalan', NULL, NULL, -7.1606870, 112.7744520),
(7, 2, 'Pantai Goa Petapa', 'Pantai dengan goa dan spot snorkeling kecil.', 'Labang, Bangkalan', NULL, NULL, -7.1576460, 112.8023530),
(8, 2, 'Pantai Batu Malang', 'Pantai dengan formasi batu besar dan pemandangan alam yang eksotis.', 'Labang, Bangkalan', NULL, NULL, -7.1583280, 112.8057320);

-- --------------------------------------------------------

--
-- Table structure for table `wisata_gambar`
--

CREATE TABLE `wisata_gambar` (
  `id_gambar` int(11) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `file_gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wisata_gambar`
--

INSERT INTO `wisata_gambar` (`id_gambar`, `id_wisata`, `file_gambar`) VALUES
(1, 1, 'bukitarosbaya.jpg'),
(2, 2, 'bukitjaddih.jpeg'),
(3, 3, 'geger.jpg'),
(4, 4, 'rongkang.jpg'),
(5, 5, 'kemuning.jpg'),
(6, 6, 'rindu.jpg'),
(7, 7, 'petapa.jpg'),
(8, 8, ' batu.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `kategori_wisata`
--
ALTER TABLE `kategori_wisata`
  ADD PRIMARY KEY (`id_kategori`) USING BTREE;

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id_wisata`) USING BTREE,
  ADD KEY `id_kategori` (`id_kategori`) USING BTREE;

--
-- Indexes for table `wisata_gambar`
--
ALTER TABLE `wisata_gambar`
  ADD PRIMARY KEY (`id_gambar`) USING BTREE,
  ADD KEY `id_wisata` (`id_wisata`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori_wisata`
--
ALTER TABLE `kategori_wisata`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wisata_gambar`
--
ALTER TABLE `wisata_gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wisata`
--
ALTER TABLE `wisata`
  ADD CONSTRAINT `wisata_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_wisata` (`id_kategori`);

--
-- Constraints for table `wisata_gambar`
--
ALTER TABLE `wisata_gambar`
  ADD CONSTRAINT `wisata_gambar_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `wisata` (`id_wisata`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
