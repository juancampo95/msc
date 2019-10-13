-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2019 at 10:22 PM
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
  `detalle_pedidos` longtext COLLATE utf8_spanish_ci NOT NULL,
  `detalle_gastos` text COLLATE utf8_spanish_ci NOT NULL,
  `detalle_otros_ingresos` text COLLATE utf8_spanish_ci NOT NULL,
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

INSERT INTO `balances_diarios` (`id`, `usuario`, `base_i_b`, `base_i_m`, `pedidos_facturados`, `datafono`, `online`, `otros_ingresos`, `total_ingresos`, `compras_gastos`, `vales`, `total_gastos`, `total_resumen`, `detalle_pedidos`, `detalle_gastos`, `detalle_otros_ingresos`, `billetes_a`, `monedas_a`, `datafono_a`, `online_a`, `total_arqueo`, `descuadre`, `cuadrado`, `fecha_ini`, `hora_ini`, `fecha_fin`, `hora_fin`) VALUES
(6, 'jose', 800000, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', '0', 0, 0, 0, 0, 0, 0, 'no', '6/12/2019', '3:25:28 PM', 'sin fecha final', 'sin hora final'),
(7, 'juancampo95', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, 0, 'no', '9/20/2019', '11:45:54 AM', '', '');

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

-- --------------------------------------------------------

--
-- Table structure for table `pedidos_tb`
--

CREATE TABLE `pedidos_tb` (
  `id` int(11) NOT NULL,
  `id_resumen` int(100) NOT NULL,
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
(27, 'Salchipapa de Costilla', 'Costilla, queso, ripio, papa y salchicha', 1, 14000, 14000, 's_costi.jpg', 0, 'comida'),
(28, 'Salchipapa Especial Personal', 'Tocineta, pollo, queso, ripio, salsas, papa y salchicha.', 1, 14000, 14000, 'f_gratinada.jpg', 0, 'comida'),
(29, 'Salchipapa Especial Grande', 'Tocineta, pollo, queso, ripio, salsas, papa y salchicha.', 1, 17000, 17000, 'f_gratinada.jpg', 0, 'comida'),
(30, 'Salchipapa Super Especial Personal', 'Tocineta, pollo, maiz, queso, ripio, salsas, papa y salchicha.', 1, 16000, 16000, 'supoercostilla.jpg', 0, 'comida'),
(31, 'Salchipapa Super Especial Grande', 'Tocineta, pollo, maiz, queso, ripio, salsas, papa y salchicha.', 1, 20000, 20000, 'supoercostilla.jpg', 0, 'comida'),
(32, 'Salchipapa Mega Hamburguesa', 'Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.', 1, 25000, 25000, 'hbmegaHB.jpg', 0, 'comida'),
(33, 'Salchipapa Mega Especial', 'Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.', 1, 28000, 28000, 'mgmega.jpg', 0, 'comida'),
(34, 'Pizza personal Mixta', 'Dos ingredientes diferentes', 1, 10000, 10000, 'p_pizzapp.jpg', 0, 'comida'),
(35, 'Pizza Personal Hawaiana', 'Pina calada, queso doble crema y jamon', 1, 8000, 8000, 'p_pizzapp.jpg', 0, 'comida'),
(36, 'Pizza Personal Jamon y Queso', 'Jamon y Queso doble crema', 1, 8000, 8000, 'p_pizzapp.jpg', 0, 'comida'),
(37, 'Pizza Personal Napolitana', 'Tomate, oregano y queso doble crema', 1, 8000, 8000, 'p_pizzapp.jpg', 0, 'comida'),
(38, 'Pizza Personal Pollo Champinones', 'Pollo, champinones y queso.', 1, 8000, 8000, 'p_pizzapp.jpg', 0, 'comida'),
(39, 'Pizza Personal Pollo Jamon', 'Pollo, jamon y queso.', 1, 8000, 8000, 'p_pizzapp.jpg', 0, 'comida'),
(40, 'Pizza Personal Pepperoni', 'Pepperoni y queso doble crema', 1, 8000, 8000, 'p_pizzapp.jpg', 0, 'comida'),
(41, 'Pizza Personal De La Casa', 'Maduro, tocineta, jamon, queso.', 1, 9000, 9000, 'p_pizzapp.jpg', 0, 'comida'),
(42, 'Pizza Personal 3 Carnes', 'Pepperoni, salami, jamon y queso.', 1, 9000, 9000, 'p_pizzapp.jpg', 0, 'comida'),
(43, 'Pizza Personal Campesina', 'Tocineta, maiz dulce, jamon y queso.', 1, 9000, 9000, 'p_pizzapp.jpg', 0, 'comida'),
(44, 'Pizza Mediana Mixta', 'Dos sabores diferentes', 1, 23000, 23000, 'f_ppm.jpg', 0, 'comida'),
(45, 'Pizza Mediana Hawaiana', 'Pina calada, queso, jamon', 1, 19000, 19000, 'f_ppm.jpg', 0, 'comida'),
(46, 'Pizza Mediana Jamon y Queso', 'Jamon y queso doble crema.', 1, 19000, 19000, 'f_ppm.jpg', 0, 'comida'),
(47, 'Pizza Mediana Napolitana', 'Tomate, oregano, queso doble crema', 1, 19000, 19000, 'f_ppm.jpg', 0, 'comida'),
(48, 'Pizza Mediana Pollo Champinones', 'Pollo, champinones y queso.', 1, 21000, 21000, 'f_ppm.jpg', 0, 'comida'),
(49, 'Pizza Mediana Pollo Jamon', 'Pollo, jamon y queso.', 1, 21000, 21000, 'f_ppm.jpg', 0, 'comida'),
(50, 'Pizza Mediana Pepperoni', 'Pepperoni y queso.', 1, 21000, 21000, 'f_ppm.jpg', 0, 'comida'),
(51, 'Pizza Mediana De La Casa', 'Maduro, tocineta, jamon y queso.', 1, 23000, 23000, 'f_ppm.jpg', 0, 'comida'),
(52, 'Pizza Mediana 3 Carnes', 'Pepperoni, salami, jamon y queso.', 1, 23000, 23000, 'f_ppm.jpg', 0, 'comida'),
(53, 'Pizza Mediana Campesina', 'Tocineta, maiz dulce, jamon y queso doble crema.', 1, 23000, 23000, 'f_ppm.jpg', 0, 'comida'),
(54, 'Filete de Res', '300 gr de lomo caracho, papas francesas, ensalada.', 1, 16000, 16000, 'f_res.jpg', 0, 'comida'),
(55, 'Filete de Pollo', '300gr de pernil, papas a la francesa, ensalada, salsas.', 1, 16000, 16000, 'f_res.jpg', 0, 'comida'),
(56, 'Costilla Ahumada Personal', '250gr Costilla, papas a la francesa, ensalada y salsas.', 1, 10000, 10000, 'f_costilla.jpg', 0, 'comida'),
(57, 'Costilla Ahumada Grande', '400gr Costilla, papas a la francesa, ensalada y salsas.', 1, 16000, 16000, 'f_costilla.jpg', 0, 'comida'),
(58, 'Sandwich mixto', 'combinacion de dos sabores', 1, 12000, 12000, 'sdsd.jpg', 0, 'comida'),
(59, 'Sandwich Jamon y Queso', 'Salami, peperoni, jamon queso, lechuga y salsa de ajo', 1, 8000, 8000, 'f_sandwichcarne.jpg', 0, 'comida'),
(60, 'Sandwich Cordero', 'Jamon de cordero, salami, pepperoni, queso, lechuga y salsa', 1, 8000, 8000, 'f_sandwichjamon.jpg', 0, 'comida'),
(61, 'Sandwich pollo', 'filete de pollo, salami, pepperoni, queso, lechuga y salsa', 1, 8000, 8000, 'f_sandwichcarne.jpg', 0, 'comida'),
(62, 'Sandwich Hawaiano', 'pina calada, salami, pepperoni, queso, jamon lechuga y salsa', 1, 8000, 8000, 'f_sandwichjamon.jpg', 0, 'comida'),
(63, 'Sandwich Tocineta', 'tocineta, salami, pepperoni, queso, lechuga y salsa', 1, 8000, 8000, 'f_sandwichcarne.jpg', 0, 'comida'),
(64, 'Sandwich Carne', 'Carne desmechada, salami, pepperoni, queso, lechuga y salsa', 1, 8000, 8000, 'f_sandwichcarne.jpg', 0, 'comida'),
(65, 'Combo para Sandwich', 'Aplicar el combo para el sandwich', 1, 5000, 5000, 'sdsd.jpg', 0, 'comida'),
(66, 'Maicitos de Pollo Personal', 'maicitos, pollo queso', 1, 11000, 11000, 'f_maicitos.jpg', 0, 'comida'),
(67, 'Maicitos Rancheros Personales', 'maicitos con salchicha ranchera', 1, 11000, 11000, 'f_maicitos.jpg', 0, 'comida'),
(68, 'Maicitos Tocineta Personal', 'Tocineta, maiz y queso', 1, 11000, 11000, 'f_maicitos.jpg', 0, 'comida'),
(69, 'Maicitos Carne Personal', 'Carne desmechada, maiz y queso', 1, 11000, 11000, 'f_maicitos.jpg', 0, 'comida'),
(70, 'Maicitos Pollo Grande', 'Pollo maicitos grandes', 1, 18000, 18000, 'g_maicitos_g.jpg', 0, 'comida'),
(71, 'Maicitos Rancheros Grande', 'Rancheros maicitos grandes', 1, 18000, 18000, 'g_maicitos_g.jpg', 0, 'comida'),
(72, 'Maicitos Tocineta Grande', 'Tocineta maicitos grandes', 1, 18000, 18000, 'g_maicitos_g.jpg', 0, 'comida'),
(73, 'Maicitos Carne Grande', 'Carne maicitos grandes', 1, 18000, 18000, 'g_maicitos_g.jpg', 0, 'comida'),
(74, 'Adicion Ensalada', 'lechuga tomate salsa', 1, 4000, 4000, 'f_ensalada.jpg', 0, 'comida'),
(75, 'Adicion Cebolla', 'Adicion cebolla con bbq', 1, 2500, 2500, 'ff_cebllo.jpg', 0, 'comida'),
(76, 'Adicion Queso', 'Adicion queso dos lonjas', 1, 2500, 2500, 'ff_queso.jpg', 0, 'comida'),
(77, 'Adicion Carne Hamburguesa', 'Adicion Carne de Hamburguesa', 1, 4000, 4000, 'ff_carnehb.jpg', 0, 'comida'),
(78, 'Adicion Carne Desmechada', 'Adicion Carne Desmechada', 1, 4000, 4000, 'ff_carnedes.jpg', 0, 'comida'),
(79, 'Adicion Pollo Desmechado', 'Adicion Pollo Desmechado', 1, 4000, 4000, 'ff_pollodes.jpg', 0, 'comida'),
(80, 'Adicion Tocineta', 'Adicion Tocineta', 1, 4000, 4000, 'ff_tocineta.jpg', 0, 'comida'),
(81, 'Adicion Maiz ', 'Adicion Maiz ', 1, 4000, 4000, 'ff_maiz.jpg', 0, 'comida'),
(82, 'Adicion Ranchera', 'Adicion Ranchera', 1, 5500, 5500, 'ff_ranchera.jpg', 0, 'comida'),
(83, 'Adicion Costilla', 'Adicion Costilla', 1, 5500, 5500, 'ff_costilla.jpg', 0, 'comida'),
(84, 'Adicion Papa Amarilla', 'Adicion Papa Amarilla', 1, 4000, 4000, 'f_papamaralla.jpg', 0, 'comida'),
(85, 'Adicion Francesa Personal', 'Adicion Francesa Personal 5000', 1, 5000, 5000, 'f_francesas.jpg', 0, 'comida'),
(86, 'Adicion Francesa Personal', 'Adicion Francesa Personal 7000', 1, 7000, 7000, 'f_francesas.jpg', 0, 'comida'),
(88, 'Postobon 400ml', 'Uva Manzana Pepsi Colombiana', 1, 2500, 2500, 'f_postobon.jpg', 0, 'bebida'),
(89, 'Postobon 2 Litros', 'Uva Manzana Pepsi Colombiana', 1, 4000, 4000, 'f_postobon.jpg', 0, 'bebida'),
(90, 'Postobon 3 Lts', 'Uva Manzana Pepsi Colombiana', 1, 7000, 7000, 'f_postobon.jpg', 0, 'bebida'),
(91, 'Hit Personal 500ml', 'Mora, Frutos Tropicales, Mango, Naranja Pina', 1, 2500, 2500, 'f_hit500.jpg', 0, 'bebida'),
(92, 'Hit Caja Litro', 'Mora, Frutos Tropicales, Mango, Naranja Pina', 1, 3500, 3500, 'f_hit500.jpg', 0, 'bebida'),
(93, 'Mr Tea 500ml', 'Limon y durazno', 1, 2500, 2500, 'f_mrtea.jpg', 0, 'bebida'),
(94, 'Botella Agua', 'Botella con agua', 1, 2500, 2500, 'aguaagua.jpg', 0, 'bebida'),
(95, 'Jugo de Limonada JARRA', 'Jarra de Limonada', 1, 7000, 7000, 'f_jugolimoana.jpg', 0, 'bebida'),
(96, 'Jugo de Limonada', 'Jugo de Limonada', 1, 3500, 3500, 'f_jugolimoana.jpg', 0, 'bebida'),
(97, 'Jugo de Mango Agua', 'Jugo de Mango Agua', 1, 4000, 4000, 'f_jugomango.jpg', 0, 'bebida'),
(98, 'Jugo de Mango Leche', 'Jugo de Mango Leche', 1, 5000, 5000, 'f_jugomango.jpg', 0, 'bebida'),
(99, 'Jugo de Mora Agua', 'Jugo de Mora Agua', 1, 4000, 4000, 'f_jugomora.jpg', 0, 'bebida'),
(100, 'Jugo de Mora Leche', 'Jugo de Mora Leche', 1, 5000, 5000, 'f_jugomora.jpg', 0, 'bebida'),
(101, 'Jugo de Fresa Agua', 'Jugo de Fresa Agua', 1, 4000, 4000, 'f_jugofresa.jpg', 0, 'bebida'),
(102, 'Jugo de Fresa Leche', 'Jugo de Fresa Leche', 1, 5000, 5000, 'f_jugofresa.jpg', 0, 'bebida'),
(103, 'Jugo de Guanabana Agua', 'Jugo de Guanabana Agua', 1, 4000, 4000, 'f_jugoguanabana.jpg', 0, 'bebida'),
(104, 'Jugo de Guanabana Leche', 'Jugo de Guanabana Leche', 1, 5000, 5000, 'f_jugoguanabana.jpg', 0, 'bebida'),
(105, 'Jugo de Lulo Agua', 'Jugo de Lulo Agua', 1, 4000, 4000, 'f_jugolulo.jpg', 0, 'bebida'),
(106, 'Jugo de Lulo Leche', 'Jugo de Lulo Leche', 1, 5000, 5000, 'f_jugolulo.jpg', 0, 'bebida'),
(126, 'Jugo de Maracuya Agua', 'Jugo de Maracuya Agua', 1, 4000, 4000, 'f_jugomaracuya.jpg', 0, 'bebida'),
(127, 'Jugo de Maracuya Leche', 'Jugo de Maracuya Leche', 1, 5000, 5000, 'f_jugomaracuya.jpg', 0, 'bebida'),
(128, 'HB Combo Doble Burger 25000', '2 burgers, 2 francesas, 2 litros', 1, 25000, 25000, 'd_burgersd.jpg', 0, 'comida'),
(129, 'HB Combo Doble Burger 29000', '2 burgers especiales, 2 francesas, 2 litros', 1, 29000, 29000, 'd_burgersd.jpg', 0, 'comida'),
(130, 'Cerveza en lata', 'Poker, Light, Club', 1, 4000, 4000, 'g_cerveza.jpg', 0, 'bebida'),
(131, 'Cerveza Corona', 'Corona botella vidrio', 1, 6500, 6500, 'co_cerveza.jpg', 0, 'bebida');

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
(1, 'juancampo95', 'camilocampo', 'administrador', 'yglh66iq8ng6818xmk78'),
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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otrosingresos_tb`
--
ALTER TABLE `otrosingresos_tb`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pedidos_tb`
--
ALTER TABLE `pedidos_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productos_tb3`
--
ALTER TABLE `productos_tb3`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `usuarios_tb`
--
ALTER TABLE `usuarios_tb`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
