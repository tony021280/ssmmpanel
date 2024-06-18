-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 09 Jun 2020 pada 17.32
-- Versi server: 10.3.23-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xhostnes_xnesia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `balance_logs`
--

CREATE TABLE `balance_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(5) COLLATE utf8_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment` enum('pulsa','bank','redeem') COLLATE utf8_swedish_ci NOT NULL,
  `type` enum('manual','auto') COLLATE utf8_swedish_ci NOT NULL,
  `method_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `post_amount` double NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `status` enum('Pending','Canceled','Success') COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` int(11) NOT NULL,
  `payment` enum('pulsa','bank') COLLATE utf8_swedish_ci NOT NULL,
  `type` enum('manual','auto') COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `rate` double NOT NULL,
  `min_amount` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `deposit_methods`
--

INSERT INTO `deposit_methods` (`id`, `payment`, `type`, `name`, `note`, `rate`, `min_amount`, `status`) VALUES
(2, 'bank', 'auto', 'BRI', 'Transfer ke 614501021615535\r\nA/N LISA MARTANIA', 1, 10000, 1),
(4, 'bank', 'manual', 'DANA', 'Transfer ke 0813-9032-7727\r\nLalu kirm bukti ke Whatsapp Admin', 1, 10000, 1),
(5, 'bank', 'manual', 'GOPAY', 'Transfer ke 0813-9032-7727\r\nLalu kirim bukti ke Admin', 1, 10000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `content` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `news`
--

INSERT INTO `news` (`id`, `created_at`, `content`) VALUES
(1, '2020-06-08 23:32:40', 'Untuk isi saldo via pulsa silahkan hubungi admin ya:)\r\nWhatsapp : 0813-9032-7727'),
(2, '2020-06-09 12:16:09', 'Saldo dipanel tidak bisa direfund atau diuangkan. Gunakan layanan work yang ada dipanel, atau bisa tanyakan Admin'),
(3, '2020-06-09 12:17:18', 'Isi saldo juga bisa melalui Dana/Gopay\r\nHubungi Whatsapp : 0813-9032-7727'),
(4, '2020-06-09 12:17:49', 'Jika ingin membuat pesanan dengan Target yang sama dengan pesanan yang sudah pernah dipesan sebelumnya, mohon menunggu sampai pesanan sebelumnya selesai diproses. Tidak ada pengembalian dana jika jumlah awal sama karena double order.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `data` text COLLATE utf8_swedish_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `start_count` int(11) NOT NULL DEFAULT 0,
  `remains` int(11) NOT NULL DEFAULT 0,
  `status` enum('Pending','Processing','Error','Partial','Success') COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` int(11) NOT NULL,
  `provider_order_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `is_api` int(1) NOT NULL DEFAULT 0,
  `is_refund` int(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `api_order_log` text COLLATE utf8_swedish_ci DEFAULT NULL,
  `api_status_log` text COLLATE utf8_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8_swedish_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `content`, `updated_at`) VALUES
(1, 'Kontak admin :\r\nWhatsapp : 081390327727\r\nFb : Aisyah Yuliani | https://fb.com/Aisyahyuliani\r\nFast Respon : 07.00 - 22.00 ', '2019-03-20 10:18:14'),
(2, 'Syarat & Ketentuan Jatasub.id telah ditetapkan kesepakatan-kesepakatan berikut.\r\n\r\n1. UMUM\r\n\r\nDengan mendaftar dan menggunakan layanan Cybersmm secara otomatis anda menyetujui semua ketentuan yang kami buat. Ketentuan bisa saja berubah sewaktu-waktu tanpa pemberitahuan terlebih dahulu.\r\n\r\n2. LAYANAN\r\n\r\nCybersmm hanya untuk sarana promosi. Hanya untuk membatu meningkatkan \"penampilan\" Akun sosial media anda.\r\nCybersmm tidak dapat memastikan pengikut baru anda akan berinteraksi dengan anda.\r\nCybersmm hanya menjamin anda akan mendapatkan pengikut sesuai yang anda bayar.\r\nCybersmm tidak menjamin 100% dari akun kami memiliki gambar profil atau bio yang lengkap.\r\nCybersmm tidak akan mengembalikan saldo jika anda salah memesan. Pastikan anda memasukan data yang benar sebelum memesan layanan.\r\nCybersmm Anda Tidak Dapat Melakukan Pemesanan Untuk Hal Yang Bersifat Melanggar Hukum.\r\nCybersmm Tidak Menjamin Semua Layanan Dapat Bertahan Selamanya.\r\n\r\n3. TANGGUNG JAWAB\r\n\r\nCybersmm sama sekali tidak bertanggung jawab atas kerugian yang mungkin terjadi pada bisnis anda.\r\nCybersmm tidak bertanggung jawab jika terjadi penanguhan akun,penghapusan foto atau video atau bahkan pembokiran akun sosial media anda.\r\nCybersmm tidak bertanggung jawab atas penyalahgunaan layanan yang kami sediakan.\r\nCybersmm di bebaskan dari segala tuntutan hukum.\r\n\r\n4. HARGA\r\n\r\nHarga yang kami tawarkan dapat berubah sewaktu-waktu. Dengan pemberitahuan atau tanpa pemberitahuan.\r\n\r\n5. PEMESANAN\r\n\r\nPesanan yang sudah di input tidak dapat di batalkan.\r\nWaktu pengerjaan yang kami lampirkan di diskripsi hanyalah perkiraan.\r\n\r\n6. SALDO\r\n\r\nTidak ada pengembalian uang yang akan dilakukan ke metode pembayaran Anda. Setelah deposit selesai, tidak ada cara untuk mengembalikannya. Anda harus menggunakan saldo Anda atas perintah dari Cybersmm.\r\nAnda setuju bahwa setelah Anda menyelesaikan pembayaran, Anda tidak akan mengajukan sengketa atau tagihan balik kepada kami karena alasan apa pun.\r\n\r\n7. AKUN\r\n\r\nKami tidak akan membantu apapun yang terjadi pada akun anda jika data yang anda inputkan saat pendaftaran tidak sesuai dengan kriteria yang telah kami sarankan.\r\nJika Anda melakukan pendaftaran dan tidak melakukan deposit atau pengisian saldo dalam waktu lebih dari 1 hari maka akun Anda otomatis akan dinonaktifkan oleh sistem. Jika Anda terbukti melakukan kecurangan dalam bertransaksi di Jatasub.id maka kami akan menonaktifkan atau bisa saja menghapus akun Anda dari website kami.', '2019-03-20 00:00:00'),
(3, '1. Apa itu Cybersmm?\r\nCybersmm adalah sebuah platform bisnis yang menyediakan berbagai layanan sosial media marketing yang bergerak terutama di Indonesia. Dengan bergabung bersama kami, Anda dapat menjadi penyedia jasa sosial media atau reseller social media seperti jasa penambah Followers, Likes, dll.\r\n\r\n2. Bagaimana cara mendaftar di Cybersmm?\r\nAnda dapat langsung mendaftar di website Cybersmm pada halaman Daftar\r\n\r\n3. Bagaimana cara membuat pesanan?\r\nUntuk membuat pesanan sangatlah mudah, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman pemesanan dengan mengklik menu yang sudah tersedia. Selain itu Anda juga dapat melakukan pemesanan melalui request API.\r\n\r\n4. Bagaimana cara melakukan deposit/isi saldo?\r\nUntuk melakukan deposit/isi saldo, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman deposit dengan mengklik menu yang sudah tersedia. Kami menyediakan deposit melalui bank dan pulsa.', '2019-03-20 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `provider`
--

CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `api_url_order` text COLLATE utf8_swedish_ci NOT NULL,
  `api_url_status` text COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `provider`
--

INSERT INTO `provider` (`id`, `name`, `api_url_order`, `api_url_status`, `api_key`) VALUES
(4, 'ANJEL', 'https://anjelpedia.com/api/social-media', 'https://anjelpedia.com/api/social-media', 'masukan api key anjelpedia.com disini');

-- --------------------------------------------------------

--
-- Struktur dari tabel `register_logs`
--

CREATE TABLE `register_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `provider_id` int(11) NOT NULL,
  `provider_service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_cat`
--

CREATE TABLE `service_cat` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `msg` text COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Waiting','Responded','Closed') COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `is_admin` int(1) NOT NULL DEFAULT 0,
  `msg` text COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `balance` double NOT NULL,
  `level` enum('Member','Reseller','Admin') COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `api_key` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `remember_me` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `balance`, `level`, `status`, `api_key`, `remember_me`, `created_at`) VALUES
(1, 'aisyahcc', '$2y$10$1top/up/lJB1/zm5oJzJR.dKOnigHX3FzyNxUnNvtaWJpXlOoGzBC', 'aisyahcc', 90635.813235294, 'Admin', 1, 'REHZN4K2E039CCD7WOET56OXXCBD13', NULL, '2020-06-05 20:41:41'),
(2, 'nabil', '$2y$10$ex1ugoglN7QfPZZltXzR3.Y3gaLXwjSwQwyH5DB.7g2X/Wyh.DkIa', 'Nabil', 0, 'Member', 1, 'P6J5C6594TZS0Y3SZOTYSUQAALWGDQ', NULL, '2020-06-05 21:11:28'),
(3, 'nabil123', '$2y$10$5MzIhPVo8DQEMaZ/aBOicO0F.pAu4.5F/yK95K0kZMclCUHDAIVIu', 'Nabil', 0, 'Member', 1, '7AFEL9OBO47U1EJORMLSXKUIYESTVA', NULL, '2020-06-06 13:55:32'),
(4, 'cobacobacoba', '$2y$10$vp9F1QeMw.qJ4mD0pG2vouz7IiCpWpqAo0xQmXQMWCX5EbQyzZWLu', 'cobacobacoba', 0, 'Member', 1, '5HNCUFH5XN3L1P1GXHDNHUWKX6UUFP', NULL, '2020-06-07 02:38:48'),
(5, 'remusaw', '$2y$10$GPNdmmznIE/5rnOPMA9J1.WChL5pzSzF3OWfG4YVW5U1BDrj5rEDy', 'Raihan Javier', 0, 'Member', 1, '25W5R8JVG578D0DTD4MMBBL6DVBZ2R', NULL, '2020-06-07 21:24:10'),
(6, 'elzstore', '$2y$10$GaHueLGu7JqG/5nlLc9DgOr3aEo2kNKo64Q6CmojrtrdCaUFGFzsG', 'JoelPratama', 0, 'Member', 1, '2SJ70KCKQY4PKF9QO89D1XNC13F31K', NULL, '2020-06-07 22:32:16'),
(8, 'admin', '$2y$10$.BezszeQ4RMkrPdVgfwrr.jS769VUNogPpTDrCAGBK41J.7OC7Z.u', 'andi', 0, 'Member', 1, 'NBG0ES3IU0NAEWMSCB48MLA0IJ6Y9R', NULL, '2020-06-08 19:41:41'),
(9, 'vj12345', '$2y$10$EglGC.hBAQhifQ4CjHtVJ.yNmbnjvVfXivHZgnmXl4WBUWcPw9KTq', 'vj123', 0, 'Member', 1, '59FYR4JHHJRHCAQI3QNJO48TYON9DE', NULL, '2020-06-09 08:48:04'),
(10, 'anggi nurahman', '$2y$10$4Oz4xcKaILfUqpqKhDqXM.yHcIV0SENOl7bH8.8EYJjNmp38St2p.', 'Anggi Nurahman', 3530.5882352941, 'Member', 1, 'BLCZ1IFM5O2MPTKJ19KD41YUER80H2', NULL, '2020-06-09 20:05:06'),
(11, 'ktlgaming', '$2y$10$k8gq4kByrRSbIHhU3s7Oze7QNcFDZEwopjAXhSPafrCAlqR4v90Rm', 'ktlgaming', 0, 'Member', 1, 'LP3M5TTZRV2WVS6ZWAFIMX1RJHPM4J', NULL, '2020-06-09 22:14:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `voucher_code` text COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `balance_logs`
--
ALTER TABLE `balance_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `register_logs`
--
ALTER TABLE `register_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_cat`
--
ALTER TABLE `service_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `balance_logs`
--
ALTER TABLE `balance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `register_logs`
--
ALTER TABLE `register_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `service_cat`
--
ALTER TABLE `service_cat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
