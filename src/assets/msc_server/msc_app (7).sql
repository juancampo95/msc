-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2019 at 10:41 PM
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
-- Table structure for table `balances_diarios`
--

CREATE TABLE `balances_diarios` (
  `id` int(50) NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `base_i_b` int(100) NOT NULL,
  `base_i_m` int(100) NOT NULL,
  `pedidos_facturados` int(100) NOT NULL,
  `datafono` int(100) NOT NULL,
  `online` int(100) NOT NULL,
  `otros_ingresos` int(100) NOT NULL,
  `total_ingresos` int(100) NOT NULL,
  `compras_gastos` int(100) NOT NULL,
  `vales` int(100) NOT NULL,
  `total_gastos` int(100) NOT NULL,
  `total_resumen` int(100) NOT NULL,
  `billetes_a` int(100) NOT NULL,
  `monedas_a` int(100) NOT NULL,
  `datafono_a` int(100) NOT NULL,
  `online_a` int(100) NOT NULL,
  `total_arqueo` int(100) NOT NULL,
  `descuadre` int(100) NOT NULL,
  `cuadrado` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `hora_ini` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_fin` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `hora_fin` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `balances_diarios`
--

INSERT INTO `balances_diarios` (`id`, `usuario`, `base_i_b`, `base_i_m`, `pedidos_facturados`, `datafono`, `online`, `otros_ingresos`, `total_ingresos`, `compras_gastos`, `vales`, `total_gastos`, `total_resumen`, `billetes_a`, `monedas_a`, `datafono_a`, `online_a`, `total_arqueo`, `descuadre`, `cuadrado`, `fecha_ini`, `hora_ini`, `fecha_fin`, `hora_fin`) VALUES
(6, 'jose', 800000, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'no', '6/12/2019', '3:25:28 PM', 'sin fecha final', 'sin hora final'),
(7, 'juancampo95', 450000, 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'no', '9/20/2019', '11:45:54 AM', 'sin fecha final', 'sin hora final');

-- --------------------------------------------------------

--
-- Table structure for table `gastos_y_vales`
--

CREATE TABLE `gastos_y_vales` (
  `id` int(100) NOT NULL,
  `id_resumen` int(100) NOT NULL,
  `fecha` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `detalle` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `total` int(100) NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `gastos_y_vales`
--

INSERT INTO `gastos_y_vales` (`id`, `id_resumen`, `fecha`, `detalle`, `tipo`, `total`, `usuario`) VALUES
(1, 7, '10/4/2019', 'carne', 'gasto', 50000, 'juancampo95'),
(2, 7, '10/4/2019', 'vale alex bicicleta', 'vale', 80000, 'juancampo95'),
(3, 7, '5/10/2019', 'alex ', 'vale', 50000, 'juancampo95'),
(4, 7, '5/10/2019', 'Jean Carlo gastos', 'gasto', 36000, 'juancampo95');

-- --------------------------------------------------------

--
-- Table structure for table `otrosingresos_tb`
--

CREATE TABLE `otrosingresos_tb` (
  `id` int(100) NOT NULL,
  `id_resumen` int(100) NOT NULL,
  `fecha` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `detalle` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `total` int(100) NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `otrosingresos_tb`
--

INSERT INTO `otrosingresos_tb` (`id`, `id_resumen`, `fecha`, `detalle`, `total`, `usuario`) VALUES
(7, 7, '5/10/2019', 'Jean Carlo venta', 218650, 'juancampo95');

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
  `devuelta` int(50) NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `pedidos_tb`
--

INSERT INTO `pedidos_tb` (`id`, `fecha`, `hora`, `cliente`, `documento`, `mesero`, `metodo`, `comentario`, `mesa`, `subtotal_p`, `total_p`, `descuento`, `productos`, `estado`, `pagadocon`, `devuelta`, `usuario`) VALUES
(117, '10/4/2019', '2:01:29 PM', 'jeffre', '12131512', 'Caja', 'Efectivo', 'empacar salsas, ', 14, 24500, 24500, 0, '[{\"0\":\"2\",\"1\":\"Perro Caliente\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"3000\",\"5\":\"3000\",\"6\":\"perro.png\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"2\",\"nombre\":\"Perro Caliente\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":2,\"v_unidad\":\"3000\",\"v_total\":6000,\"foto\":\"perro.png\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"3\",\"1\":\"Pepsi Litro 1/2\",\"2\":\"Gaseosa pepsi cola litro y medio - postobon\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"gaseosas.png\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"3\",\"nombre\":\"Pepsi Litro 1/2\",\"descripcion\":\"Gaseosa pepsi cola litro y medio - postobon\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"gaseosas.png\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"1\",\"1\":\"Salchipapa Especial\",\"2\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"3\":\"1\",\"4\":\"15000\",\"5\":\"15000\",\"6\":\"maisitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"Salchipapa Especial\",\"descripcion\":\"2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.\",\"cantidad\":\"1\",\"v_unidad\":\"15000\",\"v_total\":15000,\"foto\":\"maisitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 24500, 0, 'juancampo95');

-- --------------------------------------------------------

--
-- Table structure for table `productos_tb3`
--

CREATE TABLE `productos_tb3` (
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
-- Dumping data for table `productos_tb3`
--

INSERT INTO `productos_tb3` (`id`, `nombre`, `descripcion`, `cantidad`, `v_unidad`, `v_total`, `foto`, `anadido`, `tipo`) VALUES
(1, 'HB Artesanal de Res', 'Hamburguesa carne de res, tocineta, jamon, queso, lecucha, ripio y salsas.', 1, 10000, 10000, 'f_hbres.jpg', 0, 'comida'),
(2, 'HB Especial de Res', 'Hamburguesa Especial de res, tocineta, doble jamon, doble queso, lecucha, rip...', 1, 12000, 12000, 'f_hbres.jpg', 0, 'comida'),
(3, 'HB Super Combo de Res', 'Artesanal Especial, papas a la francesa y postobon 400ml', 1, 16000, 16000, 'f_hbres.jpg', 0, 'comida'),
(4, 'HB Artesanal de pollo', 'Hamburguesa filete de pollo, tocineta, jamon, queso, lechuga, ripio y salsas.', 1, 11000, 11000, 'f_hbpollo.jpg', 0, 'comida'),
(5, 'HB Especial de pollo', 'Hamburguesa filete de pollo, tocineta, doble jamon, doble queso, lechuga, ripio y salsas.', 1, 13000, 13000, 'f_hbpollo.jpg', 0, 'comida'),
(6, 'HB Mixta Res y Pollo', 'Hamburguesa res, pollo, jamon, queso, lechuga, ripio y salsas.', 1, 8000, 8000, 'f_hbres.jpg', 0, 'comida'),
(7, 'HB Super Combo de Pollo', 'Hamburguesa especial de pollo, papas francesas y gaseosa 400l', 1, 17000, 17000, 'f_hbpollo.jpg', 0, 'comida'),
(8, 'Perro Americano', 'Salchicha Americana, jamon, queso y salsas caseras', 1, 8000, 8000, 'f_perro.jpg', 0, 'comida'),
(9, 'Perro Americano Especial', 'Salchicha Americana, tocineta, jamon, queso y salsas caseras', 1, 10000, 10000, 'f_perro.jpg', 0, 'comida'),
(10, 'Super Combo Americano', 'Perro especial, papas francesas y gaseosa 400ml', 1, 15000, 15000, 'f_perro.jpg', 0, 'comida'),
(11, 'Salchipapa Sencilla Personal', 'Papa amarilla, salchicha y salsas', 1, 4500, 4500, 'f_salchipapa.jpg', 0, 'comida'),
(12, 'Salchipapa Sencilla Grande', 'Papa amarilla, salchicha y salsas', 1, 5500, 5500, 'f_salchipapa.jpg', 0, 'comida'),
(13, 'Salchipapa Gratinada Personal', 'Queso, Ripio, Papa amarilla, salchicha y salsas', 1, 6500, 6500, 'f_gratinada.jpg', 0, 'comida'),
(14, 'Salchipapa Gratinada Grande', 'Queso, Ripio, Papa amarilla, salchicha y salsas', 1, 8000, 8000, 'f_gratinada.jpg', 0, 'comida'),
(15, 'Salchipapa de Pollo Personal', 'Pollo desmechado, queso, ripio papa y salchicha', 1, 10000, 10000, 'f_salchi_in.jpg', 0, 'comida'),
(16, 'Salchipapa de Pollo Grande', 'Pollo desmechado, queso, ripio papa y salchicha', 1, 12000, 12000, 'f_salchi_in.jpg', 0, 'comida'),
(17, 'Salchipapa de Tocineta Personal', 'Tocineta, queso, ripio papa y salchicha', 1, 10000, 10000, 'f_salchi_in.jpg', 0, 'comida'),
(18, 'Salchipapa de Tocineta Grande', 'Tocineta, queso, ripio papa y salchicha', 1, 12000, 12000, 'f_salchi_in.jpg', 0, 'comida'),
(19, 'Salchipapa Ranchera Personal', 'Salchicha ranchera, queso, ripio y papa', 1, 10000, 10000, 'f_salchi_in.jpg', 0, 'comida'),
(20, 'Salchipapa Ranchera Grande', 'Salchicha ranchera, queso, ripio y papa', 1, 12000, 12000, 'f_salchi_in.jpg', 0, 'comida'),
(21, 'Salchipapa de Carne Personal', 'Carne desmechada, queso, ripio, papa y salchicha', 1, 10000, 10000, 'f_salchi_in.jpg', 0, 'comida'),
(22, 'Salchipapa de Carne Grande', 'Carne desmechada, queso, ripio, papa y salchicha', 1, 12000, 12000, 'f_salchi_in.jpg', 0, 'comida'),
(23, 'Salchipapa de HB Personal', 'Carne de hamburguesa, queso, ripio, papa y salchicha', 1, 10000, 10000, 'f_salchi_in.jpg', 0, 'comida'),
(24, 'Salchipapa de HB Grande', 'Carne de hamburguesa, queso, ripio, papa y salchicha', 1, 12000, 12000, 'f_salchi_in.jpg', 0, 'comida'),
(25, 'Salchipapa de Maiz Personal', 'Maicitos, queso, ripio, papa y salchicha', 1, 10000, 10000, 'f_salchi_in.jpg', 0, 'comida'),
(26, 'Salchipapa de Maiz Grande', 'Maicitos, queso, ripio, papa y salchicha', 1, 12000, 12000, 'f_salchi_in.jpg', 0, 'comida'),
(27, 'Salchipapa de Costilla', 'Costilla, queso, ripio, papa y salchicha', 1, 14000, 14000, 'f_costilla.jpg', 0, 'comida');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_tb`
--

CREATE TABLE `usuarios_tb` (
  `id` int(100) NOT NULL,
  `username` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `key_access` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios_tb`
--

INSERT INTO `usuarios_tb` (`id`, `username`, `password`, `rol`, `key_access`) VALUES
(1, 'juancampo95', 'camilocampo', 'administrador', 'acwif719m4n5l9ygm2ys'),
(2, 'milton', 'fabian', 'administrador', 'g9yj8iyecdslaejdagtq'),
(3, 'rodrigo', 'campo', 'administrador', 'd6u7i3a2j0m48j0yx4qu'),
(4, 'jose', 'aldemar', 'administrador', 'ij9fmh3v7qlvgha2tlu6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balances_diarios`
--
ALTER TABLE `balances_diarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gastos_y_vales`
--
ALTER TABLE `gastos_y_vales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otrosingresos_tb`
--
ALTER TABLE `otrosingresos_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos_tb`
--
ALTER TABLE `pedidos_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos_tb3`
--
ALTER TABLE `productos_tb3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios_tb`
--
ALTER TABLE `usuarios_tb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balances_diarios`
--
ALTER TABLE `balances_diarios`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gastos_y_vales`
--
ALTER TABLE `gastos_y_vales`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `otrosingresos_tb`
--
ALTER TABLE `otrosingresos_tb`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pedidos_tb`
--
ALTER TABLE `pedidos_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `productos_tb3`
--
ALTER TABLE `productos_tb3`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `usuarios_tb`
--
ALTER TABLE `usuarios_tb`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
