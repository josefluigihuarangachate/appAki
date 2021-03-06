-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2021 a las 21:27:46
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
(1, 'ABRIGO  NIÑO', 'UNAD', '2 ', '15.00', 1, 3, 'Activo'),
(2, 'ALMOHADA', 'UNAD', '3 ', '10.00', 1, 3, 'Activo'),
(3, 'ALMOHADA  PLUMAS', 'UNAD', '169 ', '15.00', 1, 3, 'Activo'),
(4, 'ALMOHADA GRANDE', 'UNAD', '4 ', '15.00', 1, 3, 'Activo'),
(5, 'ALMOHADA GRANDE  PLUMAS', 'UNAD', '226 ', '20.00', 1, 3, 'Activo'),
(6, 'BABUCHAS', 'UNAD', '5 ', '10.00', 1, 3, 'Activo'),
(7, 'BABUCHAS  NIÑO', 'UNAD', '6 ', '8.00', 1, 3, 'Activo'),
(8, 'BANDERA', 'UNAD', '294 ', '12.00', 1, 3, 'Activo'),
(9, 'BATA  NIÑO', 'UNAD', '215 ', '10.00', 1, 3, 'Activo'),
(10, 'BERMUDA NIÑO', 'UNAD', '443 ', '5.00', 1, 3, 'Activo'),
(11, 'BOLSA  DORMIR', 'UNAD', '9 ', '35.00', 1, 3, 'Activo'),
(12, 'BUZO  NIÑO (CASA-PANT)', 'UNAD', '15 ', '12.00', 1, 3, 'Activo'),
(13, 'BUZO (CASA-PANT)', 'UNAD', '14 ', '15.00', 1, 3, 'Activo'),
(14, 'CAMISA NIÑO', 'UNAD', '346 ', '7.00', 1, 3, 'Activo'),
(15, 'CARTERA CUERO SINTETICO', 'UNAD', '176 ', '25.00', 1, 3, 'Activo'),
(16, 'CARTERA TEXTIL', 'UNAD', '25 ', '20.00', 1, 3, 'Activo'),
(17, 'CASACA', 'UNAD', '19 ', '13.00', 1, 3, 'Activo'),
(18, 'CASACA  ACOLCHADA', 'UNAD', '20 ', '17.00', 1, 3, 'Activo'),
(19, 'CASACA  IMPERMEABLE', 'UNAD', '21 ', '25.00', 1, 3, 'Activo'),
(20, 'CASACA  PLUMAS', 'UNAD', '22 ', '25.00', 1, 3, 'Activo'),
(21, 'CASACA ACOLCHADA LARGA', 'UNAD', '385 ', '23.00', 1, 3, 'Activo'),
(22, 'CASACA CUERO SINTETICO', 'UNAD', '375 ', '35.00', 1, 3, 'Activo'),
(23, 'CASACA JEAN', 'UNAD', '228 ', '13.00', 1, 3, 'Activo'),
(24, 'CASACA NIÑO', 'UNAD', '233 ', '10.00', 1, 3, 'Activo'),
(25, 'CHOMPA NIÑO', 'UNAD', '237 ', '8.00', 1, 3, 'Activo'),
(26, 'COBERTOR SILLA BEBE', 'UNAD', '341 ', '15.00', 1, 3, 'Activo'),
(27, 'COJIN  ANATÓMICO', 'UNAD', '27 ', '18.00', 1, 3, 'Activo'),
(28, 'COJIN CHICO', 'UNAD', '26 ', '8.00', 1, 3, 'Activo'),
(29, 'COJIN CHICO FORRO', 'UNAD', '411 ', '8.00', 1, 3, 'Activo'),
(30, 'COJIN GRANDE', 'UNAD', '410 ', '16.00', 1, 3, 'Activo'),
(31, 'COJIN GRANDE FORRO', 'UNAD', '413 ', '12.00', 1, 3, 'Activo'),
(32, 'COJIN MEDIANO', 'UNAD', '180 ', '10.00', 1, 3, 'Activo'),
(33, 'COJIN MEDIANO FORRO', 'UNAD', '412 ', '10.00', 1, 3, 'Activo'),
(34, 'COLCHA  MEDINA', 'UNAD', '30 ', '17.00', 1, 3, 'Activo'),
(35, 'COLCHA GRANDE', 'UNAD', '29 ', '20.00', 1, 3, 'Activo'),
(36, 'COLCHA PEQUEÑA', 'UNAD', '28 ', '13.00', 1, 3, 'Activo'),
(37, 'CORSET', 'UNAD', '285 ', '18.00', 1, 3, 'Activo'),
(38, 'CORTINA CENEFA (METRO)', 'UNAD', '33 ', '8.00', 1, 3, 'Activo'),
(39, 'CORTINA TAPASOL (METRO)', 'UNAD', '182 ', '10.00', 1, 3, 'Activo'),
(40, 'CORTINA TAPASOL DOBLE (METRO', 'UNAD', '243 ', '15.00', 1, 3, 'Activo'),
(41, 'CORTINA TUL (METRO)', 'UNAD', '31 ', '8.00', 1, 3, 'Activo'),
(42, 'CUBRECAMA  1 1/2 PLAZA', 'UNAD', '36 ', '27.00', 1, 3, 'Activo'),
(43, 'CUBRECAMA  2 PLAZA', 'UNAD', '37 ', '30.00', 1, 3, 'Activo'),
(44, 'CUBRECAMA  KING', 'UNAD', '39 ', '50.00', 1, 3, 'Activo'),
(45, 'CUBRECAMA  QUEEN', 'UNAD', '38 ', '40.00', 1, 3, 'Activo'),
(46, 'EDREDON 1 1/2 PLAZA', 'UNAD', '47 ', '30.00', 1, 3, 'Activo'),
(47, 'EDREDON 2 PLAZA', 'UNAD', '48 ', '35.00', 1, 3, 'Activo'),
(48, 'EDREDON CUNA', 'UNAD', '312 ', '18.00', 1, 3, 'Activo'),
(49, 'EDREDON KING', 'UNAD', '50 ', '50.00', 1, 3, 'Activo'),
(50, 'EDREDON PLUMAS 1 1/2 PLAZA', 'UNAD', '51 ', '45.00', 1, 3, 'Activo'),
(51, 'EDREDON PLUMAS 2 PLAZA', 'UNAD', '52 ', '50.00', 1, 3, 'Activo'),
(52, 'EDREDON PLUMAS KING', 'UNAD', '54 ', '65.00', 1, 3, 'Activo'),
(53, 'EDREDON PLUMAS QUEEN', 'UNAD', '53 ', '55.00', 1, 3, 'Activo'),
(54, 'EDREDON QUEEN', 'UNAD', '49 ', '40.00', 1, 3, 'Activo'),
(55, 'ENTERIZO NIÑO', 'UNAD', '281 ', '15.00', 1, 3, 'Activo'),
(56, 'FALDA NIÑA', 'UNAD', '445 ', '6.00', 1, 3, 'Activo'),
(57, 'FRAZADA 1 1/2 PLAZA', 'UNAD', '65 ', '18.00', 1, 3, 'Activo'),
(58, 'FRAZADA 2 PLAZA', 'UNAD', '66 ', '23.00', 1, 3, 'Activo'),
(59, 'FRAZADA KING', 'UNAD', '68 ', '55.00', 1, 3, 'Activo'),
(60, 'FRAZADA QUEEN', 'UNAD', '67 ', '45.00', 1, 3, 'Activo'),
(61, 'FUNDA ALMOHADA', 'UNAD', '61 ', '5.00', 1, 3, 'Activo'),
(62, 'FUNDA ALMOHADA GRANDE', 'UNAD', '186 ', '7.00', 1, 3, 'Activo'),
(63, 'FUNDA MUEBLE (1 CUERPO)', 'UNAD', '334 ', '20.00', 1, 3, 'Activo'),
(64, 'FUNDA MUEBLE (2 CUERPOS)', 'UNAD', '335 ', '30.00', 1, 3, 'Activo'),
(65, 'FUNDA MUEBLE (3 CUERPOS)', 'UNAD', '336 ', '40.00', 1, 3, 'Activo'),
(66, 'FUNDA PLUMON 1 1/2 PLZ.', 'UNAD', '313 ', '15.00', 1, 3, 'Activo'),
(67, 'FUNDA PLUMON 2 PLZ.', 'UNAD', '62 ', '18.00', 1, 3, 'Activo'),
(68, 'FUNDA PLUMON KING', 'UNAD', '64 ', '22.00', 1, 3, 'Activo'),
(69, 'FUNDA PLUMON QUEEN', 'UNAD', '63 ', '20.00', 1, 3, 'Activo'),
(70, 'GORRA NIÑO', 'UNAD', '345 ', '7.00', 1, 3, 'Activo'),
(71, 'GUANTES NIÑO', 'UNAD', '446 ', '8.00', 1, 3, 'Activo'),
(72, 'INDIVIDUAL', 'UNAD', '461 ', '4.00', 1, 3, 'Activo'),
(73, 'JGO. SABANAS 1 1/2 PLZ. + 1 FUNDA', 'UNAD', '199 ', '16.00', 1, 3, 'Activo'),
(74, 'JGO. SABANAS 2 PLZ. + 2 FUNDAS', 'UNAD', '200 ', '20.00', 1, 3, 'Activo'),
(75, 'JGO. SABANAS KING + 2 FUNDAS', 'UNAD', '202 ', '26.00', 1, 3, 'Activo'),
(76, 'JGO. SABANAS QUEEN + 2 FUNDAS', 'UNAD', '201 ', '24.00', 1, 3, 'Activo'),
(77, 'MALETIN', 'UNAD', '89 ', '20.00', 1, 3, 'Activo'),
(78, 'MAMELUCO NIÑO', 'UNAD', '447 ', '6.00', 1, 3, 'Activo'),
(79, 'MANDIL NIÑO', 'UNAD', '86 ', '6.00', 1, 3, 'Activo'),
(80, 'MANTA', 'UNAD', '87 ', '15.00', 1, 3, 'Activo'),
(81, 'MANTA GRANDE', 'UNAD', '88 ', '20.00', 1, 3, 'Activo'),
(82, 'MANTEL BORDADO GRANDE', 'UNAD', '80 ', '25.00', 1, 3, 'Activo'),
(83, 'MANTEL BORDADO MEDIANO', 'UNAD', '79 ', '20.00', 1, 3, 'Activo'),
(84, 'MANTEL BORDADO PEQUEÑO', 'UNAD', '290 ', '15.00', 1, 3, 'Activo'),
(85, 'MANTEL C/ ALMIDÓN BORDADO GRANDE', 'UNAD', '84 ', '30.00', 1, 3, 'Activo'),
(86, 'MANTEL C/ ALMIDÓN BORDADO MEDIANO', 'UNAD', '83 ', '25.00', 1, 3, 'Activo'),
(87, 'MANTEL C/ ALMIDÓN LLANO GRANDE', 'UNAD', '82 ', '20.00', 1, 3, 'Activo'),
(88, 'MANTEL C/ ALMIDÓN LLANO MEDIANO', 'UNAD', '81 ', '17.00', 1, 3, 'Activo'),
(89, 'MANTEL C/ALMIDÓN BORDADO PEQUEÑO', 'UNAD', '292 ', '20.00', 1, 3, 'Activo'),
(90, 'MANTEL C/ALMIDÓN LLANO PEQUEÑO', 'UNAD', '293 ', '15.00', 1, 3, 'Activo'),
(91, 'MANTEL LLANO GRANDE', 'UNAD', '78 ', '15.00', 1, 3, 'Activo'),
(92, 'MANTEL LLANO MEDIANO', 'UNAD', '77 ', '12.00', 1, 3, 'Activo'),
(93, 'MANTEL LLANO PEQUEÑO', 'UNAD', '291 ', '10.00', 1, 3, 'Activo'),
(94, 'MOCHILA SINTETICA', 'UNAD', '191 ', '20.00', 1, 3, 'Activo'),
(95, 'MOCHILA TELA', 'UNAD', '90 ', '15.00', 1, 3, 'Activo'),
(96, 'OVEROL NIÑO', 'UNAD', '92 ', '10.00', 1, 3, 'Activo'),
(97, 'PANTALON NIÑO', 'UNAD', '448 ', '8.00', 1, 3, 'Activo'),
(98, 'PELUCHE GRANDE', 'UNAD', '339 ', '60.00', 1, 3, 'Activo'),
(99, 'PELUCHE MEDIANO', 'UNAD', '338 ', '30.00', 1, 3, 'Activo'),
(100, 'PELUCHE PEQUEÑO', 'UNAD', '337 ', '15.00', 1, 3, 'Activo'),
(101, 'PIJAMA NIÑO (2 PZAS.)', 'UNAD', '98 ', '10.00', 1, 3, 'Activo'),
(102, 'PISO DE BAÑO', 'UNAD', '288 ', '12.00', 1, 3, 'Activo'),
(103, 'PISO MESA BORDADO GRANDE', 'UNAD', '196 ', '20.00', 1, 3, 'Activo'),
(104, 'PISO MESA BORDADO MEDIANO', 'UNAD', '195 ', '18.00', 1, 3, 'Activo'),
(105, 'PISO MESA GRANDE', 'UNAD', '194 ', '15.00', 1, 3, 'Activo'),
(106, 'PISO MESA MEDIANO', 'UNAD', '193 ', '10.00', 1, 3, 'Activo'),
(107, 'POLO NIÑO M/C', 'UNAD', '310 ', '5.00', 1, 3, 'Activo'),
(108, 'POLO NIÑO M/L', 'UNAD', '311 ', '5.00', 1, 3, 'Activo'),
(109, 'PONCHO NIÑO', 'UNAD', '331 ', '10.00', 1, 3, 'Activo'),
(110, 'PROTECTOR COLCHON 1 1/2 PLZ', 'UNAD', '460 ', '15.00', 1, 3, 'Activo'),
(111, 'PROTECTOR COLCHON 1PLZ', 'UNAD', '459 ', '12.00', 1, 3, 'Activo'),
(112, 'PROTECTOR COLCHON 2 PLZ', 'UNAD', '409 ', '18.00', 1, 3, 'Activo'),
(113, 'PROTECTOR COLCHON KING', 'UNAD', '457 ', '25.00', 1, 3, 'Activo'),
(114, 'PROTECTOR COLCHON QUEEN', 'UNAD', '458 ', '22.00', 1, 3, 'Activo'),
(115, 'PROTECTOR CUNA', 'UNAD', '351 ', '15.00', 1, 3, 'Activo'),
(116, 'PULLOVER NIÑO', 'UNAD', '449 ', '4.00', 1, 3, 'Activo'),
(117, 'SABANA 1 1/2 PLAZA', 'UNAD', '105 ', '7.00', 1, 3, 'Activo'),
(118, 'SABANA 2 PLAZA', 'UNAD', '106 ', '7.00', 1, 3, 'Activo'),
(119, 'SABANA KING', 'UNAD', '108 ', '10.00', 1, 3, 'Activo'),
(120, 'SABANA QUEEN', 'UNAD', '107 ', '8.00', 1, 3, 'Activo'),
(121, 'SACO NIÑO', 'UNAD', '321 ', '10.00', 1, 3, 'Activo'),
(122, 'SACON NIÑO', 'UNAD', '112 ', '12.00', 1, 3, 'Activo'),
(123, 'SECADOR', 'UNAD', '289 ', '5.00', 1, 3, 'Activo'),
(124, 'SERVILLETA BORDADA', 'UNAD', '115 ', '6.00', 1, 3, 'Activo'),
(125, 'SERVILLETA C/ ALMIDÓN BORDADA', 'UNAD', '117 ', '8.00', 1, 3, 'Activo'),
(126, 'SERVILLETA C/ ALMIDÓN LLANA', 'UNAD', '116 ', '7.00', 1, 3, 'Activo'),
(127, 'SERVILLETA LLANA', 'UNAD', '114 ', '5.00', 1, 3, 'Activo'),
(128, 'SHORT NIÑO', 'UNAD', '450 ', '4.00', 1, 3, 'Activo'),
(129, 'TAPETE', 'UNAD', '332 ', '8.00', 1, 3, 'Activo'),
(130, 'TOALLA GRANDE', 'UNAD', '123 ', '10.00', 1, 3, 'Activo'),
(131, 'TOALLA MEDIANA', 'UNAD', '122 ', '8.00', 1, 3, 'Activo'),
(132, 'TOALLA PEQUEÑA', 'UNAD', '121 ', '5.00', 1, 3, 'Activo'),
(133, 'TOALLA PLAYA', 'UNAD', '324 ', '15.00', 1, 3, 'Activo'),
(134, 'VARIOS', 'UNAD', '408 ', '5.00', 1, 3, 'Activo'),
(135, 'VESTIDO NIÑA', 'UNAD', '325 ', '28.00', 1, 3, 'Activo'),
(136, 'ZAPATILLAS SINTETICAS', 'UNAD', '210 ', '25.00', 1, 3, 'Activo'),
(137, 'ZAPATILLAS TELA', 'UNAD', '133 ', '20.00', 1, 3, 'Activo'),
(138, 'ABRIGO ENTALLE COSTADOS', 'UNAD', '244 ', '25.00', 1, 6, 'Activo'),
(139, 'ABRIGO SUBIR BASTA', 'UNAD', '245 ', '20.00', 1, 6, 'Activo'),
(140, 'ABRIGO SUBIR PUÑOS', 'UNAD', '246 ', '15.00', 1, 6, 'Activo'),
(141, 'ARREGLO APLICACION', 'UNAD', '415 ', '15.00', 1, 6, 'Activo'),
(142, 'ARREGLO DE CORTINA', 'UNAD', '426 ', '15.00', 1, 6, 'Activo'),
(143, 'ARREGLO GRANDE', 'UNAD', '249 ', '12.00', 1, 6, 'Activo'),
(144, 'ARREGLO PEQUEÑO', 'UNAD', '247 ', '10.00', 1, 6, 'Activo'),
(145, 'BASTA CON ELASTICO', 'UNAD', '416 ', '15.00', 1, 6, 'Activo'),
(146, 'BERMUDA CERRAR COSTURA', 'UNAD', '393 ', '10.00', 1, 6, 'Activo'),
(147, 'BLUSA BASTA SIMPLE', 'UNAD', '252 ', '12.00', 1, 6, 'Activo'),
(148, 'BLUSA ENTALLE + BASTA', 'UNAD', '251 ', '20.00', 1, 6, 'Activo'),
(149, 'BLUSA ENTALLE LADOS', 'UNAD', '417 ', '12.00', 1, 6, 'Activo'),
(150, 'BLUSA SUBIR PUÑOS', 'UNAD', '253 ', '12.00', 1, 6, 'Activo'),
(151, 'CAMISA ACORTAR MANGA', 'UNAD', '259 ', '10.00', 1, 6, 'Activo'),
(152, 'CAMISA ARREGLO BOLSILLO', 'UNAD', '260 ', '12.00', 1, 6, 'Activo'),
(153, 'CAMISA ARREGLO DE CUELLO', 'UNAD', '255 ', '15.00', 1, 6, 'Activo'),
(154, 'CAMISA ENTALLE COSTADO', 'UNAD', '256 ', '18.00', 1, 6, 'Activo'),
(155, 'CAMISA SUBIR BASTA', 'UNAD', '257 ', '15.00', 1, 6, 'Activo'),
(156, 'CAMISA SUBIR PUÑO MAS YUGO', 'UNAD', '422 ', '20.00', 1, 6, 'Activo'),
(157, 'CAMISA SUBIR PUÑOS', 'UNAD', '258 ', '16.00', 1, 6, 'Activo'),
(158, 'CAMISA VOLTEAR CUELLO', 'UNAD', '254 ', '20.00', 1, 6, 'Activo'),
(159, 'CASACA BOLSILLO DESCOSIDO', 'UNAD', '419 ', '10.00', 1, 6, 'Activo'),
(160, 'CASACA CAMBIO CIERRE PLASTICO/METAL', 'UNAD', '421 ', '20.00', 1, 6, 'Activo'),
(161, 'CASACA DESCOSIDO', 'UNAD', '418 ', '12.00', 1, 6, 'Activo'),
(162, 'CASACA FORRO DESCOSIDO', 'UNAD', '420 ', '15.00', 1, 6, 'Activo'),
(163, 'CHAQUETA CAMBIO CIERRE', 'UNAD', '423 ', '15.00', 1, 6, 'Activo'),
(164, 'CIERRE ARREGLO DE CARRITO', 'UNAD', '425 ', '8.00', 1, 6, 'Activo'),
(165, 'CIERRE CAMBIO MANDIL', 'UNAD', '424 ', '15.00', 1, 6, 'Activo'),
(166, 'CONFECCION BOLSA TELA 35X30', 'UNAD', '400 ', '5.90', 1, 6, 'Activo'),
(167, 'CORBATA ARREGLO COSTURA 1', 'UNAD', '261 ', '10.00', 1, 6, 'Activo'),
(168, 'CORBATA ARREGLO COSTURA 2', 'UNAD', '394 ', '15.00', 1, 6, 'Activo'),
(169, 'COSTURA GRANDE', 'UNAD', '467 ', '15.00', 1, 6, 'Activo'),
(170, 'COSTURA MEDIANO', 'UNAD', '464 ', '12.00', 1, 6, 'Activo'),
(171, 'COSTURA PEQUEÑA', 'UNAD', '466 ', '10.00', 1, 6, 'Activo'),
(172, 'CUBRECAMA DESCOSIDO', 'UNAD', '427 ', '12.00', 1, 6, 'Activo'),
(173, 'CUBRECAMA PARCHE', 'UNAD', '428 ', '12.00', 1, 6, 'Activo'),
(174, 'EDREDON DESCOSIDO', 'UNAD', '429 ', '15.00', 1, 6, 'Activo'),
(175, 'EDREDON PARCHE', 'UNAD', '430 ', '12.00', 1, 6, 'Activo'),
(176, 'MANTEL DESCOSIDO', 'UNAD', '431 ', '15.00', 1, 6, 'Activo'),
(177, 'PANTALON BASTA CORTA', 'UNAD', '269 ', '15.00', 1, 6, 'Activo'),
(178, 'PANTALON BASTA INGLESA', 'UNAD', '267 ', '18.00', 1, 6, 'Activo'),
(179, 'PANTALON BASTA SIMPLE', 'UNAD', '266 ', '15.00', 1, 6, 'Activo'),
(180, 'PANTALON CAMBIO CIERRE', 'UNAD', '262 ', '12.00', 1, 6, 'Activo'),
(181, 'PANTALON CAMBIO CIERRE INVISIBLE', 'UNAD', '395 ', '15.00', 1, 6, 'Activo'),
(182, 'PANTALON CAMBIO ELASTICO', 'UNAD', '434 ', '15.00', 1, 6, 'Activo'),
(183, 'PANTALON CERRAR COSTURA', 'UNAD', '268 ', '8.00', 1, 6, 'Activo'),
(184, 'PANTALON ELASTICO NIÑO', 'UNAD', '435 ', '10.00', 1, 6, 'Activo'),
(185, 'PANTALON ENTALLE CINTURA', 'UNAD', '263 ', '15.00', 1, 6, 'Activo'),
(186, 'PANTALON ENTALLE CINTURA MAS TIRO', 'UNAD', '432 ', '15.00', 1, 6, 'Activo'),
(187, 'PANTALON ENTALLE COSTADO', 'UNAD', '264 ', '15.00', 1, 6, 'Activo'),
(188, 'PANTALON ENTALLE COSTADO + BASTA', 'UNAD', '265 ', '20.00', 1, 6, 'Activo'),
(189, 'PANTALON JEAN BASTA CORTA CONVERTIR DE LARGO A CORTO', 'UNAD', '433 ', '15.00', 1, 6, 'Activo'),
(190, 'PANTALON PARCHE', 'UNAD', '270 ', '12.00', 1, 6, 'Activo'),
(191, 'PARCHE GRANDE', 'UNAD', '469 ', '20.00', 1, 6, 'Activo'),
(192, 'PARCHE MEDIANO', 'UNAD', '465 ', '15.00', 1, 6, 'Activo'),
(193, 'PARCHE PEQUEÑO', 'UNAD', '468 ', '10.00', 1, 6, 'Activo'),
(194, 'PELUCHE ARREGLO', 'UNAD', '436 ', '12.00', 1, 6, 'Activo'),
(195, 'POLO ARREGLO COSTURA', 'UNAD', '272 ', '12.00', 1, 6, 'Activo'),
(196, 'POLO BASTA', 'UNAD', '273 ', '10.00', 1, 6, 'Activo'),
(197, 'POLO NIÑO ARREGLO COSTURA', 'UNAD', '271 ', '8.00', 1, 6, 'Activo'),
(198, 'SABANA ARREGLO', 'UNAD', '439 ', '15.00', 1, 6, 'Activo'),
(199, 'SACO COSTURA FORRO', 'UNAD', '438 ', '15.00', 1, 6, 'Activo'),
(200, 'SACO SACONES ABRIGOS DESCOSIDO', 'UNAD', '437 ', '15.00', 1, 6, 'Activo'),
(201, 'SACO SUBIR PUÑOS', 'UNAD', '274 ', '15.00', 1, 6, 'Activo'),
(202, 'SHORT BASTA SIMPLE', 'UNAD', '396 ', '10.00', 1, 6, 'Activo'),
(203, 'VESTIDO BASTA (CON FORRO)', 'UNAD', '276 ', '18.00', 1, 6, 'Activo'),
(204, 'VESTIDO BASTA (SIN FORRO)', 'UNAD', '275 ', '15.00', 1, 6, 'Activo'),
(205, 'VESTIDO CAMBIO CIERRE INVISIBLE', 'UNAD', '399 ', '18.00', 1, 6, 'Activo'),
(206, 'VESTIDO DE NOCHE BASTA SIMPLE', 'UNAD', '440 ', '18.00', 1, 6, 'Activo'),
(207, 'VESTIDO ENTALLE LADOS', 'UNAD', '397 ', '15.00', 1, 6, 'Activo'),
(208, 'VESTIDO ENTALLE LADOS + TIRAS', 'UNAD', '277 ', '28.00', 1, 6, 'Activo'),
(209, 'VESTIDO FIESTA BASTA', 'UNAD', '470 ', '18.00', 1, 6, 'Activo'),
(210, 'VESTIDO FIESTA BASTA + VUELO', 'UNAD', '392 ', '25.00', 1, 6, 'Activo'),
(211, 'VESTIDO NIÑA ARREGLO', 'UNAD', '441 ', '12.00', 1, 6, 'Activo'),
(212, 'VESTIDO SUBIR TIRAS', 'UNAD', '398 ', '10.00', 1, 6, 'Activo'),
(213, 'ZURCIDO', 'UNAD', '442 ', '50.00', 1, 6, 'Activo'),
(214, 'ABRIGO  CUERO', 'UNAD', '139 ', '80.00', 1, 4, 'Activo'),
(215, 'ABRIGO  GAMUZA', 'UNAD', '170 ', '90.00', 1, 4, 'Activo'),
(216, 'ABRIGO  GAMUZA ACOLCHADO', 'UNAD', '171 ', '100.00', 1, 4, 'Activo'),
(217, 'ABRIGO CUERO ACOLCHADO', 'UNAD', '138 ', '90.00', 1, 4, 'Activo'),
(218, 'BLUSA  CUERO', 'UNAD', '140 ', '30.00', 1, 4, 'Activo'),
(219, 'BLUSA  GAMUZA', 'UNAD', '172 ', '30.00', 1, 4, 'Activo'),
(220, 'BOTAS  CUERO  ALTAS', 'UNAD', '158 ', '35.00', 1, 4, 'Activo'),
(221, 'BOTAS  CUERO BAJAS', 'UNAD', '157 ', '25.00', 1, 4, 'Activo'),
(222, 'BOTAS  GAMUZA ALTAS', 'UNAD', '173 ', '35.00', 1, 4, 'Activo'),
(223, 'BOTAS  GAMUZA BAJAS', 'UNAD', '174 ', '25.00', 1, 4, 'Activo'),
(224, 'BOTINES  CUERO', 'UNAD', '212 ', '20.00', 1, 4, 'Activo'),
(225, 'BOTINES  GAMUZA', 'UNAD', '213 ', '20.00', 1, 4, 'Activo'),
(226, 'CAMISACO  CUERO', 'UNAD', '141 ', '50.00', 1, 4, 'Activo'),
(227, 'CAMISACO  GAMUZA', 'UNAD', '175 ', '50.00', 1, 4, 'Activo'),
(228, 'CARTERA  CUERO CHICA', 'UNAD', '159 ', '30.00', 1, 4, 'Activo'),
(229, 'CARTERA  CUERO GRANDE', 'UNAD', '161 ', '40.00', 1, 4, 'Activo'),
(230, 'CARTERA  CUERO MEDIANA', 'UNAD', '160 ', '35.00', 1, 4, 'Activo'),
(231, 'CASACA CUERO', 'UNAD', '142 ', '50.00', 1, 4, 'Activo'),
(232, 'CASACA CUERO ACOLCHADA', 'UNAD', '143 ', '70.00', 1, 4, 'Activo'),
(233, 'CASACA CUERO SINTETICO', 'UNAD', '401 ', '35.00', 1, 4, 'Activo'),
(234, 'CASACA GAMUZA', 'UNAD', '178 ', '50.00', 1, 4, 'Activo'),
(235, 'CASACA GAMUZA ACOLCHADA', 'UNAD', '177 ', '70.00', 1, 4, 'Activo'),
(236, 'CHALECO CUERO', 'UNAD', '145 ', '40.00', 1, 4, 'Activo'),
(237, 'CHALECO GAMUZA', 'UNAD', '179 ', '40.00', 1, 4, 'Activo'),
(238, 'CONJUNTO CUERO', 'UNAD', '144 ', '100.00', 1, 4, 'Activo'),
(239, 'CONJUNTO GAMUZA', 'UNAD', '181 ', '110.00', 1, 4, 'Activo'),
(240, 'CORREA DE CUERO', 'UNAD', '162 ', '15.00', 1, 4, 'Activo'),
(241, 'FALDA CUERO CORTA', 'UNAD', '146 ', '35.00', 1, 4, 'Activo'),
(242, 'FALDA CUERO LARGA', 'UNAD', '147 ', '50.00', 1, 4, 'Activo'),
(243, 'FALDA CUERO SINTETICO', 'UNAD', '403 ', '30.00', 1, 4, 'Activo'),
(244, 'FALDA GAMUZA CORTA', 'UNAD', '184 ', '35.00', 1, 4, 'Activo'),
(245, 'FALDA GAMUZA LARGA', 'UNAD', '185 ', '50.00', 1, 4, 'Activo'),
(246, 'GUANTES CUERO', 'UNAD', '404 ', '25.00', 1, 4, 'Activo'),
(247, 'GUANTES GAMUZA', 'UNAD', '405 ', '25.00', 1, 4, 'Activo'),
(248, 'MALETIN DE CUERO CHICO', 'UNAD', '163 ', '30.00', 1, 4, 'Activo'),
(249, 'MALETIN DE CUERO GRANDE', 'UNAD', '164 ', '45.00', 1, 4, 'Activo'),
(250, 'MALETIN DE GAMUZA CHICO', 'UNAD', '188 ', '30.00', 1, 4, 'Activo'),
(251, 'MALETIN DE GAMUZA GRANDE', 'UNAD', '189 ', '45.00', 1, 4, 'Activo'),
(252, 'MOCHILA DE CUERO CHICO', 'UNAD', '165 ', '30.00', 1, 4, 'Activo'),
(253, 'MOCHILA DE CUERO GRANDE', 'UNAD', '166 ', '45.00', 1, 4, 'Activo'),
(254, 'MOCHILA DE GAMUZA CHICO', 'UNAD', '190 ', '30.00', 1, 4, 'Activo'),
(255, 'MOCHILA DE GAMUZA GRANDE', 'UNAD', '192 ', '45.00', 1, 4, 'Activo'),
(256, 'PANTALON CUERO', 'UNAD', '148 ', '50.00', 1, 4, 'Activo'),
(257, 'PANTALON GAMUZA', 'UNAD', '197 ', '50.00', 1, 4, 'Activo'),
(258, 'SACO CUERO', 'UNAD', '149 ', '50.00', 1, 4, 'Activo'),
(259, 'SACO CUERO ACOLCHADO', 'UNAD', '150 ', '70.00', 1, 4, 'Activo'),
(260, 'SACO GAMUZA', 'UNAD', '204 ', '50.00', 1, 4, 'Activo'),
(261, 'SACO GAMUZA ACOLCHADO', 'UNAD', '203 ', '70.00', 1, 4, 'Activo'),
(262, 'SACON CUERO', 'UNAD', '151 ', '70.00', 1, 4, 'Activo'),
(263, 'SACON CUERO  ACOLCHADO', 'UNAD', '152 ', '90.00', 1, 4, 'Activo'),
(264, 'SACON GAMUZA', 'UNAD', '205 ', '70.00', 1, 4, 'Activo'),
(265, 'SACON GAMUZA ACOLCHADO', 'UNAD', '206 ', '90.00', 1, 4, 'Activo'),
(266, 'SHORT CUERO', 'UNAD', '153 ', '30.00', 1, 4, 'Activo'),
(267, 'SHORT GAMUZA', 'UNAD', '207 ', '35.00', 1, 4, 'Activo'),
(268, 'VESTIDO CUERO CORTO', 'UNAD', '155 ', '60.00', 1, 4, 'Activo'),
(269, 'VESTIDO CUERO LARGO', 'UNAD', '156 ', '70.00', 1, 4, 'Activo'),
(270, 'VESTIDO GAMUZA CORTO', 'UNAD', '208 ', '60.00', 1, 4, 'Activo'),
(271, 'VESTIDO GAMUZA LARGO', 'UNAD', '209 ', '80.00', 1, 4, 'Activo'),
(272, 'ZAPATILLAS CUERO', 'UNAD', '278 ', '30.00', 1, 4, 'Activo'),
(273, 'ZAPATILLAS CUERO/GAMUZA', 'UNAD', '279 ', '30.00', 1, 4, 'Activo'),
(274, 'ZAPATOS DE CUERO', 'UNAD', '167 ', '30.00', 1, 4, 'Activo'),
(275, 'ZAPATOS DE GAMUZA', 'UNAD', '211 ', '35.00', 1, 4, 'Activo'),
(276, 'ABRIGO', 'UNAD', '1 ', '16.10', 1, 5, 'Activo'),
(277, 'ABRIGO ALPACA', 'UNAD', '359 ', '23.10', 1, 5, 'Activo'),
(278, 'BANDERA', 'UNAD', '294 ', '8.40', 1, 5, 'Activo'),
(279, 'BATA DELGADA', 'UNAD', '214 ', '10.50', 1, 5, 'Activo'),
(280, 'BATA GRUESA', 'UNAD', '218 ', '12.60', 1, 5, 'Activo'),
(281, 'BERMUDA', 'UNAD', '7 ', '4.90', 1, 5, 'Activo'),
(282, 'BIVIRÍ', 'UNAD', '305 ', '4.20', 1, 5, 'Activo'),
(283, 'BLUSA  SEDA', 'UNAD', '12 ', '7.00', 1, 5, 'Activo'),
(284, 'BLUSA C/ APLICACIONES', 'UNAD', '11 ', '10.50', 1, 5, 'Activo'),
(285, 'BLUSA LLANA', 'UNAD', '10 ', '6.30', 1, 5, 'Activo'),
(286, 'BLUSON', 'UNAD', '222 ', '10.50', 1, 5, 'Activo'),
(287, 'BODY', 'UNAD', '8 ', '4.20', 1, 5, 'Activo'),
(288, 'BOLERO', 'UNAD', '223 ', '8.40', 1, 5, 'Activo'),
(289, 'BUFANDA', 'UNAD', '13 ', '4.20', 1, 5, 'Activo'),
(290, 'BUZO  NIÑO (CASA-PANT)', 'UNAD', '15 ', '8.40', 1, 5, 'Activo'),
(291, 'BUZO (CASA-PANT)', 'UNAD', '14 ', '10.50', 1, 5, 'Activo'),
(292, 'CAMISA', 'UNAD', '16 ', '7.00', 1, 5, 'Activo'),
(293, 'CAMISA  CORDUROY', 'UNAD', '225 ', '8.40', 1, 5, 'Activo'),
(294, 'CAMISA  SEDA', 'UNAD', '17 ', '8.40', 1, 5, 'Activo'),
(295, 'CAMISON DORMIR', 'UNAD', '304 ', '5.60', 1, 5, 'Activo'),
(296, 'CAPA  ALPACA', 'UNAD', '24 ', '17.50', 1, 5, 'Activo'),
(297, 'CAPA DELGADA', 'UNAD', '23 ', '8.40', 1, 5, 'Activo'),
(298, 'CAPA GRUESA', 'UNAD', '238 ', '10.50', 1, 5, 'Activo'),
(299, 'CAPRI', 'UNAD', '216 ', '7.00', 1, 5, 'Activo'),
(300, 'CASACA', 'UNAD', '19 ', '9.10', 1, 5, 'Activo'),
(301, 'CASACA  ACOLCHADA', 'UNAD', '20 ', '11.90', 1, 5, 'Activo'),
(302, 'CASACA  IMPERMEABLE', 'UNAD', '21 ', '17.50', 1, 5, 'Activo'),
(303, 'CASACA  PLUMAS', 'UNAD', '22 ', '17.50', 1, 5, 'Activo'),
(304, 'CASACA JEAN', 'UNAD', '228 ', '9.10', 1, 5, 'Activo'),
(305, 'CASACA PLUMAS LARGA', 'UNAD', '227 ', '21.00', 1, 5, 'Activo'),
(306, 'CASACA SEMIACOLCHADA', 'UNAD', '347 ', '11.20', 1, 5, 'Activo'),
(307, 'CASULLA', 'UNAD', '343 ', '21.00', 1, 5, 'Activo'),
(308, 'CHAL - PASHMINA (ALPACA, LANA)', 'UNAD', '390 ', '10.50', 1, 5, 'Activo'),
(309, 'CHAL - PASHMINA CHICO', 'UNAD', '239 ', '5.60', 1, 5, 'Activo'),
(310, 'CHALECO', 'UNAD', '350 ', '8.40', 1, 5, 'Activo'),
(311, 'CHALECO PLUMAS', 'UNAD', '234 ', '14.00', 1, 5, 'Activo'),
(312, 'CHALECO VESTIR', 'UNAD', '40 ', '5.60', 1, 5, 'Activo'),
(313, 'CHALINA', 'UNAD', '240 ', '5.60', 1, 5, 'Activo'),
(314, 'CHOMPA ALPACA', 'UNAD', '45 ', '10.50', 1, 5, 'Activo'),
(315, 'CHOMPA C/ APLICACIONES', 'UNAD', '44 ', '10.50', 1, 5, 'Activo'),
(316, 'CHOMPA DELGADA', 'UNAD', '42 ', '7.00', 1, 5, 'Activo'),
(317, 'CHOMPA GRUESA', 'UNAD', '43 ', '8.40', 1, 5, 'Activo'),
(318, 'CHULLO', 'UNAD', '187 ', '3.50', 1, 5, 'Activo'),
(319, 'CONJUNTO (2 PZA.)', 'UNAD', '46 ', '14.00', 1, 5, 'Activo'),
(320, 'CORBATA', 'UNAD', '34 ', '5.60', 1, 5, 'Activo'),
(321, 'CORBATA SEDA', 'UNAD', '35 ', '7.00', 1, 5, 'Activo'),
(322, 'CORSET', 'UNAD', '285 ', '12.60', 1, 5, 'Activo'),
(323, 'CORTINA CENEFA (METRO)', 'UNAD', '33 ', '5.60', 1, 5, 'Activo'),
(324, 'CORTINA TAPASOL (METRO)', 'UNAD', '182 ', '7.00', 1, 5, 'Activo'),
(325, 'CORTINA TAPASOL DOBLE (METRO', 'UNAD', '243 ', '10.50', 1, 5, 'Activo'),
(326, 'CORTINA TUL (METRO)', 'UNAD', '31 ', '5.60', 1, 5, 'Activo'),
(327, 'ENTERIZO CORTO', 'UNAD', '55 ', '17.50', 1, 5, 'Activo'),
(328, 'ENTERIZO LARGO', 'UNAD', '56 ', '24.50', 1, 5, 'Activo'),
(329, 'FALDA  CORTA', 'UNAD', '57 ', '5.60', 1, 5, 'Activo'),
(330, 'FALDA  MARINERA', 'UNAD', '60 ', '49.00', 1, 5, 'Activo'),
(331, 'FALDA  PLIZADA LARGA', 'UNAD', '58 ', '28.00', 1, 5, 'Activo'),
(332, 'FALDA  PLIZADA LARGA SEDA', 'UNAD', '59 ', '35.00', 1, 5, 'Activo'),
(333, 'FALDA ACAMPANADA CORTA', 'UNAD', '283 ', '7.00', 1, 5, 'Activo'),
(334, 'FALDA ACAMPANADA LARGA', 'UNAD', '284 ', '10.50', 1, 5, 'Activo'),
(335, 'FALDA ALPACA', 'UNAD', '217 ', '24.50', 1, 5, 'Activo'),
(336, 'FALDA LARGA', 'UNAD', '183 ', '7.00', 1, 5, 'Activo'),
(337, 'FALDA SEDA', 'UNAD', '282 ', '14.00', 1, 5, 'Activo'),
(338, 'KIMONO', 'UNAD', '342 ', '17.50', 1, 5, 'Activo'),
(339, 'LEGGINS', 'UNAD', '76 ', '6.30', 1, 5, 'Activo'),
(340, 'MANDIL', 'UNAD', '85 ', '8.40', 1, 5, 'Activo'),
(341, 'OVEROL', 'UNAD', '91 ', '10.50', 1, 5, 'Activo'),
(342, 'PANTALON', 'UNAD', '363', '8.40', 1, 5, 'Activo'),
(343, 'PANTALÓN JEAN', 'UNAD', '298 ', '8.40', 1, 5, 'Activo'),
(344, 'PANTALÓN VESTIR', 'UNAD', '93 ', '8.40', 1, 5, 'Activo'),
(345, 'PAÑUELO', 'UNAD', '94 ', '2.10', 1, 5, 'Activo'),
(346, 'PAÑUELO  SEDA', 'UNAD', '95 ', '5.60', 1, 5, 'Activo'),
(347, 'PAÑUELO GRANDE', 'UNAD', '340 ', '5.60', 1, 5, 'Activo'),
(348, 'PAREO', 'UNAD', '96 ', '5.60', 1, 5, 'Activo'),
(349, 'PIJAMA (2 PZAS.)', 'UNAD', '97 ', '9.80', 1, 5, 'Activo'),
(350, 'POLERA', 'UNAD', '101 ', '7.00', 1, 5, 'Activo'),
(351, 'POLO CUELLO', 'UNAD', '308 ', '6.30', 1, 5, 'Activo'),
(352, 'POLO ESTAMPADO M/C', 'UNAD', '306 ', '6.30', 1, 5, 'Activo'),
(353, 'POLO M/C', 'UNAD', '99 ', '5.60', 1, 5, 'Activo'),
(354, 'PONCHO', 'UNAD', '102 ', '10.50', 1, 5, 'Activo'),
(355, 'PONCHO ALPACA', 'UNAD', '198 ', '17.50', 1, 5, 'Activo'),
(356, 'PONCHO IMPERMEABLE', 'UNAD', '327 ', '14.00', 1, 5, 'Activo'),
(357, 'PULLOVER', 'UNAD', '104 ', '5.60', 1, 5, 'Activo'),
(358, 'SACO', 'UNAD', '109', '9.80', 1, 5, 'Activo'),
(359, 'SACO CORDUROY', 'UNAD', '317 ', '9.80', 1, 5, 'Activo'),
(360, 'SACO UNIFORME', 'UNAD', '319 ', '9.80', 1, 5, 'Activo'),
(361, 'SACON', 'UNAD', '111 ', '12.60', 1, 5, 'Activo'),
(362, 'SHORT', 'UNAD', '113 ', '4.20', 1, 5, 'Activo'),
(363, 'TOP', 'UNAD', '120 ', '4.90', 1, 5, 'Activo'),
(364, 'TUNICA', 'UNAD', '344 ', '10.50', 1, 5, 'Activo'),
(365, 'VESTIDO C/APLICACIONES FIESTA CORTO', 'UNAD', '130 ', '42.00', 1, 5, 'Activo'),
(366, 'VESTIDO C/APLICACIONES FIESTA LARGO', 'UNAD', '131 ', '56.00', 1, 5, 'Activo'),
(367, 'VESTIDO C/APLICACIONES LARGO', 'UNAD', '129 ', '38.50', 1, 5, 'Activo'),
(368, 'VESTIDO FIESTA CORTO', 'UNAD', '126 ', '28.00', 1, 5, 'Activo'),
(369, 'VESTIDO FIESTA LARGO', 'UNAD', '127 ', '42.00', 1, 5, 'Activo'),
(370, 'VESTIDO PLIZADO', 'UNAD', '326 ', '49.00', 1, 5, 'Activo'),
(371, 'VESTIDO SIMPLE CORTO', 'UNAD', '124 ', '14.00', 1, 5, 'Activo'),
(372, 'VESTIDO SIMPLE LARGO', 'UNAD', '125 ', '17.50', 1, 5, 'Activo'),
(373, 'ABRIGO', 'UNAD', '1 ', '23.00', 1, 2, 'Activo'),
(374, 'ABRIGO  NIÑO', 'UNAD', '2 ', '15.00', 1, 2, 'Activo'),
(375, 'ABRIGO ALPACA', 'UNAD', '359 ', '33.00', 1, 2, 'Activo'),
(376, 'BABUCHAS  NIÑO', 'UNAD', '6 ', '8.00', 1, 2, 'Activo'),
(377, 'BATA  NIÑO', 'UNAD', '215 ', '10.00', 1, 2, 'Activo'),
(378, 'BATA DELGADA', 'UNAD', '214 ', '15.00', 1, 2, 'Activo'),
(379, 'BATA GRUESA', 'UNAD', '218 ', '18.00', 1, 2, 'Activo'),
(380, 'BERMUDA', 'UNAD', '7 ', '7.00', 1, 2, 'Activo'),
(381, 'BERMUDA NIÑO', 'UNAD', '443 ', '5.00', 1, 2, 'Activo'),
(382, 'BIVIRÍ', 'UNAD', '305 ', '6.00', 1, 2, 'Activo'),
(383, 'BLUSA  SEDA', 'UNAD', '12 ', '10.00', 1, 2, 'Activo'),
(384, 'BLUSA C/ APLICACIONES', 'UNAD', '11 ', '15.00', 1, 2, 'Activo'),
(385, 'BLUSA LLANA', 'UNAD', '10 ', '9.00', 1, 2, 'Activo'),
(386, 'BLUSA MARINERA', 'UNAD', '414 ', '40.00', 1, 2, 'Activo'),
(387, 'BLUSON', 'UNAD', '222 ', '15.00', 1, 2, 'Activo'),
(388, 'BODY', 'UNAD', '8 ', '8.00', 1, 2, 'Activo'),
(389, 'BOLERO', 'UNAD', '223 ', '12.00', 1, 2, 'Activo'),
(390, 'BUFANDA', 'UNAD', '13 ', '6.00', 1, 2, 'Activo'),
(391, 'BUZO  NIÑO (CASA-PANT)', 'UNAD', '15 ', '12.00', 1, 2, 'Activo'),
(392, 'BUZO (CASA-PANT)', 'UNAD', '14 ', '15.00', 1, 2, 'Activo'),
(393, 'CAMISA', 'UNAD', '16 ', '10.00', 1, 2, 'Activo'),
(394, 'CAMISA  C/ ALMIDÓN', 'UNAD', '18 ', '12.00', 1, 2, 'Activo'),
(395, 'CAMISA  CORDUROY', 'UNAD', '225 ', '12.00', 1, 2, 'Activo'),
(396, 'CAMISA  SEDA', 'UNAD', '17 ', '12.00', 1, 2, 'Activo'),
(397, 'CAMISA NIÑO', 'UNAD', '346 ', '7.00', 1, 2, 'Activo'),
(398, 'CAMISON DORMIR', 'UNAD', '304 ', '8.00', 1, 2, 'Activo'),
(399, 'CAPA  ALPACA', 'UNAD', '24 ', '25.00', 1, 2, 'Activo'),
(400, 'CAPA DELGADA', 'UNAD', '23 ', '12.00', 1, 2, 'Activo'),
(401, 'CAPA GRUESA', 'UNAD', '238 ', '15.00', 1, 2, 'Activo'),
(402, 'CAPRI', 'UNAD', '216 ', '10.00', 1, 2, 'Activo'),
(403, 'CASACA', 'UNAD', '19 ', '13.00', 1, 2, 'Activo'),
(404, 'CASACA  ACOLCHADA', 'UNAD', '20 ', '17.00', 1, 2, 'Activo'),
(405, 'CASACA  IMPERMEABLE', 'UNAD', '21 ', '25.00', 1, 2, 'Activo'),
(406, 'CASACA  PLUMAS', 'UNAD', '22 ', '25.00', 1, 2, 'Activo'),
(407, 'CASACA ACOLCHADA LARGA', 'UNAD', '385 ', '23.00', 1, 2, 'Activo'),
(408, 'CASACA ALPACA', 'UNAD', '472 ', '25.00', 1, 2, 'Activo'),
(409, 'CASACA JEAN', 'UNAD', '228 ', '13.00', 1, 2, 'Activo'),
(410, 'CASACA NIÑO', 'UNAD', '233 ', '10.00', 1, 2, 'Activo'),
(411, 'CASACA PLUMAS LARGA', 'UNAD', '227 ', '30.00', 1, 2, 'Activo'),
(412, 'CASACA SEMIACOLCHADA', 'UNAD', '347 ', '16.00', 1, 2, 'Activo'),
(413, 'CASULLA', 'UNAD', '343 ', '30.00', 1, 2, 'Activo'),
(414, 'CHAL - PASHMINA (ALPACA, LANA)', 'UNAD', '390 ', '15.00', 1, 2, 'Activo'),
(415, 'CHAL - PASHMINA CHICO', 'UNAD', '239 ', '8.00', 1, 2, 'Activo'),
(416, 'CHAL - PASHMINA GRANDE', 'UNAD', '41 ', '12.00', 1, 2, 'Activo'),
(417, 'CHALECO', 'UNAD', '350 ', '12.00', 1, 2, 'Activo'),
(418, 'CHALECO ACOLCHADO', 'UNAD', '386 ', '16.00', 1, 2, 'Activo'),
(419, 'CHALECO PLUMAS', 'UNAD', '234 ', '20.00', 1, 2, 'Activo'),
(420, 'CHALECO VESTIR', 'UNAD', '40 ', '10.00', 1, 2, 'Activo'),
(421, 'CHALINA', 'UNAD', '240 ', '10.00', 1, 2, 'Activo'),
(422, 'CHAQUETA', 'UNAD', '387 ', '10.00', 1, 2, 'Activo'),
(423, 'CHOMPA ALPACA', 'UNAD', '45 ', '15.00', 1, 2, 'Activo'),
(424, 'CHOMPA C/ APLICACIONES', 'UNAD', '44 ', '15.00', 1, 2, 'Activo'),
(425, 'CHOMPA DELGADA', 'UNAD', '42 ', '10.00', 1, 2, 'Activo'),
(426, 'CHOMPA GRUESA', 'UNAD', '43 ', '12.00', 1, 2, 'Activo'),
(427, 'CHOMPA NIÑO', 'UNAD', '237 ', '8.00', 1, 2, 'Activo'),
(428, 'CHULLO', 'UNAD', '187 ', '5.00', 1, 2, 'Activo'),
(429, 'COJIN CHICO FORRO', 'UNAD', '411 ', '8.00', 1, 2, 'Activo'),
(430, 'COJIN GRANDE FORRO', 'UNAD', '413 ', '12.00', 1, 2, 'Activo'),
(431, 'COJIN MEDIANO FORRO', 'UNAD', '412 ', '10.00', 1, 2, 'Activo'),
(432, 'COJIN PLUMAS', 'UNAD', '242 ', '15.00', 1, 2, 'Activo'),
(433, 'CONJUNTO (2 PZA.)', 'UNAD', '46 ', '20.00', 1, 2, 'Activo'),
(434, 'CORBATA', 'UNAD', '34 ', '8.00', 1, 2, 'Activo'),
(435, 'CORBATA SEDA', 'UNAD', '35 ', '10.00', 1, 2, 'Activo'),
(436, 'ENTERIZO CORTO', 'UNAD', '55 ', '25.00', 1, 2, 'Activo'),
(437, 'ENTERIZO LARGO', 'UNAD', '56 ', '35.00', 1, 2, 'Activo'),
(438, 'ENTERIZO NIÑO', 'UNAD', '281 ', '15.00', 1, 2, 'Activo'),
(439, 'ESTOLA SACERDOTE', 'UNAD', '463 ', '18.00', 1, 2, 'Activo'),
(440, 'FALDA  CORTA', 'UNAD', '57 ', '8.00', 1, 2, 'Activo'),
(441, 'FALDA  MARINERA', 'UNAD', '60 ', '70.00', 1, 2, 'Activo'),
(442, 'FALDA  PLIZADA LARGA', 'UNAD', '58 ', '40.00', 1, 2, 'Activo'),
(443, 'FALDA  PLIZADA LARGA SEDA', 'UNAD', '59 ', '50.00', 1, 2, 'Activo'),
(444, 'FALDA ACAMPANADA CORTA', 'UNAD', '283 ', '10.00', 1, 2, 'Activo'),
(445, 'FALDA ACAMPANADA LARGA', 'UNAD', '284 ', '15.00', 1, 2, 'Activo'),
(446, 'FALDA ALPACA', 'UNAD', '217 ', '35.00', 1, 2, 'Activo'),
(447, 'FALDA LARGA', 'UNAD', '183 ', '10.00', 1, 2, 'Activo'),
(448, 'FALDA NIÑA', 'UNAD', '445 ', '6.00', 1, 2, 'Activo'),
(449, 'FALDA SEDA', 'UNAD', '282 ', '15.00', 1, 2, 'Activo'),
(450, 'FRAZADA ALPACA 1 1/2 PLAZA', 'UNAD', '69 ', '35.00', 1, 2, 'Activo'),
(451, 'FRAZADA ALPACA 2 PLAZA', 'UNAD', '70 ', '50.00', 1, 2, 'Activo'),
(452, 'FRAZADA ALPACA KING', 'UNAD', '72 ', '80.00', 1, 2, 'Activo'),
(453, 'FRAZADA ALPACA QUEEN', 'UNAD', '71 ', '60.00', 1, 2, 'Activo'),
(454, 'GORRA', 'UNAD', '73 ', '10.00', 1, 2, 'Activo'),
(455, 'GORRA NIÑO', 'UNAD', '345 ', '7.00', 1, 2, 'Activo'),
(456, 'GUANTES', 'UNAD', '75 ', '10.00', 1, 2, 'Activo'),
(457, 'GUANTES NIÑO', 'UNAD', '446 ', '8.00', 1, 2, 'Activo'),
(458, 'IMPERMEABLE (2 PZAS.)', 'UNAD', '328 ', '30.00', 1, 2, 'Activo'),
(459, 'KIMONO', 'UNAD', '342 ', '25.00', 1, 2, 'Activo'),
(460, 'LEGGINS', 'UNAD', '76 ', '9.00', 1, 2, 'Activo'),
(461, 'MAMELUCO ADULTO', 'UNAD', '451 ', '12.00', 1, 2, 'Activo'),
(462, 'MAMELUCO NIÑO', 'UNAD', '447 ', '6.00', 1, 2, 'Activo'),
(463, 'MANDIL', 'UNAD', '85 ', '12.00', 1, 2, 'Activo'),
(464, 'MANDIL NIÑO', 'UNAD', '86 ', '6.00', 1, 2, 'Activo'),
(465, 'MANTA ALPACA', 'UNAD', '314 ', '25.00', 1, 2, 'Activo'),
(466, 'OVEROL', 'UNAD', '91 ', '15.00', 1, 2, 'Activo'),
(467, 'OVEROL NIÑO', 'UNAD', '92 ', '10.00', 1, 2, 'Activo'),
(468, 'PANTALON', 'UNAD', '363', '12.00', 1, 2, 'Activo'),
(469, 'PANTALÓN CORDUROY', 'UNAD', '297 ', '12.00', 1, 2, 'Activo'),
(470, 'PANTALON DRILL', 'UNAD', '296 ', '12.00', 1, 2, 'Activo'),
(471, 'PANTALÓN JEAN', 'UNAD', '298 ', '12.00', 1, 2, 'Activo'),
(472, 'PANTALON NIÑO', 'UNAD', '448 ', '8.00', 1, 2, 'Activo'),
(473, 'PANTALÓN UNIFORME', 'UNAD', '299 ', '12.00', 1, 2, 'Activo'),
(474, 'PANTALÓN VESTIR', 'UNAD', '93 ', '12.00', 1, 2, 'Activo'),
(475, 'PAÑUELO', 'UNAD', '94 ', '5.00', 1, 2, 'Activo'),
(476, 'PAÑUELO  SEDA', 'UNAD', '95 ', '8.00', 1, 2, 'Activo'),
(477, 'PAÑUELO GRANDE', 'UNAD', '340 ', '8.00', 1, 2, 'Activo'),
(478, 'PAREO', 'UNAD', '96 ', '8.00', 1, 2, 'Activo'),
(479, 'PIJAMA (2 PZAS.)', 'UNAD', '97 ', '14.00', 1, 2, 'Activo'),
(480, 'PIJAMA NIÑO (2 PZAS.)', 'UNAD', '98 ', '10.00', 1, 2, 'Activo'),
(481, 'POLERA', 'UNAD', '101 ', '10.00', 1, 2, 'Activo'),
(482, 'POLERA ESTAMPADA', 'UNAD', '309 ', '12.00', 1, 2, 'Activo'),
(483, 'POLO CUELLO', 'UNAD', '308 ', '9.00', 1, 2, 'Activo'),
(484, 'POLO ESTAMPADO M/C', 'UNAD', '306 ', '9.00', 1, 2, 'Activo'),
(485, 'POLO ESTAMPADO M/L', 'UNAD', '307 ', '9.00', 1, 2, 'Activo'),
(486, 'POLO M/C', 'UNAD', '99 ', '8.00', 1, 2, 'Activo'),
(487, 'POLO M/L', 'UNAD', '100 ', '9.00', 1, 2, 'Activo'),
(488, 'POLO NIÑO M/C', 'UNAD', '310 ', '5.00', 1, 2, 'Activo'),
(489, 'POLO NIÑO M/L', 'UNAD', '311 ', '5.00', 1, 2, 'Activo'),
(490, 'PONCHO', 'UNAD', '102 ', '15.00', 1, 2, 'Activo'),
(491, 'PONCHO ALPACA', 'UNAD', '198 ', '25.00', 1, 2, 'Activo'),
(492, 'PONCHO IMPERMEABLE', 'UNAD', '327 ', '20.00', 1, 2, 'Activo'),
(493, 'PONCHO NIÑO', 'UNAD', '331 ', '10.00', 1, 2, 'Activo'),
(494, 'PROTECTOR CUNA', 'UNAD', '351 ', '15.00', 1, 2, 'Activo'),
(495, 'PULLOVER', 'UNAD', '104 ', '8.00', 1, 2, 'Activo'),
(496, 'PULLOVER NIÑO', 'UNAD', '449 ', '4.00', 1, 2, 'Activo'),
(497, 'SACO', 'UNAD', '109', '14.00', 1, 2, 'Activo'),
(498, 'SACO ALPACA', 'UNAD', '471 ', '25.00', 1, 2, 'Activo'),
(499, 'SACO CORDUROY', 'UNAD', '317 ', '14.00', 1, 2, 'Activo'),
(500, 'SACO NIÑO', 'UNAD', '321 ', '10.00', 1, 2, 'Activo'),
(501, 'SACO PANA /SEDA', 'UNAD', '110 ', '14.00', 1, 2, 'Activo'),
(502, 'SACO UNIFORME', 'UNAD', '319 ', '14.00', 1, 2, 'Activo'),
(503, 'SACON', 'UNAD', '111 ', '18.00', 1, 2, 'Activo'),
(504, 'SACON ALPACA', 'UNAD', '376 ', '30.00', 1, 2, 'Activo'),
(505, 'SACON NIÑO', 'UNAD', '112 ', '12.00', 1, 2, 'Activo'),
(506, 'SHORT', 'UNAD', '113 ', '6.00', 1, 2, 'Activo'),
(507, 'SHORT NIÑO', 'UNAD', '450 ', '4.00', 1, 2, 'Activo'),
(508, 'TOP', 'UNAD', '120 ', '7.00', 1, 2, 'Activo'),
(509, 'TUNICA', 'UNAD', '344 ', '15.00', 1, 2, 'Activo'),
(510, 'VARIOS', 'UNAD', '408 ', '5.00', 1, 2, 'Activo'),
(511, 'VESTIDO C/APLICACIONES CORTO', 'UNAD', '128 ', '45.00', 1, 2, 'Activo'),
(512, 'VESTIDO C/APLICACIONES FIESTA CORTO', 'UNAD', '130 ', '60.00', 1, 2, 'Activo'),
(513, 'VESTIDO C/APLICACIONES FIESTA LARGO', 'UNAD', '131 ', '80.00', 1, 2, 'Activo'),
(514, 'VESTIDO C/APLICACIONES LARGO', 'UNAD', '129 ', '55.00', 1, 2, 'Activo'),
(515, 'VESTIDO FIESTA CORTO', 'UNAD', '126 ', '40.00', 1, 2, 'Activo'),
(516, 'VESTIDO FIESTA ESPECIAL', 'UNAD', '462 ', '180.00', 1, 2, 'Activo'),
(517, 'VESTIDO FIESTA LARGO', 'UNAD', '127 ', '60.00', 1, 2, 'Activo'),
(518, 'VESTIDO NIÑA', 'UNAD', '325 ', '28.00', 1, 2, 'Activo'),
(519, 'VESTIDO NOVIA 1', 'UNAD', '132 ', '400.00', 1, 2, 'Activo'),
(520, 'VESTIDO NOVIA 2', 'UNAD', '286 ', '500.00', 1, 2, 'Activo'),
(521, 'VESTIDO NOVIA 3', 'UNAD', '287 ', '750.00', 1, 2, 'Activo'),
(522, 'VESTIDO PLIZADO', 'UNAD', '326 ', '70.00', 1, 2, 'Activo'),
(523, 'VESTIDO SIMPLE CORTO', 'UNAD', '124 ', '20.00', 1, 2, 'Activo'),
(524, 'VESTIDO SIMPLE LARGO', 'UNAD', '125 ', '25.00', 1, 2, 'Activo'),
(526, '3X2 PRENDAS DE VESTIR', 'UNAD', '455', '0.00', 1, 1, 'Activo'),
(527, '4X3 PRENDAS DE  VESTIR', 'UNAD', '456', '0.00', 1, 1, 'Activo'),
(528, '3X2 PRENDAS DE CAMA', 'UNAD', '454', '0.00', 1, 1, 'Activo'),
(529, 'TERNO (2 PZS.)', 'UNAD', '118', '21.00', 1, 2, 'Activo'),
(530, 'TERNO (2 PZS.)', 'UNAD', '118', '16.00', 1, 5, 'Activo');

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
(51, 6, 'Juan Luis', 1, 'PROMOCIONES', 'Boleta', 'B006-0000051', 'C4-0000002', 'DNI', '99999999', 'Maria Leon', 3647, '2021-10-14', '15:18:00', '{\"3X2 PRENDAS DE CAMA\":[{\"key\":\"U4h21\",\"idprenda\":\"37\",\"nombreprenda\":\"CORSET\",\"color\":\"VIOLACEO\",\"marca\":\"WALON\",\"precioprenda\":\"18.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U0dlo\",\"idprenda\":\"38\",\"nombreprenda\":\"CORTINA CENEFA (METRO)\",\"color\":\"ROSADO\",\"marca\":\"TRIAL\",\"precioprenda\":\"8.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uy9q5\",\"idprenda\":\"39\",\"nombreprenda\":\"CORTINA TAPASOL (METRO)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Desgaste\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}],\"3X2 PRENDAS DE VESTIR\":[{\"key\":\"U0z5s\",\"idprenda\":\"2\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"WALON\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Rotura @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"U65et\",\"idprenda\":\"20\",\"nombreprenda\":\"CASACA  PLUMAS\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"25.00\",\"nombreestados\":\"Con Mancha @ Con Rotura\",\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Usucn\",\"idprenda\":\"171\",\"nombreprenda\":\"COSTURA PEQUE\\u00d1A\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null}],\"4X3 PRENDAS DE  VESTIR\":[{\"key\":\"Uv2qw\",\"idprenda\":\"363\",\"nombreprenda\":\"TOP\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"4.90\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ui479\",\"idprenda\":\"11\",\"nombreprenda\":\"BOLSA  DORMIR\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"35.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Ukjvb\",\"idprenda\":\"11\",\"nombreprenda\":\"BOLSA  DORMIR\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TRIAL\",\"precioprenda\":\"35.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null},{\"key\":\"Uw92p\",\"idprenda\":\"10\",\"nombreprenda\":\"BERMUDA NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"precioprenda\":\"5.00\",\"nombreestados\":null,\"observaciones\":null,\"audios\":null,\"imagenes\":null}]}', 'B006-000005120211014151800.pdf', 'ok', '{\"emiRucTipo\":\"6\",\"emiRucNumero\":\"20123257899\",\"emiNombre\":\"LAVANDERIA AKI DRY CLEANERS S.R.L.\",\"emiUbigeo\":\"150130\",\"adqRucTipo\":\"2\",\"adqRucNumero\":\"99999999\",\"adqNombre\":\"MARIA LEON\",\"adqUbigeo\":\"150130\",\"adqDireccion\":\"Lima\",\"adqProvincia\":\"\",\"adqDepartamento\":\"\",\"adqDistrito\":\"\",\"docFechaEmision\":\"14\\/10\\/2021\",\"docTipo\":\"03\",\"docNumero\":\"B00600000510\",\"docMoneda\":\"PEN\",\"docTipoReferencia\":\"\",\"docReferencia\":\"\",\"docMovimiento\":\"\",\"docTotOperGravada\":\"138.00\",\"docTotOperInafecta\":\"0\",\"docTotOperExonerada\":\"0\",\"docTotIGVMonto\":\"21.05\",\"docTotIGVPctaje\":\"18.00\",\"docTotISCMonto\":\"0\",\"docTotDsctoGlobMonto\":\"0\",\"docTotDsctoMonto\":\"0\",\"docImporteTotalVenta\":\"138.00\",\"docImporteVtaLetras\":\"CIENTO TREINTA Y OCHO  Y 00\\/100 Soles\",\"docTipoCambio\":\"0\",\"docCondPago\":\"\",\"docVendCodigo\":\"\",\"docTdaCodigo\":\"\",\"docEstado\":\"\",\"docSUNATCodigo\":\"\",\"docSUNATObservacion\":\"\",\"docValorResumen\":\"\",\"docFechaVcto\":\"14\\/10\\/2021\",\"docICBPER\":\"0.00\",\"detalle\":[{\"item\":1,\"prodCodigoInterno\":\"454\",\"prodUniMedida\":\"UNAD\",\"prodCantidad\":\"1.000\",\"prodDescripcion\":\"3X2 PRENDAS DE CAMA\",\"prodPrecioUnitario\":\"28.0000\",\"prodPrecioVenta\":\"28.0000\",\"itemDscto\":\"0\",\"itemValorVenta\":\"28.0000\",\"ItemAfectacion\":\"0\",\"itemObservacion\":\"\",\"itemICBPER\":0,\"itemIGVMonto\":\"4.2712\"},{\"item\":2,\"prodCodigoInterno\":\"455\",\"prodUniMedida\":\"UNAD\",\"prodCantidad\":\"1.000\",\"prodDescripcion\":\"3X2 PRENDAS DE VESTIR\",\"prodPrecioUnitario\":\"35.0000\",\"prodPrecioVenta\":\"35.0000\",\"itemDscto\":\"0\",\"itemValorVenta\":\"35.0000\",\"ItemAfectacion\":\"0\",\"itemObservacion\":\"\",\"itemICBPER\":0,\"itemIGVMonto\":\"5.3390\"},{\"item\":3,\"prodCodigoInterno\":\"456\",\"prodUniMedida\":\"UNAD\",\"prodCantidad\":\"1.000\",\"prodDescripcion\":\"4X3 PRENDAS DE  VESTIR\",\"prodPrecioUnitario\":\"75.0000\",\"prodPrecioVenta\":\"75.0000\",\"itemDscto\":\"0\",\"itemValorVenta\":\"75.0000\",\"ItemAfectacion\":\"0\",\"itemObservacion\":\"\",\"itemICBPER\":0,\"itemIGVMonto\":\"11.4407\"}]}');

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
(3647, 'Persona', '3647', 'MARIA', 'LEON', '-', '4', '99999999', '-', 'RENOI 273 402', '-', 'prueba@gyvsoftware.com', '990441759', '150130', '150130', 'Activo', 1, '2021-10-13', NULL, NULL, NULL, NULL),
(3649, 'Persona', '3649', 'BONOETT', 'CXC', '-', '4', '99999999', '-', 'REPUBLIC 271_601', '-', 'prueba@gyvsoftware.com', '999271208', '150140', '150140', 'Activo', 1, '2021-10-13', NULL, NULL, '-12.0575809', '-77.0673784'),
(3686, 'Persona', '3686', 'LUISA', 'MENDOZA', '-', '1', '99999999', '-', 'ROSSEAU 391', '-', 'prueba@gyvsoftware.com', '4360521', '150130', '150130', 'Activo', 1, '2021-10-13', NULL, NULL, NULL, NULL),
(7285, 'Persona', '7285', 'LUIS', 'MENA', '-', '1', '99999999', '-', 'JR. ALABA 119 5TA. ETAPAURB. JAVIER PRADO', '-', 'prueba@gyvsoftware.com', '3464478', '150134', '150134', 'Activo', 3, '2021-10-13', NULL, NULL, NULL, NULL),
(10691, 'Persona', '10691', 'ALBERTO', 'CARNERO', '-', '1', '10007106', '-', 'AV. LAS ARTES SUR 391  DPT: 101', '-', 'prueba@gyvsoftware.com', '969000599', '150130', '150130', 'Activo', 1, '2021-10-13', NULL, NULL, NULL, NULL);

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
  `item` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
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

