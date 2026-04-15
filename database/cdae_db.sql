-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-04-2026 a las 23:33:14
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cdae_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos`
--

CREATE TABLE `catalogos` (
  `id` bigint UNSIGNED NOT NULL,
  `pagina_id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `catalogos`
--

INSERT INTO `catalogos` (`id`, `pagina_id`, `imagen`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 1, '41776269928.jpeg', 1, '2026-04-15 16:18:48', '2026-04-15 17:43:58', NULL),
(6, 2, '61776270526.jpg', 1, '2026-04-15 16:28:46', '2026-04-15 16:28:46', NULL),
(7, 3, '71776270670.jpg', 1, '2026-04-15 16:31:10', '2026-04-15 17:44:07', NULL),
(8, 4, '81776270794.jpg', 1, '2026-04-15 16:33:14', '2026-04-15 17:48:55', NULL),
(9, 5, '91776270876.jpg', 1, '2026-04-15 16:34:36', '2026-04-15 16:34:36', NULL),
(10, 6, '101776270951.jpg', 1, '2026-04-15 16:35:51', '2026-04-15 16:35:51', NULL),
(11, 7, '111776270987.jpg', 1, '2026-04-15 16:36:27', '2026-04-15 16:36:27', NULL),
(12, 8, '121776271063.jpeg', 1, '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(13, 9, '131776271211.jpeg', 1, '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `logo`, `portada`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SISTEMA CDA', 'CDA', 'logo.png', 'portada11775163668.jpg', NULL, '2026-04-02 21:01:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` json DEFAULT NULL,
  `datos_nuevo` json DEFAULT NULL,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 4, \"estado\": \"0\", \"imagen\": \"41776269928.jpeg\", \"pagina_id\": \"1\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"updated_at\": \"2026-04-15T16:18:48.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:18:48', '2026-04-15 16:18:48', '2026-04-15 16:18:48'),
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 6, \"estado\": \"1\", \"imagen\": \"61776270526.jpg\", \"pagina_id\": \"2\", \"created_at\": \"2026-04-15T16:28:46.000000Z\", \"updated_at\": \"2026-04-15T16:28:46.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:28:46', '2026-04-15 16:28:46', '2026-04-15 16:28:46'),
(3, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 7, \"estado\": \"0\", \"imagen\": \"71776270670.jpg\", \"pagina_id\": \"3\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"updated_at\": \"2026-04-15T16:31:10.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:31:10', '2026-04-15 16:31:10', '2026-04-15 16:31:10'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 8, \"estado\": \"0\", \"imagen\": \"81776270794.jpg\", \"pagina_id\": \"4\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"updated_at\": \"2026-04-15T16:33:14.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:33:14', '2026-04-15 16:33:14', '2026-04-15 16:33:14'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 9, \"estado\": \"1\", \"imagen\": \"91776270876.jpg\", \"pagina_id\": \"5\", \"created_at\": \"2026-04-15T16:34:36.000000Z\", \"updated_at\": \"2026-04-15T16:34:36.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:34:36', '2026-04-15 16:34:36', '2026-04-15 16:34:36'),
(6, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 10, \"estado\": \"1\", \"imagen\": \"101776270951.jpg\", \"pagina_id\": \"6\", \"created_at\": \"2026-04-15T16:35:51.000000Z\", \"updated_at\": \"2026-04-15T16:35:51.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:35:51', '2026-04-15 16:35:51', '2026-04-15 16:35:51'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 11, \"estado\": \"1\", \"imagen\": \"111776270987.jpg\", \"pagina_id\": \"7\", \"created_at\": \"2026-04-15T16:36:27.000000Z\", \"updated_at\": \"2026-04-15T16:36:27.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:36:27', '2026-04-15 16:36:27', '2026-04-15 16:36:27'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 12, \"estado\": \"1\", \"imagen\": \"121776271063.jpeg\", \"pagina_id\": \"8\", \"created_at\": \"2026-04-15T16:37:43.000000Z\", \"updated_at\": \"2026-04-15T16:37:43.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:37:43', '2026-04-15 16:37:43', '2026-04-15 16:37:43'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CATALOGO', '{\"id\": 13, \"estado\": \"1\", \"imagen\": \"131776271211.jpeg\", \"pagina_id\": \"9\", \"created_at\": \"2026-04-15T16:40:11.000000Z\", \"updated_at\": \"2026-04-15T16:40:11.000000Z\"}', NULL, 'CATALOGOS', '2026-04-15', '12:40:11', '2026-04-15 16:40:11', '2026-04-15 16:40:11'),
(10, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CATALOGO', '{\"id\": 4, \"estado\": \"0\", \"imagen\": \"41776269928.jpeg\", \"pagina_id\": 1, \"productos\": [{\"id\": 3, \"codigo\": \"p001\", \"imagen\": \"031776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 1\", \"precio\": \"20.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/031776269928.jpg\", \"catalogo_id\": 4}, {\"id\": 4, \"codigo\": \"p002\", \"imagen\": \"141776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 2\", \"precio\": \"90.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/141776269928.jpg\", \"catalogo_id\": 4}, {\"id\": 5, \"codigo\": \"p003\", \"imagen\": \"251776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 3\", \"precio\": \"120.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/251776269928.jpg\", \"catalogo_id\": 4}, {\"id\": 6, \"codigo\": \"p004\", \"imagen\": \"361776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 4\", \"precio\": \"190.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/361776269928.jpg\", \"catalogo_id\": 4}], \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\"}', '{\"id\": 4, \"estado\": \"1\", \"imagen\": \"41776269928.jpeg\", \"pagina_id\": \"1\", \"productos\": [{\"id\": 3, \"codigo\": \"p001\", \"imagen\": \"031776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 1\", \"precio\": \"20.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/031776269928.jpg\", \"catalogo_id\": 4}, {\"id\": 4, \"codigo\": \"p002\", \"imagen\": \"141776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 2\", \"precio\": \"90.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/141776269928.jpg\", \"catalogo_id\": 4}, {\"id\": 5, \"codigo\": \"p003\", \"imagen\": \"251776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 3\", \"precio\": \"120.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/251776269928.jpg\", \"catalogo_id\": 4}, {\"id\": 6, \"codigo\": \"p004\", \"imagen\": \"361776269928.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"producto 4\", \"precio\": \"190.00\", \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:18:48.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/361776269928.jpg\", \"catalogo_id\": 4}], \"created_at\": \"2026-04-15T16:18:48.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T17:43:58.000000Z\"}', 'CATALOGOS', '2026-04-15', '13:43:58', '2026-04-15 17:43:58', '2026-04-15 17:43:58'),
(11, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CATALOGO', '{\"id\": 7, \"estado\": \"0\", \"imagen\": \"71776270670.jpg\", \"pagina_id\": 3, \"productos\": [{\"id\": 12, \"codigo\": \"p009\", \"imagen\": \"0121776270670.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 9\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/0121776270670.jpg\", \"catalogo_id\": 7}, {\"id\": 13, \"codigo\": \"p10\", \"imagen\": \"1131776270670.jpeg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 10\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/1131776270670.jpeg\", \"catalogo_id\": 7}, {\"id\": 14, \"codigo\": \"p11\", \"imagen\": \"2141776270670.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 11\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/2141776270670.jpg\", \"catalogo_id\": 7}], \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\"}', '{\"id\": 7, \"estado\": \"1\", \"imagen\": \"71776270670.jpg\", \"pagina_id\": \"3\", \"productos\": [{\"id\": 12, \"codigo\": \"p009\", \"imagen\": \"0121776270670.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 9\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/0121776270670.jpg\", \"catalogo_id\": 7}, {\"id\": 13, \"codigo\": \"p10\", \"imagen\": \"1131776270670.jpeg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 10\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/1131776270670.jpeg\", \"catalogo_id\": 7}, {\"id\": 14, \"codigo\": \"p11\", \"imagen\": \"2141776270670.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 11\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:31:10.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/2141776270670.jpg\", \"catalogo_id\": 7}], \"created_at\": \"2026-04-15T16:31:10.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T17:44:07.000000Z\"}', 'CATALOGOS', '2026-04-15', '13:44:07', '2026-04-15 17:44:07', '2026-04-15 17:44:07'),
(12, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CATALOGO', '{\"id\": 8, \"estado\": 0, \"imagen\": \"81776270794.jpg\", \"pagina_id\": 4, \"productos\": [{\"id\": 15, \"codigo\": \"p12\", \"imagen\": \"0151776270794.jpeg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 12\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/0151776270794.jpeg\", \"catalogo_id\": 8}, {\"id\": 16, \"codigo\": \"p13\", \"imagen\": \"1161776270794.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 13\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/1161776270794.jpg\", \"catalogo_id\": 8}, {\"id\": 17, \"codigo\": \"p14\", \"imagen\": \"2171776270794.webp\", \"moneda\": \"Bs.\", \"nombre\": \"prod 14\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/2171776270794.webp\", \"catalogo_id\": 8}, {\"id\": 18, \"codigo\": \"p15\", \"imagen\": \"3181776270794.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 15\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/3181776270794.jpg\", \"catalogo_id\": 8}, {\"id\": 19, \"codigo\": \"p16\", \"imagen\": \"4191776270794.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 16\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/4191776270794.jpg\", \"catalogo_id\": 8}, {\"id\": 20, \"codigo\": \"p17\", \"imagen\": \"5201776270794.jpeg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 17\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/5201776270794.jpeg\", \"catalogo_id\": 8}, {\"id\": 21, \"codigo\": \"p18\", \"imagen\": \"6211776270794.webp\", \"moneda\": \"Bs.\", \"nombre\": \"prod 18\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/6211776270794.webp\", \"catalogo_id\": 8}], \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\"}', '{\"id\": 8, \"estado\": \"1\", \"imagen\": \"81776270794.jpg\", \"pagina_id\": \"4\", \"productos\": [{\"id\": 15, \"codigo\": \"p12\", \"imagen\": \"0151776270794.jpeg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 12\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/0151776270794.jpeg\", \"catalogo_id\": 8}, {\"id\": 16, \"codigo\": \"p13\", \"imagen\": \"1161776270794.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 13\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/1161776270794.jpg\", \"catalogo_id\": 8}, {\"id\": 17, \"codigo\": \"p14\", \"imagen\": \"2171776270794.webp\", \"moneda\": \"Bs.\", \"nombre\": \"prod 14\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/2171776270794.webp\", \"catalogo_id\": 8}, {\"id\": 18, \"codigo\": \"p15\", \"imagen\": \"3181776270794.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 15\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/3181776270794.jpg\", \"catalogo_id\": 8}, {\"id\": 19, \"codigo\": \"p16\", \"imagen\": \"4191776270794.jpg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 16\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/4191776270794.jpg\", \"catalogo_id\": 8}, {\"id\": 20, \"codigo\": \"p17\", \"imagen\": \"5201776270794.jpeg\", \"moneda\": \"Bs.\", \"nombre\": \"prod 17\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/5201776270794.jpeg\", \"catalogo_id\": 8}, {\"id\": 21, \"codigo\": \"p18\", \"imagen\": \"6211776270794.webp\", \"moneda\": \"Bs.\", \"nombre\": \"prod 18\", \"precio\": \"100.00\", \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T16:33:14.000000Z\", \"url_imagen\": \"http://cdae.test/imgs/productos/6211776270794.webp\", \"catalogo_id\": 8}], \"created_at\": \"2026-04-15T16:33:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-04-15T17:48:55.000000Z\"}', 'CATALOGOS', '2026-04-15', '13:48:55', '2026-04-15 17:48:55', '2026-04-15 17:48:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_01_31_165641_create_configuracions_table', 1),
(2, '2024_11_02_153317_create_users_table', 1),
(3, '2024_11_02_153318_create_historial_accions_table', 1),
(4, '2026_03_30_160029_create_pagina_catalogos_table', 1),
(5, '2026_03_30_160030_create_catalogos_table', 1),
(6, '2026_03_30_160031_create_productos_table', 1),
(7, '2026_03_30_160227_create_socials_table', 1),
(8, '2026_04_01_171321_create_pedidos_table', 1),
(9, '2026_04_01_171324_create_pedido_detalles_table', 1),
(10, '2026_04_01_182619_create_visitantes_table', 1),
(11, '2026_04_15_095348_create_producto_descripcions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina_catalogos`
--

CREATE TABLE `pagina_catalogos` (
  `id` bigint UNSIGNED NOT NULL,
  `pagina` int NOT NULL,
  `descripcion` int NOT NULL,
  `productos` int NOT NULL,
  `redes` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina_catalogos`
--

INSERT INTO `pagina_catalogos` (`id`, `pagina`, `descripcion`, `productos`, `redes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 5, 0, NULL, NULL, NULL),
(2, 2, 1, 4, 0, NULL, NULL, NULL),
(3, 3, 1, 3, 0, NULL, NULL, NULL),
(4, 4, 1, 7, 0, NULL, NULL, NULL),
(5, 5, 2, 5, 0, NULL, NULL, NULL),
(6, 6, 3, 3, 0, NULL, NULL, NULL),
(7, 7, 3, 1, 0, NULL, NULL, NULL),
(8, 8, 2, 7, 0, NULL, NULL, NULL),
(9, 9, 1, 9, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `ip_cliente` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `ip_cliente`, `pdf`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', NULL, '2026-04-15', '19:29:51', '2026-04-15 23:29:51', '2026-04-15 23:29:51'),
(2, '127.0.0.1', NULL, '2026-04-15', '19:29:57', '2026-04-15 23:29:57', '2026-04-15 23:29:57'),
(3, '127.0.0.1', NULL, '2026-04-15', '19:30:30', '2026-04-15 23:30:30', '2026-04-15 23:30:30'),
(4, '127.0.0.1', NULL, '2026-04-15', '19:31:39', '2026-04-15 23:31:39', '2026-04-15 23:31:39'),
(5, '127.0.0.1', NULL, '2026-04-15', '19:31:55', '2026-04-15 23:31:55', '2026-04-15 23:31:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalles`
--

CREATE TABLE `pedido_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `precio` decimal(24,2) NOT NULL DEFAULT '0.00',
  `cantidad` int NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido_detalles`
--

INSERT INTO `pedido_detalles` (`id`, `pedido_id`, `producto_id`, `precio`, `cantidad`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 20.00, 3, 60.00, '2026-04-15 23:31:55', '2026-04-15 23:31:55'),
(2, 5, 4, 90.00, 4, 360.00, '2026-04-15 23:31:55', '2026-04-15 23:31:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `catalogo_id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moneda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `catalogo_id`, `codigo`, `nombre`, `moneda`, `precio`, `imagen`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 4, 'p001', 'Producto 1', 'Bs.', 20.00, '031776269928.jpg', '2026-04-15 16:18:48', '2026-04-15 17:51:25', NULL),
(4, 4, 'p002', 'producto 2', 'Bs.', 90.00, '141776269928.jpg', '2026-04-15 16:18:48', '2026-04-15 16:18:48', NULL),
(5, 4, 'p003', 'producto 3', 'Bs.', 120.00, '251776269928.jpg', '2026-04-15 16:18:48', '2026-04-15 16:18:48', NULL),
(6, 4, 'p004', 'producto 4', 'Bs.', 190.00, '361776269928.jpg', '2026-04-15 16:18:48', '2026-04-15 16:18:48', NULL),
(8, 6, 'p005', 'producto 5', 'Bs.', 90.00, '081776270526.jpg', '2026-04-15 16:28:46', '2026-04-15 16:28:46', NULL),
(9, 6, 'p006', 'producto 6', 'Bs.', 120.00, '191776270526.jpg', '2026-04-15 16:28:46', '2026-04-15 16:28:46', NULL),
(10, 6, 'p007', 'producto 7', 'Bs.', 200.00, '2101776270526.jpeg', '2026-04-15 16:28:46', '2026-04-15 16:28:46', NULL),
(11, 6, 'p008', 'producto 8', 'Bs.', 70.00, '3111776270526.jpg', '2026-04-15 16:28:46', '2026-04-15 16:28:46', NULL),
(12, 7, 'p009', 'prod 9', 'Bs.', 100.00, '0121776270670.jpg', '2026-04-15 16:31:10', '2026-04-15 16:31:10', NULL),
(13, 7, 'p10', 'prod 10', 'Bs.', 100.00, '1131776270670.jpeg', '2026-04-15 16:31:10', '2026-04-15 16:31:10', NULL),
(14, 7, 'p11', 'prod 11', 'Bs.', 100.00, '2141776270670.jpg', '2026-04-15 16:31:10', '2026-04-15 16:31:10', NULL),
(15, 8, 'p12', 'prod 12', 'Bs.', 100.00, '0151776270794.jpeg', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(16, 8, 'p13', 'prod 13', 'Bs.', 100.00, '1161776270794.jpg', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(17, 8, 'p14', 'prod 14', 'Bs.', 100.00, '2171776270794.webp', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(18, 8, 'p15', 'prod 15', 'Bs.', 100.00, '3181776270794.jpg', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(19, 8, 'p16', 'prod 16', 'Bs.', 100.00, '4191776270794.jpg', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(20, 8, 'p17', 'prod 17', 'Bs.', 100.00, '5201776270794.jpeg', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(21, 8, 'p18', 'prod 18', 'Bs.', 100.00, '6211776270794.webp', '2026-04-15 16:33:14', '2026-04-15 16:33:14', NULL),
(22, 9, 'p19', 'prod 19', 'Bs.', 100.00, '0221776270876.jpg', '2026-04-15 16:34:36', '2026-04-15 16:34:36', NULL),
(23, 9, 'p20', 'prod 20', 'Bs.', 100.00, '1231776270876.webp', '2026-04-15 16:34:36', '2026-04-15 16:34:36', NULL),
(24, 9, 'p21', 'prod 21', 'Bs.', 100.00, '2241776270876.jpeg', '2026-04-15 16:34:36', '2026-04-15 16:34:36', NULL),
(25, 9, 'p22', 'prod 22', 'Bs.', 100.00, '3251776270876.jpeg', '2026-04-15 16:34:36', '2026-04-15 16:34:36', NULL),
(26, 9, 'p23', 'prod 23', 'Bs.', 100.00, '4261776270876.jpg', '2026-04-15 16:34:36', '2026-04-15 16:34:36', NULL),
(27, 10, 'p24', 'prod 24', 'Bs.', 100.00, '0271776270951.jpeg', '2026-04-15 16:35:51', '2026-04-15 16:35:51', NULL),
(28, 10, 'p25', 'prod 25', 'Bs.', 100.00, '1281776270951.jpeg', '2026-04-15 16:35:51', '2026-04-15 16:35:51', NULL),
(29, 10, 'p26', 'prod 26', 'Bs.', 100.00, '2291776270951.jpeg', '2026-04-15 16:35:51', '2026-04-15 16:35:51', NULL),
(30, 11, 'p27', 'prod 27', 'Bs.', 100.00, '0301776270987.jpg', '2026-04-15 16:36:27', '2026-04-15 16:36:27', NULL),
(31, 12, 'p28', 'prod 28', 'Bs.', 100.00, '0311776271063.webp', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(32, 12, 'p29', 'prod 29', 'Bs.', 100.00, '1321776271063.jpeg', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(33, 12, 'p30', 'prod 30', 'Bs.', 100.00, '2331776271063.jpg', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(34, 12, 'p31', 'prod 31', 'Bs.', 100.00, '3341776271063.jpg', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(35, 12, 'p32', 'prod 32', 'Bs.', 100.00, '4351776271063.jpg', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(36, 12, 'p33', 'prod 33', 'Bs.', 100.00, '5361776271063.jpg', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(37, 12, 'p34', 'prod 34', 'Bs.', 100.00, '6371776271063.webp', '2026-04-15 16:37:43', '2026-04-15 16:37:43', NULL),
(38, 13, 'p35', 'prod 36', 'Bs.', 100.00, '0381776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(39, 13, 'p36', 'prod 36', 'Bs.', 100.00, '1391776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(40, 13, 'p37', 'prod 37', 'Bs.', 100.00, '2401776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(41, 13, 'p38', 'prod 38', 'Bs.', 100.00, '3411776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(42, 13, 'p39', 'prod 39', 'Bs.', 100.00, '4421776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(43, 13, 'p40', 'prod 40', 'Bs.', 100.00, '5431776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(44, 13, 'p41', 'prod 41', 'Bs.', 100.00, '6441776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(45, 13, 'p42', 'prod 42', 'Bs.', 100.00, '7451776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(46, 13, 'p43', 'prod 43', 'Bs.', 100.00, '8461776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(47, 13, 'p44', 'prod 44', 'Bs.', 100.00, '9471776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(48, 13, 'p45', 'prod 45', 'Bs.', 100.00, '10481776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(49, 13, 'p46', 'prod 46', 'Bs.', 100.00, '11491776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(50, 13, 'p47', 'prod 47', 'Bs.', 100.00, '12501776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(51, 13, 'p48', 'prod 48', 'Bs.', 100.00, '13511776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(52, 13, 'p49', 'prod 49', 'Bs.', 100.00, '14521776271211.jpeg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(53, 13, 'p50', 'prod 50', 'Bs.', 100.00, '15531776271211.jpg', '2026-04-15 16:40:11', '2026-04-15 16:40:11', NULL),
(54, 4, 'P0006', 'PRODCUCTO CAT 1-6', 'Bs.', 100.00, '217735193781.jpeg', '2026-04-15 16:18:48', '2026-04-15 16:18:48', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_descripcions`
--

CREATE TABLE `producto_descripcions` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_descripcions`
--

INSERT INTO `producto_descripcions` (`id`, `producto_id`, `descripcion`, `created_at`, `updated_at`) VALUES
(2, 3, 'Descripcion producto 1', '2026-04-15 16:18:48', '2026-04-15 20:47:42'),
(3, 4, 'Descripcion del producto', '2026-04-15 16:18:48', '2026-04-15 20:47:28'),
(4, 5, 'desc3', '2026-04-15 16:18:48', '2026-04-15 21:15:21'),
(5, 6, 'Antes Bs. 210', '2026-04-15 16:18:48', '2026-04-15 16:18:48'),
(6, 8, 'Descripcion producto', '2026-04-15 16:28:46', '2026-04-15 16:28:46'),
(7, 9, 'desc 2', '2026-04-15 16:28:46', '2026-04-15 21:15:33'),
(8, 10, 'desc3', '2026-04-15 16:28:46', '2026-04-15 21:15:33'),
(9, 11, 'Descripcion del prdesoducto 4', '2026-04-15 16:28:46', '2026-04-15 21:15:33'),
(10, 12, 'Descripcion prod 9', '2026-04-15 16:31:10', '2026-04-15 17:44:17'),
(11, 13, 'desc 2', '2026-04-15 16:31:10', '2026-04-15 21:15:41'),
(12, 14, 'desc 3', '2026-04-15 16:31:10', '2026-04-15 21:15:41'),
(13, 15, 'desc 1', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(14, 16, 'desc 2', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(15, 17, 'desc 3', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(16, 18, 'desc 4', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(17, 19, 'desc 5', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(18, 20, 'desc 6', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(19, 21, 'desc 7', '2026-04-15 16:33:14', '2026-04-15 21:16:01'),
(20, 22, 'desc 1-5', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(21, 22, 'desc -12', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(22, 23, 'desc 21', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(23, 23, 'desc 22', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(24, 24, 'desc31', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(25, 24, 'desc 32', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(26, 25, 'desc 41', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(27, 25, 'desc 42', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(28, 26, 'desc 51', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(29, 26, 'desc 52', '2026-04-15 16:34:36', '2026-04-15 21:16:34'),
(30, 27, 'Descripcion 1', '2026-04-15 16:35:51', '2026-04-15 16:35:51'),
(31, 27, 'desc 12', '2026-04-15 16:35:51', '2026-04-15 21:16:55'),
(32, 27, 'desc 13', '2026-04-15 16:35:51', '2026-04-15 21:16:55'),
(33, 28, 'Descripcion del producto', '2026-04-15 16:35:51', '2026-04-15 16:35:51'),
(34, 28, 'Descripcion 2 del producto', '2026-04-15 16:35:51', '2026-04-15 16:35:51'),
(35, 28, 'desc 23', '2026-04-15 16:35:51', '2026-04-15 21:16:55'),
(36, 29, 'desc 31', '2026-04-15 16:35:51', '2026-04-15 21:16:55'),
(37, 29, 'desc 32', '2026-04-15 16:35:51', '2026-04-15 21:16:55'),
(38, 29, 'desc 33', '2026-04-15 16:35:51', '2026-04-15 21:16:55'),
(39, 30, 'desc 11', '2026-04-15 16:36:27', '2026-04-15 21:18:43'),
(40, 30, 'desc 12', '2026-04-15 16:36:27', '2026-04-15 21:18:43'),
(41, 30, 'desc 13', '2026-04-15 16:36:27', '2026-04-15 21:18:43'),
(42, 31, 'desc 11', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(43, 31, 'desc 12', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(44, 32, 'desc 21', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(45, 32, 'desc 22', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(46, 33, 'desc 31', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(47, 33, 'desc 32', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(48, 34, 'desc 41', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(49, 34, 'desc 42', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(50, 35, 'desc 51', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(51, 35, 'desc 52', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(52, 36, 'desc 61', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(53, 36, 'desc 62', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(54, 37, 'desc 71', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(55, 37, 'desc 72', '2026-04-15 16:37:43', '2026-04-15 21:17:24'),
(56, 38, 'desc 11', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(57, 38, 'desc 21', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(58, 39, 'desc 231', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(59, 39, 'desc 22', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(60, 40, 'desc 31', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(61, 40, 'desc 32', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(62, 41, 'desc 41', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(63, 41, 'des c42', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(64, 42, 'desc 51', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(65, 42, 'desc 52', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(66, 43, 'desc 61', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(67, 43, 'desc 62', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(68, 44, 'desc 71', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(69, 44, 'desc 72', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(70, 45, 'desc 81', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(71, 46, 'desc 91', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(72, 47, 'desc 101', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(73, 48, 'desc 111', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(74, 49, 'desc 121', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(75, 50, 'desc 131', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(76, 51, 'desc 141', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(77, 52, 'desc 151', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(78, 53, 'desc 161', '2026-04-15 16:40:11', '2026-04-15 21:18:28'),
(79, 54, 'Desc prod 5', '2026-04-15 16:18:48', '2026-04-15 18:24:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socials`
--

CREATE TABLE `socials` (
  `id` bigint UNSIGNED NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socials`
--

INSERT INTO `socials` (`id`, `dir`, `whatsapp`, `facebook`, `tiktok`, `instagram`, `youtube`, `x`, `web`, `correo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Los Pedregales', '+59173594451', 'https://facebook.com', 'https://tiktok.com', 'https://instagram.com', 'https://youtube.com', 'https://x.com', 'www.google.com', 'correo@gmail.com', '2026-03-31 21:21:51', '2026-04-01 21:36:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceso` int NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `correo`, `fono`, `password`, `acceso`, `tipo`, `foto`, `fecha_registro`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, NULL, '', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 'ADMINISTRADOR', NULL, '2026-03-31', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitantes`
--

CREATE TABLE `visitantes` (
  `id` bigint UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `visitantes`
--

INSERT INTO `visitantes` (`id`, `ip`, `user_agent`, `browser`, `platform`, `device`, `url`, `referer`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test', NULL, '2026-04-15 17:51:36', '2026-04-15 17:51:36'),
(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test', 'http://cdae.test/', '2026-04-15 18:00:57', '2026-04-15 18:00:57'),
(3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test', 'http://cdae.test/', '2026-04-15 18:06:00', '2026-04-15 18:06:00'),
(4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=1', 'http://cdae.test/?page=1', '2026-04-15 18:15:26', '2026-04-15 18:15:26'),
(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=1', 'http://cdae.test/?page=1', '2026-04-15 18:28:34', '2026-04-15 18:28:34'),
(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 18:36:03', '2026-04-15 18:36:03'),
(7, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', 'Safari', 'iOS', 'Mobile', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 18:49:39', '2026-04-15 18:49:39'),
(8, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', 'Safari', 'iOS', 'Mobile', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 18:55:03', '2026-04-15 18:55:03'),
(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:08:00', '2026-04-15 19:08:00'),
(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:17:11', '2026-04-15 19:17:11'),
(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:17:11', '2026-04-15 19:17:11'),
(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:17:11', '2026-04-15 19:17:11'),
(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=1', 'http://cdae.test/?page=2', '2026-04-15 19:25:08', '2026-04-15 19:25:08'),
(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:31:35', '2026-04-15 19:31:35'),
(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:37:23', '2026-04-15 19:37:23'),
(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=1', '2026-04-15 19:42:38', '2026-04-15 19:42:38'),
(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=2', '2026-04-15 19:51:16', '2026-04-15 19:51:16'),
(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=3', '2026-04-15 20:01:18', '2026-04-15 20:01:18'),
(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=2', '2026-04-15 20:06:38', '2026-04-15 20:06:38'),
(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=3', 'http://cdae.test/?page=2', '2026-04-15 20:13:10', '2026-04-15 20:13:10'),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=2', '2026-04-15 20:18:35', '2026-04-15 20:18:35'),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=3', '2026-04-15 20:34:05', '2026-04-15 20:34:05'),
(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=2', 'http://cdae.test/?page=3', '2026-04-15 20:39:30', '2026-04-15 20:39:30'),
(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=1', 'http://cdae.test/?page=2', '2026-04-15 20:46:20', '2026-04-15 20:46:20'),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=3', 'http://cdae.test/?page=2', '2026-04-15 20:53:54', '2026-04-15 20:53:54'),
(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=3', 'http://cdae.test/?page=4', '2026-04-15 21:04:04', '2026-04-15 21:04:04'),
(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=4', 'http://cdae.test/?page=5', '2026-04-15 21:10:08', '2026-04-15 21:10:08'),
(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=4', 'http://cdae.test/?page=5', '2026-04-15 21:19:40', '2026-04-15 21:19:40'),
(29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=6', 'http://cdae.test/?page=5', '2026-04-15 21:37:35', '2026-04-15 21:37:35'),
(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=7', 'http://cdae.test/?page=6', '2026-04-15 21:48:33', '2026-04-15 21:48:33'),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=7', 'http://cdae.test/?page=6', '2026-04-15 21:56:36', '2026-04-15 21:56:36'),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=8', 'http://cdae.test/?page=7', '2026-04-15 22:01:51', '2026-04-15 22:01:51'),
(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=7', 'http://cdae.test/?page=8', '2026-04-15 22:07:35', '2026-04-15 22:07:35'),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=9', 'http://cdae.test/?page=9', '2026-04-15 22:13:43', '2026-04-15 22:13:43'),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'http://cdae.test/?page=7', 'http://cdae.test/?page=6', '2026-04-15 22:18:43', '2026-04-15 22:18:43'),
(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test/?page=1', NULL, '2026-04-15 22:26:27', '2026-04-15 22:26:27'),
(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test/?page=1', 'https://cdae.test/?page=1', '2026-04-15 22:31:52', '2026-04-15 22:31:52'),
(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test/?page=1', 'https://cdae.test/?page=1', '2026-04-15 22:37:53', '2026-04-15 22:37:53'),
(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test/?page=1', NULL, '2026-04-15 22:42:56', '2026-04-15 22:42:56'),
(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test/productos/verProducto/3', NULL, '2026-04-15 22:49:42', '2026-04-15 22:49:42'),
(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test', 'https://cdae.test/', '2026-04-15 22:55:01', '2026-04-15 22:55:01'),
(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test', 'https://cdae.test/', '2026-04-15 23:02:54', '2026-04-15 23:02:54'),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test', 'https://cdae.test/', '2026-04-15 23:10:34', '2026-04-15 23:10:34'),
(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test', 'https://cdae.test/productos/miCatalogo', '2026-04-15 23:17:38', '2026-04-15 23:17:38'),
(45, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test', 'https://cdae.test/', '2026-04-15 23:24:48', '2026-04-15 23:24:48'),
(46, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Chrome', 'Windows', 'Desktop', 'https://cdae.test', 'https://cdae.test/productos/miCatalogo', '2026-04-15 23:32:40', '2026-04-15 23:32:40');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagina_catalogos`
--
ALTER TABLE `pagina_catalogos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_detalles_pedido_id_foreign` (`pedido_id`),
  ADD KEY `pedido_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productos_codigo_unique` (`codigo`),
  ADD KEY `productos_catalogo_id_foreign` (`catalogo_id`);

--
-- Indices de la tabla `producto_descripcions`
--
ALTER TABLE `producto_descripcions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_descripcions_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitantes`
--
ALTER TABLE `visitantes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pagina_catalogos`
--
ALTER TABLE `pagina_catalogos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `producto_descripcions`
--
ALTER TABLE `producto_descripcions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `visitantes`
--
ALTER TABLE `visitantes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD CONSTRAINT `pedido_detalles_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_catalogo_id_foreign` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogos` (`id`);

--
-- Filtros para la tabla `producto_descripcions`
--
ALTER TABLE `producto_descripcions`
  ADD CONSTRAINT `producto_descripcions_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
