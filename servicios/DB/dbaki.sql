-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2021 a las 07:43:53
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbaki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` int(25) NOT NULL,
  `nombre_articulo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `unidadmedida_articulo` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'UNAD',
  `codigo_articulo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio_articulo` decimal(19,2) NOT NULL DEFAULT 0.00,
  `flkpak_prenda` int(25) NOT NULL DEFAULT 1,
  `Id_Servicio` int(25) DEFAULT NULL,
  `estado_articulo` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `nombre_articulo`, `unidadmedida_articulo`, `codigo_articulo`, `precio_articulo`, `flkpak_prenda`, `Id_Servicio`, `estado_articulo`) VALUES
(1, 'ABRIGO', 'UNAD', '1', '23.00', 1, 5, 'Activo'),
(2, 'ABRIGO  NIÑO', 'UNAD', '2', '15.00', 1, 3, 'Activo'),
(3, 'ALMOHADA', 'UNAD', '3', '10.00', 1, 3, 'Activo'),
(4, 'ALMOHADA GRANDE', 'UNAD', '4', '15.00', 1, 3, 'Activo'),
(5, 'BABUCHAS', 'UNAD', '5', '10.00', 1, 3, 'Activo'),
(6, 'BABUCHAS  NIÑO', 'UNAD', '6', '8.00', 1, 3, 'Activo'),
(7, 'BERMUDA', 'UNAD', '7', '7.00', 1, 5, 'Activo'),
(8, 'BODY', 'UNAD', '8', '8.00', 1, 5, 'Activo'),
(9, 'BOLSA  DORMIR', 'UNAD', '9', '35.00', 1, 3, 'Activo'),
(10, 'BLUSA LLANA', 'UNAD', '10', '9.00', 1, 5, 'Activo'),
(11, 'BLUSA C/ APLICACIONES', 'UNAD', '11', '15.00', 1, 5, 'Activo'),
(12, 'BLUSA  SEDA', 'UNAD', '12', '10.00', 1, 5, 'Activo'),
(13, 'BUFANDA', 'UNAD', '13', '6.00', 1, 5, 'Activo'),
(14, 'BUZO (CASA-PANT)', 'UNAD', '14', '15.00', 1, 3, 'Activo'),
(15, 'BUZO  NIÑO (CASA-PANT)', 'UNAD', '15', '12.00', 1, 3, 'Activo'),
(16, 'CAMISA', 'UNAD', '16', '10.00', 1, 5, 'Activo'),
(17, 'CAMISA  SEDA', 'UNAD', '17', '12.00', 1, 5, 'Activo'),
(18, 'CAMISA  C/ ALMIDÓN', 'UNAD', '18', '12.00', 1, 2, 'Activo'),
(19, 'CASACA', 'UNAD', '19', '13.00', 1, 3, 'Activo'),
(20, 'CASACA  ACOLCHADA', 'UNAD', '20', '17.00', 1, 3, 'Activo'),
(21, 'CASACA  IMPERMEABLE', 'UNAD', '21', '25.00', 1, 3, 'Activo'),
(22, 'CASACA  PLUMAS', 'UNAD', '22', '25.00', 1, 3, 'Activo'),
(23, 'CAPA DELGADA', 'UNAD', '23', '12.00', 1, 5, 'Activo'),
(24, 'CAPA  ALPACA', 'UNAD', '24', '25.00', 1, 5, 'Activo'),
(25, 'CARTERA TEXTIL', 'UNAD', '25', '20.00', 1, 3, 'Activo'),
(26, 'COJIN CHICO', 'UNAD', '26', '8.00', 1, 3, 'Activo'),
(27, 'COJIN  ANATÓMICO', 'UNAD', '27', '18.00', 1, 3, 'Activo'),
(28, 'COLCHA PEQUEÑA', 'UNAD', '28', '13.00', 1, 3, 'Activo'),
(29, 'COLCHA GRANDE', 'UNAD', '29', '20.00', 1, 3, 'Activo'),
(30, 'COLCHA  MEDINA', 'UNAD', '30', '17.00', 1, 3, 'Activo'),
(31, 'CORTINA TUL (METRO)', 'UNAD', '31', '5.60', 1, 3, 'Activo'),
(33, 'CORTINA CENEFA (METRO)', 'UNAD', '33', '5.60', 1, 3, 'Activo'),
(34, 'CORBATA', 'UNAD', '34', '8.00', 1, 5, 'Activo'),
(35, 'CORBATA SEDA', 'UNAD', '35', '10.00', 1, 5, 'Activo'),
(36, 'CUBRECAMA  1 1/2 PLAZA', 'UNAD', '36', '27.00', 1, 3, 'Activo'),
(37, 'CUBRECAMA  2 PLAZA', 'UNAD', '37', '30.00', 1, 3, 'Activo'),
(38, 'CUBRECAMA  QUEEN', 'UNAD', '38', '40.00', 1, 3, 'Activo'),
(39, 'CUBRECAMA  KING', 'UNAD', '39', '50.00', 1, 3, 'Activo'),
(40, 'CHALECO VESTIR', 'UNAD', '40', '10.00', 1, 5, 'Activo'),
(41, 'CHAL - PASHMINA GRANDE', 'UNAD', '41', '12.00', 1, 2, 'Activo'),
(42, 'CHOMPA DELGADA', 'UNAD', '42', '10.00', 1, 5, 'Activo'),
(43, 'CHOMPA GRUESA', 'UNAD', '43', '12.00', 1, 5, 'Activo'),
(44, 'CHOMPA C/ APLICACIONES', 'UNAD', '44', '15.00', 1, 5, 'Activo'),
(45, 'CHOMPA ALPACA', 'UNAD', '45', '15.00', 1, 5, 'Activo'),
(46, 'CONJUNTO (2 PZA.)', 'UNAD', '46', '20.00', 1, 5, 'Activo'),
(47, 'EDREDON 1 1/2 PLAZA', 'UNAD', '47', '30.00', 1, 3, 'Activo'),
(48, 'EDREDON 2 PLAZA', 'UNAD', '48', '35.00', 1, 3, 'Activo'),
(49, 'EDREDON QUEEN', 'UNAD', '49', '40.00', 1, 3, 'Activo'),
(50, 'EDREDON KING', 'UNAD', '50', '50.00', 1, 3, 'Activo'),
(51, 'EDREDON PLUMAS 1 1/2 PLAZA', 'UNAD', '51', '45.00', 1, 3, 'Activo'),
(52, 'EDREDON PLUMAS 2 PLAZA', 'UNAD', '52', '50.00', 1, 3, 'Activo'),
(53, 'EDREDON PLUMAS QUEEN', 'UNAD', '53', '55.00', 1, 3, 'Activo'),
(54, 'EDREDON PLUMAS KING', 'UNAD', '54', '65.00', 1, 3, 'Activo'),
(55, 'ENTERIZO CORTO', 'UNAD', '55', '25.00', 1, 5, 'Activo'),
(56, 'ENTERIZO LARGO', 'UNAD', '56', '35.00', 1, 5, 'Activo'),
(57, 'FALDA  CORTA', 'UNAD', '57', '8.00', 1, 5, 'Activo'),
(58, 'FALDA  PLIZADA LARGA', 'UNAD', '58', '40.00', 1, 5, 'Activo'),
(59, 'FALDA  PLIZADA LARGA SEDA', 'UNAD', '59', '50.00', 1, 5, 'Activo'),
(60, 'FALDA  MARINERA', 'UNAD', '60', '70.00', 1, 5, 'Activo'),
(61, 'FUNDA ALMOHADA', 'UNAD', '61', '5.00', 1, 3, 'Activo'),
(62, 'FUNDA PLUMON 2 PLZ.', 'UNAD', '62', '18.00', 1, 3, 'Activo'),
(63, 'FUNDA PLUMON QUEEN', 'UNAD', '63', '20.00', 1, 3, 'Activo'),
(64, 'FUNDA PLUMON KING', 'UNAD', '64', '22.00', 1, 3, 'Activo'),
(65, 'FRAZADA 1 1/2 PLAZA', 'UNAD', '65', '18.00', 1, 3, 'Activo'),
(66, 'FRAZADA 2 PLAZA', 'UNAD', '66', '23.00', 1, 3, 'Activo'),
(67, 'FRAZADA QUEEN', 'UNAD', '67', '45.00', 1, 3, 'Activo'),
(68, 'FRAZADA KING', 'UNAD', '68', '55.00', 1, 3, 'Activo'),
(69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'UNAD', '69', '35.00', 1, 2, 'Activo'),
(70, 'FRAZADA ALPACA 2 PLAZA', 'UNAD', '70', '50.00', 1, 2, 'Activo'),
(71, 'FRAZADA ALPACA QUEEN', 'UNAD', '71', '60.00', 1, 2, 'Activo'),
(72, 'FRAZADA ALPACA KING', 'UNAD', '72', '80.00', 1, 2, 'Activo'),
(73, 'GORRA', 'UNAD', '73', '10.00', 1, 2, 'Activo'),
(75, 'GUANTES', 'UNAD', '75', '10.00', 1, 2, 'Activo'),
(76, 'LEGGINS', 'UNAD', '76', '9.00', 1, 5, 'Activo'),
(77, 'MANTEL LLANO MEDIANO', 'UNAD', '77', '12.00', 1, 3, 'Activo'),
(78, 'MANTEL LLANO GRANDE', 'UNAD', '78', '15.00', 1, 3, 'Activo'),
(79, 'MANTEL BORDADO MEDIANO', 'UNAD', '79', '20.00', 1, 3, 'Activo'),
(80, 'MANTEL BORDADO GRANDE', 'UNAD', '80', '25.00', 1, 3, 'Activo'),
(81, 'MANTEL C/ ALMIDÓN LLANO MEDIANO', 'UNAD', '81', '17.00', 1, 3, 'Activo'),
(82, 'MANTEL C/ ALMIDÓN LLANO GRANDE', 'UNAD', '82', '20.00', 1, 3, 'Activo'),
(83, 'MANTEL C/ ALMIDÓN BORDADO MEDIANO', 'UNAD', '83', '25.00', 1, 3, 'Activo'),
(84, 'MANTEL C/ ALMIDÓN BORDADO GRANDE', 'UNAD', '84', '30.00', 1, 3, 'Activo'),
(85, 'MANDIL', 'UNAD', '85', '12.00', 1, 5, 'Activo'),
(86, 'MANDIL NIÑO', 'UNAD', '86', '6.00', 1, 3, 'Activo'),
(87, 'MANTA', 'UNAD', '87', '15.00', 1, 3, 'Activo'),
(88, 'MANTA GRANDE', 'UNAD', '88', '20.00', 1, 3, 'Activo'),
(89, 'MALETIN', 'UNAD', '89', '20.00', 1, 3, 'Activo'),
(90, 'MOCHILA TELA', 'UNAD', '90', '15.00', 1, 3, 'Activo'),
(91, 'OVEROL', 'UNAD', '91', '15.00', 1, 5, 'Activo'),
(92, 'OVEROL NIÑO', 'UNAD', '92', '10.00', 1, 3, 'Activo'),
(93, 'PANTALÓN VESTIR', 'UNAD', '93', '12.00', 1, 5, 'Activo'),
(94, 'PAÑUELO', 'UNAD', '94', '5.00', 1, 5, 'Activo'),
(95, 'PAÑUELO  SEDA', 'UNAD', '95', '8.00', 1, 5, 'Activo'),
(96, 'PAREO', 'UNAD', '96', '8.00', 1, 5, 'Activo'),
(97, 'PIJAMA (2 PZAS.)', 'UNAD', '97', '14.00', 1, 5, 'Activo'),
(98, 'PIJAMA NIÑO (2 PZAS.)', 'UNAD', '98', '10.00', 1, 3, 'Activo'),
(99, 'POLO M/C', 'UNAD', '99', '8.00', 1, 5, 'Activo'),
(100, 'POLO M/L', 'UNAD', '100', '9.00', 1, 2, 'Activo'),
(101, 'POLERA', 'UNAD', '101', '10.00', 1, 5, 'Activo'),
(102, 'PONCHO', 'UNAD', '102', '15.00', 1, 5, 'Activo'),
(104, 'PULLOVER', 'UNAD', '104', '8.00', 1, 5, 'Activo'),
(105, 'SABANA 1 1/2 PLAZA', 'UNAD', '105', '7.00', 1, 3, 'Activo'),
(106, 'SABANA 2 PLAZA', 'UNAD', '106', '7.00', 1, 3, 'Activo'),
(107, 'SABANA QUEEN', 'UNAD', '107', '8.00', 1, 3, 'Activo'),
(108, 'SABANA KING', 'UNAD', '108', '10.00', 1, 3, 'Activo'),
(109, 'SACO', 'UNAD', '109', '14.00', 1, 5, 'Activo'),
(110, 'SACO PANA /SEDA', 'UNAD', '110', '14.00', 1, 2, 'Activo'),
(111, 'SACON', 'UNAD', '111', '18.00', 1, 5, 'Activo'),
(112, 'SACON NIÑO', 'UNAD', '112', '12.00', 1, 3, 'Activo'),
(113, 'SHORT', 'UNAD', '113', '6.00', 1, 5, 'Activo'),
(114, 'SERVILLETA LLANA', 'UNAD', '114', '5.00', 1, 3, 'Activo'),
(115, 'SERVILLETA BORDADA', 'UNAD', '115', '6.00', 1, 3, 'Activo'),
(116, 'SERVILLETA C/ ALMIDÓN LLANA', 'UNAD', '116', '7.00', 1, 3, 'Activo'),
(117, 'SERVILLETA C/ ALMIDÓN BORDADA', 'UNAD', '117', '8.00', 1, 3, 'Activo'),
(118, 'TERNO (2 PZS.)', 'UNAD', '118', '26.00', 1, 5, 'Activo'),
(119, 'TERNO NIÑO (2 PZS.)', 'UNAD', '119', '17.00', 1, 3, 'Activo'),
(120, 'TOP', 'UNAD', '120', '7.00', 1, 5, 'Activo'),
(121, 'TOALLA PEQUEÑA', 'UNAD', '121', '5.00', 1, 3, 'Activo'),
(122, 'TOALLA MEDIANA', 'UNAD', '122', '8.00', 1, 3, 'Activo'),
(123, 'TOALLA GRANDE', 'UNAD', '123', '10.00', 1, 3, 'Activo'),
(124, 'VESTIDO SIMPLE CORTO', 'UNAD', '124', '20.00', 1, 5, 'Activo'),
(125, 'VESTIDO SIMPLE LARGO', 'UNAD', '125', '25.00', 1, 5, 'Activo'),
(126, 'VESTIDO FIESTA CORTO', 'UNAD', '126', '40.00', 1, 5, 'Activo'),
(127, 'VESTIDO FIESTA LARGO', 'UNAD', '127', '60.00', 1, 5, 'Activo'),
(128, 'VESTIDO C/APLICACIONES CORTO', 'UNAD', '128', '45.00', 1, 2, 'Activo'),
(129, 'VESTIDO C/APLICACIONES LARGO', 'UNAD', '129', '55.00', 1, 5, 'Activo'),
(130, 'VESTIDO C/APLICACIONES FIESTA CORTO', 'UNAD', '130', '60.00', 1, 5, 'Activo'),
(131, 'VESTIDO C/APLICACIONES FIESTA LARGO', 'UNAD', '131', '80.00', 1, 5, 'Activo'),
(132, 'VESTIDO NOVIA 1', 'UNAD', '132', '400.00', 1, 2, 'Activo'),
(133, 'ZAPATILLAS TELA', 'UNAD', '133', '20.00', 1, 3, 'Activo'),
(138, 'ABRIGO CUERO ACOLCHADO', 'UNAD', '138', '90.00', 1, 4, 'Activo'),
(139, 'ABRIGO  CUERO', 'UNAD', '139', '80.00', 1, 4, 'Activo'),
(140, 'BLUSA  CUERO', 'UNAD', '140', '30.00', 1, 4, 'Activo'),
(141, 'CAMISACO  CUERO', 'UNAD', '141', '50.00', 1, 4, 'Activo'),
(142, 'CASACA CUERO', 'UNAD', '142', '50.00', 1, 4, 'Activo'),
(143, 'CASACA CUERO ACOLCHADA', 'UNAD', '143', '70.00', 1, 4, 'Activo'),
(144, 'CONJUNTO CUERO', 'UNAD', '144', '100.00', 1, 4, 'Activo'),
(145, 'CHALECO CUERO', 'UNAD', '145', '40.00', 1, 4, 'Activo'),
(146, 'FALDA CUERO CORTA', 'UNAD', '146', '35.00', 1, 4, 'Activo'),
(147, 'FALDA CUERO LARGA', 'UNAD', '147', '50.00', 1, 4, 'Activo'),
(148, 'PANTALON CUERO', 'UNAD', '148', '50.00', 1, 4, 'Activo'),
(149, 'SACO CUERO', 'UNAD', '149', '50.00', 1, 4, 'Activo'),
(150, 'SACO CUERO ACOLCHADO', 'UNAD', '150', '70.00', 1, 4, 'Activo'),
(151, 'SACON CUERO', 'UNAD', '151', '70.00', 1, 4, 'Activo'),
(152, 'SACON CUERO  ACOLCHADO', 'UNAD', '152', '90.00', 1, 4, 'Activo'),
(153, 'SHORT CUERO', 'UNAD', '153', '30.00', 1, 4, 'Activo'),
(155, 'VESTIDO CUERO CORTO', 'UNAD', '155', '60.00', 1, 4, 'Activo'),
(156, 'VESTIDO CUERO LARGO', 'UNAD', '156', '70.00', 1, 4, 'Activo'),
(157, 'BOTAS  CUERO BAJAS', 'UNAD', '157', '25.00', 1, 4, 'Activo'),
(158, 'BOTAS  CUERO  ALTAS', 'UNAD', '158', '35.00', 1, 4, 'Activo'),
(159, 'CARTERA  CUERO CHICA', 'UNAD', '159', '30.00', 1, 4, 'Activo'),
(160, 'CARTERA  CUERO MEDIANA', 'UNAD', '160', '35.00', 1, 4, 'Activo'),
(161, 'CARTERA  CUERO GRANDE', 'UNAD', '161', '40.00', 1, 4, 'Activo'),
(162, 'CORREA DE CUERO', 'UNAD', '162', '15.00', 1, 4, 'Activo'),
(163, 'MALETIN DE CUERO CHICO', 'UNAD', '163', '30.00', 1, 4, 'Activo'),
(164, 'MALETIN DE CUERO GRANDE', 'UNAD', '164', '45.00', 1, 4, 'Activo'),
(165, 'MOCHILA DE CUERO CHICO', 'UNAD', '165', '30.00', 1, 4, 'Activo'),
(166, 'MOCHILA DE CUERO GRANDE', 'UNAD', '166', '45.00', 1, 4, 'Activo'),
(167, 'ZAPATOS DE CUERO', 'UNAD', '167', '30.00', 1, 4, 'Activo'),
(169, 'ALMOHADA  PLUMAS', 'UNAD', '169', '15.00', 1, 3, 'Activo'),
(170, 'ABRIGO  GAMUZA', 'UNAD', '170', '90.00', 1, 4, 'Activo'),
(171, 'ABRIGO  GAMUZA ACOLCHADO', 'UNAD', '171', '100.00', 1, 4, 'Activo'),
(172, 'BLUSA  GAMUZA', 'UNAD', '172', '30.00', 1, 4, 'Activo'),
(173, 'BOTAS  GAMUZA ALTAS', 'UNAD', '173', '35.00', 1, 4, 'Activo'),
(174, 'BOTAS  GAMUZA BAJAS', 'UNAD', '174', '25.00', 1, 4, 'Activo'),
(175, 'CAMISACO  GAMUZA', 'UNAD', '175', '50.00', 1, 4, 'Activo'),
(176, 'CARTERA CUERO SINTETICO', 'UNAD', '176', '25.00', 1, 3, 'Activo'),
(177, 'CASACA GAMUZA ACOLCHADA', 'UNAD', '177', '70.00', 1, 4, 'Activo'),
(178, 'CASACA GAMUZA', 'UNAD', '178', '50.00', 1, 4, 'Activo'),
(179, 'CHALECO GAMUZA', 'UNAD', '179', '40.00', 1, 4, 'Activo'),
(180, 'COJIN MEDIANO', 'UNAD', '180', '10.00', 1, 3, 'Activo'),
(181, 'CONJUNTO GAMUZA', 'UNAD', '181', '110.00', 1, 4, 'Activo'),
(182, 'CORTINA TAPASOL (METRO)', 'UNAD', '182', '7.00', 1, 3, 'Activo'),
(183, 'FALDA LARGA', 'UNAD', '183', '10.00', 1, 5, 'Activo'),
(184, 'FALDA GAMUZA CORTA', 'UNAD', '184', '35.00', 1, 4, 'Activo'),
(185, 'FALDA GAMUZA LARGA', 'UNAD', '185', '50.00', 1, 4, 'Activo'),
(186, 'FUNDA ALMOHADA GRANDE', 'UNAD', '186', '7.00', 1, 3, 'Activo'),
(187, 'CHULLO', 'UNAD', '187', '5.00', 1, 5, 'Activo'),
(188, 'MALETIN DE GAMUZA CHICO', 'UNAD', '188', '30.00', 1, 4, 'Activo'),
(189, 'MALETIN DE GAMUZA GRANDE', 'UNAD', '189', '45.00', 1, 4, 'Activo'),
(190, 'MOCHILA DE GAMUZA CHICO', 'UNAD', '190', '30.00', 1, 4, 'Activo'),
(191, 'MOCHILA SINTETICA', 'UNAD', '191', '20.00', 1, 3, 'Activo'),
(192, 'MOCHILA DE GAMUZA GRANDE', 'UNAD', '192', '45.00', 1, 4, 'Activo'),
(193, 'PISO MESA MEDIANO', 'UNAD', '193', '10.00', 1, 3, 'Activo'),
(194, 'PISO MESA GRANDE', 'UNAD', '194', '15.00', 1, 3, 'Activo'),
(195, 'PISO MESA BORDADO MEDIANO', 'UNAD', '195', '18.00', 1, 3, 'Activo'),
(196, 'PISO MESA BORDADO GRANDE', 'UNAD', '196', '20.00', 1, 3, 'Activo'),
(197, 'PANTALON GAMUZA', 'UNAD', '197', '50.00', 1, 4, 'Activo'),
(198, 'PONCHO ALPACA', 'UNAD', '198', '25.00', 1, 5, 'Activo'),
(199, 'JGO. SABANAS 1 1/2 PLZ. + 1 FUNDA', 'UNAD', '199', '16.00', 1, 3, 'Activo'),
(200, 'JGO. SABANAS 2 PLZ. + 2 FUNDAS', 'UNAD', '200', '20.00', 1, 3, 'Activo'),
(201, 'JGO. SABANAS QUEEN + 2 FUNDAS', 'UNAD', '201', '24.00', 1, 3, 'Activo'),
(202, 'JGO. SABANAS KING + 2 FUNDAS', 'UNAD', '202', '26.00', 1, 3, 'Activo'),
(203, 'SACO GAMUZA ACOLCHADO', 'UNAD', '203', '70.00', 1, 4, 'Activo'),
(204, 'SACO GAMUZA', 'UNAD', '204', '50.00', 1, 4, 'Activo'),
(205, 'SACON GAMUZA', 'UNAD', '205', '70.00', 1, 4, 'Activo'),
(206, 'SACON GAMUZA ACOLCHADO', 'UNAD', '206', '90.00', 1, 4, 'Activo'),
(207, 'SHORT GAMUZA', 'UNAD', '207', '35.00', 1, 4, 'Activo'),
(208, 'VESTIDO GAMUZA CORTO', 'UNAD', '208', '60.00', 1, 4, 'Activo'),
(209, 'VESTIDO GAMUZA LARGO', 'UNAD', '209', '80.00', 1, 4, 'Activo'),
(210, 'ZAPATILLAS SINTETICAS', 'UNAD', '210', '25.00', 1, 3, 'Activo'),
(211, 'ZAPATOS DE GAMUZA', 'UNAD', '211', '35.00', 1, 4, 'Activo'),
(212, 'BOTINES  CUERO', 'UNAD', '212', '20.00', 1, 4, 'Activo'),
(213, 'BOTINES  GAMUZA', 'UNAD', '213', '20.00', 1, 4, 'Activo'),
(214, 'BATA DELGADA', 'UNAD', '214', '15.00', 1, 5, 'Activo'),
(215, 'BATA  NIÑO', 'UNAD', '215', '10.00', 1, 3, 'Activo'),
(216, 'CAPRI', 'UNAD', '216', '10.00', 1, 5, 'Activo'),
(217, 'FALDA ALPACA', 'UNAD', '217', '35.00', 1, 5, 'Activo'),
(218, 'BATA GRUESA', 'UNAD', '218', '18.00', 1, 5, 'Activo'),
(222, 'BLUSON', 'UNAD', '222', '15.00', 1, 5, 'Activo'),
(223, 'BOLERO', 'UNAD', '223', '12.00', 1, 5, 'Activo'),
(225, 'CAMISA  CORDUROY', 'UNAD', '225', '12.00', 1, 5, 'Activo'),
(226, 'ALMOHADA GRANDE  PLUMAS', 'UNAD', '226', '20.00', 1, 3, 'Activo'),
(227, 'CASACA PLUMAS LARGA', 'UNAD', '227', '30.00', 1, 5, 'Activo'),
(228, 'CASACA JEAN', 'UNAD', '228', '13.00', 1, 3, 'Activo'),
(233, 'CASACA NIÑO', 'UNAD', '233', '10.00', 1, 3, 'Activo'),
(234, 'CHALECO PLUMAS', 'UNAD', '234', '20.00', 1, 5, 'Activo'),
(237, 'CHOMPA NIÑO', 'UNAD', '237', '8.00', 1, 3, 'Activo'),
(238, 'CAPA GRUESA', 'UNAD', '238', '15.00', 1, 5, 'Activo'),
(239, 'CHAL - PASHMINA CHICO', 'UNAD', '239', '8.00', 1, 5, 'Activo'),
(240, 'CHALINA', 'UNAD', '240', '10.00', 1, 5, 'Activo'),
(242, 'COJIN PLUMAS', 'UNAD', '242', '15.00', 1, 2, 'Activo'),
(243, 'CORTINA TAPASOL DOBLE (METRO', 'UNAD', '243', '10.50', 1, 3, 'Activo'),
(244, 'ABRIGO ENTALLE COSTADOS', 'UNAD', '244', '25.00', 1, 6, 'Activo'),
(245, 'ABRIGO SUBIR BASTA', 'UNAD', '245', '20.00', 1, 6, 'Activo'),
(246, 'ABRIGO SUBIR PUÑOS', 'UNAD', '246', '15.00', 1, 6, 'Activo'),
(247, 'ARREGLO PEQUEÑO', 'UNAD', '247', '10.00', 1, 6, 'Activo'),
(249, 'ARREGLO GRANDE', 'UNAD', '249', '12.00', 1, 6, 'Activo'),
(251, 'BLUSA ENTALLE + BASTA', 'UNAD', '251', '20.00', 1, 6, 'Activo'),
(252, 'BLUSA BASTA SIMPLE', 'UNAD', '252', '12.00', 1, 6, 'Activo'),
(253, 'BLUSA SUBIR PUÑOS', 'UNAD', '253', '12.00', 1, 6, 'Activo'),
(254, 'CAMISA VOLTEAR CUELLO', 'UNAD', '254', '20.00', 1, 6, 'Activo'),
(255, 'CAMISA ARREGLO DE CUELLO', 'UNAD', '255', '15.00', 1, 6, 'Activo'),
(256, 'CAMISA ENTALLE COSTADO', 'UNAD', '256', '18.00', 1, 6, 'Activo'),
(257, 'CAMISA SUBIR BASTA', 'UNAD', '257', '15.00', 1, 6, 'Activo'),
(258, 'CAMISA SUBIR PUÑOS', 'UNAD', '258', '16.00', 1, 6, 'Activo'),
(259, 'CAMISA ACORTAR MANGA', 'UNAD', '259', '10.00', 1, 6, 'Activo'),
(260, 'CAMISA ARREGLO BOLSILLO', 'UNAD', '260', '12.00', 1, 6, 'Activo'),
(261, 'CORBATA ARREGLO COSTURA 1', 'UNAD', '261', '10.00', 1, 6, 'Activo'),
(262, 'PANTALON CAMBIO CIERRE', 'UNAD', '262', '12.00', 1, 6, 'Activo'),
(263, 'PANTALON ENTALLE CINTURA', 'UNAD', '263', '15.00', 1, 6, 'Activo'),
(264, 'PANTALON ENTALLE COSTADO', 'UNAD', '264', '15.00', 1, 6, 'Activo'),
(265, 'PANTALON ENTALLE COSTADO + BASTA', 'UNAD', '265', '20.00', 1, 6, 'Activo'),
(266, 'PANTALON BASTA SIMPLE', 'UNAD', '266', '15.00', 1, 6, 'Activo'),
(267, 'PANTALON BASTA INGLESA', 'UNAD', '267', '18.00', 1, 6, 'Activo'),
(268, 'PANTALON CERRAR COSTURA', 'UNAD', '268', '8.00', 1, 6, 'Activo'),
(269, 'PANTALON BASTA CORTA', 'UNAD', '269', '15.00', 1, 6, 'Activo'),
(270, 'PANTALON PARCHE', 'UNAD', '270', '12.00', 1, 6, 'Activo'),
(271, 'POLO NIÑO ARREGLO COSTURA', 'UNAD', '271', '8.00', 1, 6, 'Activo'),
(272, 'POLO ARREGLO COSTURA', 'UNAD', '272', '12.00', 1, 6, 'Activo'),
(273, 'POLO BASTA', 'UNAD', '273', '10.00', 1, 6, 'Activo'),
(274, 'SACO SUBIR PUÑOS', 'UNAD', '274', '15.00', 1, 6, 'Activo'),
(275, 'VESTIDO BASTA (SIN FORRO)', 'UNAD', '275', '15.00', 1, 6, 'Activo'),
(276, 'VESTIDO BASTA (CON FORRO)', 'UNAD', '276', '18.00', 1, 6, 'Activo'),
(277, 'VESTIDO ENTALLE LADOS + TIRAS', 'UNAD', '277', '28.00', 1, 6, 'Activo'),
(278, 'ZAPATILLAS CUERO', 'UNAD', '278', '30.00', 1, 4, 'Activo'),
(279, 'ZAPATILLAS CUERO/GAMUZA', 'UNAD', '279', '30.00', 1, 4, 'Activo'),
(281, 'ENTERIZO NIÑO', 'UNAD', '281', '15.00', 1, 3, 'Activo'),
(282, 'FALDA SEDA', 'UNAD', '282', '15.00', 1, 5, 'Activo'),
(283, 'FALDA ACAMPANADA CORTA', 'UNAD', '283', '10.00', 1, 5, 'Activo'),
(284, 'FALDA ACAMPANADA LARGA', 'UNAD', '284', '15.00', 1, 5, 'Activo'),
(285, 'CORSET', 'UNAD', '285', '12.60', 1, 3, 'Activo'),
(286, 'VESTIDO NOVIA 2', 'UNAD', '286', '500.00', 1, 2, 'Activo'),
(287, 'VESTIDO NOVIA 3', 'UNAD', '287', '750.00', 1, 2, 'Activo'),
(288, 'PISO DE BAÑO', 'UNAD', '288', '12.00', 1, 3, 'Activo'),
(289, 'SECADOR', 'UNAD', '289', '5.00', 1, 3, 'Activo'),
(290, 'MANTEL BORDADO PEQUEÑO', 'UNAD', '290', '15.00', 1, 3, 'Activo'),
(291, 'MANTEL LLANO PEQUEÑO', 'UNAD', '291', '10.00', 1, 3, 'Activo'),
(292, 'MANTEL C/ALMIDÓN BORDADO PEQUEÑO', 'UNAD', '292', '20.00', 1, 3, 'Activo'),
(293, 'MANTEL C/ALMIDÓN LLANO PEQUEÑO', 'UNAD', '293', '15.00', 1, 3, 'Activo'),
(294, 'BANDERA', 'UNAD', '294', '8.40', 1, 3, 'Activo'),
(296, 'PANTALON DRILL', 'UNAD', '296', '12.00', 1, 2, 'Activo'),
(297, 'PANTALÓN CORDUROY', 'UNAD', '297', '12.00', 1, 2, 'Activo'),
(298, 'PANTALÓN JEAN', 'UNAD', '298', '12.00', 1, 5, 'Activo'),
(299, 'PANTALÓN UNIFORME', 'UNAD', '299', '12.00', 1, 2, 'Activo'),
(304, 'CAMISON DORMIR', 'UNAD', '304', '8.00', 1, 5, 'Activo'),
(305, 'BIVIRÍ', 'UNAD', '305', '6.00', 1, 5, 'Activo'),
(306, 'POLO ESTAMPADO M/C', 'UNAD', '306', '9.00', 1, 5, 'Activo'),
(307, 'POLO ESTAMPADO M/L', 'UNAD', '307', '9.00', 1, 2, 'Activo'),
(308, 'POLO CUELLO', 'UNAD', '308', '9.00', 1, 5, 'Activo'),
(309, 'POLERA ESTAMPADA', 'UNAD', '309', '12.00', 1, 2, 'Activo'),
(310, 'POLO NIÑO M/C', 'UNAD', '310', '5.00', 1, 3, 'Activo'),
(311, 'POLO NIÑO M/L', 'UNAD', '311', '5.00', 1, 3, 'Activo'),
(312, 'EDREDON CUNA', 'UNAD', '312', '18.00', 1, 3, 'Activo'),
(313, 'FUNDA PLUMON 1 1/2 PLZ.', 'UNAD', '313', '15.00', 1, 3, 'Activo'),
(314, 'MANTA ALPACA', 'UNAD', '314', '25.00', 1, 2, 'Activo'),
(317, 'SACO CORDUROY', 'UNAD', '317', '14.00', 1, 5, 'Activo'),
(319, 'SACO UNIFORME', 'UNAD', '319', '14.00', 1, 5, 'Activo'),
(321, 'SACO NIÑO', 'UNAD', '321', '10.00', 1, 3, 'Activo'),
(324, 'TOALLA PLAYA', 'UNAD', '324', '15.00', 1, 3, 'Activo'),
(325, 'VESTIDO NIÑA', 'UNAD', '325', '28.00', 1, 3, 'Activo'),
(326, 'VESTIDO PLIZADO', 'UNAD', '326', '70.00', 1, 5, 'Activo'),
(327, 'PONCHO IMPERMEABLE', 'UNAD', '327', '20.00', 1, 5, 'Activo'),
(328, 'IMPERMEABLE (2 PZAS.)', 'UNAD', '328', '30.00', 1, 2, 'Activo'),
(331, 'PONCHO NIÑO', 'UNAD', '331', '10.00', 1, 3, 'Activo'),
(332, 'TAPETE', 'UNAD', '332', '8.00', 1, 3, 'Activo'),
(334, 'FUNDA MUEBLE (1 CUERPO)', 'UNAD', '334', '20.00', 1, 3, 'Activo'),
(335, 'FUNDA MUEBLE (2 CUERPOS)', 'UNAD', '335', '30.00', 1, 3, 'Activo'),
(336, 'FUNDA MUEBLE (3 CUERPOS)', 'UNAD', '336', '40.00', 1, 3, 'Activo'),
(337, 'PELUCHE PEQUEÑO', 'UNAD', '337', '15.00', 1, 3, 'Activo'),
(338, 'PELUCHE MEDIANO', 'UNAD', '338', '30.00', 1, 3, 'Activo'),
(339, 'PELUCHE GRANDE', 'UNAD', '339', '60.00', 1, 3, 'Activo'),
(340, 'PAÑUELO GRANDE', 'UNAD', '340', '8.00', 1, 5, 'Activo'),
(341, 'COBERTOR SILLA BEBE', 'UNAD', '341', '15.00', 1, 3, 'Activo'),
(342, 'KIMONO', 'UNAD', '342', '25.00', 1, 5, 'Activo'),
(343, 'CASULLA', 'UNAD', '343', '30.00', 1, 5, 'Activo'),
(344, 'TUNICA', 'UNAD', '344', '15.00', 1, 5, 'Activo'),
(345, 'GORRA NIÑO', 'UNAD', '345', '7.00', 1, 3, 'Activo'),
(346, 'CAMISA NIÑO', 'UNAD', '346', '7.00', 1, 3, 'Activo'),
(347, 'CASACA SEMIACOLCHADA', 'UNAD', '347', '16.00', 1, 5, 'Activo'),
(350, 'CHALECO', 'UNAD', '350', '12.00', 1, 5, 'Activo'),
(351, 'PROTECTOR CUNA', 'UNAD', '351', '15.00', 1, 3, 'Activo'),
(359, 'ABRIGO ALPACA', 'UNAD', '359', '33.00', 1, 5, 'Activo'),
(363, 'PANTALON', 'UNAD', '363', '12.00', 1, 5, 'Activo'),
(375, 'CASACA CUERO SINTETICO', 'UNAD', '375', '35.00', 1, 3, 'Activo'),
(376, 'SACON ALPACA', 'UNAD', '376', '30.00', 1, 2, 'Activo'),
(385, 'CASACA ACOLCHADA LARGA', 'UNAD', '385', '23.00', 1, 3, 'Activo'),
(386, 'CHALECO ACOLCHADO', 'UNAD', '386', '16.00', 1, 2, 'Activo'),
(387, 'CHAQUETA', 'UNAD', '387', '10.00', 1, 2, 'Activo'),
(390, 'CHAL - PASHMINA (ALPACA, LANA)', 'UNAD', '390', '15.00', 1, 5, 'Activo'),
(391, 'TERNO (3 PZS.)', 'UNAD', '391', '33.00', 1, 5, 'Activo'),
(392, 'VESTIDO FIESTA BASTA + VUELO', 'UNAD', '392', '25.00', 1, 6, 'Activo'),
(393, 'BERMUDA CERRAR COSTURA', 'UNAD', '393', '10.00', 1, 6, 'Activo'),
(394, 'CORBATA ARREGLO COSTURA 2', 'UNAD', '394', '15.00', 1, 6, 'Activo'),
(395, 'PANTALON CAMBIO CIERRE INVISIBLE', 'UNAD', '395', '15.00', 1, 6, 'Activo'),
(396, 'SHORT BASTA SIMPLE', 'UNAD', '396', '10.00', 1, 6, 'Activo'),
(397, 'VESTIDO ENTALLE LADOS', 'UNAD', '397', '15.00', 1, 6, 'Activo'),
(398, 'VESTIDO SUBIR TIRAS', 'UNAD', '398', '10.00', 1, 6, 'Activo'),
(399, 'VESTIDO CAMBIO CIERRE INVISIBLE', 'UNAD', '399', '18.00', 1, 6, 'Activo'),
(400, 'CONFECCION BOLSA TELA 35X30', 'UNAD', '400', '5.90', 1, 6, 'Activo'),
(401, 'CASACA CUERO SINTETICO', 'UNAD', '401', '35.00', 1, 4, 'Activo'),
(403, 'FALDA CUERO SINTETICO', 'UNAD', '403', '30.00', 1, 4, 'Activo'),
(404, 'GUANTES CUERO', 'UNAD', '404', '25.00', 1, 4, 'Activo'),
(405, 'GUANTES GAMUZA', 'UNAD', '405', '25.00', 1, 4, 'Activo'),
(408, 'VARIOS', 'UNAD', '408', '5.00', 1, 3, 'Activo'),
(409, 'PROTECTOR COLCHON 2 PLZ', 'UNAD', '409', '18.00', 1, 3, 'Activo'),
(410, 'COJIN GRANDE', 'UNAD', '410', '16.00', 1, 3, 'Activo'),
(411, 'COJIN CHICO FORRO', 'UNAD', '411', '8.00', 1, 3, 'Activo'),
(412, 'COJIN MEDIANO FORRO', 'UNAD', '412', '10.00', 1, 3, 'Activo'),
(413, 'COJIN GRANDE FORRO', 'UNAD', '413', '12.00', 1, 3, 'Activo'),
(414, 'BLUSA MARINERA', 'UNAD', '414', '40.00', 1, 2, 'Activo'),
(415, 'ARREGLO APLICACION', 'UNAD', '415', '15.00', 1, 6, 'Activo'),
(416, 'BASTA CON ELASTICO', 'UNAD', '416', '15.00', 1, 6, 'Activo'),
(417, 'BLUSA ENTALLE LADOS', 'UNAD', '417', '12.00', 1, 6, 'Activo'),
(418, 'CASACA DESCOSIDO', 'UNAD', '418', '12.00', 1, 6, 'Activo'),
(419, 'CASACA BOLSILLO DESCOSIDO', 'UNAD', '419', '10.00', 1, 6, 'Activo'),
(420, 'CASACA FORRO DESCOSIDO', 'UNAD', '420', '15.00', 1, 6, 'Activo'),
(421, 'CASACA CAMBIO CIERRE PLASTICO/METAL', 'UNAD', '421', '20.00', 1, 6, 'Activo'),
(422, 'CAMISA SUBIR PUÑO MAS YUGO', 'UNAD', '422', '20.00', 1, 6, 'Activo'),
(423, 'CHAQUETA CAMBIO CIERRE', 'UNAD', '423', '15.00', 1, 6, 'Activo'),
(424, 'CIERRE CAMBIO MANDIL', 'UNAD', '424', '15.00', 1, 6, 'Activo'),
(425, 'CIERRE ARREGLO DE CARRITO', 'UNAD', '425', '8.00', 1, 6, 'Activo'),
(426, 'ARREGLO DE CORTINA', 'UNAD', '426', '15.00', 1, 6, 'Activo'),
(427, 'CUBRECAMA DESCOSIDO', 'UNAD', '427', '12.00', 1, 6, 'Activo'),
(428, 'CUBRECAMA PARCHE', 'UNAD', '428', '12.00', 1, 6, 'Activo'),
(429, 'EDREDON DESCOSIDO', 'UNAD', '429', '15.00', 1, 6, 'Activo'),
(430, 'EDREDON PARCHE', 'UNAD', '430', '12.00', 1, 6, 'Activo'),
(431, 'MANTEL DESCOSIDO', 'UNAD', '431', '15.00', 1, 6, 'Activo'),
(432, 'PANTALON ENTALLE CINTURA MAS TIRO', 'UNAD', '432', '15.00', 1, 6, 'Activo'),
(433, 'PANTALON JEAN BASTA CORTA CONVERTIR DE LARGO A CORTO', 'UNAD', '433', '15.00', 1, 6, 'Activo'),
(434, 'PANTALON CAMBIO ELASTICO', 'UNAD', '434', '15.00', 1, 6, 'Activo'),
(435, 'PANTALON ELASTICO NIÑO', 'UNAD', '435', '10.00', 1, 6, 'Activo'),
(436, 'PELUCHE ARREGLO', 'UNAD', '436', '12.00', 1, 6, 'Activo'),
(437, 'SACO SACONES ABRIGOS DESCOSIDO', 'UNAD', '437', '15.00', 1, 6, 'Activo'),
(438, 'SACO COSTURA FORRO', 'UNAD', '438', '15.00', 1, 6, 'Activo'),
(439, 'SABANA ARREGLO', 'UNAD', '439', '15.00', 1, 6, 'Activo'),
(440, 'VESTIDO DE NOCHE BASTA SIMPLE', 'UNAD', '440', '18.00', 1, 6, 'Activo'),
(441, 'VESTIDO NIÑA ARREGLO', 'UNAD', '441', '12.00', 1, 6, 'Activo'),
(442, 'ZURCIDO', 'UNAD', '442', '50.00', 1, 6, 'Activo'),
(443, 'BERMUDA NIÑO', 'UNAD', '443', '5.00', 1, 3, 'Activo'),
(445, 'FALDA NIÑA', 'UNAD', '445', '6.00', 1, 3, 'Activo'),
(446, 'GUANTES NIÑO', 'UNAD', '446', '8.00', 1, 3, 'Activo'),
(447, 'MAMELUCO NIÑO', 'UNAD', '447', '6.00', 1, 3, 'Activo'),
(448, 'PANTALON NIÑO', 'UNAD', '448', '8.00', 1, 3, 'Activo'),
(449, 'PULLOVER NIÑO', 'UNAD', '449', '4.00', 1, 3, 'Activo'),
(450, 'SHORT NIÑO', 'UNAD', '450', '4.00', 1, 3, 'Activo'),
(451, 'MAMELUCO ADULTO', 'UNAD', '451', '12.00', 1, 2, 'Activo'),
(457, 'PROTECTOR COLCHON KING', 'UNAD', '457', '25.00', 1, 3, 'Activo'),
(458, 'PROTECTOR COLCHON QUEEN', 'UNAD', '458', '22.00', 1, 3, 'Activo'),
(459, 'PROTECTOR COLCHON 1PLZ', 'UNAD', '459', '12.00', 1, 3, 'Activo'),
(460, 'PROTECTOR COLCHON 1 1/2 PLZ', 'UNAD', '460', '15.00', 1, 3, 'Activo'),
(461, 'INDIVIDUAL', 'UNAD', '461', '4.00', 1, 3, 'Activo'),
(462, 'VESTIDO FIESTA ESPECIAL', 'UNAD', '462', '180.00', 1, 2, 'Activo'),
(463, 'ESTOLA SACERDOTE', 'UNAD', '463', '18.00', 1, 2, 'Activo'),
(464, 'COSTURA MEDIANO', 'UNAD', '464', '12.00', 1, 6, 'Activo'),
(465, 'PARCHE MEDIANO', 'UNAD', '465', '15.00', 1, 6, 'Activo'),
(466, 'COSTURA PEQUEÑA', 'UNAD', '466', '10.00', 1, 6, 'Activo'),
(467, 'COSTURA GRANDE', 'UNAD', '467', '15.00', 1, 6, 'Activo'),
(468, 'PARCHE PEQUEÑO', 'UNAD', '468', '10.00', 1, 6, 'Activo'),
(469, 'PARCHE GRANDE', 'UNAD', '469', '20.00', 1, 6, 'Activo'),
(470, 'VESTIDO FIESTA BASTA', 'UNAD', '470', '18.00', 1, 6, 'Activo'),
(471, 'SACO ALPACA', 'UNAD', '471', '25.00', 1, 2, 'Activo'),
(472, 'CASACA ALPACA', 'UNAD', '472', '25.00', 1, 2, 'Activo'),
(473, '3x2 PRENDAS DE CAMA', 'UNAD', '473', '0.00', 1, 1, 'Activo'),
(475, '3x2 PRENDAS DE VESTIR', 'UNAD', '475', '0.00', 1, 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(25) NOT NULL,
  `Tipo_Cliente` enum('Persona','Empresa') COLLATE utf8_spanish_ci DEFAULT 'Persona',
  `Codigo_Cliente` decimal(18,0) NOT NULL,
  `Nombre_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoPaterno_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoMaterno_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `TipoDocumento_Cliente` decimal(18,0) DEFAULT 1,
  `NumeroDocumento_Cliente` decimal(18,0) DEFAULT NULL,
  `Direccion1_Cliente` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion2_Cliente` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Email_Cliente` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumeroCel_Cliente` decimal(18,0) DEFAULT NULL,
  `CodDistrito1_Cliente` decimal(18,0) DEFAULT NULL,
  `CodDistrito2_Cliente` decimal(18,0) DEFAULT NULL,
  `Estado_Cliente` enum('Activo','Inactivo') COLLATE utf8_spanish_ci DEFAULT 'Activo',
  `CodZona_Cliente` int(25) DEFAULT NULL,
  `FechaRegistro_Cliente` date NOT NULL,
  `CantOrdenAtendida_Clliente` decimal(18,0) DEFAULT NULL,
  `ImporteAcumulado_Cliente` decimal(7,2) DEFAULT NULL,
  `Latitud` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Longitud` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `Tipo_Cliente`, `Codigo_Cliente`, `Nombre_Cliente`, `ApellidoPaterno_Cliente`, `ApellidoMaterno_Cliente`, `TipoDocumento_Cliente`, `NumeroDocumento_Cliente`, `Direccion1_Cliente`, `Direccion2_Cliente`, `Email_Cliente`, `NumeroCel_Cliente`, `CodDistrito1_Cliente`, `CodDistrito2_Cliente`, `Estado_Cliente`, `CodZona_Cliente`, `FechaRegistro_Cliente`, `CantOrdenAtendida_Clliente`, `ImporteAcumulado_Cliente`, `Latitud`, `Longitud`) VALUES
(4, 'Persona', '12345', 'Juan Luis', 'Huaman', 'Sanchez', '1', '76543218', 'Calle Simoni 209', 'Cdra. 28 Av. Aviación', 'juan@gmail.com', '7777777', '150130', '150130', 'Activo', 1, '2020-01-01', '1', '0.00', '-12.09594', '-77.00141'),
(5, 'Persona', '4535', 'Renan', 'Urteaga', 'Boggio', '1', '78906586', 'Calle Matier 604', 'Cdra. 27 Av. Aviación', 'renan@gmail.com', '7777777', '150130', '150130', 'Activo', 1, '2020-01-04', '1', '1.00', '-12.1154531', '-76.9984062'),
(8, 'Persona', '4536', 'Luis', 'Rodriguez', 'Huaman', '1', '78906777', 'Calle Beethoven 530', 'Cdra. 22 Av. San Luis', 'luis@gmail.com', '7777799', '150130', '150130', 'Activo', 1, '2020-01-01', '1', '2.00', '-12.1154268', '-76.9984274'),
(10, 'Persona', '87075', 'Luigi', 'Huaranga', 'Chate', '1', '77223910', 'Av. Santa Anita 530', 'Cdra. 28 Av. Encalada', 'luigi@gmail.com', '999999999', '150130', '150130', 'Activo', 1, '2020-01-01', '3', '30.00', '-12.095338', '-76.994546');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(25) NOT NULL,
  `Nombre_Color` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Estado_Color` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `Nombre_Color`, `Estado_Color`) VALUES
