-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2019 at 08:40 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

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
(7, 'juancampo95', 1724000, 21100, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, 0, 'no', '9/20/2019', '11:45:54 AM', '', '');

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
(2, 7, '13/10/2019', 'albahaca', 'gasto', 500, 'juancampo95'),
(3, 7, '13/10/2019', 'Guabal', 'gasto', 246100, 'juancampo95'),
(4, 7, '13/10/2019', 'Floralia', 'gasto', 135800, 'juancampo95'),
(5, 7, '13/10/2019', 'salsa rosada', 'gasto', 15500, 'juancampo95'),
(6, 7, '13/10/2019', 'salsa bbq', 'gasto', 14000, 'juancampo95'),
(7, 7, '14/10/2019', 'jean carlo gastos y turno', 'gasto', 49000, 'juancampo95'),
(8, 7, '14/10/2019', 'Nomina', 'gasto', 1308500, 'juancampo95'),
(9, 7, '14/10/2019', 'basura', 'gasto', 2500, 'juancampo95');

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
(1, 7, '14/10/2019', 'Entrega Jean Carlo', 431750, 'juancampo95');

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

--
-- Dumping data for table `pedidos_tb`
--

INSERT INTO `pedidos_tb` (`id`, `id_resumen`, `fecha`, `hora`, `cliente`, `documento`, `mesero`, `metodo`, `comentario`, `mesa`, `subtotal_p`, `total_p`, `descuento`, `productos`, `estado`, `pagadocon`, `devuelta`, `usuario`) VALUES
(3, 0, '13/10/2019', '17:11:40', 'clientes', '21321', 'Caja', 'Efectivo', '', 3, 20000, 20000, 0, '[{\"0\":\"30\",\"1\":\"Salchipapa Super Especial Personal\",\"2\":\"Tocineta, pollo, maiz, queso, ripio, salsas, papa y salchicha.\",\"3\":\"1\",\"4\":\"16000\",\"5\":\"16000\",\"6\":\"supoercostilla.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"30\",\"nombre\":\"Salchipapa Super Especial Personal\",\"descripcion\":\"Tocineta, pollo, maiz, queso, ripio, salsas, papa y salchicha.\",\"cantidad\":\"1\",\"v_unidad\":\"16000\",\"v_total\":16000,\"foto\":\"supoercostilla.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"89\",\"1\":\"Postobon 2 Litros\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"4000\",\"5\":\"4000\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"89\",\"nombre\":\"Postobon 2 Litros\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"4000\",\"v_total\":4000,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 20000, 0, 'juancampo95'),
(4, 0, '13/10/2019', '17:29:45', 'motociclista', '3321', 'Caja', 'Efectivo', '', 0, 17000, 17000, 0, '[{\"0\":\"29\",\"1\":\"Salchipapa Especial Grande\",\"2\":\"Tocineta, pollo, queso, ripio, salsas, papa y salchicha.\",\"3\":\"1\",\"4\":\"17000\",\"5\":\"17000\",\"6\":\"f_gratinada.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"29\",\"nombre\":\"Salchipapa Especial Grande\",\"descripcion\":\"Tocineta, pollo, queso, ripio, salsas, papa y salchicha.\",\"cantidad\":\"1\",\"v_unidad\":\"17000\",\"v_total\":17000,\"foto\":\"f_gratinada.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 17000, 0, 'juancampo95'),
(5, 0, '13/10/2019', '17:57:45', 'pareja rappi', '2131', 'Caja', 'Efectivo', '', 10, 25000, 25000, 0, '[{\"0\":\"32\",\"1\":\"Salchipapa Mega Hamburguesa\",\"2\":\"Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"hbmegaHB.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"32\",\"nombre\":\"Salchipapa Mega Hamburguesa\",\"descripcion\":\"Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"hbmegaHB.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 25000, 0, 'juancampo95'),
(6, 0, '13/10/2019', '18:30:28', 'pareja ventilador', '32423', 'Caja', 'Efectivo', '', 1, 36000, 36000, 0, '[{\"0\":\"33\",\"1\":\"Salchipapa Mega Especial\",\"2\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"28000\",\"5\":\"28000\",\"6\":\"mgmega.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"33\",\"nombre\":\"Salchipapa Mega Especial\",\"descripcion\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"28000\",\"v_total\":28000,\"foto\":\"mgmega.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"130\",\"1\":\"Cerveza en lata\",\"2\":\"Poker, Light, Club\",\"3\":\"1\",\"4\":\"4000\",\"5\":\"4000\",\"6\":\"g_cerveza.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"130\",\"nombre\":\"Cerveza en lata\",\"descripcion\":\"Poker, Light, Club\",\"cantidad\":2,\"v_unidad\":\"4000\",\"v_total\":8000,\"foto\":\"g_cerveza.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 36000, 0, 'juancampo95'),
(7, 0, '13/10/2019', '17:58:35', 'cliente', '342', 'Caja', 'Efectivo', '', 0, 25000, 25000, 0, '[{\"0\":\"32\",\"1\":\"Salchipapa Mega Hamburguesa\",\"2\":\"Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"hbmegaHB.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"32\",\"nombre\":\"Salchipapa Mega Hamburguesa\",\"descripcion\":\"Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"hbmegaHB.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 25000, 0, 'juancampo95'),
(8, 0, '13/10/2019', '18:48:46', 'mesa 14', '23456', 'Caja', 'Efectivo', '', 14, 32000, 32000, 0, '[{\"0\":\"67\",\"1\":\"Maicitos Rancheros Personales\",\"2\":\"maicitos con salchicha ranchera\",\"3\":\"1\",\"4\":\"11000\",\"5\":\"11000\",\"6\":\"f_maicitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"67\",\"nombre\":\"Maicitos Rancheros Personales\",\"descripcion\":\"maicitos con salchicha ranchera\",\"cantidad\":\"1\",\"v_unidad\":\"11000\",\"v_total\":11000,\"foto\":\"f_maicitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"66\",\"1\":\"Maicitos de Pollo Personal\",\"2\":\"maicitos, pollo queso\",\"3\":\"1\",\"4\":\"11000\",\"5\":\"11000\",\"6\":\"f_maicitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"66\",\"nombre\":\"Maicitos de Pollo Personal\",\"descripcion\":\"maicitos, pollo queso\",\"cantidad\":\"1\",\"v_unidad\":\"11000\",\"v_total\":11000,\"foto\":\"f_maicitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"102\",\"1\":\"Jugo de Fresa Leche\",\"2\":\"Jugo de Fresa Leche\",\"3\":\"1\",\"4\":\"5000\",\"5\":\"5000\",\"6\":\"f_jugofresa.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"102\",\"nombre\":\"Jugo de Fresa Leche\",\"descripcion\":\"Jugo de Fresa Leche\",\"cantidad\":\"1\",\"v_unidad\":\"5000\",\"v_total\":5000,\"foto\":\"f_jugofresa.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"127\",\"1\":\"Jugo de Maracuya Leche\",\"2\":\"Jugo de Maracuya Leche\",\"3\":\"1\",\"4\":\"5000\",\"5\":\"5000\",\"6\":\"f_jugomaracuya.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"127\",\"nombre\":\"Jugo de Maracuya Leche\",\"descripcion\":\"Jugo de Maracuya Leche\",\"cantidad\":\"1\",\"v_unidad\":\"5000\",\"v_total\":5000,\"foto\":\"f_jugomaracuya.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 32000, 0, 'juancampo95'),
(9, 0, '13/10/2019', '18:43:30', 'clientes fieles', '342432', 'Caja', 'Efectivo', '', 2, 20000, 20000, 0, '[{\"0\":\"38\",\"1\":\"Pizza Personal Pollo Champinones\",\"2\":\"Pollo, champinones y queso.\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"38\",\"nombre\":\"Pizza Personal Pollo Champinones\",\"descripcion\":\"Pollo, champinones y queso.\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"40\",\"1\":\"Pizza Personal Pepperoni\",\"2\":\"Pepperoni y queso doble crema\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"40\",\"nombre\":\"Pizza Personal Pepperoni\",\"descripcion\":\"Pepperoni y queso doble crema\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"89\",\"1\":\"Postobon 2 Litros\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"4000\",\"5\":\"4000\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"89\",\"nombre\":\"Postobon 2 Litros\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"4000\",\"v_total\":4000,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 20000, 0, 'juancampo95'),
(10, 0, '13/10/2019', '19:06:27', 'familia', '3213213', 'Caja', 'Datafono', '', 8, 28000, 28000, 0, '[{\"0\":\"33\",\"1\":\"Salchipapa Mega Especial\",\"2\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"28000\",\"5\":\"28000\",\"6\":\"mgmega.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"33\",\"nombre\":\"Salchipapa Mega Especial\",\"descripcion\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"28000\",\"v_total\":28000,\"foto\":\"mgmega.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 28000, 0, 'juancampo95'),
(11, 0, '13/10/2019', '19:22:08', 'pareja', '32423', 'Caja', 'Efectivo', '', 10, 25000, 25000, 0, '[{\"0\":\"128\",\"1\":\"HB Combo Doble Burger 25000\",\"2\":\"2 burgers, 2 francesas, 2 litros\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"d_burgersd.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"128\",\"nombre\":\"HB Combo Doble Burger 25000\",\"descripcion\":\"2 burgers, 2 francesas, 2 litros\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"d_burgersd.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 25000, 0, 'juancampo95'),
(12, 0, '13/10/2019', '19:45:56', 'seÃ±oras', '241231', 'Caja', 'Efectivo', '', 2, 10500, 10500, 0, '[{\"0\":\"35\",\"1\":\"Pizza Personal Hawaiana\",\"2\":\"Pina calada, queso doble crema y jamon\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"35\",\"nombre\":\"Pizza Personal Hawaiana\",\"descripcion\":\"Pina calada, queso doble crema y jamon\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"91\",\"1\":\"Hit Personal 500ml\",\"2\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"f_hit500.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"91\",\"nombre\":\"Hit Personal 500ml\",\"descripcion\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"f_hit500.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 0, 0, 'juancampo95'),
(13, 0, '13/10/2019', '19:31:39', 'seÃ±ora', '76567', 'Caja', 'Efectivo', '', 0, 14000, 14000, 0, '[{\"0\":\"27\",\"1\":\"Salchipapa de Costilla\",\"2\":\"Costilla, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"14000\",\"5\":\"14000\",\"6\":\"s_costi.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"27\",\"nombre\":\"Salchipapa de Costilla\",\"descripcion\":\"Costilla, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"14000\",\"v_total\":14000,\"foto\":\"s_costi.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 14000, 0, 'juancampo95'),
(14, 0, '13/10/2019', '19:38:01', 'jhkjh', '44556', 'Caja', 'Efectivo', '', 0, 24000, 24000, 0, '[{\"0\":\"27\",\"1\":\"Salchipapa de Costilla\",\"2\":\"Costilla, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"14000\",\"5\":\"14000\",\"6\":\"s_costi.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"27\",\"nombre\":\"Salchipapa de Costilla\",\"descripcion\":\"Costilla, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"14000\",\"v_total\":14000,\"foto\":\"s_costi.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"21\",\"1\":\"Salchipapa de Carne Personal\",\"2\":\"Carne desmechada, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"10000\",\"5\":\"10000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"21\",\"nombre\":\"Salchipapa de Carne Personal\",\"descripcion\":\"Carne desmechada, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"10000\",\"v_total\":10000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(15, 0, '13/10/2019', '19:55:22', 'sra', '2321', 'Caja', 'Efectivo', '', 0, 8000, 8000, 0, '[{\"0\":\"63\",\"1\":\"Sandwich Tocineta\",\"2\":\"tocineta, salami, pepperoni, queso, lechuga y salsa\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"f_sandwichcarne.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"63\",\"nombre\":\"Sandwich Tocineta\",\"descripcion\":\"tocineta, salami, pepperoni, queso, lechuga y salsa\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"f_sandwichcarne.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 8000, 0, 'juancampo95'),
(16, 0, '13/10/2019', '20:08:41', 'jgj', '34354', 'Caja', 'Efectivo', '', 0, 14500, 14500, 0, '[{\"0\":\"24\",\"1\":\"Salchipapa de HB Grande\",\"2\":\"Carne de hamburguesa, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"24\",\"nombre\":\"Salchipapa de HB Grande\",\"descripcion\":\"Carne de hamburguesa, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"12000\",\"v_total\":12000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"76\",\"1\":\"Adicion Queso\",\"2\":\"Adicion queso dos lonjas\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"ff_queso.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"76\",\"nombre\":\"Adicion Queso\",\"descripcion\":\"Adicion queso dos lonjas\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"ff_queso.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 14500, 0, 'juancampo95'),
(17, 0, '13/10/2019', '20:23:19', 'muchasfdas', '31221', 'Caja', 'Efectivo', 'sin salsas - COLOMBIANA', 10, 25000, 25000, 0, '[{\"0\":\"32\",\"1\":\"Salchipapa Mega Hamburguesa\",\"2\":\"Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"hbmegaHB.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"32\",\"nombre\":\"Salchipapa Mega Hamburguesa\",\"descripcion\":\"Carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"hbmegaHB.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(18, 0, '13/10/2019', '21:16:44', 'sr', '345', 'Caja', 'Efectivo', '', 7, 10500, 10500, 0, '[{\"0\":\"38\",\"1\":\"Pizza Personal Pollo Champinones\",\"2\":\"Pollo, champinones y queso.\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"38\",\"nombre\":\"Pizza Personal Pollo Champinones\",\"descripcion\":\"Pollo, champinones y queso.\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"88\",\"1\":\"Postobon 400ml\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"88\",\"nombre\":\"Postobon 400ml\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 10500, 0, 'juancampo95'),
(19, 0, '13/10/2019', '21:17:24', 'familia', '3413', 'Caja', 'Efectivo', '', 14, 49500, 49500, 0, '[{\"0\":\"56\",\"1\":\"Costilla Ahumada Personal\",\"2\":\"250gr Costilla, papas a la francesa, ensalada y salsas.\",\"3\":\"1\",\"4\":\"10000\",\"5\":\"10000\",\"6\":\"f_costilla.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"56\",\"nombre\":\"Costilla Ahumada Personal\",\"descripcion\":\"250gr Costilla, papas a la francesa, ensalada y salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"10000\",\"v_total\":10000,\"foto\":\"f_costilla.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"36\",\"1\":\"Pizza Personal Jamon y Queso\",\"2\":\"Jamon y Queso doble crema\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"36\",\"nombre\":\"Pizza Personal Jamon y Queso\",\"descripcion\":\"Jamon y Queso doble crema\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"129\",\"1\":\"HB Combo Doble Burger 29000\",\"2\":\"2 burgers especiales, 2 francesas, 2 litros\",\"3\":\"1\",\"4\":\"29000\",\"5\":\"29000\",\"6\":\"d_burgersd.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"129\",\"nombre\":\"HB Combo Doble Burger 29000\",\"descripcion\":\"2 burgers especiales, 2 francesas, 2 litros\",\"cantidad\":\"1\",\"v_unidad\":\"29000\",\"v_total\":29000,\"foto\":\"d_burgersd.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"91\",\"1\":\"Hit Personal 500ml\",\"2\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"f_hit500.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"91\",\"nombre\":\"Hit Personal 500ml\",\"descripcion\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"f_hit500.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 0, 0, 'juancampo95'),
(20, 0, '13/10/2019', '22:10:52', 'familia grande', '3422', 'Caja', 'Efectivo', '', 2, 51500, 51500, 0, '[{\"0\":\"12\",\"1\":\"Salchipapa Sencilla Grande\",\"2\":\"Papa amarilla, salchicha y salsas\",\"3\":\"1\",\"4\":\"5500\",\"5\":\"5500\",\"6\":\"f_salchipapa.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"12\",\"nombre\":\"Salchipapa Sencilla Grande\",\"descripcion\":\"Papa amarilla, salchicha y salsas\",\"cantidad\":2,\"v_unidad\":\"5500\",\"v_total\":11000,\"foto\":\"f_salchipapa.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"44\",\"1\":\"Pizza Mediana Mixta\",\"2\":\"Dos sabores diferentes\",\"3\":\"1\",\"4\":\"23000\",\"5\":\"23000\",\"6\":\"f_ppm.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"44\",\"nombre\":\"Pizza Mediana Mixta\",\"descripcion\":\"Dos sabores diferentes\",\"cantidad\":\"1\",\"v_unidad\":\"23000\",\"v_total\":23000,\"foto\":\"f_ppm.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"98\",\"1\":\"Jugo de Mango Leche\",\"2\":\"Jugo de Mango Leche\",\"3\":\"1\",\"4\":\"5000\",\"5\":\"5000\",\"6\":\"f_jugomango.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"98\",\"nombre\":\"Jugo de Mango Leche\",\"descripcion\":\"Jugo de Mango Leche\",\"cantidad\":2,\"v_unidad\":\"5000\",\"v_total\":10000,\"foto\":\"f_jugomango.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"96\",\"1\":\"Jugo de Limonada\",\"2\":\"Jugo de Limonada\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"f_jugolimoana.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"96\",\"nombre\":\"Jugo de Limonada\",\"descripcion\":\"Jugo de Limonada\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"f_jugolimoana.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"89\",\"1\":\"Postobon 2 Litros\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"4000\",\"5\":\"4000\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"89\",\"nombre\":\"Postobon 2 Litros\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"4000\",\"v_total\":4000,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 51500, 0, 'juancampo95'),
(21, 0, '13/10/2019', '21:24:23', 'llevar', '2311', 'Caja', 'Efectivo', '', 0, 12000, 12000, 0, '[{\"0\":\"16\",\"1\":\"Salchipapa de Pollo Grande\",\"2\":\"Pollo desmechado, queso, ripio papa y salchicha\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"16\",\"nombre\":\"Salchipapa de Pollo Grande\",\"descripcion\":\"Pollo desmechado, queso, ripio papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"12000\",\"v_total\":12000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 12000, 0, 'juancampo95'),
(22, 0, '13/10/2019', '22:10:14', 'mesa 16', '21312', 'Caja', 'Efectivo', '', 16, 46000, 46000, 0, '[{\"0\":\"33\",\"1\":\"Salchipapa Mega Especial\",\"2\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"28000\",\"5\":\"28000\",\"6\":\"mgmega.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"33\",\"nombre\":\"Salchipapa Mega Especial\",\"descripcion\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"28000\",\"v_total\":28000,\"foto\":\"mgmega.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"66\",\"1\":\"Maicitos de Pollo Personal\",\"2\":\"maicitos, pollo queso\",\"3\":\"1\",\"4\":\"11000\",\"5\":\"11000\",\"6\":\"f_maicitos.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"66\",\"nombre\":\"Maicitos de Pollo Personal\",\"descripcion\":\"maicitos, pollo queso\",\"cantidad\":\"1\",\"v_unidad\":\"11000\",\"v_total\":11000,\"foto\":\"f_maicitos.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"95\",\"1\":\"Jugo de Limonada JARRA\",\"2\":\"Jarra de Limonada\",\"3\":\"1\",\"4\":\"7000\",\"5\":\"7000\",\"6\":\"f_jugolimoana.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"95\",\"nombre\":\"Jugo de Limonada JARRA\",\"descripcion\":\"Jarra de Limonada\",\"cantidad\":\"1\",\"v_unidad\":\"7000\",\"v_total\":7000,\"foto\":\"f_jugolimoana.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 46000, 0, 'juancampo95'),
(23, 0, '13/10/2019', '21:44:50', 'viene', '32423', 'Caja', 'Datafono', '', 0, 25000, 25000, 0, '[{\"0\":\"128\",\"1\":\"HB Combo Doble Burger 25000\",\"2\":\"2 burgers, 2 francesas, 2 litros\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"d_burgersd.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"128\",\"nombre\":\"HB Combo Doble Burger 25000\",\"descripcion\":\"2 burgers, 2 francesas, 2 litros\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"d_burgersd.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(24, 0, '13/10/2019', '21:49:44', 'paga 12mil con datafono', '32', 'Caja', 'Datafono', '', 9, 17000, 12000, 5000, '[{\"0\":\"29\",\"1\":\"Salchipapa Especial Grande\",\"2\":\"Tocineta, pollo, queso, ripio, salsas, papa y salchicha.\",\"3\":\"1\",\"4\":\"17000\",\"5\":\"17000\",\"6\":\"f_gratinada.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"29\",\"nombre\":\"Salchipapa Especial Grande\",\"descripcion\":\"Tocineta, pollo, queso, ripio, salsas, papa y salchicha.\",\"cantidad\":1,\"v_unidad\":\"17000\",\"v_total\":17000,\"foto\":\"f_gratinada.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(25, 0, '13/10/2019', '22:41:39', 'khk', '344', 'Caja', 'Efectivo', '', 3, 24500, 24500, 0, '[{\"0\":\"43\",\"1\":\"Pizza Personal Campesina\",\"2\":\"Tocineta, maiz dulce, jamon y queso.\",\"3\":\"1\",\"4\":\"9000\",\"5\":\"9000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"43\",\"nombre\":\"Pizza Personal Campesina\",\"descripcion\":\"Tocineta, maiz dulce, jamon y queso.\",\"cantidad\":\"1\",\"v_unidad\":\"9000\",\"v_total\":9000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"18\",\"1\":\"Salchipapa de Tocineta Grande\",\"2\":\"Tocineta, queso, ripio papa y salchicha\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"18\",\"nombre\":\"Salchipapa de Tocineta Grande\",\"descripcion\":\"Tocineta, queso, ripio papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"12000\",\"v_total\":12000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"92\",\"1\":\"Hit Caja Litro\",\"2\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"f_hit500.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"92\",\"nombre\":\"Hit Caja Litro\",\"descripcion\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"f_hit500.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 24500, 0, 'juancampo95'),
(26, 0, '13/10/2019', '22:14:56', 'PAGO DE 14MIL', '455', 'Caja', 'Efectivo', 'PAGO DE 14MIL', 0, 14000, 14000, 0, '[{\"0\":\"27\",\"1\":\"Salchipapa de Costilla\",\"2\":\"Costilla, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"14000\",\"5\":\"14000\",\"6\":\"s_costi.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"27\",\"nombre\":\"Salchipapa de Costilla\",\"descripcion\":\"Costilla, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"14000\",\"v_total\":14000,\"foto\":\"s_costi.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 14000, 0, 'juancampo95'),
(27, 0, '13/10/2019', '22:33:08', 'Ana Maria', '000', 'Caja', 'Efectivo', '', 0, 12500, 12500, 0, '[{\"0\":\"1\",\"1\":\"HB Artesanal de Res\",\"2\":\"Hamburguesa carne de res, tocineta, jamon, queso, lecucha, ripio y salsas.\",\"3\":\"1\",\"4\":\"10000\",\"5\":\"10000\",\"6\":\"f_hbres.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"HB Artesanal de Res\",\"descripcion\":\"Hamburguesa carne de res, tocineta, jamon, queso, lecucha, ripio y salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"10000\",\"v_total\":10000,\"foto\":\"f_hbres.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"88\",\"1\":\"Postobon 400ml\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"88\",\"nombre\":\"Postobon 400ml\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 10000, 0, 'juancampo95'),
(28, 0, '13/10/2019', '22:45:05', '4 personas', '0000', 'Caja', 'Efectivo', '', 6, 32000, 32000, 0, '[{\"0\":\"11\",\"1\":\"Salchipapa Sencilla Personal\",\"2\":\"Papa amarilla, salchicha y salsas\",\"3\":\"1\",\"4\":\"4500\",\"5\":\"4500\",\"6\":\"f_salchipapa.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"11\",\"nombre\":\"Salchipapa Sencilla Personal\",\"descripcion\":\"Papa amarilla, salchicha y salsas\",\"cantidad\":\"1\",\"v_unidad\":\"4500\",\"v_total\":4500,\"foto\":\"f_salchipapa.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"13\",\"1\":\"Salchipapa Gratinada Personal\",\"2\":\"Queso, Ripio, Papa amarilla, salchicha y salsas\",\"3\":\"1\",\"4\":\"6500\",\"5\":\"6500\",\"6\":\"f_gratinada.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"13\",\"nombre\":\"Salchipapa Gratinada Personal\",\"descripcion\":\"Queso, Ripio, Papa amarilla, salchicha y salsas\",\"cantidad\":\"1\",\"v_unidad\":\"6500\",\"v_total\":6500,\"foto\":\"f_gratinada.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"42\",\"1\":\"Pizza Personal 3 Carnes\",\"2\":\"Pepperoni, salami, jamon y queso.\",\"3\":\"1\",\"4\":\"9000\",\"5\":\"9000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"42\",\"nombre\":\"Pizza Personal 3 Carnes\",\"descripcion\":\"Pepperoni, salami, jamon y queso.\",\"cantidad\":\"1\",\"v_unidad\":\"9000\",\"v_total\":9000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"89\",\"1\":\"Postobon 2 Litros\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"4000\",\"5\":\"4000\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"89\",\"nombre\":\"Postobon 2 Litros\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"4000\",\"v_total\":4000,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"},{\"0\":\"8\",\"1\":\"Perro Americano\",\"2\":\"Salchicha Americana, jamon, queso y salsas caseras\",\"3\":\"1\",\"4\":\"8000\",\"5\":\"8000\",\"6\":\"f_perro.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"8\",\"nombre\":\"Perro Americano\",\"descripcion\":\"Salchicha Americana, jamon, queso y salsas caseras\",\"cantidad\":\"1\",\"v_unidad\":\"8000\",\"v_total\":8000,\"foto\":\"f_perro.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 32000, 0, 'juancampo95'),
(29, 0, '13/10/2019', '22:24:51', 'jhg', '345', 'Caja', 'Efectivo', '', 0, 14000, 14000, 0, '[{\"0\":\"27\",\"1\":\"Salchipapa de Costilla\",\"2\":\"Costilla, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"14000\",\"5\":\"14000\",\"6\":\"s_costi.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"27\",\"nombre\":\"Salchipapa de Costilla\",\"descripcion\":\"Costilla, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"14000\",\"v_total\":14000,\"foto\":\"s_costi.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 14000, 0, 'juancampo95'),
(30, 0, '13/10/2019', '22:30:44', 'clienta fiel', '000', 'Caja', 'Efectivo', '', 0, 5500, 5500, 0, '[{\"0\":\"12\",\"1\":\"Salchipapa Sencilla Grande\",\"2\":\"Papa amarilla, salchicha y salsas\",\"3\":\"1\",\"4\":\"5500\",\"5\":\"5500\",\"6\":\"f_salchipapa.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"12\",\"nombre\":\"Salchipapa Sencilla Grande\",\"descripcion\":\"Papa amarilla, salchicha y salsas\",\"cantidad\":\"1\",\"v_unidad\":\"5500\",\"v_total\":5500,\"foto\":\"f_salchipapa.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 5500, 0, 'juancampo95'),
(31, 0, '13/10/2019', '22:59:58', 'mesa 15', '000', 'Caja', 'Efectivo', '', 15, 28000, 28000, 0, '[{\"0\":\"33\",\"1\":\"Salchipapa Mega Especial\",\"2\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"28000\",\"5\":\"28000\",\"6\":\"mgmega.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"33\",\"nombre\":\"Salchipapa Mega Especial\",\"descripcion\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"28000\",\"v_total\":28000,\"foto\":\"mgmega.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 28000, 0, 'juancampo95'),
(32, 0, '13/10/2019', '23:58:30', 'Jean Carlo', '0000', 'Caja', 'Efectivo', '', 0, 12000, 12000, 0, '[{\"0\":\"24\",\"1\":\"Salchipapa de HB Grande\",\"2\":\"Carne de hamburguesa, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"24\",\"nombre\":\"Salchipapa de HB Grande\",\"descripcion\":\"Carne de hamburguesa, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"12000\",\"v_total\":12000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 12000, 0, 'juancampo95'),
(33, 0, '13/10/2019', '22:57:45', 'oscar', '0000', 'Caja', 'Efectivo', '', 0, 11500, 11500, 0, '[{\"0\":\"43\",\"1\":\"Pizza Personal Campesina\",\"2\":\"Tocineta, maiz dulce, jamon y queso.\",\"3\":\"1\",\"4\":\"9000\",\"5\":\"9000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"43\",\"nombre\":\"Pizza Personal Campesina\",\"descripcion\":\"Tocineta, maiz dulce, jamon y queso.\",\"cantidad\":\"1\",\"v_unidad\":\"9000\",\"v_total\":9000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"88\",\"1\":\"Postobon 400ml\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"88\",\"nombre\":\"Postobon 400ml\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'anulado', 0, 0, 'juancampo95'),
(34, 0, '13/10/2019', '23:39:46', 'pareja', '000', 'Caja', 'Efectivo', '', 2, 30000, 30000, 0, '[{\"0\":\"128\",\"1\":\"HB Combo Doble Burger 25000\",\"2\":\"2 burgers, 2 francesas, 2 litros\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"d_burgersd.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"128\",\"nombre\":\"HB Combo Doble Burger 25000\",\"descripcion\":\"2 burgers, 2 francesas, 2 litros\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"d_burgersd.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"85\",\"1\":\"Adicion Francesa Personal\",\"2\":\"Adicion Francesa Personal 5000\",\"3\":\"1\",\"4\":\"5000\",\"5\":\"5000\",\"6\":\"f_francesas.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"85\",\"nombre\":\"Adicion Francesa Personal\",\"descripcion\":\"Adicion Francesa Personal 5000\",\"cantidad\":\"1\",\"v_unidad\":\"5000\",\"v_total\":5000,\"foto\":\"f_francesas.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(35, 0, '14/10/2019', '0:09:10', 'pareja', '000', 'Caja', 'Efectivo', '', 13, 21000, 21000, 0, '[{\"0\":\"29\",\"1\":\"Salchipapa Especial Grande\",\"2\":\"Tocineta, pollo, queso, ripio, salsas, papa y salchicha.\",\"3\":\"1\",\"4\":\"17000\",\"5\":\"17000\",\"6\":\"f_gratinada.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"29\",\"nombre\":\"Salchipapa Especial Grande\",\"descripcion\":\"Tocineta, pollo, queso, ripio, salsas, papa y salchicha.\",\"cantidad\":\"1\",\"v_unidad\":\"17000\",\"v_total\":17000,\"foto\":\"f_gratinada.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"89\",\"1\":\"Postobon 2 Litros\",\"2\":\"Uva Manzana Pepsi Colombiana\",\"3\":\"1\",\"4\":\"4000\",\"5\":\"4000\",\"6\":\"f_postobon.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"89\",\"nombre\":\"Postobon 2 Litros\",\"descripcion\":\"Uva Manzana Pepsi Colombiana\",\"cantidad\":\"1\",\"v_unidad\":\"4000\",\"v_total\":4000,\"foto\":\"f_postobon.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 21000, 0, 'juancampo95'),
(36, 0, '14/10/2019', '0:00:03', 'pareja tv', '000', 'Caja', 'Efectivo', '', 16, 25000, 25000, 0, '[{\"0\":\"128\",\"1\":\"HB Combo Doble Burger 25000\",\"2\":\"2 burgers, 2 francesas, 2 litros\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"d_burgersd.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"128\",\"nombre\":\"HB Combo Doble Burger 25000\",\"descripcion\":\"2 burgers, 2 francesas, 2 litros\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"d_burgersd.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 25000, 0, 'juancampo95'),
(37, 0, '13/10/2019', '23:47:23', 'llevar pareja', '000', 'Caja', 'Efectivo', '', 0, 25000, 25000, 0, '[{\"0\":\"128\",\"1\":\"HB Combo Doble Burger 25000\",\"2\":\"2 burgers, 2 francesas, 2 litros\",\"3\":\"1\",\"4\":\"25000\",\"5\":\"25000\",\"6\":\"d_burgersd.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"128\",\"nombre\":\"HB Combo Doble Burger 25000\",\"descripcion\":\"2 burgers, 2 francesas, 2 litros\",\"cantidad\":\"1\",\"v_unidad\":\"25000\",\"v_total\":25000,\"foto\":\"d_burgersd.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 25000, 0, 'juancampo95'),
(38, 0, '14/10/2019', '0:18:00', '00', '00', 'Caja', 'Efectivo', '', 3, 28000, 28000, 0, '[{\"0\":\"33\",\"1\":\"Salchipapa Mega Especial\",\"2\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"3\":\"1\",\"4\":\"28000\",\"5\":\"28000\",\"6\":\"mgmega.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"33\",\"nombre\":\"Salchipapa Mega Especial\",\"descripcion\":\"Costilla, carne de Hb, tocineta, pollo, maiz, queso, ripio, salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"28000\",\"v_total\":28000,\"foto\":\"mgmega.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 28000, 0, 'juancampo95'),
(39, 0, '14/10/2019', '0:02:50', 'pago datafono domicilio', '2000', 'Caja', 'Datafono', 'se cobran 2mil de domicilio pago datafono', 0, 24000, 26000, -2000, '[{\"0\":\"20\",\"1\":\"Salchipapa Ranchera Grande\",\"2\":\"Salchicha ranchera, queso, ripio y papa\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"20\",\"nombre\":\"Salchipapa Ranchera Grande\",\"descripcion\":\"Salchicha ranchera, queso, ripio y papa\",\"cantidad\":2,\"v_unidad\":\"12000\",\"v_total\":24000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(40, 0, '14/10/2019', '0:59:48', 'Cliente Fiel', '000', 'Caja', 'Efectivo', '', 8, 14500, 14500, 0, '[{\"0\":\"24\",\"1\":\"Salchipapa de HB Grande\",\"2\":\"Carne de hamburguesa, queso, ripio, papa y salchicha\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"24\",\"nombre\":\"Salchipapa de HB Grande\",\"descripcion\":\"Carne de hamburguesa, queso, ripio, papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"12000\",\"v_total\":12000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"91\",\"1\":\"Hit Personal 500ml\",\"2\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"3\":\"1\",\"4\":\"2500\",\"5\":\"2500\",\"6\":\"f_hit500.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"91\",\"nombre\":\"Hit Personal 500ml\",\"descripcion\":\"Mora, Frutos Tropicales, Mango, Naranja Pina\",\"cantidad\":\"1\",\"v_unidad\":\"2500\",\"v_total\":2500,\"foto\":\"f_hit500.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 0, -14500, 'juancampo95'),
(41, 0, '14/10/2019', '0:27:56', 'Josneiker', '00', 'Caja', 'Efectivo', '', 0, 9000, 9000, 0, '[{\"0\":\"43\",\"1\":\"Pizza Personal Campesina\",\"2\":\"Tocineta, maiz dulce, jamon y queso.\",\"3\":\"1\",\"4\":\"9000\",\"5\":\"9000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"43\",\"nombre\":\"Pizza Personal Campesina\",\"descripcion\":\"Tocineta, maiz dulce, jamon y queso.\",\"cantidad\":\"1\",\"v_unidad\":\"9000\",\"v_total\":9000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 0, 0, 'juancampo95'),
(42, 0, '14/10/2019', '0:39:23', '0', '0', 'Caja', 'Efectivo', '', 6, 13500, 13500, 0, '[{\"0\":\"1\",\"1\":\"HB Artesanal de Res\",\"2\":\"Hamburguesa carne de res, tocineta, jamon, queso, lecucha, ripio y salsas.\",\"3\":\"1\",\"4\":\"10000\",\"5\":\"10000\",\"6\":\"f_hbres.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"1\",\"nombre\":\"HB Artesanal de Res\",\"descripcion\":\"Hamburguesa carne de res, tocineta, jamon, queso, lecucha, ripio y salsas.\",\"cantidad\":\"1\",\"v_unidad\":\"10000\",\"v_total\":10000,\"foto\":\"f_hbres.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"},{\"0\":\"96\",\"1\":\"Jugo de Limonada\",\"2\":\"Jugo de Limonada\",\"3\":\"1\",\"4\":\"3500\",\"5\":\"3500\",\"6\":\"f_jugolimoana.jpg\",\"7\":\"0\",\"8\":\"bebida\",\"id\":\"96\",\"nombre\":\"Jugo de Limonada\",\"descripcion\":\"Jugo de Limonada\",\"cantidad\":\"1\",\"v_unidad\":\"3500\",\"v_total\":3500,\"foto\":\"f_jugolimoana.jpg\",\"anadido\":\"1\",\"tipo\":\"bebida\"}]', 'facturado', 0, 0, 'juancampo95'),
(43, 0, '14/10/2019', '0:44:20', 'alex', '0', 'Caja', 'Efectivo', '', 0, 9000, 9000, 0, '[{\"0\":\"41\",\"1\":\"Pizza Personal De La Casa\",\"2\":\"Maduro, tocineta, jamon, queso.\",\"3\":\"1\",\"4\":\"9000\",\"5\":\"9000\",\"6\":\"p_pizzapp.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"41\",\"nombre\":\"Pizza Personal De La Casa\",\"descripcion\":\"Maduro, tocineta, jamon, queso.\",\"cantidad\":\"1\",\"v_unidad\":\"9000\",\"v_total\":9000,\"foto\":\"p_pizzapp.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 9000, 0, 'juancampo95'),
(44, 0, '14/10/2019', '1:12:18', '00', '00', 'Caja', 'Efectivo', '', 3, 12000, 12000, 0, '[{\"0\":\"16\",\"1\":\"Salchipapa de Pollo Grande\",\"2\":\"Pollo desmechado, queso, ripio papa y salchicha\",\"3\":\"1\",\"4\":\"12000\",\"5\":\"12000\",\"6\":\"f_salchi_in.jpg\",\"7\":\"0\",\"8\":\"comida\",\"id\":\"16\",\"nombre\":\"Salchipapa de Pollo Grande\",\"descripcion\":\"Pollo desmechado, queso, ripio papa y salchicha\",\"cantidad\":\"1\",\"v_unidad\":\"12000\",\"v_total\":12000,\"foto\":\"f_salchi_in.jpg\",\"anadido\":\"1\",\"tipo\":\"comida\"}]', 'facturado', 12000, 0, 'juancampo95');

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
(1, 'juancampo95', 'camilocampo', 'administrador', '96me6gubn038skd81qyb'),
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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `otrosingresos_tb`
--
ALTER TABLE `otrosingresos_tb`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pedidos_tb`
--
ALTER TABLE `pedidos_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