INSERT INTO `detalleorden` (`id`, `item`, `idorden`, `ordenpromocion`, `idpromocion`, `nombrepromocion`, `idprenda`, `nombreprenda`, `color`, `marca`, `precioprenda`, `nombreestados`, `observaciones`, `audios`, `imagenes`) VALUES
(25, '101', 17, 'Uu0qa', NULL, NULL, 388, 'BODY', 'VERDE / VERDE A RAYAS', 'TIGRE', '8.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(26, '201', 17, 'U8ayp', 529, 'TERNO (2 PZS.)', 93, 'MANTEL LLANO PEQUEÑO', 'VERDE / VERDE A RAYAS', 'TIGRE', '21.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(27, '202', 17, 'U8ayp', 529, 'TERNO (2 PZS.)', 109, 'PONCHO NIÑO', 'VERDE / VERDE A RAYAS', 'TIGRE', '0.00', 'Con Mancha @ Con Desgaste', NULL, NULL, NULL),
(28, '301', 17, 'Udp8n', NULL, NULL, 374, 'ABRIGO  NIÑO', 'VERDE / VERDE A RAYAS', 'TIGRE', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(29, '401', 17, 'U0clu', 529, 'TERNO (2 PZS.)', 93, 'MANTEL LLANO PEQUEÑO', 'VERDE', 'TRIAL', '21.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(30, '402', 17, 'U0clu', 529, 'TERNO (2 PZS.)', 109, 'PONCHO NIÑO', 'VERDE', 'TRIAL', '0.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(31, '101', 24, 'Uhzrx', 527, '4X3 PRENDAS DE  VESTIR', 10, 'BERMUDA NIÑO', 'VERDE', 'TIGRE', '5.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(32, '102', 24, 'Umeqq', 527, '4X3 PRENDAS DE  VESTIR', 12, 'BUZO  NIÑO (CASA-PANT)', 'VERDE', 'TIGRE', '12.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(33, '103', 24, 'Urzs6', 527, '4X3 PRENDAS DE  VESTIR', 11, 'BOLSA  DORMIR', 'VERDE / VERDE A RAYAS', 'WALON', '35.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL),
(34, '104', 24, 'Uu7ll', 527, '4X3 PRENDAS DE  VESTIR', 363, 'TOP', 'VIOLETA', 'ÉL', '4.90', 'Con Mancha @ Con Rotura', NULL, NULL, NULL),
(35, '201', 24, 'U9omi', 526, '3X2 PRENDAS DE VESTIR', 2, 'ALMOHADA', 'VERDE', 'TIGRE', '10.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(36, '202', 24, 'Uwvji', 526, '3X2 PRENDAS DE VESTIR', 1, 'ABRIGO  NIÑO', 'ROSADO', 'RIPLEY', '15.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(37, '203', 24, 'Uvzr8', 526, '3X2 PRENDAS DE VESTIR', 228, 'CARTERA  CUERO CHICA', 'VIOLETA', 'ÉL', '30.00', 'Con Mancha @ Con Huequito', NULL, NULL, NULL),
(38, '301', 24, 'Uxnbf', 528, '3X2 PRENDAS DE CAMA', 38, 'CORTINA CENEFA (METRO)', 'VERDE', 'RIPLEY', '8.00', 'Con Desgaste @ Con Huequito', NULL, NULL, NULL),
(39, '302', 24, 'Ukppp', 528, '3X2 PRENDAS DE CAMA', 312, 'CHALECO VESTIR', 'VIOLETA', 'ÉL', '5.60', 'Con Mancha @ Con Decoloración', NULL, NULL, NULL),
(40, '303', 24, 'Unnw0', 528, '3X2 PRENDAS DE CAMA', 38, 'CORTINA CENEFA (METRO)', 'VERDE', 'TRIAL', '8.00', 'Con Decoloración @ Con Huequito', NULL, NULL, NULL);

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
(17, 2, 'C1-0000017', 'SECO', 'Juan Huaman', '2021-10-16', '14:18:56', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '14:18:56', 'Por Cobrar', 'C1', '0.00', '0.00', '65.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '[{\"idprenda\":\"388\",\"ordenpromocion\":\"Uu0qa\",\"precio\":\"8.00\",\"nombreprenda\":\"BODY\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Uu0qa\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null,\"item\":101}]},{\"idprenda\":\"529\",\"ordenpromocion\":\"U8ayp\",\"precio\":\"21.00\",\"nombreprenda\":\"TERNO (2 PZS.)\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U5ovk\",\"idpieza\":\"93\",\"nombrepieza\":\"MANTEL LLANO PEQUE\\u00d1O\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null,\"item\":201},{\"key\":\"U794r\",\"idpieza\":\"109\",\"nombrepieza\":\"PONCHO NI\\u00d1O\",\"nombresestados\":\"Con Mancha @ Con Desgaste\",\"observacion\":null,\"audios\":null,\"imagenes\":null,\"item\":202}]},{\"idprenda\":\"374\",\"ordenpromocion\":\"Udp8n\",\"precio\":\"15.00\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"TIGRE\",\"cantpiezas\":1,\"piezas\":[{\"key\":\"Udp8n\",\"idpieza\":null,\"nombrepieza\":null,\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null,\"item\":301}]},{\"idprenda\":\"529\",\"ordenpromocion\":\"U0clu\",\"precio\":\"21.00\",\"nombreprenda\":\"TERNO (2 PZS.)\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"cantpiezas\":2,\"piezas\":[{\"key\":\"U0k90\",\"idpieza\":\"93\",\"nombrepieza\":\"MANTEL LLANO PEQUE\\u00d1O\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null,\"item\":401},{\"key\":\"Uhr7q\",\"idpieza\":\"109\",\"nombrepieza\":\"PONCHO NI\\u00d1O\",\"nombresestados\":\"Con Mancha @ Con Huequito\",\"observacion\":null,\"audios\":null,\"imagenes\":null,\"item\":402}]}]', 2),
(18, 1, 'C1-0000018', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '14:21:42', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '14:21:42', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(19, 1, 'C1-0000019', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '14:26:48', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '14:26:48', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(20, 1, 'C1-0000020', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '14:33:48', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '14:33:48', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(21, 1, 'C1-0000021', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '15:07:31', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '15:07:31', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(22, 1, 'C1-0000022', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '15:18:46', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '15:18:46', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(23, 1, 'C1-0000023', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '15:23:28', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '15:23:28', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', NULL, 2),
(24, 1, 'C1-0000024', 'PROMOCIONES', 'Juan Huaman', '2021-10-16', '15:24:07', 10691, 'Alberto Carnero', '969000599', 'AV. LAS ARTES SUR 391  DPT: 101', '2021-10-20', '15:24:07', 'Por Cobrar', 'C1', '0.00', '0.00', '108.00', '0.00', '0.00', 'Activo', 'Por Cobrar', 'Entrega', '{\"4X3 PRENDAS DE  VESTIR\":[{\"key\":\"Uhzrx\",\"idprenda\":\"10\",\"nombreprenda\":\"BERMUDA NI\\u00d1O\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"5.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":101},{\"key\":\"Umeqq\",\"idprenda\":\"12\",\"nombreprenda\":\"BUZO  NI\\u00d1O (CASA-PANT)\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"12.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":102},{\"key\":\"Urzs6\",\"idprenda\":\"11\",\"nombreprenda\":\"BOLSA  DORMIR\",\"color\":\"VERDE \\/ VERDE A RAYAS\",\"marca\":\"WALON\",\"precioprenda\":\"35.00\",\"nombreestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":103},{\"key\":\"Uu7ll\",\"idprenda\":\"363\",\"nombreprenda\":\"TOP\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"4.90\",\"nombreestados\":\"Con Mancha @ Con Rotura\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":104}],\"3X2 PRENDAS DE VESTIR\":[{\"key\":\"U9omi\",\"idprenda\":\"2\",\"nombreprenda\":\"ALMOHADA\",\"color\":\"VERDE\",\"marca\":\"TIGRE\",\"precioprenda\":\"10.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":201},{\"key\":\"Uwvji\",\"idprenda\":\"1\",\"nombreprenda\":\"ABRIGO  NI\\u00d1O\",\"color\":\"ROSADO\",\"marca\":\"RIPLEY\",\"precioprenda\":\"15.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":202},{\"key\":\"Uvzr8\",\"idprenda\":\"228\",\"nombreprenda\":\"CARTERA  CUERO CHICA\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"30.00\",\"nombreestados\":\"Con Mancha @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":203}],\"3X2 PRENDAS DE CAMA\":[{\"key\":\"Uxnbf\",\"idprenda\":\"38\",\"nombreprenda\":\"CORTINA CENEFA (METRO)\",\"color\":\"VERDE\",\"marca\":\"RIPLEY\",\"precioprenda\":\"8.00\",\"nombreestados\":\"Con Desgaste @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":301},{\"key\":\"Ukppp\",\"idprenda\":\"312\",\"nombreprenda\":\"CHALECO VESTIR\",\"color\":\"VIOLETA\",\"marca\":\"\\u00c9L\",\"precioprenda\":\"5.60\",\"nombreestados\":\"Con Mancha @ Con Decoloraci\\u00f3n\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":302},{\"key\":\"Unnw0\",\"idprenda\":\"38\",\"nombreprenda\":\"CORTINA CENEFA (METRO)\",\"color\":\"VERDE\",\"marca\":\"TRIAL\",\"precioprenda\":\"8.00\",\"nombreestados\":\"Con Decoloraci\\u00f3n @ Con Huequito\",\"observaciones\":null,\"audios\":null,\"imagenes\":null,\"item\":303}]}', 2);

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
(2, 526, 'PROMO526', 'PROMO1', '0.00', 'Activo'),
(3, 526, 'PROMO526', 'PROMO2', '0.00', 'Activo'),
(4, 526, 'PROMO526', 'PROMO3', '0.00', 'Activo'),
(5, 527, 'PROMO527', 'PROMO1', '0.00', 'Activo'),
(6, 527, 'PROMO527', 'PROMO2', '0.00', 'Activo'),
(7, 527, 'PROMO527', 'PROMO3', '0.00', 'Activo'),
(8, 527, 'PROMO527', 'PROMO4', '0.00', 'Activo'),
(9, 528, 'PROMO528', 'PROMO1', '0.00', 'Activo'),
(10, 528, 'PROMO528', 'PROMO2', '0.00', 'Activo'),
(11, 528, 'PROMO528', 'PROMO3', '0.00', 'Activo');

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
(2, 2, 1),
(3, 2, 2),
(4, 2, 19),
(5, 2, 20),
(6, 2, 21),
(7, 2, 22),
(8, 2, 109),
(9, 2, 110),
(10, 2, 111),
(11, 2, 112),
(12, 2, 118),
(13, 2, 119),
(14, 2, 138),
(15, 2, 139),
(16, 2, 142),
(17, 2, 143),
(18, 2, 149),
(19, 2, 150),
(20, 2, 151),
(21, 2, 152),
(22, 2, 170),
(23, 2, 171),
(24, 2, 177),
(25, 2, 178),
(26, 2, 203),
(27, 2, 204),
(28, 2, 205),
(29, 2, 206),
(30, 2, 227),
(31, 2, 228),
(32, 2, 233),
(33, 2, 385),
(34, 2, 317),
(35, 2, 319),
(36, 2, 321),
(37, 2, 347),
(38, 2, 359),
(39, 2, 376),
(40, 2, 377),
(41, 2, 471),
(42, 2, 472),
(43, 3, 1),
(44, 3, 2),
(45, 3, 19),
(46, 3, 20),
(47, 3, 21),
(48, 3, 22),
(49, 3, 109),
(50, 3, 110),
(51, 3, 111),
(52, 3, 112),
(53, 3, 118),
(54, 3, 119),
(55, 3, 138),
(56, 3, 139),
(57, 3, 142),
(58, 3, 143),
(59, 3, 149),
(60, 3, 150),
(61, 3, 151),
(62, 3, 152),
(63, 3, 170),
(64, 3, 171),
(65, 3, 177),
(66, 3, 178),
(67, 3, 203),
(68, 3, 204),
(69, 3, 205),
(70, 3, 206),
(71, 3, 227),
(72, 3, 228),
(73, 3, 233),
(74, 3, 385),
(75, 3, 317),
(76, 3, 319),
(77, 3, 321),
(78, 3, 347),
(79, 3, 359),
(80, 3, 376),
(81, 3, 377),
(82, 3, 471),
(83, 3, 472),
(84, 4, 1),
(85, 4, 2),
(86, 4, 19),
(87, 4, 20),
(88, 4, 21),
(89, 4, 22),
(90, 4, 109),
(91, 4, 110),
(92, 4, 111),
(93, 4, 112),
(94, 4, 118),
(95, 4, 119),
(96, 4, 138),
(97, 4, 139),
(98, 4, 142),
(99, 4, 143),
(100, 4, 149),
(101, 4, 150),
(102, 4, 151),
(103, 4, 152),
(104, 4, 170),
(105, 4, 171),
(106, 4, 177),
(107, 4, 178),
(108, 4, 203),
(109, 4, 204),
(110, 4, 205),
(111, 4, 206),
(112, 4, 227),
(113, 4, 228),
(114, 4, 233),
(115, 4, 385),
(116, 4, 317),
(117, 4, 319),
(118, 4, 321),
(119, 4, 347),
(120, 4, 359),
(121, 4, 376),
(122, 4, 377),
(123, 4, 471),
(124, 4, 472),
(125, 5, 10),
(126, 5, 11),
(127, 5, 12),
(128, 5, 16),
(129, 5, 17),
(130, 5, 42),
(131, 5, 43),
(132, 5, 45),
(133, 5, 93),
(134, 5, 99),
(135, 5, 100),
(136, 5, 101),
(137, 5, 140),
(138, 5, 148),
(139, 5, 172),
(140, 5, 197),
(141, 5, 222),
(142, 5, 225),
(143, 5, 237),
(144, 5, 296),
(145, 5, 297),
(146, 5, 298),
(147, 5, 299),
(148, 5, 306),
(149, 5, 308),
(150, 5, 310),
(151, 5, 311),
(152, 5, 346),
(153, 5, 363),
(154, 5, 414),
(155, 5, 448),
(156, 6, 10),
(157, 6, 11),
(158, 6, 12),
(159, 6, 16),
(160, 6, 17),
(161, 6, 42),
(162, 6, 43),
(163, 6, 45),
(164, 6, 93),
(165, 6, 99),
(166, 6, 100),
(167, 6, 101),
(168, 6, 140),
(169, 6, 148),
(170, 6, 172),
(171, 6, 197),
(172, 6, 222),
(173, 6, 225),
(174, 6, 237),
(175, 6, 296),
(176, 6, 297),
(177, 6, 298),
(178, 6, 299),
(179, 6, 306),
(180, 6, 308),
(181, 6, 310),
(182, 6, 311),
(183, 6, 346),
(184, 6, 363),
(185, 6, 414),
(186, 6, 448),
(187, 7, 10),
(188, 7, 11),
(189, 7, 12),
(190, 7, 16),
(191, 7, 17),
(192, 7, 42),
(193, 7, 43),
(194, 7, 45),
(195, 7, 93),
(196, 7, 99),
(197, 7, 100),
(198, 7, 101),
(199, 7, 140),
(200, 7, 148),
(201, 7, 172),
(202, 7, 197),
(203, 7, 222),
(204, 7, 225),
(205, 7, 237),
(206, 7, 296),
(207, 7, 297),
(208, 7, 298),
(209, 7, 299),
(210, 7, 306),
(211, 7, 308),
(212, 7, 310),
(213, 7, 311),
(214, 7, 346),
(215, 7, 363),
(216, 7, 414),
(217, 7, 448),
(218, 8, 10),
(219, 8, 11),
(220, 8, 12),
(221, 8, 16),
(222, 8, 17),
(223, 8, 42),
(224, 8, 43),
(225, 8, 45),
(226, 8, 93),
(227, 8, 99),
(228, 8, 100),
(229, 8, 101),
(230, 8, 140),
(231, 8, 148),
(232, 8, 172),
(233, 8, 197),
(234, 8, 222),
(235, 8, 225),
(236, 8, 237),
(237, 8, 296),
(238, 8, 297),
(239, 8, 298),
(240, 8, 299),
(241, 8, 306),
(242, 8, 308),
(243, 8, 310),
(244, 8, 311),
(245, 8, 346),
(246, 8, 363),
(247, 8, 414),
(248, 8, 448),
(249, 9, 36),
(250, 9, 37),
(251, 9, 38),
(252, 9, 39),
(253, 9, 47),
(254, 9, 48),
(255, 9, 49),
(256, 9, 50),
(257, 9, 51),
(258, 9, 52),
(259, 9, 53),
(260, 9, 54),
(261, 9, 62),
(262, 9, 63),
(263, 9, 64),
(264, 9, 65),
(265, 9, 66),
(266, 9, 67),
(267, 9, 68),
(268, 9, 69),
(269, 9, 70),
(270, 9, 71),
(271, 9, 72),
(272, 9, 87),
(273, 9, 88),
(274, 9, 199),
(275, 9, 200),
(276, 9, 201),
(277, 9, 202),
(278, 9, 312),
(279, 9, 313),
(280, 9, 314),
(281, 10, 36),
(282, 10, 37),
(283, 10, 38),
(284, 10, 39),
(285, 10, 47),
(286, 10, 48),
(287, 10, 49),
(288, 10, 50),
(289, 10, 51),
(290, 10, 52),
(291, 10, 53),
(292, 10, 54),
(293, 10, 62),
(294, 10, 63),
(295, 10, 64),
(296, 10, 65),
(297, 10, 66),
(298, 10, 67),
(299, 10, 68),
(300, 10, 69),
(301, 10, 70),
(302, 10, 71),
(303, 10, 72),
(304, 10, 87),
(305, 10, 88),
(306, 10, 199),
(307, 10, 200),
(308, 10, 201),
(309, 10, 202),
(310, 10, 312),
(311, 10, 313),
(312, 10, 314),
(313, 11, 36),
(314, 11, 37),
(315, 11, 38),
(316, 11, 39),
(317, 11, 47),
(318, 11, 48),
(319, 11, 49),
(320, 11, 50),
(321, 11, 51),
(322, 11, 52),
(323, 11, 53),
(324, 11, 54),
(325, 11, 62),
(326, 11, 63),
(327, 11, 64),
(328, 11, 65),
(329, 11, 66),
(330, 11, 67),
(331, 11, 68),
(332, 11, 69),
(333, 11, 70),
(334, 11, 71),
(335, 11, 72),
(336, 11, 87),
(337, 11, 88),
(338, 11, 199),
(339, 11, 200),
(340, 11, 201),
(341, 11, 202),
(342, 11, 312),
(343, 11, 313),
(344, 11, 314);

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
(1, 529, '1', 93),
(2, 529, '1', 109),
(3, 530, '1', 93),
(4, 530, '1', 109);

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
(6, 'REP0006', 'Juan Luis', 'Huaman Keiko', '', 1, NULL, NULL, '', 'B006', 'F006', 'Activo'),
(8, 'DAVID', 'David Huanaco', '-', '', 2, NULL, NULL, '', 'B004', 'F004', 'Activo');

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
  `idprenda` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'AQUI GUARDO EL ITEM, NO GUARDO EL ID DE PRENDA',
  `color` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `turnoxcliente`
--

INSERT INTO `turnoxcliente` (`id`, `numero_orden`, `id_repartidor`, `id_cliente`, `id_zona`, `puesto_turno`, `fecha_turno`, `hora_turno`, `atencion`, `estado_turno`, `idprenda`, `color`, `marca`) VALUES
(1, NULL, 6, 10691, 1, 'Tarde', '2021-10-13', '15:00:00', 'Sin Atender', 'Recojo', NULL, NULL, NULL),
(28, 'C1-0000017', 6, 10691, 1, 'Temprano', '2021-10-16', '10:00:00', 'Sin Atender', 'Recojo', '201', 'VERDE / VERDE A RAYAS', 'TIGRE');

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
(5, 1, 6),
(6, 4, 7),
(7, 2, 8);

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
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10694;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4871;

--
-- AUTO_INCREMENT de la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impresora`
--
ALTER TABLE `impresora`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1956;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `promocionxarticulo`
--
ALTER TABLE `promocionxarticulo`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reclamoxprenda`
--
ALTER TABLE `reclamoxprenda`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `turnoxcliente`
--
ALTER TABLE `turnoxcliente`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `zonaxrepartidor`
--
ALTER TABLE `zonaxrepartidor`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