(1, 'VERDE', 'Activo'),
(2, 'ROJO', 'Activo'),
(3, 'VERDE / VERDE A RAYAS', 'Activo'),
(4, 'CELESTE', 'Activo'),
(5, 'NEGRO', 'Activo'),
(6, 'AMARILLO / AMARILLO A CUADROS', 'Activo'),
(7, 'PLOMO', 'Activo'),
(8, 'BLANCO', 'Activo'),
(9, 'BLANCO / BLANCO A RAYAS', 'Activo'),
(10, 'BLANCO AZULADO', 'Activo'),
(11, 'GRIS', 'Activo'),
(12, 'AMARILLO', 'Activo'),
(13, 'MORADO', 'Activo'),
(14, 'ROSADO', 'Activo'),
(15, 'ANARANJADO', 'Activo'),
(16, 'MARRON', 'Activo'),
(17, 'TURQUESA', 'Activo'),
(20, 'PLATEADO', 'Activo'),
(21, 'CELESTE CLARO', 'Activo'),
(22, 'CELESTE OSCURO', 'Activo'),
(24, 'VIOLETA', 'Activo'),
(27, 'MOSTAZA', 'Activo'),
(33, 'VIOLACEO', 'Activo'),
(1000, 'AZUL FUXIA', 'Activo'),
(1870, 'AZUL MARINO', 'Activo'),
(1900, 'AZUL TURQUESA', 'Activo'),
(3974, 'CELESTE / ROJO', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleorden`
--

CREATE TABLE `detalleorden` (
  `id` int(25) NOT NULL,
  `idorden` int(25) NOT NULL,
  `ordenpromocion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Sirve para ordenar por un key las promociones',
  `idpromocion` int(25) DEFAULT NULL,
  `nombrepromocion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idprenda` int(25) NOT NULL,
  `nombreprenda` varchar(225) COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `precioprenda` decimal(19,2) DEFAULT NULL,
  `nombreestados` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'En php hay que separarlo con el explode por este caracter @ que es el arroba',
  `observaciones` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `audios` text COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Sera asi:\r\n\r\n{\r\n  ''nombreaudio1.mp3'',\r\n  ''nombreaudio2.mp3'',\r\n}',
  `imagenes` text COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Sera asi:\r\n\r\n{\r\n  ''imagen1.png'',\r\n  ''imagen2.png'',\r\n}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id` int(25) NOT NULL,
  `Codigo_Distrito` decimal(18,0) NOT NULL,
  `Nombre_Distrito` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id`, `Codigo_Distrito`, `Nombre_Distrito`) VALUES
