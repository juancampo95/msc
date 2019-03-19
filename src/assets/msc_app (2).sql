-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2019 at 04:39 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msc_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `pedidos_tb`
--

CREATE TABLE `pedidos_tb` (
  `id` int(11) NOT NULL,
  `fecha` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `hora` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `cliente` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `documento` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `mesero` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `metodo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `comentario` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `mesa` int(10) NOT NULL,
  `subtotal_p` int(20) NOT NULL,
  `total_p` int(20) NOT NULL,
  `descuento` int(20) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `pedidos_tb`
--

INSERT INTO `pedidos_tb` (`id`, `fecha`, `hora`, `cliente`, `documento`, `mesero`, `metodo`, `comentario`, `mesa`, `subtotal_p`, `total_p`, `descuento`, `productos`, `estado`) VALUES
(42, '3/18/2019', '6:49:05 PM', 'da', '2', 'Nicolas', 'Datafono', 's', 1, 6500, 6500, 0, '[{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"3000\",\"v_total\":3000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"3\",\"1\":\"Pepsi Litro 1/2\",\"2\":\"Gaseosa pepsi cola litro y medio - postobon\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"gaseosas.png\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"3\",\"nombre\":\"Pepsi Litro 1/2\",\"descripcion\":\"Gaseosa pepsi cola litro y medio - postobon\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"gaseosas.png\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'Sin Facturar');

-- --------------------------------------------------------

--
-- Table structure for table `productos_tb`
--

CREATE TABLE `productos_tb` (
  `id` int(20) NOT NULL,
  `nombre` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(20) NOT NULL,
  `v_unidad` int(20) NOT NULL,
  `v_total` int(20) NOT NULL,
  `foto` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `anadido` tinyint(1) NOT NULL,
  `tipo` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos_tb`
--

INSERT INTO `productos_tb` (`id`, `nombre`, `descripcion`, `cantidad`, `v_unidad`, `v_total`, `foto`, `anadido`, `tipo`) VALUES
(1, 'Salchipapa Especial', '2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.', 1, 15000, 15000, 'maisitos.jpg', 0, 'comida'),
(2, 'Perro Caliente', '2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.', 1, 3000, 3000, 'perro.png', 0, 'comida'),
(3, 'Pepsi Litro 1/2', 'Gaseosa pepsi cola litro y medio - postobon', 1, 3500, 3500, 'gaseosas.png', 0, 'bebida'),
(4, 'Jugo de Mango (Con Agua)', 'Juego de pulpa natural con agua', 1, 3500, 3500, 'jugos.png', 0, 'bebida'),
(5, 'Hamburguesa Sencilla', 'Carne de Hamburguesa, tomate, queso, tocineta, lechuga, pan bimbo.', 1, 9000, 9000, 'hamburguesa.png', 0, 'comida'),
(6, 'Filete de Res', 'Asado a la plancha, ensalada, papas a la francesa.', 1, 8000, 8000, 'filete.png', 0, 'comida');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pedidos_tb`
--
ALTER TABLE `pedidos_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos_tb`
--
ALTER TABLE `productos_tb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pedidos_tb`
--
ALTER TABLE `pedidos_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `productos_tb`
--
ALTER TABLE `productos_tb`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
