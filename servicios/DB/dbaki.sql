-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2021 a las 04:55:21
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
(475, '3x2 PRENDAS DE VESTIR', 'UNAD', '475', '0.00', 1, 1, 'Activo'),
(1000006, 'NUEVA 1995', 'UNAD', '999999', '10.00', 1, 2, 'Activo'),
(1000007, 'TERNO (2 PZS.)', 'UNAD', '118', '24.00', 1, 2, 'Activo'),
(1000012, '4X5 PRENDAS DE ROPERO', 'UNAD', '89', '0.00', 1, 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `id` int(25) NOT NULL,
  `idrepartidor` int(25) NOT NULL,
  `nombrerepartidor` varchar(255) NOT NULL,
  `idservicio` int(25) NOT NULL,
  `nombreservicio` varchar(255) NOT NULL,
  `tipofactura` enum('Boleta','Factura','Ninguno') NOT NULL DEFAULT 'Boleta',
  `numeroserie` varchar(255) DEFAULT NULL,
  `numeroorden` varchar(255) NOT NULL,
  `tipodocumento` enum('DNI','RUC') NOT NULL,
  `dniruc` varchar(255) NOT NULL,
  `nombrecliente` varchar(255) NOT NULL,
  `idcliente` int(25) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `detalleorden` text NOT NULL,
  `nombredocumento` varchar(255) DEFAULT NULL,
  `respuesta_sunat` enum('ok','error','pendiente') DEFAULT 'error',
  `xml` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`id`, `idrepartidor`, `nombrerepartidor`, `idservicio`, `nombreservicio`, `tipofactura`, `numeroserie`, `numeroorden`, `tipodocumento`, `dniruc`, `nombrecliente`, `idcliente`, `fecha`, `hora`, `detalleorden`, `nombredocumento`, `respuesta_sunat`, `xml`) VALUES