(1, '150102', 'Ancon'),
(2, '150103', 'Ate'),
(3, '150104', 'Barranco'),
(4, '150130', 'San Borja'),
(5, '150140', 'Santiago de Surco'),
(6, '150131', 'San Isidro'),
(7, '150114', 'La Molina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoprenda`
--

CREATE TABLE `estadoprenda` (
  `id` int(25) NOT NULL,
  `Codigo_Prenda` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre_Prenda` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Estado_Prenda` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estadoprenda`
--

INSERT INTO `estadoprenda` (`id`, `Codigo_Prenda`, `Nombre_Prenda`, `Estado_Prenda`) VALUES
(1, 'ESTPRENDA01', 'Con Mancha', 'Activo'),
(2, 'ESTPRENDA02', 'Con Rotura', 'Activo'),
(3, 'ESTPRENDA03', 'Con Desgaste', 'Activo'),
(4, 'ESTPRENDA04', 'Con Arrugas', 'Inactivo'),
(5, 'ESTPRENDA05', 'Con Decoloración', 'Activo'),
(6, 'ESTPRENDA06', 'Con Huequito', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoreclamo`
--

CREATE TABLE `estadoreclamo` (
  `id` int(25) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadoreclamo`
--

INSERT INTO `estadoreclamo` (`id`, `codigo`, `nombre`, `estado`) VALUES
(1, 'ESTRECLM01', 'Mal Lavado', 'Activo'),
(2, 'ESTRECLM02', 'Mal Planchado', 'Activo'),
(3, 'ESTRECLM03', 'Falta Botones', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresora`
--

CREATE TABLE `impresora` (
  `id` int(25) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `mac` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `impresora`
--

INSERT INTO `impresora` (`id`, `nombre`, `mac`, `estado`) VALUES
(1, 'SPP-R310', '74:F0:7D:E9:B8:4C', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(25) NOT NULL,
  `Nombre_Marca` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Estado_Marca` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `Nombre_Marca`, `Estado_Marca`) VALUES
(11, 'POLISTEL', 'Activo'),
(12, 'ADIDAS', 'Activo'),
(13, 'NIKE', 'Activo'),
(14, 'LACOSTE', 'Activo'),
(15, 'PARADA III', 'Activo'),
(16, 'PUMA', 'Activo'),
(17, 'REEBOK', 'Activo'),
(18, 'ÉL', 'Activo'),
(19, 'BATA', 'Activo'),
(20, 'NAZARO', 'Activo'),
(21, 'TIGRE', 'Activo'),
(22, 'AKI', 'Activo'),
(23, 'RIPLEY', 'Activo'),
(24, 'ORBIT', 'Activo'),
(25, 'REUSH', 'Activo'),
(26, 'WALON', 'Activo'),
(27, 'PLATANITOS', 'Activo'),
(28, 'JHON KELVIN', 'Activo'),
(1000, 'NAVIGATA', 'Activo'),
(1041, 'TRIAL', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(25) NOT NULL,
  `idservicio` int(25) NOT NULL,
  `numeroorden` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_servicio` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_repartidor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `hora` time NOT NULL DEFAULT current_timestamp(),
  `nombre_cliente` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `celular_cliente` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion_cliente` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_entrega` date NOT NULL DEFAULT current_timestamp(),
  `hora_entrega` time NOT NULL DEFAULT current_timestamp(),
  `tipo_cobro` enum('Por Cobrar','Cancelado','Reclamo','Aceptado') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Por Cobrar',
  `idzona` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `total_s_dscto` decimal(19,2) DEFAULT 0.00,
  `descuento` decimal(19,2) DEFAULT 0.00,
  `total_pagar` decimal(19,2) DEFAULT 0.00,
  `a_cuenta` decimal(19,2) DEFAULT 0.00,
  `saldo` decimal(19,2) DEFAULT 0.00,
  `estado` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo',
  `tipo_pago` enum('Efectivo','Tarjeta Credito/Debito','Cheque','Deposito','Yape','Plin','Por Cobrar') COLLATE utf8_spanish_ci DEFAULT 'Por Cobrar',
  `tipo_atencion` enum('Entrega','Recojo','Reclamo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Entrega',
  `array_detalleorden` text COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'para convertir en array usar: json_decode',
  `Id_Orden_Orig` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Numero de la atención original (RECLAMOS)\r\n',
  `Id_prenda_orig` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Número de la prenda dentro de la orden original (RECLAMOS).\r\n\r\nSe guardara los Ids de las prendas que fueron reclamadas o solo se guardara un id por la prenda:\r\n\r\nEjm:\r\n1,75,67,345,8,9'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(25) NOT NULL,
  `idarticulo_promocion` int(25) DEFAULT NULL,
  `codigo_promocion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_promocion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `precio_promocion` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0.00',
  `estado_promocion` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id`, `idarticulo_promocion`, `codigo_promocion`, `nombre_promocion`, `precio_promocion`, `estado_promocion`) VALUES
(7, 473, 'PROMO473', 'PROMOCION 1', '0.00', 'Activo'),
(8, 473, 'PROMO474', 'PROMOCION 2', '0.00', 'Activo'),
(9, 473, 'PROMO475', 'PROMOCION 3', '0.00', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocionxarticulo`
--

CREATE TABLE `promocionxarticulo` (
  `id` int(25) NOT NULL,
  `idpromocion` int(25) NOT NULL,
  `idarticulo` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `promocionxarticulo`
--

INSERT INTO `promocionxarticulo` (`id`, `idpromocion`, `idarticulo`) VALUES
(10, 7, 1),
(11, 7, 2),
(12, 8, 3),
(13, 8, 4),
(14, 9, 5),
(15, 9, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` int(25) NOT NULL,
  `IdArticulo_Receta` int(11) DEFAULT NULL,
  `Cantidad_Receta` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `IdArticuloPieza_Receta` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `IdArticulo_Receta`, `Cantidad_Receta`, `IdArticuloPieza_Receta`) VALUES
(1, 118, '1', 93),
(2, 118, '1', 40),
(3, 391, '1', 93),
(4, 391, '1', 40),
(5, 391, '1', 19),
(6, 119, '1', 93),
(7, 119, '1', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamoxprenda`
--

CREATE TABLE `reclamoxprenda` (
  `id` int(25) NOT NULL,
  `numeroorden` varchar(255) DEFAULT NULL,
  `origennumeroorden` varchar(255) NOT NULL,
  `idcliente` int(25) NOT NULL,
  `idrepartidor` int(25) NOT NULL,
  `nombrecliente` varchar(255) NOT NULL,
  `nombrerepartidor` varchar(255) NOT NULL,
  `idzona` varchar(255) NOT NULL,
  `idprenda` int(25) NOT NULL,
  `nombreprenda` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL COMMENT 'Color y marca que se registro en el registro',
  `marca` varchar(255) NOT NULL COMMENT 'Color y marca que se registro en el registro',
  `observacion` text DEFAULT NULL,
  `estados` varchar(255) DEFAULT NULL,
  `audio` text DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `ordenprenda` varchar(255) DEFAULT NULL COMMENT 'Se guardara el key que generamos con el uniqueKey'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `id` int(25) NOT NULL,
  `codigo_repartidor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_repartidor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_repartidor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `avatar_repartidor` varchar(255) COLLATE utf8_spanish_ci DEFAULT '',
  `id_zona` int(25) DEFAULT NULL,
  `Latitud` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Longitud` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idimpresora` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Estado_Repartidor` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`id`, `codigo_repartidor`, `nombre_repartidor`, `apellido_repartidor`, `avatar_repartidor`, `id_zona`, `Latitud`, `Longitud`, `idimpresora`, `Estado_Repartidor`) VALUES
(1, 'REP0001', 'Roberto Manuel', 'Manrique Rodriguez', '', 1, '-12.1154202', '-76.9984335', '74:F0:7D:E9:B8:4C', 'Activo'),
(2, 'REP0002', 'Juan Carlos', 'Mamani Quispe', '', 2, NULL, NULL, '', 'Activo'),
(3, 'REP0003', 'Luis Miguel', 'Chavez de la Cruz', '', 3, NULL, NULL, '', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(25) NOT NULL,
  `Nombre_Servicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Codigo_Servicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Estado_Servicio` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo',
  `Dias_Servicio` int(25) DEFAULT 1,
  `Orden_Servicio` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `Nombre_Servicio`, `Codigo_Servicio`, `Estado_Servicio`, `Dias_Servicio`, `Orden_Servicio`) VALUES
(1, 'Promociones', 'CODSER1', 'Activo', 3, 6),
(2, 'Seco', 'CODSER2', 'Activo', 3, 1),
(3, 'Agua', 'CODSER3', 'Activo', 5, 2),
(4, 'Pieles', 'CODSER4', 'Activo', 8, 3),
(5, 'Planchado', 'CODSER5', 'Activo', 2, 5),
(6, 'Costura', 'CODSER6', 'Activo', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnoxcliente`
--

CREATE TABLE `turnoxcliente` (
  `id` int(25) NOT NULL,
  `numero_orden` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Cuando es recojo no tiene numero de orden, solo cuando es entrega se puede tiene numero de orden',
  `id_repartidor` int(25) NOT NULL,
  `id_cliente` int(25) NOT NULL,
  `id_zona` int(25) NOT NULL,
  `puesto_turno` enum('Temprano','Tarde') COLLATE utf8_spanish_ci DEFAULT 'Temprano' COMMENT 'Temprano es : Mañana, lo puse temprano porque no acepataba ñ en base de datos',
  `fecha_turno` date NOT NULL,
  `hora_turno` time NOT NULL,
  `atencion` enum('Atendido','Sin Atender') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Sin Atender',
  `estado_turno` enum('Entrega','Recojo','Reclamo') COLLATE utf8_spanish_ci DEFAULT 'Recojo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `turnoxcliente`
--

INSERT INTO `turnoxcliente` (`id`, `numero_orden`, `id_repartidor`, `id_cliente`, `id_zona`, `puesto_turno`, `fecha_turno`, `hora_turno`, `atencion`, `estado_turno`) VALUES
(4, '', 1, 8, 1, 'Temprano', '2021-09-17', '19:00:00', 'Sin Atender', 'Recojo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `id` int(25) NOT NULL,
  `codigo_zona` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_zona` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_zona` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `puesto_zona` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'PRIMERA ZONA',
  `imagen_zona` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'zona1.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id`, `codigo_zona`, `nombre_zona`, `descripcion_zona`, `puesto_zona`, `imagen_zona`) VALUES
(1, 'ZONA01', 'SAN BORJA', 'Es uno de los cuarenta y tres distritos que conforman la provincia de Lima, ubicada en el departamento homonimo en Peru.', 'C1', 'zona1.png'),
(2, 'ZONA02', 'SURCO', 'Se caracteriza por ser un distrito de amplia extension y con gran cantidad de areas verdes antes de San Borja.', 'C2', 'zona2.png'),
(3, 'ZONA03', 'SAN ISIDRO', 'Es un distrito al este de Lima que destaca por su clima fresco, su famosa laguna y por tener zonas enteramente residenciales.', 'C3', 'zona3.png'),
(4, 'ZONA04', 'LA MOLINA', 'Es un distrito al este de Lima que destaca por su clima fresco, su famosa laguna y por tener zonas enteramente residenciales.', 'C4', 'zona4.png'),
(5, 'ZONA05', 'Servicio a domicilio de puntos de acopio actual, con código S1 Clientes de la Molina SE Clientes de la embajada', 'Es un distrito al este de Lima que destaca por su clima fresco, su famosa laguna y por tener zonas enteramente residenciales.', 'C5', 'zona5.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonaxrepartidor`
--

CREATE TABLE `zonaxrepartidor` (
  `id` int(25) NOT NULL,
  `id_zona` int(25) NOT NULL,
  `id_repartidor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `zonaxrepartidor`
--

INSERT INTO `zonaxrepartidor` (`id`, `id_zona`, `id_repartidor`) VALUES
(1, 1, 1),
(2, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_articulo` (`codigo_articulo`),
  ADD KEY `FK2_idservicio` (`Id_Servicio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Codigo_Cliente` (`Codigo_Cliente`),
  ADD KEY `FK1_idzona_cliente` (`CodZona_Cliente`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nombre_Color` (`Nombre_Color`);

--
-- Indices de la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Codigo_Distrito` (`Codigo_Distrito`);

--
-- Indices de la tabla `estadoprenda`
--
ALTER TABLE `estadoprenda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nombre_Prenda` (`Nombre_Prenda`),
  ADD UNIQUE KEY `Codigo_Prenda` (`Codigo_Prenda`);

--
-- Indices de la tabla `estadoreclamo`
--
ALTER TABLE `estadoreclamo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `impresora`
--
ALTER TABLE `impresora`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `printmac` (`mac`) USING BTREE;

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nombre_Marca` (`Nombre_Marca`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_promocion` (`codigo_promocion`),
  ADD KEY `FK1_idarticulo_promocion` (`idarticulo_promocion`);

--
-- Indices de la tabla `promocionxarticulo`
--
ALTER TABLE `promocionxarticulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6_idpromocion` (`idpromocion`),
  ADD KEY `FK7_idarticulo` (`idarticulo`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6_idarticuloreceta` (`IdArticulo_Receta`),
  ADD KEY `FK7_idarticulopiezareceta` (`IdArticuloPieza_Receta`);

--
-- Indices de la tabla `reclamoxprenda`
--
ALTER TABLE `reclamoxprenda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_repartidor` (`codigo_repartidor`),
  ADD KEY `FK1_idzona` (`id_zona`),
  ADD KEY `FK2_idimpresora` (`idimpresora`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nombre_Servicio` (`Nombre_Servicio`),
  ADD UNIQUE KEY `Codigo_Servicio` (`Codigo_Servicio`);

--
-- Indices de la tabla `turnoxcliente`
--
ALTER TABLE `turnoxcliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_idrepartidor` (`id_repartidor`),
  ADD KEY `FK2_idcliente` (`id_cliente`),
  ADD KEY `FK3_idzona` (`id_zona`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_zona` (`codigo_zona`);

--
-- Indices de la tabla `zonaxrepartidor`
--
ALTER TABLE `zonaxrepartidor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4_idzona` (`id_zona`),
  ADD KEY `FK5_idrepartidor` (`id_repartidor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4484;

--
-- AUTO_INCREMENT de la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estadoprenda`
--
ALTER TABLE `estadoprenda`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estadoreclamo`
--
ALTER TABLE `estadoreclamo`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `impresora`
--
ALTER TABLE `impresora`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1572;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `promocionxarticulo`
--
ALTER TABLE `promocionxarticulo`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reclamoxprenda`
--
ALTER TABLE `reclamoxprenda`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `turnoxcliente`
--
ALTER TABLE `turnoxcliente`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `zonaxrepartidor`
--
ALTER TABLE `zonaxrepartidor`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `FK2_idservicio` FOREIGN KEY (`Id_Servicio`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK1_idzona_cliente` FOREIGN KEY (`CodZona_Cliente`) REFERENCES `zona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD CONSTRAINT `FK1_idarticulo_promocion` FOREIGN KEY (`idarticulo_promocion`) REFERENCES `articulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `promocionxarticulo`
--
ALTER TABLE `promocionxarticulo`
  ADD CONSTRAINT `FK6_idpromocion` FOREIGN KEY (`idpromocion`) REFERENCES `promocion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK7_idarticulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `FK6_idarticuloreceta` FOREIGN KEY (`IdArticulo_Receta`) REFERENCES `articulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK7_idarticulopiezareceta` FOREIGN KEY (`IdArticuloPieza_Receta`) REFERENCES `articulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `turnoxcliente`
--
ALTER TABLE `turnoxcliente`
  ADD CONSTRAINT `FK1_idrepartidor` FOREIGN KEY (`id_repartidor`) REFERENCES `repartidor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK2_idcliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK3_idzona` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
