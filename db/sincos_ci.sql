-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2022 at 09:37 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sincos_ci`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `agenda`
-- (See below for the actual view)
--
CREATE TABLE `agenda` (
`kd_pinjam` int(4)
,`tgl` date
,`nm_ruang` varchar(50)
,`nm_sesi` varchar(10)
,`nm_komunitas` varchar(50)
,`keperluan` varchar(20)
,`jumlah` int(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'Zach Zuch', NULL, '2022-04-06 04:05:02', 0),
(2, '::1', 'Zach Zuch', 1, '2022-04-06 04:05:14', 0),
(3, '::1', 'Zach Zuch', 1, '2022-04-06 06:11:55', 0),
(4, '::1', 'Zach Zuch', 1, '2022-04-06 06:12:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1649230741, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `kd_admin` varchar(4) NOT NULL,
  `nm_admin` varchar(20) NOT NULL,
  `kontak` varchar(15) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`kd_admin`, `nm_admin`, `kontak`, `user`, `pass`, `level`) VALUES
('ADM1', 'Sulastri Wulandari', '08123456789', 'adm1', 'admin1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kembali`
--

CREATE TABLE `tb_kembali` (
  `kd_kembali` int(5) NOT NULL,
  `kd_pinjam` int(4) NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_komunitas`
--

CREATE TABLE `tb_komunitas` (
  `kd_komunitas` int(4) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `nm_komunitas` varchar(50) NOT NULL,
  `bidang` varchar(20) NOT NULL,
  `jml_anggota` int(4) NOT NULL,
  `ketua` varchar(20) NOT NULL,
  `kontak` varchar(15) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_komunitas`
--

INSERT INTO `tb_komunitas` (`kd_komunitas`, `logo`, `nm_komunitas`, `bidang`, `jml_anggota`, `ketua`, `kontak`, `user`, `pass`, `level`) VALUES
(1, 'genpiblitar.jpg', 'Genpi Blitar', 'Pariwisata', 15, 'Istajib Lana', '085347864607', 'genpi', 'gnp123', 2),
(2, 'Hari Cinta Tanah Air.jpg', 'Hari Cinta Tanah Air', 'Sosial', 25, 'Mada Nova', '081235716816', 'hcta', 'hcta123', 2),
(3, 'perupamuda.jpg', 'Perupa Muda', 'Hobby', 20, 'Istajib Lana', '085347864607', 'perma', 'perma123', 2),
(4, '', 'PENA', 'Hobi', 10, 'Nana', '085678906543', 'pena', 'pena', 2),
(5, 'cursor2.png', 'PENA', 'Hobi', 10, 'Nana', '085678906543', 'pena', 'pena', 2),
(6, '60ece413594d5.png', 'PENA', 'Hobi', 10, 'Nana', '085678906543', 'pena', 'pena', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_piket`
--

CREATE TABLE `tb_piket` (
  `kd_piket` int(4) NOT NULL,
  `kd_komunitas` int(4) NOT NULL,
  `hari` enum('senin','selasa','rabu','kamis','jumat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_piket`
--

INSERT INTO `tb_piket` (`kd_piket`, `kd_komunitas`, `hari`) VALUES
(1, 1, 'senin'),
(2, 1, 'selasa');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pinjam`
--

CREATE TABLE `tb_pinjam` (
  `kd_pinjam` int(4) NOT NULL,
  `kd_komunitas` varchar(4) NOT NULL,
  `tgl` date NOT NULL,
  `kd_sesi` char(1) NOT NULL,
  `keperluan` varchar(20) NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pinjam`
--

INSERT INTO `tb_pinjam` (`kd_pinjam`, `kd_komunitas`, `tgl`, `kd_sesi`, `keperluan`, `jumlah`) VALUES
(1, 'GNP', '2021-06-22', '1', '', 0),
(2, 'HCT', '2021-06-22', '2', '', 0),
(4, 'GNP', '0000-00-00', '2', '', 0),
(5, 'GNP', '0000-00-00', '2', '', 0),
(6, 'GNP', '0000-00-00', '2', '', 0),
(7, 'GNP', '0000-00-00', '2', '', 0),
(8, 'GNP', '2021-07-08', '1', '', 0),
(10, 'GNP', '2021-07-07', '1', '', 0),
(11, 'GNP', '2021-07-06', '1', '', 0),
(12, 'GNP', '2021-07-05', '1', '', 0),
(18, 'HCT', '2021-07-05', '2', '', 0),
(21, 'GNP', '2021-07-01', '1', '', 0),
(22, 'GNP', '2021-07-01', '2', '', 0),
(23, 'GNP', '0000-00-00', '1', '', 0),
(24, 'GNP', '2021-07-02', '1', '', 0),
(25, 'GNP', '2021-07-02', '2', '', 0),
(26, 'GNP', '2021-07-06', '2', '', 0),
(27, 'GNP', '2021-07-07', '2', '', 0),
(28, 'GNP', '2021-07-08', '2', '', 0),
(29, 'GNP', '2021-07-09', '1', '', 0),
(30, 'GNP', '2021-07-09', '2', '', 0),
(31, 'GNP', '2021-06-30', '1', '', 0),
(32, 'GNP', '2021-06-30', '2', '', 0),
(33, 'GNP', '2021-06-29', '1', '', 0),
(34, 'GNP', '2021-06-29', '2', '', 0),
(35, 'GNP', '2021-06-28', '1', '', 0),
(36, 'GNP', '2021-06-21', '1', '', 0),
(37, '1', '2021-05-05', '1', '', 0),
(38, '1', '2021-05-31', '1', '', 0),
(39, '1', '2021-05-28', '1', '', 0),
(40, '1', '2021-05-28', '2', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_ruang`
--

CREATE TABLE `tb_ruang` (
  `kd_ruang` int(11) NOT NULL,
  `nm_ruang` varchar(50) NOT NULL,
  `kapasitas` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ruang`
--

INSERT INTO `tb_ruang` (`kd_ruang`, `nm_ruang`, `kapasitas`) VALUES
(1, 'Diskominfo Kab. blitar', 20),
(2, 'Ruang Terbuka Hijau Kanigoro', 10),
(3, 'Ruang Terbuka Hijau Taman Wlingi', 80);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sesi`
--

CREATE TABLE `tb_sesi` (
  `kd_sesi` int(2) NOT NULL,
  `nm_sesi` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `kd_ruang` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_sesi`
--

INSERT INTO `tb_sesi` (`kd_sesi`, `nm_sesi`, `jam_mulai`, `jam_selesai`, `kd_ruang`) VALUES
(1, 'Sesi 1', '08:00:00', '10:00:00', 'R1'),
(2, 'Sesi 1', '08:00:00', '10:00:00', 'R2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'zachphoenix1010@gmail.com', 'Zach Zuch', '$2y$10$CRgguVdnener86EIeSYQ8Ou3QEeP0AH2UMjJWGcnxzfWA3OAc7cum', NULL, NULL, NULL, 'aa0e942a07a106a3841e09d9cff49f92', NULL, NULL, 0, 0, '2022-04-06 04:02:54', '2022-04-06 04:02:54', NULL);

-- --------------------------------------------------------

--
-- Structure for view `agenda`
--
DROP TABLE IF EXISTS `agenda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agenda`  AS SELECT `tb_pinjam`.`kd_pinjam` AS `kd_pinjam`, `tb_pinjam`.`tgl` AS `tgl`, `tb_ruang`.`nm_ruang` AS `nm_ruang`, `tb_sesi`.`nm_sesi` AS `nm_sesi`, `tb_komunitas`.`nm_komunitas` AS `nm_komunitas`, `tb_pinjam`.`keperluan` AS `keperluan`, `tb_pinjam`.`jumlah` AS `jumlah` FROM (((`tb_pinjam` join `tb_ruang`) join `tb_sesi`) join `tb_komunitas`) WHERE `tb_pinjam`.`kd_sesi` = `tb_sesi`.`kd_sesi` AND `tb_ruang`.`kd_ruang` = `tb_sesi`.`kd_ruang` AND `tb_pinjam`.`kd_komunitas` = `tb_komunitas`.`kd_komunitas` ORDER BY `tb_pinjam`.`tgl` DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`kd_admin`);

--
-- Indexes for table `tb_kembali`
--
ALTER TABLE `tb_kembali`
  ADD PRIMARY KEY (`kd_kembali`),
  ADD KEY `kd_pinjam` (`kd_pinjam`);

--
-- Indexes for table `tb_komunitas`
--
ALTER TABLE `tb_komunitas`
  ADD PRIMARY KEY (`kd_komunitas`);

--
-- Indexes for table `tb_piket`
--
ALTER TABLE `tb_piket`
  ADD PRIMARY KEY (`kd_piket`),
  ADD KEY `kd_komunitas` (`kd_komunitas`),
  ADD KEY `hari` (`hari`);

--
-- Indexes for table `tb_pinjam`
--
ALTER TABLE `tb_pinjam`
  ADD PRIMARY KEY (`kd_pinjam`),
  ADD KEY `kd_sesi` (`kd_sesi`),
  ADD KEY `kd_komunitas` (`kd_komunitas`);

--
-- Indexes for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  ADD PRIMARY KEY (`kd_ruang`);

--
-- Indexes for table `tb_sesi`
--
ALTER TABLE `tb_sesi`
  ADD PRIMARY KEY (`kd_sesi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_kembali`
--
ALTER TABLE `tb_kembali`
  MODIFY `kd_kembali` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_komunitas`
--
ALTER TABLE `tb_komunitas`
  MODIFY `kd_komunitas` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_piket`
--
ALTER TABLE `tb_piket`
  MODIFY `kd_piket` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pinjam`
--
ALTER TABLE `tb_pinjam`
  MODIFY `kd_pinjam` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  MODIFY `kd_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_kembali`
--
ALTER TABLE `tb_kembali`
  ADD CONSTRAINT `tb_kembali_ibfk_1` FOREIGN KEY (`kd_pinjam`) REFERENCES `tb_pinjam` (`kd_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_piket`
--
ALTER TABLE `tb_piket`
  ADD CONSTRAINT `tb_piket_ibfk_1` FOREIGN KEY (`kd_komunitas`) REFERENCES `tb_komunitas` (`kd_komunitas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