(1, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000001', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-04', '13:53:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000120211004135300.pdf', 'error', NULL),
(2, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000002', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:04:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000220211005010400.pdf', 'error', NULL),
(3, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000003', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:05:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000320211005010500.pdf', 'error', NULL),
(4, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000004', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:05:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000420211005010500.pdf', 'error', NULL),
(5, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000005', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:06:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000520211005010600.pdf', 'error', NULL),
(6, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000006', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:07:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000620211005010700.pdf', 'error', NULL),
(7, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000007', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:08:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000720211005010800.pdf', 'error', NULL),
(8, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000008', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:08:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000820211005010800.pdf', 'error', NULL),
(9, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000009', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:09:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000000920211005010900.pdf', 'error', NULL),
(10, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000010', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:09:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001020211005010900.pdf', 'error', NULL),
(11, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000011', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:10:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001120211005011000.pdf', 'error', NULL),
(12, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000012', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:10:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001220211005011000.pdf', 'error', NULL),
(13, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000013', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:10:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001320211005011000.pdf', 'error', NULL),
(14, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000014', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:11:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001420211005011100.pdf', 'error', NULL),
(15, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000015', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:11:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001520211005011100.pdf', 'error', NULL),
(16, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000016', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:21:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001620211005012100.pdf', 'error', NULL),
(17, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000017', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:24:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001720211005012400.pdf', 'error', NULL),
(18, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000018', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:26:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001820211005012600.pdf', 'error', NULL),
(19, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000019', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:29:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000001920211005012900.pdf', 'error', NULL),
(20, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000020', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:31:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002020211005013100.pdf', 'error', NULL),
(21, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000021', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:32:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002120211005013200.pdf', 'error', NULL),
(22, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000022', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:34:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002220211005013400.pdf', 'error', NULL),
(23, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000023', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:37:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002320211005013700.pdf', 'error', NULL),
(24, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000024', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:38:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002420211005013800.pdf', 'error', NULL),
(25, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000025', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:42:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002520211005014200.pdf', 'error', NULL),
(26, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000026', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:43:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002620211005014300.pdf', 'error', NULL),
(27, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000027', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:47:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002720211005014700.pdf', 'error', NULL),
(28, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000028', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:48:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002820211005014800.pdf', 'error', NULL),
(29, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000029', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:49:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000002920211005014900.pdf', 'error', NULL),
(30, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000030', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:49:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003020211005014900.pdf', 'error', NULL),
(31, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000031', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:50:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003120211005015000.pdf', 'error', NULL),
(32, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000032', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:50:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003220211005015000.pdf', 'error', NULL),
(33, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000033', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:51:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003320211005015100.pdf', 'error', NULL),
(34, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000034', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:52:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003420211005015200.pdf', 'error', NULL),
(35, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000035', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '01:53:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003520211005015300.pdf', 'error', NULL),
(36, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000036', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:10:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003620211005021000.pdf', 'error', NULL),
(37, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000037', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:22:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003720211005022200.pdf', 'error', NULL),
(38, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000038', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:39:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003820211005023900.pdf', 'error', NULL),
(39, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000039', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:44:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000003920211005024400.pdf', 'error', NULL),
(40, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000040', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:46:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004020211005024600.pdf', 'error', NULL),
(41, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000041', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:49:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004120211005024900.pdf', 'error', NULL),
(42, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000042', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:50:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004220211005025000.pdf', 'error', NULL),
(43, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000043', 'C1-0000257', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '02:56:00', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004320211005025600.pdf', 'error', NULL),
(44, 1, 'Roberto Manuel', 3, 'AGUA', 'Boleta', 'B003-0000044', 'C1-0000150', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '10:39:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004420211005103900.pdf', 'error', NULL),
(45, 1, 'Roberto Manuel', 2, 'SECO', 'Boleta', 'B003-0000045', 'C1-0000148', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-05', '10:46:00', '[{\"idprenda\":\"41\",\"ordenpromocion\":\"Uxx8z\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uxx8z\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Uaf87\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uaf87\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004520211005104600.pdf', 'error', NULL),
(46, 1, 'Roberto Manuel', 2, 'SECO', 'Boleta', 'B003-0000046', 'C1-0000311', 'DNI', '78906777', 'Luis Rodriguez', 8, '2021-10-07', '19:15:00', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Ucf47\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"AMARILLO\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ucf47\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Ufh21\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufh21\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'B003-000004620211007191500.pdf', 'error', NULL);

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
  `nombreempresa` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
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

INSERT INTO `cliente` (`id`, `Tipo_Cliente`, `Codigo_Cliente`, `Nombre_Cliente`, `ApellidoPaterno_Cliente`, `ApellidoMaterno_Cliente`, `TipoDocumento_Cliente`, `NumeroDocumento_Cliente`, `nombreempresa`, `Direccion1_Cliente`, `Direccion2_Cliente`, `Email_Cliente`, `NumeroCel_Cliente`, `CodDistrito1_Cliente`, `CodDistrito2_Cliente`, `Estado_Cliente`, `CodZona_Cliente`, `FechaRegistro_Cliente`, `CantOrdenAtendida_Clliente`, `ImporteAcumulado_Cliente`, `Latitud`, `Longitud`) VALUES
(4, 'Persona', '12345', 'Juan Luis', 'Huaman', 'Sanchez', '1', '76543218', NULL, 'Calle Simoni 209', 'Cdra. 28 Av. Aviación', 'juan@gmail.com', '7777777', '150130', '150130', 'Activo', 1, '2020-01-01', '1', '0.00', '-12.09594', '-77.00141'),
(5, 'Persona', '4535', 'Renan', 'Urteaga', 'Boggio', '1', '78906586', NULL, 'Calle Matier 604', 'Cdra. 27 Av. Aviación', 'renan@gmail.com', '7777777', '150130', '150130', 'Activo', 1, '2020-01-04', '1', '1.00', '-12.1154531', '-76.9984062'),
(8, 'Persona', '4536', 'Luis', 'Rodriguez', 'Huaman', '1', '78906777', 'INTELLIPOS', 'Calle Beethoven 530', 'Cdra. 22 Av. San Luis', 'Luigi.huaranga@intellipos.com.pe', '7777799', '150130', '150130', 'Activo', 1, '2020-01-01', '1', '2.00', '-12.0387852', '-76.9623357'),
(10, 'Persona', '87075', 'Luigi', 'Huaranga', 'Chate', '1', '77223910', NULL, 'Av. Santa Anita 530', 'Cdra. 28 Av. Encalada', 'luigi@gmail.com', '999999999', '150130', '150130', 'Activo', 1, '2020-01-01', '3', '30.00', '-12.095338', '-76.994546'),
(17, 'Persona', '17', 'Carlos', 'Juarez', 'SAC', '1', '98828282', NULL, 'San Borja', 'al costado de aki', NULL, '98353333', '324324', '324324', 'Activo', 1, '2021-10-06', NULL, NULL, '-11.8200523', '-77.1300079'),
(10468, 'Empresa', '10468', 'FUNDACION PERUANA', '-', '-', '2', '20137741378', 'FUNDACION PERUANA DE CANCER', 'AV PRIMAVERA 1075', '-', 'prueba2@gyvsoftwa.com', '978914219', '150130', '150130', 'Activo', 1, '2021-10-09', NULL, NULL, '-15.8525286', '-70.0117343');

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

--
-- Volcado de datos para la tabla `detalleorden`
--

INSERT INTO `detalleorden` (`id`, `idorden`, `ordenpromocion`, `idpromocion`, `nombrepromocion`, `idprenda`, `nombreprenda`, `color`, `marca`, `precioprenda`, `nombreestados`, `observaciones`, `audios`, `imagenes`) VALUES
(116, 72, 'Udkpp', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE', 'TRIAL', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(117, 73, 'U95e2', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'RIPLEY', '17.00', NULL, NULL, NULL, NULL),
(118, 73, 'U95e2', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'RIPLEY', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(119, 73, 'Uemz5', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', 'Con Mancha @ Con Decoloración', 'Tiene desgastes', NULL, NULL),
(120, 74, 'Uk96e', NULL, NULL, 448, 'PANTALON NIÑO', 'NEGRO', 'TIGRE', '8.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(121, 74, 'U4auy', NULL, NULL, 346, 'CAMISA NIÑO', 'BLANCO', 'TIGRE', '7.00', 'Con Mancha', NULL, NULL, NULL),
(122, 75, 'U1ilf', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VERDE', 'RIPLEY', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(123, 75, 'Ugd72', 473, '3x2 PRENDAS DE CAMA', 3, 'ALMOHADA', 'VERDE', 'TIGRE', '10.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(124, 75, 'Uyfwg', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VERDE', 'TIGRE', '10.00', 'Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(125, 76, 'Uym35', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(126, 77, 'Uvfgi', NULL, NULL, 140, 'BLUSA  CUERO', 'VERDE', 'TIGRE', '30.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(127, 78, 'Unbbp', 473, '3x2 PRENDAS DE CAMA', 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(128, 78, 'U1djc', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(129, 78, 'Uq18n', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VIOLETA', 'ÉL', '10.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(130, 79, 'Uueq0', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE', 'TRIAL', '12.00', 'Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(131, 80, 'Us57a', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VERDE', 'RIPLEY', '23.00', 'Con Huequito', NULL, NULL, NULL),
(132, 80, 'U6854', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'WALON', '15.00', NULL, NULL, NULL, NULL),
(133, 80, 'Udgjz', 473, '3x2 PRENDAS DE CAMA', 6, 'BABUCHAS  NIÑO', 'VERDE', 'TIGRE', '8.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(134, 81, 'Ud8he', 475, '3x2 PRENDAS DE VESTIR', 1, 'ABRIGO', 'VERDE / VERDE A RAYAS', 'TIGRE', '23.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(135, 81, 'U80ad', 475, '3x2 PRENDAS DE VESTIR', 3, 'ALMOHADA', 'VERDE', 'TIGRE', '10.00', NULL, NULL, NULL, NULL),
(136, 81, 'Uhzao', 475, '3x2 PRENDAS DE VESTIR', 6, 'BABUCHAS  NIÑO', 'AMARILLO / AMARILLO A CUADROS', 'RIPLEY', '8.00', NULL, NULL, NULL, NULL),
(137, 81, 'Us57a', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VERDE', 'RIPLEY', '23.00', 'Con Huequito', NULL, NULL, NULL),
(138, 81, 'U6854', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'WALON', '15.00', NULL, NULL, NULL, NULL),
(139, 81, 'Udgjz', 473, '3x2 PRENDAS DE CAMA', 6, 'BABUCHAS  NIÑO', 'VERDE', 'TIGRE', '8.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(140, 82, 'U0hxs', NULL, NULL, 22, 'CASACA  PLUMAS', 'VERDE / VERDE A RAYAS', 'WALON', '25.00', 'Con Huequito', NULL, NULL, NULL),
(141, 82, 'Uej0f', NULL, NULL, 2, 'ABRIGO  NIÑO', 'ROSADO', 'BATA', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(142, 82, 'Ul76v', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(143, 82, 'Ul76v', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(144, 83, 'Ucz84', NULL, NULL, 70, 'FRAZADA ALPACA 2 PLAZA', 'VERDE / VERDE A RAYAS', 'TIGRE', '50.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(145, 83, 'Uidz6', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE', 'RIPLEY', '12.00', 'Con Rotura @ Con Desgaste', NULL, NULL, NULL),
(146, 84, 'Uv1nh', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(147, 84, 'Ucnk4', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TRIAL', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(148, 85, 'Uc1je', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(149, 86, 'Ull81', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VIOLETA', 'ÉL', '12.00', 'Con Desgaste', NULL, NULL, NULL),
(150, 87, 'Usc3t', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(151, 88, 'Ufwvq', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(152, 89, 'Usvn9', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(153, 90, 'Uy04k', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TIGRE', '90.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(154, 91, 'Uil3u', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VIOLETA', 'ÉL', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(155, 92, 'U2ipe', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', NULL, NULL, NULL, NULL),
(156, 93, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(157, 94, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(158, 95, 'Uvgrh', NULL, NULL, 72, 'FRAZADA ALPACA KING', 'MARRON', 'JHON KELVIN', '80.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(159, 95, 'Uhzb8', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'RIPLEY', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(160, 96, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(161, 97, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(162, 98, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(163, 99, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(164, 100, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(165, 101, 'Uoaeo', NULL, NULL, 3, 'ALMOHADA', 'VIOLETA', 'ÉL', '10.00', NULL, NULL, NULL, NULL),
(166, 102, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(167, 103, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(168, 104, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(169, 105, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(170, 106, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(171, 107, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(172, 108, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(173, 109, 'Ura15', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(174, 110, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(175, 111, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(176, 112, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(177, 113, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(178, 114, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(179, 115, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(180, 116, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(181, 117, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(182, 118, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(183, 119, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(184, 120, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(185, 121, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(186, 122, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(187, 123, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(188, 124, 'U3ytl', NULL, NULL, 3, 'ALMOHADA', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(189, 125, 'Ud27o', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE', 'RIPLEY', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(190, 126, 'U71gu', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', NULL, NULL, NULL, NULL),
(191, 127, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(192, 127, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(193, 128, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(194, 128, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(195, 129, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(196, 129, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(197, 130, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(198, 130, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(199, 131, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(200, 131, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(201, 132, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(202, 132, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(203, 133, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(204, 133, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(205, 134, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(206, 134, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(207, 135, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(208, 135, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(209, 136, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(210, 136, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(211, 137, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(212, 137, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(213, 138, 'Ufo16', NULL, NULL, 138, 'ABRIGO CUERO ACOLCHADO', 'VERDE / VERDE A RAYAS', 'TRIAL', '90.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(214, 138, 'Ufvea', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'RIPLEY', '80.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(215, 139, 'U8df7', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(216, 139, 'Uypg1', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VIOLETA', 'ÉL', '12.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(217, 140, 'U11ij', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', NULL, NULL, NULL, NULL),
(218, 141, 'Ury7r', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(219, 142, 'Uuhf5', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(220, 142, 'Uhuet', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(221, 143, 'Uuhf5', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(222, 143, 'Uhuet', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(223, 144, 'Uuhf5', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(224, 144, 'Uhuet', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(225, 145, 'Uuhf5', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(226, 145, 'Uhuet', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(227, 146, 'Uuhf5', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(228, 146, 'Uhuet', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(229, 147, 'Uw2op', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE', 'RIPLEY', '12.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(230, 147, 'U5gww', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(231, 148, 'Uxx8z', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(232, 148, 'Uaf87', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VIOLETA', 'ÉL', '12.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(233, 149, 'Ut1wd', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(234, 150, 'Uicge', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'REUSH', '15.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(235, 151, 'Uicge', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'REUSH', '15.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(236, 152, 'Uicge', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'REUSH', '15.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(237, 153, 'Uk5mx', NULL, NULL, 1, 'ABRIGO', 'VERDE', 'RIPLEY', '23.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(238, 154, 'U0698', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(239, 155, 'Upe8a', NULL, NULL, 70, 'FRAZADA ALPACA 2 PLAZA', 'VERDE / VERDE A RAYAS', 'TIGRE', '50.00', 'Con Decoloración', NULL, NULL, NULL),
(240, 155, 'Ujwuy', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VIOLETA', 'ÉL', '12.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(241, 156, 'Udqwo', NULL, NULL, 245, 'ABRIGO SUBIR BASTA', 'VERDE', 'TIGRE', '20.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(242, 157, 'Udqwo', NULL, NULL, 245, 'ABRIGO SUBIR BASTA', 'VERDE', 'TIGRE', '20.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(243, 158, 'Udqwo', NULL, NULL, 245, 'ABRIGO SUBIR BASTA', 'VERDE', 'TIGRE', '20.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(244, 159, 'Udqwo', NULL, NULL, 245, 'ABRIGO SUBIR BASTA', 'VERDE', 'TIGRE', '20.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(245, 160, 'Uffpf', NULL, NULL, 110, 'SACO PANA /SEDA', 'VERDE', 'TIGRE', '14.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(246, 160, 'U3sy8', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TRIAL', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(247, 161, 'Uwwzs', NULL, NULL, 190, 'MOCHILA DE GAMUZA CHICO', 'VERDE / VERDE A RAYAS', 'TIGRE', '30.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(248, 161, 'Uldc7', NULL, NULL, 139, 'ABRIGO  CUERO', 'VERDE', 'TRIAL', '80.00', 'Con Rotura', NULL, NULL, NULL),
(249, 162, 'Uuwt2', NULL, NULL, 207, 'SHORT GAMUZA', 'VERDE', 'TIGRE', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(250, 162, 'Uy0ps', NULL, NULL, 140, 'BLUSA  CUERO', 'VERDE / VERDE A RAYAS', 'TIGRE', '30.00', 'Con Mancha @ Con Desgaste @ Con Decoloración', NULL, NULL, NULL),
(251, 163, 'Utr8v', NULL, NULL, 472, 'CASACA ALPACA', 'VIOLACEO', 'WALON', '25.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(252, 163, 'Uhnpp', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(253, 164, 'U6f8o', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE / VERDE A RAYAS', 'WALON', '15.00', NULL, NULL, NULL, NULL),
(254, 164, 'Ure6j', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE / VERDE A RAYAS', 'TRIAL', '15.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(255, 165, 'Uq3fc', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE', 'TIGRE', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(256, 165, 'U09t9', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(257, 166, 'Upjq1', NULL, NULL, 471, 'SACO ALPACA', 'VIOLETA', 'ÉL', '25.00', 'Con Decoloración', NULL, NULL, NULL),
(258, 166, 'Uqu9f', NULL, NULL, 70, 'FRAZADA ALPACA 2 PLAZA', 'VIOLETA', 'ÉL', '50.00', NULL, NULL, NULL, NULL),
(259, 166, 'U92cy', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(260, 166, 'Updwn', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(261, 166, 'U6t6f', NULL, NULL, 70, 'FRAZADA ALPACA 2 PLAZA', 'VIOLETA', 'ÉL', '50.00', NULL, NULL, NULL, NULL),
(262, 166, 'Unecf', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(263, 166, 'Uo2wb', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(264, 166, 'Usxwy', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VIOLETA', 'ÉL', '12.00', NULL, NULL, NULL, NULL),
(265, 167, 'Uk4h4', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TRIAL', '12.00', 'Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(266, 167, 'U9731', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE', 'RIPLEY', '12.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(267, 167, 'Ur0bh', NULL, NULL, 463, 'ESTOLA SACERDOTE', 'VERDE / VERDE A RAYAS', 'TRIAL', '18.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(268, 167, 'U1hi5', NULL, NULL, 41, 'CHAL - PASHMINA GRANDE', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(269, 167, 'Ux72n', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'TIGRE', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(270, 168, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(271, 169, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(272, 170, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(273, 171, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(274, 172, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(275, 173, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(276, 174, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(277, 175, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(278, 176, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(279, 177, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(280, 178, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(281, 179, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(282, 180, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(283, 181, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(284, 182, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(285, 183, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(286, 184, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(287, 185, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(288, 186, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(289, 187, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(290, 188, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(291, 189, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(292, 190, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(293, 191, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(294, 192, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(295, 193, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(296, 194, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(297, 195, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(298, 196, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(299, 197, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(300, 198, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(301, 199, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(302, 200, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(303, 201, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(304, 202, 'Uml0q', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(305, 203, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(306, 203, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(307, 203, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(308, 203, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(309, 203, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(310, 203, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(311, 203, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(312, 203, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(313, 204, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(314, 204, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(315, 204, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(316, 204, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(317, 204, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(318, 204, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(319, 204, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(320, 204, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(321, 205, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(322, 205, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(323, 205, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(324, 205, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(325, 205, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(326, 205, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(327, 205, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(328, 205, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(329, 206, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(330, 206, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(331, 206, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(332, 206, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(333, 206, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(334, 206, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(335, 206, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(336, 206, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(337, 207, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(338, 207, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(339, 207, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(340, 207, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(341, 207, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(342, 207, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(343, 207, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(344, 207, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(345, 208, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(346, 208, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(347, 208, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(348, 208, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(349, 208, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(350, 208, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(351, 208, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(352, 208, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(353, 209, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Huequito', NULL, NULL, NULL),
(354, 209, 'Ulzug', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TIGRE', '0.00', 'Con Mancha @ Con Rotura @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(355, 209, 'Uyjws', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'RIPLEY', '15.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(356, 209, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(357, 209, 'U3dak', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'WALON', '0.00', NULL, NULL, NULL, NULL),
(358, 209, 'Ut87g', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TIGRE', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(359, 209, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(360, 209, 'Umfbn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(361, 210, 'Un7dj', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(362, 211, 'Un7dj', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(363, 212, 'Un7dj', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(364, 213, 'Un7dj', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(365, 214, 'Un7dj', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'VIOLETA', 'ÉL', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(366, 215, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(367, 215, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(368, 216, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(369, 216, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(370, 217, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(371, 217, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(372, 218, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(373, 218, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(374, 219, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(375, 219, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(376, 220, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(377, 220, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(378, 221, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(379, 221, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(380, 222, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(381, 222, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(382, 223, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(383, 223, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(384, 223, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(385, 224, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(386, 224, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(387, 224, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(388, 225, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(389, 225, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'TURQUESA', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(390, 225, 'Uv744', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'TURQUESA', 'RIPLEY', '0.00', 'Con Mancha @ Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(391, 226, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(392, 227, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(393, 228, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(394, 229, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(395, 230, 'U3xjp', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '17.00', 'Con Mancha @ Con Rotura @ Con Decoloración', NULL, NULL, NULL),
(396, 230, 'U3xjp', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(397, 230, 'U1pam', NULL, NULL, 4, 'ALMOHADA GRANDE', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(398, 231, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TRIAL', '17.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(399, 231, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TRIAL', '0.00', NULL, NULL, NULL, NULL),
(400, 232, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TRIAL', '17.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(401, 232, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TRIAL', '0.00', NULL, NULL, NULL, NULL),
(402, 233, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TRIAL', '17.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(403, 233, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TRIAL', '0.00', NULL, NULL, NULL, NULL),
(404, 234, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'TRIAL', '17.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(405, 234, 'Uacpn', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'TRIAL', '0.00', NULL, NULL, NULL, NULL),
(406, 235, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(407, 235, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(408, 236, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(409, 236, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(410, 237, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(411, 237, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(412, 238, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(413, 238, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(414, 239, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(415, 239, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(416, 240, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(417, 240, 'Ufsxb', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE / VERDE A RAYAS', 'TRIAL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(418, 241, 'Uizri', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(419, 242, 'Uizri', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VERDE', 'TRIAL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(420, 243, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(421, 243, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'RIPLEY', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(422, 244, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(423, 244, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'RIPLEY', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(424, 245, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(425, 245, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'RIPLEY', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(426, 246, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(427, 246, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'RIPLEY', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(428, 247, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VERDE', 'RIPLEY', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(429, 247, 'Uv5yt', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VERDE', 'RIPLEY', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(430, 248, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(431, 249, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(432, 250, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(433, 251, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(434, 252, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(435, 253, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(436, 254, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL);
INSERT INTO `detalleorden` (`id`, `idorden`, `ordenpromocion`, `idpromocion`, `nombrepromocion`, `idprenda`, `nombreprenda`, `color`, `marca`, `precioprenda`, `nombreestados`, `observaciones`, `audios`, `imagenes`) VALUES
(437, 255, 'Uyli1', NULL, NULL, 121, 'TOALLA PEQUEÑA', 'VIOLETA', 'ÉL', '5.00', NULL, NULL, NULL, NULL),
(438, 256, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', NULL, NULL, NULL, NULL),
(439, 256, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', NULL, NULL, NULL, NULL),
(440, 257, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', NULL, NULL, NULL, NULL),
(441, 257, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', NULL, NULL, NULL, NULL),
(442, 258, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(443, 258, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(444, 259, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(445, 259, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(446, 260, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(447, 260, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(448, 260, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(449, 261, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(450, 261, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(451, 261, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(452, 262, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(453, 262, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(454, 262, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(455, 263, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(456, 263, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(457, 263, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(458, 264, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(459, 264, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(460, 264, 'Ucwtj', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(461, 265, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(462, 266, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(463, 267, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(464, 268, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(465, 269, 'Upvlh', NULL, NULL, 2, 'ABRIGO  NIÑO', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(466, 270, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(467, 270, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(468, 271, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(469, 271, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(470, 272, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(471, 272, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(472, 273, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(473, 273, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(474, 274, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(475, 274, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(476, 275, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(477, 275, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(478, 276, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(479, 276, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(480, 277, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(481, 277, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(482, 278, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(483, 278, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(484, 279, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(485, 279, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(486, 280, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(487, 280, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(488, 281, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(489, 281, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(490, 282, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(491, 282, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(492, 283, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(493, 283, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(494, 284, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(495, 284, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(496, 285, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(497, 285, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(498, 286, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(499, 286, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(500, 287, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(501, 287, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(502, 288, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(503, 288, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(504, 289, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(505, 289, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(506, 290, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(507, 290, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(508, 291, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(509, 291, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(510, 292, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(511, 292, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(512, 293, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(513, 293, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(514, 294, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(515, 294, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(516, 295, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(517, 295, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(518, 296, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(519, 296, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(520, 297, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(521, 297, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(522, 298, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(523, 298, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(524, 299, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(525, 299, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(526, 300, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(527, 300, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(528, 301, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(529, 301, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(530, 302, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '17.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(531, 302, 'Untys', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'VIOLETA', 'ÉL', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(532, 303, 'Uzrwv', NULL, NULL, 3, 'ALMOHADA', 'TURQUESA', 'RIPLEY', '10.00', 'Con Rotura @ Con Huequito', NULL, NULL, NULL),
(533, 304, 'Uksr7', NULL, NULL, 3, 'ALMOHADA', 'TURQUESA', 'RIPLEY', '10.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(534, 304, 'Uklzi', 119, 'TERNO NIÑO (2 PZS.)', 40, 'CHALECO VESTIR', 'ROSADO', 'TIGRE', '17.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(535, 304, 'Uklzi', 119, 'TERNO NIÑO (2 PZS.)', 93, 'PANTALÓN VESTIR', 'ROSADO', 'TIGRE', '0.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(536, 305, 'U5tew', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VIOLETA', 'ÉL', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(537, 305, 'Uquik', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'RIPLEY', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(538, 305, 'Uqnvv', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(539, 306, 'U5tew', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VIOLETA', 'ÉL', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(540, 306, 'Uquik', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'RIPLEY', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(541, 306, 'Uqnvv', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(542, 307, 'Uqbee', 475, '3x2 PRENDAS DE VESTIR', 1, 'ABRIGO', 'VERDE', 'TIGRE', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(543, 307, 'Un1ud', 475, '3x2 PRENDAS DE VESTIR', 4, 'ALMOHADA GRANDE', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(544, 307, 'Uljw0', 475, '3x2 PRENDAS DE VESTIR', 5, 'BABUCHAS', 'TURQUESA', 'TRIAL', '10.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(545, 307, 'U5tew', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VIOLETA', 'ÉL', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(546, 307, 'Uquik', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'RIPLEY', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(547, 307, 'Uqnvv', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(548, 308, 'Uqbee', 475, '3x2 PRENDAS DE VESTIR', 1, 'ABRIGO', 'VERDE', 'TIGRE', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(549, 308, 'Un1ud', 475, '3x2 PRENDAS DE VESTIR', 4, 'ALMOHADA GRANDE', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(550, 308, 'Uljw0', 475, '3x2 PRENDAS DE VESTIR', 5, 'BABUCHAS', 'TURQUESA', 'TRIAL', '10.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(551, 308, 'U5tew', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VIOLETA', 'ÉL', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(552, 308, 'Uquik', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'RIPLEY', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(553, 308, 'Uqnvv', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(554, 309, 'Uqbee', 475, '3x2 PRENDAS DE VESTIR', 1, 'ABRIGO', 'VERDE', 'TIGRE', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(555, 309, 'Un1ud', 475, '3x2 PRENDAS DE VESTIR', 4, 'ALMOHADA GRANDE', 'VIOLETA', 'ÉL', '15.00', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(556, 309, 'Uljw0', 475, '3x2 PRENDAS DE VESTIR', 5, 'BABUCHAS', 'TURQUESA', 'TRIAL', '10.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(557, 309, 'U5tew', 473, '3x2 PRENDAS DE CAMA', 1, 'ABRIGO', 'VIOLETA', 'ÉL', '23.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(558, 309, 'Uquik', 473, '3x2 PRENDAS DE CAMA', 4, 'ALMOHADA GRANDE', 'VERDE', 'RIPLEY', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(559, 309, 'Uqnvv', 473, '3x2 PRENDAS DE CAMA', 5, 'BABUCHAS', 'VERDE', 'TRIAL', '10.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(560, 310, 'Ue0l0', NULL, NULL, 70, 'FRAZADA ALPACA 2 PLAZA', 'VERDE / VERDE A RAYAS', 'TIGRE', '50.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(561, 310, 'Uyg9e', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TIGRE', '12.00', 'Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(562, 310, 'Usy94', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE / VERDE A RAYAS', 'TRIAL', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(563, 311, 'Ucf47', NULL, NULL, 69, 'FRAZADA ALPACA 1 1/2 PLAZA', 'AMARILLO', 'TIGRE', '35.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(564, 311, 'Ufh21', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE', 'TIGRE', '12.00', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(565, 312, 'U0aej', NULL, NULL, 18, 'CAMISA  C/ ALMIDÓN', 'VERDE', 'TIGRE', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL);

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
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(25) NOT NULL,
  `idrepartidor` int(25) NOT NULL,
  `nombrerepartidor` varchar(255) NOT NULL,
  `idservicio` int(25) NOT NULL,
  `nombreservicio` varchar(255) NOT NULL,
  `tipofactura` enum('Boleta','Factura','Ninguno') NOT NULL DEFAULT 'Factura',
  `numeroserie` varchar(255) DEFAULT NULL,
  `numeroorden` varchar(255) NOT NULL,
  `tipodocumento` enum('DNI','RUC') NOT NULL,
  `dniruc` varchar(255) NOT NULL,
  `nombrecliente` varchar(255) NOT NULL,
  `idcliente` int(25) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `detalleorden` text NOT NULL,
  `nombredocumento` varchar(255) DEFAULT NULL,
  `respuesta_sunat` enum('ok','error','pendiente') DEFAULT 'error',
  `xml` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `idrepartidor`, `nombrerepartidor`, `idservicio`, `nombreservicio`, `tipofactura`, `numeroserie`, `numeroorden`, `tipodocumento`, `dniruc`, `nombrecliente`, `idcliente`, `fecha`, `hora`, `detalleorden`, `nombredocumento`, `respuesta_sunat`, `xml`) VALUES
(1, 1, 'Roberto Manuel', 2, 'SECO', 'Factura', 'F003-0000001', 'C1-0000171', 'RUC', '78906777', 'INTELLIPOS', 8, '2021-10-05', '10:21:00', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'F003-000000120211005102100.pdf', 'error', NULL),
(2, 1, 'Roberto Manuel', 2, 'SECO', 'Factura', 'F003-0000002', 'C1-0000310', 'RUC', '78906777', 'INTELLIPOS', 8, '2021-10-05', '10:31:00', '[{\"idprenda\":\"70\",\"ordenpromocion\":\"Ue0l0\",\"precio\":\"50.00\",\"nombreprenda\":\"FRAZADA ALPACA 2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ue0l0\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Uyg9e\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyg9e\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Usy94\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Usy94\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'F003-000000220211005103100.pdf', 'error', NULL),
(3, 1, 'Roberto Manuel', 3, 'AGUA', 'Factura', 'F003-0000003', 'C1-0000151', 'RUC', '78906777', 'INTELLIPOS', 8, '2021-10-05', '10:32:00', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 'F003-000000320211005103200.pdf', 'error', NULL);

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
  `idcliente` int(25) NOT NULL,
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
  `tipo_pago` enum('Efectivo','Tarjeta','Cheque','Transferencia','Yape','Plin','Por Cobrar') COLLATE utf8_spanish_ci DEFAULT 'Por Cobrar',
  `tipo_atencion` enum('Entrega','Recojo','Reclamo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Entrega',
  `array_detalleorden` text COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'para convertir en array usar: json_decode',
  `flag` int(12) NOT NULL DEFAULT 0 COMMENT '1 por defecto , cuando es un registro nuevo\r\n2 cuando hayas editado el registro, sea el motivo q sea\r\n\r\nyo siempre lo actualizaré a 0\r\nsi es 1, hago a la mala un insert a mi tabla\r\nSi es 2, le hago un update a mi tabla\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `idservicio`, `numeroorden`, `nombre_servicio`, `nombre_repartidor`, `fecha`, `hora`, `idcliente`, `nombre_cliente`, `celular_cliente`, `direccion_cliente`, `fecha_entrega`, `hora_entrega`, `tipo_cobro`, `idzona`, `total_s_dscto`, `descuento`, `total_pagar`, `a_cuenta`, `saldo`, `estado`, `tipo_pago`, `tipo_atencion`, `array_detalleorden`, `flag`) VALUES
(72, 2, 'C1-0000072', 'SECO', 'Roberto Manrique', '2021-09-17', '10:24:07', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:15:57', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"41\",\"ordenpromocion\":\"Udkpp\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Udkpp\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 1),
(73, 3, 'C1-0000073', 'AGUA', 'Roberto Manrique', '2021-09-18', '18:20:57', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '12:34:00', 'Por Cobrar', 'C1', '0.00', '0.00', '27.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"U95e2\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U2474\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uf278\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"3\",\"ordenpromocion\":\"Uemz5\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uemz5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":\"Tiene desgastes\",\"audios\":null,\"imagenes\":null}]}]', 2),
(75, 1, 'C1-0000075', 'PROMOCIONES', 'Roberto Manrique', '2021-09-20', '17:33:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:58:25', 'Por Cobrar', 'C1', '0.00', '0.00', '33.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Reclamo', '{\"3x2 PRENDAS DE CAMA\":[{\"key\":\"U1ilf\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ugd72\",\"idprenda\":\"3\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Rotura @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uyfwg\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Rotura @ Con Decoloraci\\u00f3n\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(76, 3, 'C1-0000076', 'AGUA', 'Roberto Manrique', '2021-09-20', '17:34:45', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:34:45', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Uym35\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uym35\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(77, 4, 'C1-0000077', 'PIELES', 'Roberto Manrique', '2021-09-20', '17:36:55', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:36:55', 'Por Cobrar', 'C1', '0.00', '0.00', '30.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"140\",\"ordenpromocion\":\"Uvfgi\",\"precio\":\"30.00\",\"nombreprenda\":\"BLUSA  CUERO\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uvfgi\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 1),
(78, 1, 'C1-0000078', 'PROMOCIONES', 'Roberto Manrique', '2021-09-21', '17:18:40', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:18:40', 'Por Cobrar', 'C1', '0.00', '0.00', '30.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE CAMA\":[{\"key\":\"Unbbp\",\"idprenda\":\"2\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Rotura @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U1djc\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uq18n\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(79, 2, 'C1-0000079', 'SECO', 'Roberto Manrique', '2021-09-22', '10:12:47', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '10:12:47', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"41\",\"ordenpromocion\":\"Uueq0\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uueq0\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(80, 1, 'C1-0000080', 'PROMOCIONES', 'Roberto Manrique', '2021-09-22', '12:15:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '12:15:19', 'Por Cobrar', 'C1', '0.00', '0.00', '38.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE CAMA\":[{\"key\":\"Us57a\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U6854\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"WALON\",\"precioprenda\":\"15.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Udgjz\",\"idprenda\":\"6\",\"nombreprenda\":\"BABUCHAS  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"8.00\",\"nombreestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 1),
(81, 1, 'C1-0000081', 'PROMOCIONES', 'Roberto Manrique', '2021-09-22', '12:16:18', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '12:16:18', 'Por Cobrar', 'C1', '0.00', '0.00', '71.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE VESTIR\":[{\"key\":\"Ud8he\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U80ad\",\"idprenda\":\"3\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"10.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uhzao\",\"idprenda\":\"6\",\"nombreprenda\":\"BABUCHAS  NI\\u00d1O\",\"color\":\"AMARILLO \\/ AMARILLO A CUADROS\",\"marca\":\"RIPLEY\",\"precioprenda\":\"8.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null}],\"3x2 PRENDAS DE CAMA\":[{\"key\":\"Us57a\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U6854\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"WALON\",\"precioprenda\":\"15.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Udgjz\",\"idprenda\":\"6\",\"nombreprenda\":\"BABUCHAS  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"8.00\",\"nombreestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(82, 3, 'C1-0000082', 'AGUA', 'Roberto Manrique', '2021-09-29', '10:19:44', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '10:19:44', 'Por Cobrar', 'C1', '0.00', '0.00', '57.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"22\",\"ordenpromocion\":\"U0hxs\",\"precio\":\"25.00\",\"nombreprenda\":\"CASACA  PLUMAS\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U0hxs\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uej0f\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"ROSADO\",\"marca\":\"BATA\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uej0f\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Ul76v\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U53ah\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ue4cw\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(83, 2, 'C1-0000083', 'SECO', 'Roberto Manrique', '2021-09-29', '15:04:55', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:04:55', 'Por Cobrar', 'C1', '0.00', '0.00', '62.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"70\",\"ordenpromocion\":\"Ucz84\",\"precio\":\"50.00\",\"nombreprenda\":\"FRAZADA ALPACA 2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ucz84\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Uidz6\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uidz6\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(84, 2, 'C1-0000084', 'SECO', 'Roberto Manrique', '2021-09-29', '15:08:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:08:19', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uv1nh\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uv1nh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Ucnk4\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ucnk4\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(85, 2, 'C1-0000085', 'SECO', 'Roberto Manrique', '2021-09-29', '15:10:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:10:58', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uc1je\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uc1je\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(86, 2, 'C1-0000086', 'SECO', 'Roberto Manrique', '2021-09-29', '15:17:54', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:17:54', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Ull81\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ull81\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(87, 3, 'C1-0000087', 'AGUA', 'Roberto Manrique', '2021-09-29', '15:19:08', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:19:08', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Usc3t\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Usc3t\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(88, 3, 'C1-0000088', 'AGUA', 'Roberto Manrique', '2021-09-29', '15:21:25', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:21:25', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Ufwvq\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufwvq\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(89, 2, 'C1-0000089', 'SECO', 'Roberto Manrique', '2021-09-29', '15:23:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:23:41', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Usvn9\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Usvn9\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(90, 4, 'C1-0000090', 'PIELES', 'Roberto Manrique', '2021-09-29', '15:25:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:25:03', 'Por Cobrar', 'C1', '0.00', '0.00', '90.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Uy04k\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uy04k\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(91, 2, 'C1-0000091', 'SECO', 'Roberto Manrique', '2021-09-29', '15:29:56', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:29:56', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uil3u\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uil3u\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(92, 3, 'C1-0000092', 'AGUA', 'Roberto Manrique', '2021-09-29', '15:36:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:36:38', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"U2ipe\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U2ipe\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(93, 3, 'C1-0000093', 'AGUA', 'Roberto Manrique', '2021-09-29', '15:43:23', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:43:23', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(94, 3, 'C1-0000094', 'AGUA', 'Roberto Manrique', '2021-09-29', '15:57:50', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:57:50', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(95, 2, 'C1-0000095', 'SECO', 'Roberto Manrique', '2021-09-29', '16:00:39', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:00:39', 'Por Cobrar', 'C1', '0.00', '0.00', '92.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"72\",\"ordenpromocion\":\"Uvgrh\",\"precio\":\"80.00\",\"nombreprenda\":\"FRAZADA ALPACA KING\",\"color\":\"MARRON\",\"marca\":\"JHON KELVIN\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uvgrh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Uhzb8\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhzb8\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(96, 3, 'C1-0000096', 'AGUA', 'Roberto Manrique', '2021-09-29', '16:17:05', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:17:05', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(97, 3, 'C1-0000097', 'AGUA', 'Roberto Manrique', '2021-09-29', '16:17:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:17:38', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(98, 3, 'C1-0000098', 'AGUA', 'Roberto Manrique', '2021-09-29', '16:21:43', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:21:43', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(99, 3, 'C1-0000099', 'AGUA', 'Roberto Manrique', '2021-09-29', '16:22:52', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:22:52', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(100, 3, 'C1-0000100', 'AGUA', 'Roberto Manrique', '2021-09-29', '16:23:57', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:23:57', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(101, 3, 'C1-0000101', 'AGUA', 'Roberto Manrique', '2021-09-29', '16:25:08', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:25:08', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uoaeo\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uoaeo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(102, 3, 'C1-0000102', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:00:29', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:00:29', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(103, 3, 'C1-0000103', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:03:37', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:03:37', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(104, 3, 'C1-0000104', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:05:37', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:05:37', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(105, 3, 'C1-0000105', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:06:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:06:32', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(106, 3, 'C1-0000106', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:10:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:10:32', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(107, 3, 'C1-0000107', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:10:54', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:10:54', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(108, 3, 'C1-0000108', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:11:42', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:11:42', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(109, 3, 'C1-0000109', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:24:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:24:32', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ura15\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ura15\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(110, 3, 'C1-0000110', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:32:23', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:32:23', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(111, 3, 'C1-0000111', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:36:05', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:36:05', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(112, 3, 'C1-0000112', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:38:40', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:38:40', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(113, 3, 'C1-0000113', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:41:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:41:06', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(114, 3, 'C1-0000114', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:41:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:41:41', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(115, 3, 'C1-0000115', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:41:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:41:59', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(116, 3, 'C1-0000116', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:45:04', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:45:04', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(117, 3, 'C1-0000117', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:52:22', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:52:22', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(118, 3, 'C1-0000118', 'AGUA', 'Roberto Manrique', '2021-09-29', '21:53:47', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '21:53:47', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(119, 3, 'C1-0000119', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:00:12', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:00:12', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(120, 3, 'C1-0000120', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:00:46', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:00:46', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(121, 3, 'C1-0000121', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:02:53', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:02:53', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(122, 3, 'C1-0000122', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:11:48', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:11:48', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(123, 3, 'C1-0000123', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:12:55', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:12:55', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(124, 3, 'C1-0000124', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:13:28', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:13:28', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"U3ytl\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3ytl\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(125, 2, 'C1-0000125', 'SECO', 'Roberto Manrique', '2021-09-29', '22:20:37', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:20:37', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Ud27o\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ud27o\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(126, 3, 'C1-0000126', 'AGUA', 'Roberto Manrique', '2021-09-29', '22:21:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:21:03', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"U71gu\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U71gu\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(127, 4, 'C1-0000127', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:28:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:28:38', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(128, 4, 'C1-0000128', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:31:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:31:06', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(129, 4, 'C1-0000129', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:31:51', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:31:51', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(130, 4, 'C1-0000130', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:32:30', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:32:30', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(131, 4, 'C1-0000131', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:33:23', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:33:23', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(132, 4, 'C1-0000132', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:34:55', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:34:55', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(133, 4, 'C1-0000133', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:35:33', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:35:33', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(134, 4, 'C1-0000134', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:36:37', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:36:37', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(135, 4, 'C1-0000135', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:37:10', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:37:10', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(136, 4, 'C1-0000136', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:37:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:37:59', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(137, 4, 'C1-0000137', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:41:50', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:41:50', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(138, 4, 'C1-0000138', 'PIELES', 'Roberto Manrique', '2021-09-29', '22:43:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '22:43:19', 'Por Cobrar', 'C1', '0.00', '0.00', '170.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"138\",\"ordenpromocion\":\"Ufo16\",\"precio\":\"90.00\",\"nombreprenda\":\"ABRIGO CUERO ACOLCHADO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufo16\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Ufvea\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufvea\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2);
INSERT INTO `orden` (`id`, `idservicio`, `numeroorden`, `nombre_servicio`, `nombre_repartidor`, `fecha`, `hora`, `idcliente`, `nombre_cliente`, `celular_cliente`, `direccion_cliente`, `fecha_entrega`, `hora_entrega`, `tipo_cobro`, `idzona`, `total_s_dscto`, `descuento`, `total_pagar`, `a_cuenta`, `saldo`, `estado`, `tipo_pago`, `tipo_atencion`, `array_detalleorden`, `flag`) VALUES
(139, 2, 'C1-0000139', 'SECO', 'Roberto Manrique', '2021-09-29', '23:01:33', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:01:33', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"41\",\"ordenpromocion\":\"U8df7\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U8df7\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uypg1\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uypg1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(140, 3, 'C1-0000140', 'AGUA', 'Roberto Manrique', '2021-09-29', '23:05:08', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:05:08', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"U11ij\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U11ij\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(141, 3, 'C1-0000141', 'AGUA', 'Roberto Manrique', '2021-09-29', '23:06:24', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:06:24', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Ury7r\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ury7r\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(142, 2, 'C1-0000142', 'SECO', 'Roberto Manrique', '2021-09-29', '23:13:08', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:13:08', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uuhf5\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uuhf5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uhuet\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhuet\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(143, 2, 'C1-0000143', 'SECO', 'Roberto Manrique', '2021-09-29', '23:14:14', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:14:14', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uuhf5\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uuhf5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uhuet\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhuet\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(144, 2, 'C1-0000144', 'SECO', 'Roberto Manrique', '2021-09-29', '23:20:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:20:06', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uuhf5\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uuhf5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uhuet\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhuet\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(145, 2, 'C1-0000145', 'SECO', 'Roberto Manrique', '2021-09-29', '23:20:50', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:20:50', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uuhf5\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uuhf5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uhuet\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhuet\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(146, 2, 'C1-0000146', 'SECO', 'Roberto Manrique', '2021-09-29', '23:22:30', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:22:30', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uuhf5\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uuhf5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uhuet\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhuet\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(147, 2, 'C1-0000147', 'SECO', 'Roberto Manrique', '2021-09-29', '23:28:00', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:28:00', 'Por Cobrar', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"41\",\"ordenpromocion\":\"Uw2op\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uw2op\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"U5gww\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U5gww\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(148, 2, 'C1-0000148', 'SECO', 'Roberto Manrique', '2021-09-29', '23:32:04', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:32:04', 'Cancelado', 'C1', '0.00', '0.00', '24.00', '0.00', '0.00', 'Activo', 'Transferencia', 'Entrega', '[{\"idprenda\":\"41\",\"ordenpromocion\":\"Uxx8z\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uxx8z\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Uaf87\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uaf87\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(149, 2, 'C1-0000149', 'SECO', 'Roberto Manrique', '2021-09-29', '23:34:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '23:34:59', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Ut1wd\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut1wd\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(150, 3, 'C1-0000150', 'AGUA', 'Roberto Manrique', '2021-09-30', '00:02:39', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:02:39', 'Cancelado', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Tarjeta', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(151, 3, 'C1-0000151', 'AGUA', 'Roberto Manrique', '2021-09-30', '00:02:51', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:02:51', 'Cancelado', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Efectivo', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(152, 3, 'C1-0000152', 'AGUA', 'Roberto Manrique', '2021-09-30', '00:04:13', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:04:13', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"Uicge\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"REUSH\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uicge\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(153, 5, 'C1-0000153', 'PLANCHADO', 'Roberto Manrique', '2021-09-30', '00:04:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:04:32', 'Por Cobrar', 'C1', '0.00', '0.00', '23.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"1\",\"ordenpromocion\":\"Uk5mx\",\"precio\":\"23.00\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uk5mx\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(154, 2, 'C1-0000154', 'SECO', 'Roberto Manrique', '2021-09-30', '00:10:02', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:10:02', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"U0698\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U0698\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(155, 2, 'C1-0000155', 'SECO', 'Roberto Manrique', '2021-09-30', '00:10:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:10:58', 'Por Cobrar', 'C1', '0.00', '0.00', '62.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"70\",\"ordenpromocion\":\"Upe8a\",\"precio\":\"50.00\",\"nombreprenda\":\"FRAZADA ALPACA 2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upe8a\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Ujwuy\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ujwuy\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(156, 6, 'C1-0000156', 'COSTURA', 'Roberto Manrique', '2021-09-30', '00:12:33', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:12:33', 'Por Cobrar', 'C1', '0.00', '0.00', '20.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"245\",\"ordenpromocion\":\"Udqwo\",\"precio\":\"20.00\",\"nombreprenda\":\"ABRIGO SUBIR BASTA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Udqwo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(157, 6, 'C1-0000157', 'COSTURA', 'Roberto Manrique', '2021-09-30', '00:13:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:13:41', 'Por Cobrar', 'C1', '0.00', '0.00', '20.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"245\",\"ordenpromocion\":\"Udqwo\",\"precio\":\"20.00\",\"nombreprenda\":\"ABRIGO SUBIR BASTA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Udqwo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(158, 6, 'C1-0000158', 'COSTURA', 'Roberto Manrique', '2021-09-30', '00:14:16', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:14:16', 'Por Cobrar', 'C1', '0.00', '0.00', '20.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"245\",\"ordenpromocion\":\"Udqwo\",\"precio\":\"20.00\",\"nombreprenda\":\"ABRIGO SUBIR BASTA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Udqwo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(159, 6, 'C1-0000159', 'COSTURA', 'Roberto Manrique', '2021-09-30', '00:15:37', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:15:37', 'Por Cobrar', 'C1', '0.00', '0.00', '20.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"245\",\"ordenpromocion\":\"Udqwo\",\"precio\":\"20.00\",\"nombreprenda\":\"ABRIGO SUBIR BASTA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Udqwo\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(160, 2, 'C1-0000160', 'SECO', 'Roberto Manrique', '2021-10-04', '13:57:10', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '13:57:10', 'Por Cobrar', 'C1', '0.00', '0.00', '26.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"110\",\"ordenpromocion\":\"Uffpf\",\"precio\":\"14.00\",\"nombreprenda\":\"SACO PANA \\/SEDA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uffpf\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"U3sy8\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U3sy8\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(161, 4, 'C1-0000161', 'PIELES', 'Roberto Manrique', '2021-10-04', '14:04:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:04:41', 'Por Cobrar', 'C1', '0.00', '0.00', '110.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"190\",\"ordenpromocion\":\"Uwwzs\",\"precio\":\"30.00\",\"nombreprenda\":\"MOCHILA DE GAMUZA CHICO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uwwzs\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"139\",\"ordenpromocion\":\"Uldc7\",\"precio\":\"80.00\",\"nombreprenda\":\"ABRIGO  CUERO\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uldc7\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(162, 4, 'C1-0000162', 'PIELES', 'Roberto Manrique', '2021-10-04', '14:06:42', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:06:42', 'Por Cobrar', 'C1', '0.00', '0.00', '65.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"207\",\"ordenpromocion\":\"Uuwt2\",\"precio\":\"35.00\",\"nombreprenda\":\"SHORT GAMUZA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uuwt2\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"140\",\"ordenpromocion\":\"Uy0ps\",\"precio\":\"30.00\",\"nombreprenda\":\"BLUSA  CUERO\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uy0ps\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(163, 2, 'C1-0000163', 'SECO', 'Roberto Manrique', '2021-10-04', '14:08:00', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:08:00', 'Por Cobrar', 'C1', '0.00', '0.00', '60.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"472\",\"ordenpromocion\":\"Utr8v\",\"precio\":\"25.00\",\"nombreprenda\":\"CASACA ALPACA\",\"color\":\"VIOLACEO\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Utr8v\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"69\",\"ordenpromocion\":\"Uhnpp\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uhnpp\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(164, 3, 'C1-0000164', 'AGUA', 'Roberto Manrique', '2021-10-04', '14:09:22', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:09:22', 'Por Cobrar', 'C1', '0.00', '0.00', '30.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U6f8o\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U6f8o\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"4\",\"ordenpromocion\":\"Ure6j\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ure6j\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(165, 2, 'C1-0000165', 'SECO', 'Roberto Manrique', '2021-10-04', '14:10:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:10:32', 'Por Cobrar', 'C1', '0.00', '0.00', '70.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uq3fc\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uq3fc\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"69\",\"ordenpromocion\":\"U09t9\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U09t9\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(166, 2, 'C1-0000166', 'SECO', 'Roberto Manrique', '2021-10-04', '14:12:16', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:12:16', 'Por Cobrar', 'C1', '0.00', '0.00', '185.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"471\",\"ordenpromocion\":\"Upjq1\",\"precio\":\"25.00\",\"nombreprenda\":\"SACO ALPACA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upjq1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"70\",\"ordenpromocion\":\"Uqu9f\",\"precio\":\"50.00\",\"nombreprenda\":\"FRAZADA ALPACA 2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uqu9f\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"U92cy\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U92cy\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Updwn\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Updwn\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"70\",\"ordenpromocion\":\"U6t6f\",\"precio\":\"50.00\",\"nombreprenda\":\"FRAZADA ALPACA 2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U6t6f\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Unecf\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Unecf\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Uo2wb\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uo2wb\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"Usxwy\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Usxwy\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(167, 2, 'C1-0000167', 'SECO', 'Roberto Manrique', '2021-10-04', '14:21:21', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '14:21:21', 'Por Cobrar', 'C1', '0.00', '0.00', '89.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"Uk4h4\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uk4h4\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"U9731\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U9731\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"463\",\"ordenpromocion\":\"Ur0bh\",\"precio\":\"18.00\",\"nombreprenda\":\"ESTOLA SACERDOTE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ur0bh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"41\",\"ordenpromocion\":\"U1hi5\",\"precio\":\"12.00\",\"nombreprenda\":\"CHAL - PASHMINA GRANDE\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1hi5\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"69\",\"ordenpromocion\":\"Ux72n\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ux72n\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(168, 2, 'C1-0000168', 'SECO', 'Roberto Manrique', '2021-10-04', '15:34:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:34:03', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(169, 2, 'C1-0000169', 'SECO', 'Roberto Manrique', '2021-10-04', '15:34:40', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:34:40', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(170, 2, 'C1-0000170', 'SECO', 'Roberto Manrique', '2021-10-04', '15:35:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:35:03', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(171, 2, 'C1-0000171', 'SECO', 'Roberto Manrique', '2021-10-04', '15:35:36', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:35:36', 'Cancelado', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Efectivo', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(172, 2, 'C1-0000172', 'SECO', 'Roberto Manrique', '2021-10-04', '15:35:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:35:58', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(173, 2, 'C1-0000173', 'SECO', 'Roberto Manrique', '2021-10-04', '15:36:28', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:36:28', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(174, 2, 'C1-0000174', 'SECO', 'Roberto Manrique', '2021-10-04', '15:36:45', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:36:45', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(175, 2, 'C1-0000175', 'SECO', 'Roberto Manrique', '2021-10-04', '15:38:24', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:38:24', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(176, 2, 'C1-0000176', 'SECO', 'Roberto Manrique', '2021-10-04', '15:38:51', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:38:51', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(177, 2, 'C1-0000177', 'SECO', 'Roberto Manrique', '2021-10-04', '15:38:57', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:38:57', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(178, 2, 'C1-0000178', 'SECO', 'Roberto Manrique', '2021-10-04', '15:39:27', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:39:27', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(179, 2, 'C1-0000179', 'SECO', 'Roberto Manrique', '2021-10-04', '15:39:44', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:39:44', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(180, 2, 'C1-0000180', 'SECO', 'Roberto Manrique', '2021-10-04', '15:40:04', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:40:04', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(181, 2, 'C1-0000181', 'SECO', 'Roberto Manrique', '2021-10-04', '15:40:57', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:40:57', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(182, 2, 'C1-0000182', 'SECO', 'Roberto Manrique', '2021-10-04', '15:41:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:41:38', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(183, 2, 'C1-0000183', 'SECO', 'Roberto Manrique', '2021-10-04', '15:41:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:41:58', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(184, 2, 'C1-0000184', 'SECO', 'Roberto Manrique', '2021-10-04', '15:42:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:42:19', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(185, 2, 'C1-0000185', 'SECO', 'Roberto Manrique', '2021-10-04', '15:42:40', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:42:40', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(186, 2, 'C1-0000186', 'SECO', 'Roberto Manrique', '2021-10-04', '15:43:27', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:43:27', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(187, 2, 'C1-0000187', 'SECO', 'Roberto Manrique', '2021-10-04', '15:48:30', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:48:30', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(188, 2, 'C1-0000188', 'SECO', 'Roberto Manrique', '2021-10-04', '15:50:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:50:03', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(189, 2, 'C1-0000189', 'SECO', 'Roberto Manrique', '2021-10-04', '15:50:52', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:50:52', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(190, 2, 'C1-0000190', 'SECO', 'Roberto Manrique', '2021-10-04', '15:52:13', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:52:13', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(191, 2, 'C1-0000191', 'SECO', 'Roberto Manrique', '2021-10-04', '15:52:36', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:52:36', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(192, 2, 'C1-0000192', 'SECO', 'Roberto Manrique', '2021-10-04', '15:58:11', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '15:58:11', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(193, 2, 'C1-0000193', 'SECO', 'Roberto Manrique', '2021-10-04', '16:05:44', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:05:44', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(194, 2, 'C1-0000194', 'SECO', 'Roberto Manrique', '2021-10-04', '16:06:04', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:06:04', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(195, 2, 'C1-0000195', 'SECO', 'Roberto Manrique', '2021-10-04', '16:07:11', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:07:11', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(196, 2, 'C1-0000196', 'SECO', 'Roberto Manrique', '2021-10-04', '16:07:29', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:07:29', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(197, 2, 'C1-0000197', 'SECO', 'Roberto Manrique', '2021-10-04', '16:08:45', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:08:45', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(198, 2, 'C1-0000198', 'SECO', 'Roberto Manrique', '2021-10-04', '16:09:31', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:09:31', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(199, 2, 'C1-0000199', 'SECO', 'Roberto Manrique', '2021-10-04', '16:09:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:09:58', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(200, 2, 'C1-0000200', 'SECO', 'Roberto Manrique', '2021-10-04', '16:11:02', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:11:02', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2);
INSERT INTO `orden` (`id`, `idservicio`, `numeroorden`, `nombre_servicio`, `nombre_repartidor`, `fecha`, `hora`, `idcliente`, `nombre_cliente`, `celular_cliente`, `direccion_cliente`, `fecha_entrega`, `hora_entrega`, `tipo_cobro`, `idzona`, `total_s_dscto`, `descuento`, `total_pagar`, `a_cuenta`, `saldo`, `estado`, `tipo_pago`, `tipo_atencion`, `array_detalleorden`, `flag`) VALUES
(201, 2, 'C1-0000201', 'SECO', 'Roberto Manrique', '2021-10-04', '16:11:35', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:11:35', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(202, 2, 'C1-0000202', 'SECO', 'Roberto Manrique', '2021-10-04', '16:12:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:12:06', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Uml0q\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uml0q\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(203, 3, 'C1-0000203', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:15:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:15:32', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(204, 3, 'C1-0000204', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:17:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:17:06', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(205, 3, 'C1-0000205', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:17:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:17:41', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(206, 3, 'C1-0000206', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:17:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:17:59', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(207, 3, 'C1-0000207', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:18:34', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:18:34', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(208, 3, 'C1-0000208', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:19:27', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:19:27', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(209, 3, 'C1-0000209', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:19:53', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:19:53', 'Por Cobrar', 'C1', '0.00', '0.00', '81.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ulzug\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unxlm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U5i3d\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Uyjws\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyjws\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"U3dak\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ucjni\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ug1qi\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"2\",\"ordenpromocion\":\"Ut87g\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ut87g\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Umfbn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ue86d\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uigjq\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(210, 2, 'C1-0000210', 'SECO', 'Roberto Manrique', '2021-10-04', '16:20:27', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:20:27', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Un7dj\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Un7dj\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(211, 2, 'C1-0000211', 'SECO', 'Roberto Manrique', '2021-10-04', '16:21:20', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:21:20', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Un7dj\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Un7dj\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(212, 2, 'C1-0000212', 'SECO', 'Roberto Manrique', '2021-10-04', '16:22:00', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:22:00', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Un7dj\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Un7dj\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(213, 2, 'C1-0000213', 'SECO', 'Roberto Manrique', '2021-10-04', '16:22:16', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:22:16', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Un7dj\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Un7dj\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(214, 2, 'C1-0000214', 'SECO', 'Roberto Manrique', '2021-10-04', '16:22:39', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:22:39', 'Por Cobrar', 'C1', '0.00', '0.00', '35.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Un7dj\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Un7dj\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(215, 3, 'C1-0000215', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:23:18', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:23:18', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(216, 3, 'C1-0000216', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:23:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:23:59', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(217, 3, 'C1-0000217', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:24:04', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:24:04', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(218, 3, 'C1-0000218', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:28:26', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:28:26', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(219, 3, 'C1-0000219', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:29:02', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:29:02', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(220, 3, 'C1-0000220', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:29:26', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:29:26', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(221, 3, 'C1-0000221', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:30:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:30:06', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(222, 3, 'C1-0000222', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:30:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:30:38', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(223, 3, 'C1-0000223', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:31:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:31:58', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(224, 3, 'C1-0000224', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:32:29', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:32:29', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(225, 3, 'C1-0000225', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:32:47', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:32:47', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv744\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U4iev\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ub67y\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(226, 3, 'C1-0000226', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:33:16', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:33:16', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(227, 3, 'C1-0000227', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:33:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:33:58', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(228, 3, 'C1-0000228', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:34:17', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:34:17', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(229, 3, 'C1-0000229', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:34:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:34:41', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(230, 3, 'C1-0000230', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:35:25', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:35:25', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"U3xjp\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U2h52\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U8rp5\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"4\",\"ordenpromocion\":\"U1pam\",\"precio\":\"15.00\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U1pam\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(231, 3, 'C1-0000231', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:36:33', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:36:33', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uacpn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uwgpb\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U70jv\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(232, 3, 'C1-0000232', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:39:36', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:39:36', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uacpn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uwgpb\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U70jv\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(233, 3, 'C1-0000233', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:41:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:41:38', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uacpn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uwgpb\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U70jv\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(234, 3, 'C1-0000234', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:42:14', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:42:14', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uacpn\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uwgpb\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U70jv\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(235, 3, 'C1-0000235', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:43:20', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:43:20', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ufsxb\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uieqj\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uwd3j\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(236, 3, 'C1-0000236', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:45:10', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:45:10', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ufsxb\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uieqj\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uwd3j\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(237, 3, 'C1-0000237', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:45:33', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:45:33', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ufsxb\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uieqj\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uwd3j\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(238, 3, 'C1-0000238', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:45:55', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:45:55', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ufsxb\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uieqj\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uwd3j\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(239, 3, 'C1-0000239', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:46:14', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:46:14', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ufsxb\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uieqj\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uwd3j\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(240, 3, 'C1-0000240', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:46:54', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:46:54', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ufsxb\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uieqj\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uwd3j\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(241, 3, 'C1-0000241', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:47:27', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:47:27', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Uizri\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uizri\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(242, 3, 'C1-0000242', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:49:28', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:49:28', 'Por Cobrar', 'C1', '0.00', '0.00', '15.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Uizri\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uizri\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(243, 3, 'C1-0000243', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:54:05', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:54:05', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(244, 3, 'C1-0000244', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:54:46', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:54:46', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2);
INSERT INTO `orden` (`id`, `idservicio`, `numeroorden`, `nombre_servicio`, `nombre_repartidor`, `fecha`, `hora`, `idcliente`, `nombre_cliente`, `celular_cliente`, `direccion_cliente`, `fecha_entrega`, `hora_entrega`, `tipo_cobro`, `idzona`, `total_s_dscto`, `descuento`, `total_pagar`, `a_cuenta`, `saldo`, `estado`, `tipo_pago`, `tipo_atencion`, `array_detalleorden`, `flag`) VALUES
(245, 3, 'C1-0000245', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:56:55', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:56:55', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv5yt\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U3dqz\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uvsn5\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(246, 3, 'C1-0000246', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:57:35', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:57:35', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv5yt\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U3dqz\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uvsn5\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(247, 3, 'C1-0000247', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:58:18', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:58:18', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Uv5yt\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U3dqz\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uvsn5\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(248, 3, 'C1-0000248', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:58:49', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:58:49', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(249, 3, 'C1-0000249', 'AGUA', 'Roberto Manrique', '2021-10-04', '16:59:26', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '16:59:26', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(250, 3, 'C1-0000250', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:01:01', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:01:01', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(251, 3, 'C1-0000251', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:02:09', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:02:09', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(252, 3, 'C1-0000252', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:02:32', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:02:32', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(253, 3, 'C1-0000253', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:02:54', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:02:54', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(254, 3, 'C1-0000254', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:03:18', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:03:18', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(255, 3, 'C1-0000255', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:03:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:03:38', 'Por Cobrar', 'C1', '0.00', '0.00', '5.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"121\",\"ordenpromocion\":\"Uyli1\",\"precio\":\"5.00\",\"nombreprenda\":\"TOALLA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyli1\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(256, 3, 'C1-0000256', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:04:13', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:04:13', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(257, 3, 'C1-0000257', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:05:54', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:05:54', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":null,\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(258, 3, 'C1-0000258', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:06:36', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:06:36', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(259, 3, 'C1-0000259', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:07:10', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:07:10', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(260, 3, 'C1-0000260', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:08:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:08:41', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(261, 3, 'C1-0000261', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:09:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:09:59', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(262, 3, 'C1-0000262', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:10:18', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:10:18', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(263, 3, 'C1-0000263', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:12:38', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:12:38', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(264, 3, 'C1-0000264', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:14:47', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:14:47', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Ucwtj\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Uxklm\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqvlr\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(265, 3, 'C1-0000265', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:16:46', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:16:46', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(266, 3, 'C1-0000266', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:19:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:19:06', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(267, 3, 'C1-0000267', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:19:41', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:19:41', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(268, 3, 'C1-0000268', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:20:36', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:20:36', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(269, 3, 'C1-0000269', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:21:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:21:19', 'Por Cobrar', 'C1', '0.00', '0.00', '32.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"2\",\"ordenpromocion\":\"Upvlh\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Upvlh\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(270, 3, 'C1-0000270', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:27:50', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:27:50', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(271, 3, 'C1-0000271', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:29:52', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:29:52', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(272, 3, 'C1-0000272', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:31:17', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:31:17', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(273, 3, 'C1-0000273', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:32:49', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:32:49', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(274, 3, 'C1-0000274', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:33:31', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:33:31', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(275, 3, 'C1-0000275', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:34:10', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:34:10', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(276, 3, 'C1-0000276', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:35:06', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:35:06', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(277, 3, 'C1-0000277', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:36:51', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:36:51', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(278, 3, 'C1-0000278', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:37:45', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:37:45', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(279, 3, 'C1-0000279', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:38:11', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:38:11', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(280, 3, 'C1-0000280', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:38:46', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:38:46', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(281, 3, 'C1-0000281', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:39:07', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:39:07', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(282, 3, 'C1-0000282', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:39:31', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:39:31', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(283, 3, 'C1-0000283', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:40:01', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:40:01', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(284, 3, 'C1-0000284', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:40:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:40:19', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(285, 3, 'C1-0000285', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:41:22', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:41:22', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(286, 3, 'C1-0000286', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:42:02', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:42:02', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(287, 3, 'C1-0000287', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:42:27', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:42:27', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(288, 3, 'C1-0000288', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:43:24', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:43:24', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(289, 3, 'C1-0000289', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:44:00', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:44:00', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(290, 3, 'C1-0000290', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:45:13', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:45:13', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(291, 3, 'C1-0000291', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:45:39', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:45:39', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(292, 3, 'C1-0000292', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:46:16', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:46:16', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(293, 3, 'C1-0000293', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:47:19', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:47:19', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(294, 3, 'C1-0000294', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:48:28', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:48:28', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(295, 3, 'C1-0000295', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:48:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:48:58', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(296, 3, 'C1-0000296', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:49:26', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:49:26', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(297, 3, 'C1-0000297', 'AGUA', 'Roberto Manrique', '2021-10-04', '17:59:17', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '17:59:17', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(298, 3, 'C1-0000298', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:10:57', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:10:57', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(299, 3, 'C1-0000299', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:11:49', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:11:49', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(300, 3, 'C1-0000300', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:12:08', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:12:08', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2);
INSERT INTO `orden` (`id`, `idservicio`, `numeroorden`, `nombre_servicio`, `nombre_repartidor`, `fecha`, `hora`, `idcliente`, `nombre_cliente`, `celular_cliente`, `direccion_cliente`, `fecha_entrega`, `hora_entrega`, `tipo_cobro`, `idzona`, `total_s_dscto`, `descuento`, `total_pagar`, `a_cuenta`, `saldo`, `estado`, `tipo_pago`, `tipo_atencion`, `array_detalleorden`, `flag`) VALUES
(301, 3, 'C1-0000301', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:13:35', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:13:35', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(302, 3, 'C1-0000302', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:13:56', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:13:56', 'Por Cobrar', 'C1', '0.00', '0.00', '17.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"119\",\"ordenpromocion\":\"Untys\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Unzrh\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usuvp\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(303, 3, 'C1-0000303', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:14:34', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:14:34', 'Por Cobrar', 'C1', '0.00', '0.00', '10.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uzrwv\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uzrwv\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Rotura @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(304, 3, 'C1-0000304', 'AGUA', 'Roberto Manrique', '2021-10-04', '18:15:34', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:15:34', 'Por Cobrar', 'C1', '0.00', '0.00', '27.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"3\",\"ordenpromocion\":\"Uksr7\",\"precio\":\"10.00\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"TURQUESA\",\"marca\":\"RIPLEY\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uksr7\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"119\",\"ordenpromocion\":\"Uklzi\",\"precio\":\"17.00\",\"nombreprenda\":\"TERNO NI\\u00d1O (2 PZS.)\",\"color\":\"ROSADO\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"Ugt1j\",\"idpieza\":\"40\",\"nombrepieza\":\"CHALECO VESTIR\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ua9ae\",\"idpieza\":\"93\",\"nombrepieza\":\"PANTAL\\u00d3N VESTIR\",\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(305, 1, 'C1-0000305', 'PROMOCIONES', 'Roberto Manrique', '2021-10-04', '18:16:59', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:16:59', 'Por Cobrar', 'C1', '0.00', '0.00', '38.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE CAMA\":[{\"key\":\"U5tew\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uquik\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqnvv\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Desgaste\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(306, 1, 'C1-0000306', 'PROMOCIONES', 'Roberto Manrique', '2021-10-04', '18:20:13', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:20:13', 'Por Cobrar', 'C1', '0.00', '0.00', '38.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE CAMA\":[{\"key\":\"U5tew\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uquik\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqnvv\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Desgaste\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(307, 1, 'C1-0000307', 'PROMOCIONES', 'Roberto Manrique', '2021-10-04', '18:21:30', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:21:30', 'Por Cobrar', 'C1', '0.00', '0.00', '76.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE VESTIR\":[{\"key\":\"Uqbee\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Un1ud\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Rotura\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uljw0\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"TURQUESA\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}],\"3x2 PRENDAS DE CAMA\":[{\"key\":\"U5tew\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uquik\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqnvv\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Desgaste\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(308, 1, 'C1-0000308', 'PROMOCIONES', 'Roberto Manrique', '2021-10-04', '18:26:58', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:26:58', 'Por Cobrar', 'C1', '0.00', '0.00', '76.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE VESTIR\":[{\"key\":\"Uqbee\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Un1ud\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Rotura\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uljw0\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"TURQUESA\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}],\"3x2 PRENDAS DE CAMA\":[{\"key\":\"U5tew\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uquik\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqnvv\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Desgaste\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(309, 1, 'C1-0000309', 'PROMOCIONES', 'Roberto Manrique', '2021-10-04', '18:28:03', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '18:28:03', 'Por Cobrar', 'C1', '0.00', '0.00', '76.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"3x2 PRENDAS DE VESTIR\":[{\"key\":\"Uqbee\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Un1ud\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Rotura\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uljw0\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"TURQUESA\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}],\"3x2 PRENDAS DE CAMA\":[{\"key\":\"U5tew\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"23.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uquik\",\"idprenda\":\"4\",\"nombreprenda\":\"ALMOHADA GRANDE\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uqnvv\",\"idprenda\":\"5\",\"nombreprenda\":\"BABUCHAS\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Desgaste\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 2),
(310, 2, 'C1-0000310', 'SECO', 'Roberto Manrique', '2021-10-05', '00:59:13', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-05', '00:59:13', 'Cancelado', 'C1', '0.00', '0.00', '74.00', '0.00', '0.00', 'Activo', 'Tarjeta', 'Entrega', '[{\"idprenda\":\"70\",\"ordenpromocion\":\"Ue0l0\",\"precio\":\"50.00\",\"nombreprenda\":\"FRAZADA ALPACA 2 PLAZA\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ue0l0\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Uyg9e\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uyg9e\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Rotura @ Con Desgaste @ Con Decoloraci\\u00f3n @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Usy94\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Usy94\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(311, 2, 'C1-0000311', 'SECO', 'Roberto Manrique', '2021-10-07', '18:31:18', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-14', '14:35:26', 'Reclamo', 'C1', '0.00', '0.00', '47.00', '0.00', '0.00', 'Activo', 'Tarjeta', 'Reclamo', '[{\"idprenda\":\"69\",\"ordenpromocion\":\"Ucf47\",\"precio\":\"35.00\",\"nombreprenda\":\"FRAZADA ALPACA 1 1\\/2 PLAZA\",\"color\":\"AMARILLO\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ucf47\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]},{\"idprenda\":\"18\",\"ordenpromocion\":\"Ufh21\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Ufh21\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2),
(312, 2, 'C1-0000312', 'SECO', 'Roberto Manrique', '2021-10-07', '19:13:54', 8, 'Luis Rodriguez', '7777799', 'Calle Beethoven 530', '2021-10-12', '19:13:54', 'Por Cobrar', 'C1', '0.00', '0.00', '12.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"18\",\"ordenpromocion\":\"U0aej\",\"precio\":\"12.00\",\"nombreprenda\":\"CAMISA  C\\/ ALMID\\u00d3N\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"U0aej\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null}]}]', 2);

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
(9, 473, 'PROMO475', 'PROMOCION 3', '0.00', 'Activo'),
(11, 475, 'PROMO475E', 'PROMOCION 1', '0.00', 'Activo'),
(12, 475, 'PROMO4759', 'PROMOCION 2', '0.00', 'Activo'),
(13, 475, 'PROMO486', 'PROMOCION 3', '0.00', 'Activo'),
(27, 1000012, 'PROMO1000012', 'PROMO TR1', '0.00', 'Activo'),
(28, 1000012, 'PROMO1000012', 'PROMO TR2', '0.00', 'Activo');

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
(15, 9, 6),
(16, 11, 1),
(17, 11, 2),
(18, 12, 3),
(19, 12, 4),
(20, 13, 5),
(21, 13, 6),
(48, 27, 1),
(49, 27, 2),
(50, 27, 3),
(51, 27, 4),
(52, 28, 1),
(53, 28, 2),
(54, 28, 3),
(55, 28, 4);

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
(7, 119, '1', 40),
(34, 1000006, '1', 1),
(35, 1000006, '1', 2),
(38, 1000007, '1', 93),
(39, 1000007, '1', 109);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamoxprenda`
--

CREATE TABLE `reclamoxprenda` (
  `id` int(25) NOT NULL,
  `fechaentrega` date NOT NULL DEFAULT current_timestamp(),
  `horaentrega` time NOT NULL DEFAULT current_timestamp(),
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

--
-- Volcado de datos para la tabla `reclamoxprenda`
--

INSERT INTO `reclamoxprenda` (`id`, `fechaentrega`, `horaentrega`, `numeroorden`, `origennumeroorden`, `idcliente`, `idrepartidor`, `nombrecliente`, `nombrerepartidor`, `idzona`, `idprenda`, `nombreprenda`, `color`, `marca`, `observacion`, `estados`, `audio`, `imagen`, `ordenprenda`) VALUES
(38, '2021-10-12', '17:53:43', 'C1-0000038', 'C1-0000075', 8, 1, 'Luis Rodriguez', 'Roberto Manrique', 'C1', 1, 'ABRIGO', 'VERDE', 'RIPLEY', 'Faltaba dos botones', 'Mal Lavado @ Falta Botones', NULL, 'IYm18SJ.jpg', 'U1ilf'),
(39, '2021-10-12', '17:58:25', 'C1-0000039', 'C1-0000075', 8, 1, 'Luis Rodriguez', 'Roberto Manrique', 'C1', 3, 'ALMOHADA', 'VERDE', 'TIGRE', NULL, NULL, NULL, NULL, 'Ugd72');

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
  `NumSerieBoleta` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'B003',
  `NumSerieFactura` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'F003',
  `Estado_Repartidor` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`id`, `codigo_repartidor`, `nombre_repartidor`, `apellido_repartidor`, `avatar_repartidor`, `id_zona`, `Latitud`, `Longitud`, `idimpresora`, `NumSerieBoleta`, `NumSerieFactura`, `Estado_Repartidor`) VALUES
(1, 'REP0001', 'Roberto Manuel', 'Manrique Rodriguez', '', 1, '-12.0387869', '-76.9623343', '74:F0:7D:E9:B8:4C', 'B003', 'F003', 'Activo'),
(2, 'REP0002', 'Juan Carlos', 'Mamani Quispe', '', 2, NULL, NULL, '', 'B003', 'F003', 'Activo'),
(3, 'REP0003', 'Luis Miguel', 'Chavez de la Cruz', '', 3, NULL, NULL, '', 'B003', 'F003', 'Activo'),
(7, 'empleado3', 'Juan Luis', 'Huaman Keiko', '', 4, NULL, NULL, '', 'B006', 'F006', 'Activo');

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
  `estado_turno` enum('Entrega','Recojo','Reclamo') COLLATE utf8_spanish_ci DEFAULT 'Recojo',
  `idprenda` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `turnoxcliente`
--

INSERT INTO `turnoxcliente` (`id`, `numero_orden`, `id_repartidor`, `id_cliente`, `id_zona`, `puesto_turno`, `fecha_turno`, `hora_turno`, `atencion`, `estado_turno`, `idprenda`) VALUES
(307, 'C1-0000311', 1, 8, 1, 'Tarde', '2021-10-12', '14:35:26', 'Sin Atender', 'Reclamo', NULL),
(308, 'C1-0000312', 1, 8, 1, 'Tarde', '2021-10-12', '19:13:54', 'Sin Atender', 'Entrega', NULL),
(310, '', 1, 8, 1, 'Temprano', '2021-10-12', '10:00:00', 'Sin Atender', 'Recojo', '');

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
(3, 3, 4),
(4, 3, 0),
(5, 3, 6),
(6, 4, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2_idservicio` (`Id_Servicio`);

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000013;

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10469;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4771;

--
-- AUTO_INCREMENT de la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

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
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
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
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1857;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `promocionxarticulo`
--
ALTER TABLE `promocionxarticulo`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `reclamoxprenda`
--
ALTER TABLE `reclamoxprenda`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `turnoxcliente`
--
ALTER TABLE `turnoxcliente`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `zonaxrepartidor`
--
ALTER TABLE `zonaxrepartidor`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
