-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2019 at 05:52 AM
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
  `estado` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `pagadocon` int(50) NOT NULL,
  `devuelta` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `pedidos_tb`
--

INSERT INTO `pedidos_tb` (`id`, `fecha`, `hora`, `cliente`, `documento`, `mesero`, `metodo`, `comentario`, `mesa`, `subtotal_p`, `total_p`, `descuento`, `productos`, `estado`, `pagadocon`, `devuelta`) VALUES
(52, '4/1/2019', '7:46:09 PM', 'Milton', '1107092840', 'Carlos', 'Efectivo', 'verde', 4, 73000, 62500, 10500, '[{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":4,\"v_unidad\":\"15000\",\"v_total\":60000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"3\",\"1\":\"Pepsi Litro 1/2\",\"2\":\"Gaseosa pepsi cola litro y medio - postobon\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"gaseosas.png\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"3\",\"nombre\":\"Pepsi Litro 1/2\",\"descripcion\":\"Gaseosa pepsi cola litro y medio - postobon\",\"cantidad\":2,\"v_unidad\":\"3500\",\"v_total\":7000,\"foto\":\"gaseosas.png\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":2,\"v_unidad\":\"3000\",\"v_total\":6000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 62500, 0),
(53, '4/1/2019', '9:17:19 PM', 'Jeffrey', '9587542', 'Nelmar', 'Efectivo', 'solo verdeempacar salsas, verde, llevar, empacar salsas, piÃ±a, ', 2, 58000, 57000, 1000, '[{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":2,\"v_unidad\":\"15000\",\"v_total\":30000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":7,\"v_unidad\":\"3000\",\"v_total\":21000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"3\",\"1\":\"Pepsi Litro 1/2\",\"2\":\"Gaseosa pepsi cola litro y medio - postobon\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"gaseosas.png\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"3\",\"nombre\":\"Pepsi Litro 1/2\",\"descripcion\":\"Gaseosa pepsi cola litro y medio - postobon\",\"cantidad\":2,\"v_unidad\":\"3500\",\"v_total\":7000,\"foto\":\"gaseosas.png\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 60000, 3000),
(72, '3/29/2019', '10:55:41 PM', 'Juan Pablo', '5483461841', 'Caja', 'Efectivo', 'solo verde', 5, 18000, 18000, 0, '[{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"15000\",\"v_total\":15000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"3000\",\"v_total\":3000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'Sin Facturar', 20000, 2000),
(78, '4/1/2019', '9:48:10 PM', 'Juancho', '1255486', 'Caja', 'Efectivo', '', 6, 27000, 27000, 0, '[{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"15000\",\"v_total\":15000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"3000\",\"v_total\":3000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"5\",\"1\":\"Hamburguesa Sencilla\",\"2\":\"Carne de Hamburguesa, tomate, queso, tocineta, lechuga, pan bimbo.\",\"3\":\"1\",\"4\":\"9000\",\"5\":\"9000\",\"6\":\"hamburguesa.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"5\",\"nombre\":\"Hamburguesa Sencilla\",\"descripcion\":\"Carne de Hamburguesa, tomate, queso, tocineta, lechuga, pan bimbo.\",\"cantidad\":\"1\",\"v_unidad\":\"9000\",\"v_total\":9000,\"foto\":\"hamburguesa.png\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'Sin Facturar', 30000, 3000),
(79, '4/1/2019', '9:49:16 PM', 'Rodrigo', '161489', 'Nelmar', 'Datafono', '', 9, 22000, 22000, 0, '[{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"15000\",\"v_total\":15000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"3\",\"1\":\"Pepsi Litro 1/2\",\"2\":\"Gaseosa pepsi cola litro y medio - postobon\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"gaseosas.png\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"3\",\"nombre\":\"Pepsi Litro 1/2\",\"descripcion\":\"Gaseosa pepsi cola litro y medio - postobon\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"gaseosas.png\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"4\",\"1\":\"Jugo de Mango (Con Agua)\",\"2\":\"Juego de pulpa natural con agua\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"jugos.png\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"4\",\"nombre\":\"Jugo de Mango (Con Agua)\",\"descripcion\":\"Juego de pulpa natural con agua\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"jugos.png\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'Sin Facturar', 0, 0),
(80, '4/1/2019', '9:59:17 PM', 'cristiano', '216913', 'Caja', 'Efectivo', '', 0, 18000, 18000, 0, '[{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"15000\",\"v_total\":15000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"3000\",\"v_total\":3000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'Sin Facturar', 0, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `productos_tb`
--
ALTER TABLE `productos_tb`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
