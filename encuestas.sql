-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-10-2021 a las 23:28:30
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `encuestas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_alumnos`
--

CREATE TABLE `t_alumnos` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_alumnos`
--

INSERT INTO `t_alumnos` (`id`, `nombre_usuario`, `nombre`, `apellidos`) VALUES
(76, 'docente.prueba', 'DOCENTE PRUEBA', 'PRUEBA'),
(77, 'alumno.prueba23', 'ALUMNO 1', 'PRUEBA'),
(78, 'alumno.prueba', 'alumno de prueba', 'seuat'),
(79, 'jose.santiz', 'José', 'Santíz Ruíz'),
(81, 'alumno.demo', 'ALUMNO DEMO', 'ALUMNO DEMO'),
(82, 'alumno.demo2', 'alumno', 'demo'),
(83, 'alumno.jose', 'jsosjo', 'jsojos'),
(84, 'alausjs', 'ksdjkosok', 'jsijis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_categorias_preguntas`
--

CREATE TABLE `t_categorias_preguntas` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_categorias_preguntas`
--

INSERT INTO `t_categorias_preguntas` (`id`, `nombre_categoria`) VALUES
(1, 'IDENTIDAD INSTITUCIONAL'),
(2, 'DOCENCIA'),
(3, 'PROFESIONAL'),
(4, 'PERSONAL'),
(5, 'TUTORÍAS'),
(6, 'PAPEL DEL INSTRUCTOR'),
(7, 'MATERIAL DE APOYO DOCUMENTAL(BIBLIOGRAFIA)'),
(8, 'MATERIAL DE APOYO DIGITAL'),
(9, 'ASPECTOS SOBRE EL CURSO IMPARTIDO'),
(10, 'EVALUACION MODELO EDUACTIVO'),
(11, 'COMO CONSIDERA'),
(12, 'TU OPINION NOS INTERESA'),
(13, 'COMENTARIOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_categoria_persona`
--

CREATE TABLE `t_categoria_persona` (
  `id` int(11) NOT NULL,
  `nombre_categoria_persona` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_categoria_persona`
--

INSERT INTO `t_categoria_persona` (`id`, `nombre_categoria_persona`) VALUES
(1, 'Prospecto'),
(2, 'Alumno'),
(3, 'Docente'),
(4, 'Egresado'),
(5, 'Administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_curso`
--

CREATE TABLE `t_curso` (
  `id` int(11) NOT NULL,
  `id_ponente` int(11) DEFAULT NULL,
  `nombre_curso` varchar(100) DEFAULT NULL,
  `sede` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_curso`
--

INSERT INTO `t_curso` (`id`, `id_ponente`, `nombre_curso`, `sede`) VALUES
(1, 1, 'DIDACTICA DE LA LECTURA COMPRENSIVA', 'CAMPECHE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_docente`
--

CREATE TABLE `t_docente` (
  `id` int(11) NOT NULL,
  `id_usuario_plataforma` int(11) DEFAULT NULL,
  `usuario_docente` varchar(100) DEFAULT NULL,
  `nombre_docente` varchar(100) DEFAULT NULL,
  `apellidos_docente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_docente`
--

INSERT INTO `t_docente` (`id`, `id_usuario_plataforma`, `usuario_docente`, `nombre_docente`, `apellidos_docente`) VALUES
(129, 228, 'docente.virtual', 'JOSE', 'SANTIZ RUIZ'),
(130, 909, 'docente.prueba', 'DOCENTE PRUEBA', 'PRUEBA'),
(131, 246, 'jesus.jimenez', 'JESUS ALEJANDRO', 'JIMENEZ MORALES'),
(132, 811, 'lubeydi.lopez', 'LUBEYDI', 'LOPEZ RAMIREZ'),
(133, 31, 'javier.hidalgo', 'JAVIER HIDALGO', 'RAMIREZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_encuesta`
--

CREATE TABLE `t_encuesta` (
  `id` int(11) NOT NULL,
  `nombre_encuesta` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_categoria_persona` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_encuesta`
--

INSERT INTO `t_encuesta` (`id`, `nombre_encuesta`, `descripcion`, `id_categoria_persona`, `id_periodo`, `estatus`) VALUES
(1, 'AUTOEVALUACION', 'DETECCIÓN DE NECESIDADES DE CAPACITACIÓN', 3, 2, 0),
(2, 'HETEROEVALUACION', 'EVALUACIÓN DEL DESEMPEÑO DOCENTE', 2, 2, 0),
(5, 'HETEROEVALUACION CURSO', 'DESEMPEÑO DEL CURSO DE CAPACITACION', 3, 2, 0),
(6, 'EVALUACIÓN MODELO EDUCATIVO', 'EVALUACIÓN MODELO EDUCATIVO', 3, 2, 0),
(7, 'HETEROEVALUACION', 'EVALUACION DEL DESEMPEÑO DEL PROGRAMA', 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_materias`
--

CREATE TABLE `t_materias` (
  `id` int(11) NOT NULL,
  `id_curso_plataforma` varchar(100) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `plataforma` varchar(50) DEFAULT NULL,
  `nombre_materia` varchar(200) DEFAULT NULL,
  `nombre_carrera` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_materias`
--

INSERT INTO `t_materias` (`id`, `id_curso_plataforma`, `id_docente`, `plataforma`, `nombre_materia`, `nombre_carrera`) VALUES
(672, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(673, '813', 131, 'tuxtla.sm', 'FUNDAMENTOS DE FÍSICA', 'Licenciatura en T.S.U. en Imagenología'),
(674, '831', 132, 'tuxtla.sm', 'MANEJO DE APARATOS ELECTROMEDICOS', 'Licenciatura en Enfermería'),
(675, '850', 129, 'tuxtla.sm', 'QUIMICA I', 'Semestrales'),
(676, '851', 129, 'tuxtla.sm', 'MATEMATICAS I', 'Semestrales'),
(677, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(678, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(679, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(680, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(681, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(682, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(683, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(684, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(685, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(686, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(687, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(688, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(689, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(690, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(691, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(692, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(693, '5', NULL, 'prepaabierta', 'prueba', NULL),
(694, '5', NULL, 'prepaabierta', 'prueba', NULL),
(695, '5', NULL, 'prepaabierta', 'prueba', NULL),
(696, '5', NULL, 'prepaabierta', 'prueba', NULL),
(697, '5', NULL, 'prepaabierta', 'prueba', NULL),
(698, '5', NULL, 'prepaabierta', 'prueba', NULL),
(699, '5', NULL, 'prepaabierta', 'prueba', NULL),
(700, '5', NULL, 'prepaabierta', 'prueba', NULL),
(701, '5', NULL, 'prepaabierta', 'prueba', NULL),
(702, '5', NULL, 'prepaabierta', 'prueba', NULL),
(703, '5', NULL, 'prepaabierta', 'prueba', NULL),
(704, '5', NULL, 'prepaabierta', 'prueba', NULL),
(705, '5', 133, 'prepaabierta', 'prueba', NULL),
(706, '5', 133, 'prepaabierta', 'prueba', NULL),
(707, '6', 133, 'prepaabierta', 'MÓDULO 2. El lenguaje en la relación del hombre con el mundo', 'Preparatoria abierta con diplomado - Tuxtla'),
(708, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(709, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_opciones_respuestas`
--

CREATE TABLE `t_opciones_respuestas` (
  `id` int(11) NOT NULL,
  `nombre_respuesta` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `identificador_numerico` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_opciones_respuestas`
--

INSERT INTO `t_opciones_respuestas` (`id`, `nombre_respuesta`, `identificador_numerico`, `puntuacion`) VALUES
(1, 'S', 0, 3),
(2, 'CS', 1, 2),
(3, 'AV', 2, 1),
(4, 'N', 3, 0),
(5, 'PR', 4, 1),
(6, 'AL', 5, 1),
(7, 'ME', 6, 1),
(8, 'BA', 7, 1),
(9, 'NM', 8, 1),
(10, 'EX', 9, 4),
(11, 'MB', 10, 3),
(12, 'AC', 11, 2),
(13, 'NM1', 12, 1),
(14, 'SI', 13, 1),
(15, 'NO', 14, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_opciones_respuestas_hetero_ev_des_prog`
--

CREATE TABLE `t_opciones_respuestas_hetero_ev_des_prog` (
  `id` int(11) NOT NULL,
  `identificador` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_respuesta` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `puntos` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `nombre_inciso` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_opciones_respuestas_hetero_ev_des_prog`
--

INSERT INTO `t_opciones_respuestas_hetero_ev_des_prog` (`id`, `identificador`, `nombre_respuesta`, `puntos`, `id_pregunta`, `nombre_inciso`) VALUES
(1, 'EX', 'Excelente', '4', 1, 'a'),
(2, 'MB', 'Muy Bien', '3', 1, 'b'),
(3, 'AC', 'Aceptable', '2', 1, 'c'),
(4, 'NM', 'Necesita Mejorar', '1', 1, 'd'),
(5, 'EX', 'Excelente', '4', 2, 'a'),
(6, 'MB', 'Muy Bien', '3', 2, 'b'),
(7, 'AC', 'Aceptable', '2', 2, 'c'),
(8, 'NM', 'Necesita Mejorar', '1', 2, 'd'),
(9, 'EX', 'Excelente', '4', 3, 'a'),
(10, 'MB', 'Muy Bien', '3', 3, 'b'),
(11, 'AC', 'Aceptable', '2', 3, 'c'),
(12, 'NM', 'Necesita Mejorar', '1', 3, 'd'),
(13, 'EX', 'Excelente', '4', 4, 'a'),
(14, 'MB', 'Muy Bien', '3', 4, 'b'),
(15, 'AC', 'Aceptable', '2', 4, 'c'),
(16, 'NM', 'Necesita Mejorar', '1', 4, 'd'),
(17, 'EX', 'Excelente', '4', 5, 'a'),
(18, 'MB', 'Muy Bien', '3', 5, 'b'),
(19, 'AC', 'Aceptable', '2', 5, 'c'),
(20, 'NM', 'Necesita Mejorar', '1', 5, 'd'),
(21, 'EX', 'Excelente', '4', 6, 'a'),
(22, 'MB', 'Muy Bien', '3', 6, 'b'),
(23, 'AC', 'Aceptable', '2', 6, 'c'),
(24, 'NM', 'Necesita Mejorar', '1', 6, 'd'),
(25, 'EX', 'Excelente', '4', 7, 'a'),
(26, 'MB', 'Muy Bien', '3', 7, 'b'),
(27, 'AC', 'Aceptable', '2', 7, 'c'),
(28, 'NM', 'Necesita Mejorar', '1', 7, 'd'),
(29, 'a)', 'Garantiza una fuente de empleo			', '1', 8, 'a'),
(30, 'b)', 'Favorece el desarrollo personal			', '1', 8, 'b'),
(31, 'c)', 'Tengo talento o habilidades			', '1', 8, 'c'),
(32, 'd)', 'Su reconocimiento Social			', '1', 8, 'd'),
(33, 'e)', 'Asegura buenos ingresos			', '1', 8, 'e'),
(34, 'f)', 'Tradición familiar			', '1', 8, 'f'),
(35, 'g)', 'Contribuir con el desarrollo de mi país			', '1', 8, 'g'),
(36, 'h)', 'Es novedosa			', '1', 8, 'h'),
(37, 'i)', 'Corresponde a mis gustos e intereses			', '1', 8, 'i'),
(38, 'Si', 'Si', '1', 9, 'a'),
(39, 'No', 'No', '0', 9, 'b'),
(40, 'a)', 'Redes sociales (Facebook, twitter, youtube, etc)			', '1', 10, 'a'),
(41, 'b)', 'Portal (SEUAT)			', '1', 10, 'b'),
(42, 'c)', 'Radio			', '1', 10, 'c'),
(43, 'd)', 'Espectaculares			', '1', 10, 'd'),
(44, 'e)', 'Prensa			', '1', 10, 'e'),
(45, 'f)', 'Ferias y Exposiciones			', '1', 10, 'f'),
(46, 'g)', 'Otros			', '1', 10, 'g'),
(47, 'Si', 'Si', '1', 11, 'a'),
(48, 'No', 'No', '0', 11, 'b'),
(49, 'Si', 'Si', '1', 12, 'a'),
(50, 'No', 'No', '0', 12, 'b'),
(51, 'Si', 'Si', '1', 13, 'a'),
(52, 'No', 'No', '0', 13, 'b'),
(53, 'abierta', 'opinion', '1', 14, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_opciones_respuestas_opcion_multiple`
--

CREATE TABLE `t_opciones_respuestas_opcion_multiple` (
  `id` int(11) NOT NULL,
  `nombre_inciso` varchar(100) DEFAULT NULL,
  `nombre_respuesta` varchar(500) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_opciones_respuestas_opcion_multiple`
--

INSERT INTO `t_opciones_respuestas_opcion_multiple` (`id`, `nombre_inciso`, `nombre_respuesta`, `puntuacion`, `id_pregunta`) VALUES
(83, 'a', 'Una elección inteligente', 0, 209),
(84, 'b', 'Una Educación humanista por competencias y desarrollo social', 0, 209),
(85, 'c', 'Una educación humanista con enfoque en competencias de sentido social', 1, 209),
(86, 'a', 'Mundial, Nacional y Estatal', 0, 210),
(87, 'b', 'Internacional, Nacional y Regional', 1, 210),
(88, 'c', 'Nacional, Estatal y Municipal', 0, 210),
(89, 'a', 'Art. 3° y art. 5° Constitucional, Reforma educativa 2019 y DOF', 0, 211),
(90, 'b', 'Plan de desarrollo Nacional y estatal 2019 – 2024 y art. 5° Constitucional.', 0, 211),
(91, 'c', 'Art. 3° Constitucional, Reforma educativa 2019 y Plan de desarrollo Nacional y estatal 2019 – 2024.', 1, 211),
(92, 'a', 'Epistemológico, filosófico y social.', 0, 212),
(93, 'b', 'Filosófico, pedagógico y social.', 1, 212),
(94, 'c', 'Pedagógico, epistemológico y filosófico.', 0, 212),
(95, 'a', 'La filosofía humanista', 1, 213),
(96, 'b', 'Pedagogía constructivista', 0, 213),
(97, 'c', 'Un sentido social', 0, 213),
(98, 'a', 'Conductista', 0, 214),
(99, 'b', 'Tradicional', 0, 214),
(100, 'c', 'Constructivista', 1, 214),
(101, 'a', 'Creación de ambientes de aprendizajes, un docente facilitador y motivador.', 1, 215),
(102, 'b', 'Estructuras mentales, apoyo creativo y docencia magistral.', 0, 215),
(103, 'c', 'Estructuras metales, experiencias y autoridad.', 0, 215),
(104, 'a', 'Saber: conocer, hacer, convivir y ser.', 1, 216),
(105, 'b', 'Saber: conocer, saber, querer y sentir', 0, 216),
(106, 'c', 'Saber: sentir, convivir, hacer y conocer', 0, 216),
(107, 'a', 'La filosofía humanista', 0, 217),
(108, 'b', 'Pedagogía constructivista', 0, 217),
(109, 'c', 'Un sentido social.', 1, 217),
(110, 'a', 'Formar profesionales con sentido de una educación integral humanista, basada en el enfoque de desarrollo de competencias del Siglo XXI y responsabilidad social, a fin de que construyan propuestas y alternativas de solución a problemas sociales, políticos, culturales y económicos del estado, de la región y del país.', 1, 218),
(111, 'a', 'Ser un Sistema Educativo reconocido  nacional e internacionalmente por la calidad de sus programas de formación , la consolidación de su Modelo Educativo Institucional respecto de los componentes de equidad de género, sustentabilidad, interculturalidad, inclusión social y desarrollo de la Investigación', 0, 219),
(112, 'a', 'Autonomía, Templanza, Honestidad, Respeto, Inclusión y Disciplina', 1, 220),
(113, 'b', 'Autonomía, Templanza, Cooperación, Dignidad, Paz y Tolerancia.', 0, 220),
(114, 'c', 'Amor, Justicia, Respeto, Libertad, Inclusión y Amistad.', 0, 220),
(115, 'a', 'Inclusión social, igualdad, sostenibilidad y profesional.', 0, 221),
(116, 'b', 'Inclusión social, Interculturalidad, sustentabilidad y equidad de género.', 1, 221),
(117, 'c', 'Inclusión social, cultural, económico y emprendimiento', 0, 221),
(118, 'a', 'Seminario de tesis', 0, 222),
(119, 'b', 'Programas de apoyo al estudiante.', 1, 222),
(120, 'c', 'Proyecto integrados', 0, 222),
(121, 'a', 'Seminario de tesis', 0, 223),
(122, 'b', 'Programas de apoyo al estudiante.', 0, 223),
(123, 'c', 'Proyecto integrador', 1, 223),
(124, 'b', 'Formar profesionales con sentido de una educación integral y social , basada en el enfoque de desarrollo de competencias del Siglo XXI y responsabilidad social, a fin de que construyan propuestas y alternativas de solución a problemas religiosos, culturales y económicos del estado.', 0, 218),
(125, 'c', 'Formar profesionales con sentido de una educación integral humanista, basada en el enfoque de desarrollo de competencias del Siglo XXI y responsabilidad social, a fin de que construyan propuestas y alternativas de solución a problemas políticos, culturales y económicos del país.\r\n', 0, 218),
(126, 'b', 'Ser un Sistema Educativo reconocido regional, nacional e internacionalmente por la calidad de sus programas de formación y servicios, la consolidación de su Modelo Educativo Institucional respecto de los componentes de equidad de género, sustentabilidad, interculturalidad, inclusión social y desarrollo de la Investigación Científica.', 1, 219),
(127, 'c', 'Ser un Sistema Educativo reconocido regional, nacional por la calidad de sus programas de formación y servicios, la consolidación de su Modelo Educativo Institucional respecto de los componentes de equidad de género, inclusión social y desarrollo de la Investigación Científica.', 0, 219);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_periodo`
--

CREATE TABLE `t_periodo` (
  `id` int(11) NOT NULL,
  `nombre_periodo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_periodo`
--

INSERT INTO `t_periodo` (`id`, `nombre_periodo`) VALUES
(1, 'ENERO-ABRIL 2021'),
(2, 'SEPTIEMBRE-DICIEMBRE 2021'),
(3, 'ENERO-JUNIO 2021'),
(4, 'JULIO-DICIEMBRE 2021'),
(5, 'MAYO-AGOSTO 2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_ponente`
--

CREATE TABLE `t_ponente` (
  `id` int(11) NOT NULL,
  `nombre_ponente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_ponente`
--

INSERT INTO `t_ponente` (`id`, `nombre_ponente`) VALUES
(1, 'JORGE ELIESER GOMEZ LOPEZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_preguntas`
--

CREATE TABLE `t_preguntas` (
  `id` int(11) NOT NULL,
  `nombre_pregunta` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_subcategoria` int(11) DEFAULT NULL,
  `id_opciones_respuestas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_preguntas`
--

INSERT INTO `t_preguntas` (`id`, `nombre_pregunta`, `id_encuesta`, `id_subcategoria`, `id_opciones_respuestas`) VALUES
(2, '¿El docente te dió a conocer los objetivos de la institución? ', 2, 2, NULL),
(3, '¿El docente te dio a conocer la misión, visión y valores de la institución?', 2, 2, NULL),
(4, '¿El docente te informa de los servicios que presta la Universidad?', 2, 2, NULL),
(5, '¿El docente se expresa correctamente de la Univeridad?', 2, 2, NULL),
(6, '¿El docente realizó la presentación de la asigatura al inicio del curso?', 2, 3, NULL),
(7, '¿El docente presentó y proporcionó copia  al inicio del curso de  la secuencia didáctica?', 2, 3, NULL),
(8, '¿El docente explicó claramente los criterios de evaluación de la asignatura? ', 2, 3, NULL),
(9, '¿El docente expresó los objetivos y la importancia de su asigantura en la carrera profesional?', 2, 3, NULL),
(10, '¿El docente concluyó satisfactoriamente el curso?', 2, 3, NULL),
(11, '¿El docente asistió puntualmente a sus clases?', 2, 5, NULL),
(12, '¿El docente aprovechó el tiempo de clases para desarrollar los contenidos del programa?', 2, 5, NULL),
(13, '¿El docente respetó la programación de los examenes parciales?', 2, 5, NULL),
(14, '¿El docente te ha brindado asesorías extra-clases o has observado que ha asesorado a alguno de tus compañeros?', 2, 5, NULL),
(15, '¿El docente fue puntual en la entrega de las evaulaciones', 2, 5, NULL),
(16, '¿El docente se comunica de forma clara y fácil de entender?', 2, 6, NULL),
(17, '¿El docente se muestra abierto al diálogo?', 2, 6, NULL),
(18, '¿El docente te estímula a que participes durante la clase?', 2, 6, NULL),
(19, '¿El docente estímula la interacción entre los estudiantes para el aprendizaje y desarrollo de los temas?', 2, 6, NULL),
(20, '¿El docente fomenta un ambiente de confianza, respeto mutuo y buen trato con y entre los estudiantes?', 2, 6, NULL),
(21, '¿El docente organiza actividades y/o tareas en equipo para el aprendizaje de los temas?', 2, 6, NULL),
(22, '¿El docente logra mantener tu atención durante la clase con las actividades realizadas?', 2, 9, NULL),
(23, '¿El docente despierta tu interés y motivación por aprender?', 2, 9, NULL),
(24, '¿El docente solicita que investiguen o lean previamente a la clase sobre la temática a desarrollar? ', 2, 9, NULL),
(25, '¿El docente les pide que elaboren mapas mentales o conceptuales, cuadros sinópticos, comparativos u otra forma de organizar la información? ', 2, 9, NULL),
(26, '¿El docente establece relación entre la teoría y la práctica?', 2, 9, NULL),
(27, '¿El docente solicita tareas que impliquen tu acercamiento a la práctica?', 2, 9, NULL),
(28, '¿El docente utiliza las tecnologias de la información(Internet, Caño, Software, paquetería, etc)?.', 2, 11, NULL),
(29, 'Muestra dominio al utilizar las tecnologias de la información en su clase?', 2, 11, NULL),
(30, '¿El docente solicita tareas que requieran el uso de internet y otras tecnologías?', 2, 11, NULL),
(31, '¿El docente realizó evaluación diagnostica al inicio del curso?', 2, 13, NULL),
(32, '¿El docente realizón evaluaciones en diferentes momentos del curso?', 2, 13, NULL),
(33, '¿El docente utilizó diferentes instrumentos para la evaluación de los trabajos, exposiciones y investigaciones (rúbricas, Listas de cotejo, Reportes de prácticas?', 2, 13, NULL),
(34, '¿El docente domina los temas de la asignatura?', 2, 15, NULL),
(35, '¿El docente está actualizado en los temas de la asignatura?', 2, 15, NULL),
(36, '¿El docente aclara dudas sobre los temas de la clase?', 2, 15, NULL),
(37, '¿El docente demuestra vocación profesional a su disciplina?', 2, 15, NULL),
(38, '¿El docente acerca al estudiante al conocimiento de la disciplina a través de situaciones concretas o ejemplos?', 2, 15, NULL),
(39, '¿El docente demuestra compromiso con el desarrollo del aprendizaje de los estudiantes?', 2, 16, NULL),
(40, '¿El docente logra un trato equitativo y respetuoso en su relación con los estudiantes?', 2, 16, NULL),
(41, '¿El docente inició y terminó puntualmente su clase?', 2, 16, NULL),
(42, '¿El docente demuestra amor a lo que hace?', 2, 16, NULL),
(43, '¿El docente demuestra equilibrio emocional?', 2, 16, NULL),
(44, '¿El docente cumplió con las horas asignadas de tus  tutorias?', 2, 17, NULL),
(45, '¿El docente realizó actividades ', 2, 17, NULL),
(46, '¿El docente desarrolló e instrumentó estrategias de aprendizaje y técnicas de estudio para favorecer el aprendizaje significativo de los estudiantes.', 2, 17, NULL),
(47, 'El docente Involucró a los estudiantes en actividades para desarrollar su sentido de responsabilidad individual y colectiva, de autoestima, autocontrol y sociabilidad.', 2, 17, NULL),
(48, '¿El docente Impulsó la participación en actividades artísticas y culturales como complemento de su formación integral.', 2, 17, NULL),
(49, 'El docente realizó actividades para el desarrolló de la creatividad, toma de decisiones y solución de problemas', 2, 17, NULL),
(50, 'El docente brindó apoyar para la preparación del exámenes y trabajos.', 2, 17, NULL),
(51, 'Promoción de la filosofía institucional.', 1, 2, NULL),
(52, 'Conocimiento del módelo educativo de la Universidad.', 1, 2, NULL),
(53, 'Fomento y difundo los rasgos de la cultura instiucional.', 1, 2, NULL),
(54, 'Asumno la realización de acciones para la transformación del contexto, la investigación y las actividades académicas', 1, 2, NULL),
(55, 'Desarrollo y aplicación de las estrategías de enseñanza aprendizaje', 1, 22, NULL),
(56, 'Empleo de la TIC`s en los procesos de enseñanza y aprendizaje', 1, 22, NULL),
(57, 'Fomento del uso de la plataforma educativa seuatvirtual para facilitar el aprendizaje', 1, 22, NULL),
(58, 'Empleo de la secuencia didática para el desarrollo de la asignatura', 1, 22, NULL),
(59, 'Evaluó con evidencias y criterios de desempeño las competencias', 1, 22, NULL),
(60, 'Desarrollo y apliación de las competencias en el aula', 1, 22, NULL),
(61, 'Desarrollo y aplicación de estrategias para la motivación en el aula', 1, 22, NULL),
(62, 'Detección de los estilos de aprendizaje que existen en el aula', 1, 22, NULL),
(63, 'Diseño de la secuencia didáctica para facilitar la experiencia del aprendizaje en el aula', 1, 22, NULL),
(64, 'Fomento de habilidades para un aprendizaje autónomo', 1, 22, NULL),
(65, 'Desarrollo y aplicación de técnicas para el aprendizaje en el aula', 1, 22, NULL),
(66, 'Desarrollo u aplicación del material audiovisual para el aprendizaje en el aula', 1, 22, NULL),
(67, 'Empleo de una comunicación asertiva en el aula', 1, 22, NULL),
(68, 'Generación de ambientes de aprendizaje', 1, 22, NULL),
(69, 'Desarrolla y aplica estrategias de evaluación adecuadas para un aprendizaje significativo', 1, 22, NULL),
(70, 'Fomenta el trabajo colaborativo en el aula', 1, 22, NULL),
(71, 'Desarrollo de metodología y técnicas específicas en la construcción de los aprendizajes', 1, 22, NULL),
(72, 'Fortalecer el aprendizaje del estudiante mejorando continuamente sus prácticas, métodos y estrategias implementados en el aula', 1, 22, NULL),
(73, 'Formación de habilidades de investigación en el aula', 1, 22, NULL),
(74, 'Diseño y evaluación de planes de estudio', 1, 22, NULL),
(75, 'Diseño y evaluación de programas de estudio', 1, 22, NULL),
(76, 'Diseño de propuestas académicas', 1, 22, NULL),
(77, 'Empleo de la planeación estratégica en la administración de la Institución', 1, 22, NULL),
(78, 'Propicia relaciones con los diferentes sectores para fortalecer la formación de los estudiantes', 1, 22, NULL),
(79, 'Fomenta y dirige el uso de las nuevas tecnologías como complemento del aprendizaje en el aula', 1, 22, NULL),
(80, 'Orienta la investigación de sus estudiantes hacia proyectos de investigación que satisfagan necesidades reales de los diferentes sectores económicos y sociales', 1, 22, NULL),
(81, 'Detección de problemas educativos para su investigación', 1, 22, NULL),
(82, 'Elaboración de proyectos de investigación educativa', 1, 22, NULL),
(83, 'Conocimiento y desarrollo de técnicas para la difusión de los resultados de una investigación; Publicaciones, congresos, simposios, foros, etc.', 1, 22, NULL),
(84, 'Participación en asociaciones académicas especializadas', 1, 22, NULL),
(85, 'Se mantiene actualizado en las tendencias y avances de su disciplina y área de especialidad', 1, 15, NULL),
(86, 'Promoción de la cultura y los valores nacionales', 1, 15, NULL),
(87, 'Emprende continuamente acciones que lo mantiene actualizado tanto disciplinar como pedagógicamente, con la intención de mejorar su práctia docente', 1, 15, NULL),
(88, 'Desarrollo y aplicación de las técnicas disciplinares en el aula', 1, 15, NULL),
(89, 'Motivación al compartir conocimientos en el aula.', 1, 16, NULL),
(90, 'Concentración al desarrollo del labor docente', 1, 16, NULL),
(91, 'Logro de objetivos y metas propuestos', 1, 16, NULL),
(92, 'Estado emocional actualente', 1, 16, NULL),
(93, 'Estado de salud actualmente', 1, 16, NULL),
(94, 'Detección de las necesidades para las tutorias', 1, 17, NULL),
(95, 'Solución de problemas de los tutorados', 1, 17, NULL),
(96, 'Conocimiento del programa institucional de tutorias', 1, 17, NULL),
(97, 'Diseño y aplicación del plan de acción de tutorias', 1, 17, NULL),
(98, 'Desarrollo y aplicación de estrategias para las tutorías', 1, 17, NULL),
(99, 'Informa al inicio del curso sobre el aprendizaje esperado, el tiempo de trabajo y la evidencia final', 5, 18, NULL),
(100, 'Expresa los conceptos claramente y con pertinencia', 5, 18, NULL),
(101, 'Apoya sus explicaciones en estadisticas o ejemplos', 5, 18, NULL),
(102, 'Vincula sus argumentos a la idea principal', 5, 18, NULL),
(103, 'Enfoca la sesion en el tema objeto de estudio', 5, 18, NULL),
(104, 'Facilita la participacion y reflexion de los asistentes', 5, 18, NULL),
(105, 'Responde con precision a preguntas sobre el tema', 5, 18, NULL),
(106, 'Favorece el trabajo colaborativo y en equipo', 5, 18, NULL),
(107, 'Fomenta la resolucion de problemas', 5, 18, NULL),
(108, 'Mantiene la atencion del grupo', 5, 18, NULL),
(109, 'Utiliza todo el tiempo disponible', 5, 18, NULL),
(110, 'Desarrolla los temas de acuerdo a la agenda', 5, 18, NULL),
(111, 'Utiliza recursos tecnologicos para apoyar su participacion', 5, 18, NULL),
(112, 'Favorece el desarrollo de competencias', 5, 19, NULL),
(113, 'Son pertinentes al tema y se basan en fuentes confiables', 5, 19, NULL),
(114, 'Se estructura de acuerdo al enfoque de competencias', 5, 19, NULL),
(115, 'Presenta estructura sencilla, clara y uniforme', 5, 19, NULL),
(116, 'Apoya en la comprension del tema', 5, 20, NULL),
(117, 'Incluye texto, imagen, audio, videos, son multisensorailes', 5, 20, NULL),
(118, 'Permite la manipulacion directa en situaciones de simulacion o experimentacion, son interactivos', 5, 20, NULL),
(119, 'Admite su uso en locales que no cuentan con conexion a', 5, 20, NULL),
(120, 'Internet, son portables', 5, 20, NULL),
(121, 'Es accesible desde cualquier sistema de software y equipo', 5, 20, NULL),
(122, 'Mantiene pertinencia entre el contenido y su nombre', 5, 21, NULL),
(123, 'Se organiza e imparte en una secuencia logica', 5, 21, NULL),
(124, 'Es teorico y practico', 5, 21, NULL),
(125, 'Tiene aplicacion en tu practica docente', 5, 21, NULL),
(126, 'Es adecuado el tiempo de trabajo para alcanzar el aprendizaje esperado', 5, 21, NULL),
(127, 'Se organiza oportunamente y en tiempo con la agenda', 5, 21, NULL),
(128, 'Cuenta con el apoyo humano, material y de equipo requerido', 5, 21, NULL),
(129, 'Evaluacion general del curso', 5, 21, NULL),
(209, '¿Cuál es la filosofía del modelo educativo SEUAT?', 6, 25, NULL),
(210, '¿Cuáles son los tres contextos estadísticos que toma como marco referencial el Modelo Educativo SEUAT?', 6, 25, NULL),
(211, 'Son el fundamento legal del Modelo Educativo:', 6, 25, NULL),
(212, '¿Cuáles son los fundamentos epistemológicos del Modelo Educativo SEUAT?', 6, 25, NULL),
(213, 'Nuestro sistema se centra en educar e instrumentar los procesos de convivencia en el surgimiento y desarrollo del SENTIDO COMÚN de su personal académico, administrativo y estudiantes … son tendencias de:', 6, 25, NULL),
(214, 'Pedagogía que adopta SEUAT para su modelo educativo:', 6, 25, NULL),
(215, 'Son componentes de una pedagogía constructivista:', 6, 25, NULL),
(216, '¿Cuáles son los cuatro pilares de la educación por competencias?', 6, 25, NULL),
(217, 'En este proceso formativo es consigna actuante de los programas educativos y atmósfera envolvente entorno a la dignidad e igualdad de las personas, la solidaridad y la estima del bien común, el respeto a los demás y la participación colectiva; son indicios de:', 6, 25, NULL),
(218, ' Escribe la Misión del SEUAT según el Modelo educativo:', 6, 25, NULL),
(219, 'Escribe la Visión del SEUAT según el Modelo Educativo:', 6, 25, NULL),
(220, 'Son valores que se deben de ejercer en SEUAT según el Modelo Educativo:', 6, 25, NULL),
(221, 'Son ejes de la formación profesional del estudiante desde la perspectiva del modelo educativo.', 6, 25, NULL),
(222, 'Está diseñado para la atención del estudiante en el trayecto de toda su formación profesional, vista de diferentes perspectivas como son formación integral, movilidad de estudiante, asesoría académica, tutorías, etc.', 6, 25, NULL),
(223, 'Es una herramienta formativa diseñada en tres sentidos, didáctica, epistémica y metodológica. Desde la didáctica, establece las condiciones para aprender a aprender a investigar. Desde la herramienta epistémica, el mismo proceso didáctico genera conocimiento de la realidad. A su vez, se traduce en una herramienta metodológica en la medida que el estudiante construye un método acompañado de técnicas de investigación…', 6, 25, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_preguntas_hetero_ev_des_prog`
--

CREATE TABLE `t_preguntas_hetero_ev_des_prog` (
  `id` int(11) NOT NULL,
  `nombre_pregunta` varchar(500) DEFAULT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_subcategoria` int(11) DEFAULT NULL,
  `tipo_opcion_respuesta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_preguntas_hetero_ev_des_prog`
--

INSERT INTO `t_preguntas_hetero_ev_des_prog` (`id`, `nombre_pregunta`, `id_encuesta`, `id_subcategoria`, `tipo_opcion_respuesta`) VALUES
(1, '¿Como considera la información proporcionada durante la inducción a la universidad?	', 7, 26, 'multiple'),
(2, '¿Como considera la cantidad y calidad de la información proporcionada durante la inducción?	', 7, 26, 'multiple'),
(3, '¿Como considera las actividades que se llevaron a cabo en la inducción a la universidad?	', 7, 26, 'multiple'),
(4, '¿Como considera las dinámicas realizadas en las actividades de inducción a la univerisdad?', 7, 26, 'multiple'),
(5, '¿Como considera la utilidad de la información porporcionada en la inducción a la universidad?', 7, 26, 'multiple'),
(6, '¿Como considera el apoyo brindado por el personal encargado de la inducción a la universidad?	', 7, 26, 'multiple'),
(7, '¿Como considera el dominio de los temas del personal encargado de la inducción? ', 7, 26, 'multiple'),
(8, 'Señale las razones más importantes por las que eligio su carrera: <b>(marca sólo tres)</b>			', 7, 27, 'multiple'),
(9, '¿Habia visto o escuchado antes algún anuncio de la Universidad  SEUAT?			', 7, 27, 'multiple'),
(10, '¿Por qué medio se enteró de la universidad?			', 7, 27, 'multiple'),
(11, '¿El medio por el cuál se enteró lo motivó a acercarse a la Universidad  SEUAT?			', 7, 27, 'multiple'),
(12, '¿La información presentada en los medios le fue de utilidad?			', 7, 27, 'multiple'),
(13, '¿La información proporcionada durante el curso de inducción le fue de utilidad?			', 7, 27, 'multiple'),
(14, 'Nos importa lo que piensa, comparta sus comentarios', 7, 28, 'abierta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_respuestas`
--

CREATE TABLE `t_respuestas` (
  `id` int(11) NOT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_opcion_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `tiempo_dedicado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_respuestas`
--

INSERT INTO `t_respuestas` (`id`, `id_encuesta`, `id_pregunta`, `id_materia`, `id_docente`, `id_alumno`, `id_opcion_respuesta`, `estatus`, `tiempo_dedicado`) VALUES
(1785, 2, 2, 673, 131, 77, 1, 1, 100),
(1786, 2, 3, 673, 131, 77, 2, 1, 100),
(1787, 2, 4, 673, 131, 77, 1, 1, 100),
(1788, 2, 5, 673, 131, 77, 1, 1, 100),
(1789, 2, 6, 673, 131, 77, 2, 1, 100),
(1790, 2, 7, 673, 131, 77, 1, 1, 100),
(1791, 2, 8, 673, 131, 77, 4, 1, 100),
(1792, 2, 9, 673, 131, 77, 2, 1, 100),
(1793, 2, 10, 673, 131, 77, 1, 1, 100),
(1794, 2, 11, 673, 131, 77, 2, 1, 100),
(1795, 2, 12, 673, 131, 77, 1, 1, 100),
(1796, 2, 13, 673, 131, 77, 4, 1, 100),
(1797, 2, 14, 673, 131, 77, 2, 1, 100),
(1798, 2, 15, 673, 131, 77, 3, 1, 100),
(1799, 2, 16, 673, 131, 77, 1, 1, 100),
(1800, 2, 17, 673, 131, 77, 2, 1, 100),
(1801, 2, 18, 673, 131, 77, 1, 1, 100),
(1802, 2, 19, 673, 131, 77, 2, 1, 100),
(1803, 2, 20, 673, 131, 77, 3, 1, 100),
(1804, 2, 21, 673, 131, 77, 1, 1, 100),
(1805, 2, 22, 673, 131, 77, 1, 1, 100),
(1806, 2, 23, 673, 131, 77, 3, 1, 100),
(1807, 2, 24, 673, 131, 77, 1, 1, 100),
(1808, 2, 25, 673, 131, 77, 4, 1, 100),
(1809, 2, 26, 673, 131, 77, 2, 1, 100),
(1810, 2, 27, 673, 131, 77, 1, 1, 100),
(1811, 2, 28, 673, 131, 77, 2, 1, 100),
(1812, 2, 29, 673, 131, 77, 1, 1, 100),
(1813, 2, 30, 673, 131, 77, 2, 1, 100),
(1814, 2, 31, 673, 131, 77, 3, 1, 100),
(1815, 2, 32, 673, 131, 77, 1, 1, 100),
(1816, 2, 33, 673, 131, 77, 1, 1, 100),
(1817, 2, 34, 673, 131, 77, 3, 1, 100),
(1818, 2, 35, 673, 131, 77, 2, 1, 100),
(1819, 2, 36, 673, 131, 77, 3, 1, 100),
(1820, 2, 37, 673, 131, 77, 2, 1, 100),
(1821, 2, 38, 673, 131, 77, 1, 1, 100),
(1822, 2, 39, 673, 131, 77, 2, 1, 100),
(1823, 2, 40, 673, 131, 77, 3, 1, 100),
(1824, 2, 41, 673, 131, 77, 2, 1, 100),
(1825, 2, 42, 673, 131, 77, 2, 1, 100),
(1826, 2, 43, 673, 131, 77, 2, 1, 100),
(1827, 2, 44, 673, 131, 77, 1, 1, 100),
(1828, 2, 45, 673, 131, 77, 3, 1, 100),
(1829, 2, 46, 673, 131, 77, 2, 1, 100),
(1830, 2, 47, 673, 131, 77, 1, 1, 100),
(1831, 2, 48, 673, 131, 77, 3, 1, 100),
(1832, 2, 49, 673, 131, 77, 2, 1, 100),
(1833, 2, 50, 673, 131, 77, 3, 1, 100),
(1834, 2, 2, 693, NULL, 78, 1, 1, 100),
(1835, 2, 3, 693, NULL, 78, 2, 1, 100),
(1836, 2, 4, 693, NULL, 78, 2, 1, 100),
(1837, 2, 5, 693, NULL, 78, 2, 1, 100),
(1838, 2, 6, 693, NULL, 78, 2, 1, 100),
(1839, 2, 7, 693, NULL, 78, 3, 1, 100),
(1840, 2, 8, 693, NULL, 78, 2, 1, 100),
(1841, 2, 9, 693, NULL, 78, 4, 1, 100),
(1842, 2, 10, 693, NULL, 78, 2, 1, 100),
(1843, 2, 11, 693, NULL, 78, 1, 1, 100),
(1844, 2, 12, 693, NULL, 78, 2, 1, 100),
(1845, 2, 13, 693, NULL, 78, 3, 1, 100),
(1846, 2, 14, 693, NULL, 78, 2, 1, 100),
(1847, 2, 15, 693, NULL, 78, 1, 1, 100),
(1848, 2, 16, 693, NULL, 78, 4, 1, 100),
(1849, 2, 17, 693, NULL, 78, 2, 1, 100),
(1850, 2, 18, 693, NULL, 78, 3, 1, 100),
(1851, 2, 19, 693, NULL, 78, 1, 1, 100),
(1852, 2, 20, 693, NULL, 78, 3, 1, 100),
(1853, 2, 21, 693, NULL, 78, 2, 1, 100),
(1854, 2, 22, 693, NULL, 78, 4, 1, 100),
(1855, 2, 23, 693, NULL, 78, 1, 1, 100),
(1856, 2, 24, 693, NULL, 78, 2, 1, 100),
(1857, 2, 25, 693, NULL, 78, 3, 1, 100),
(1858, 2, 26, 693, NULL, 78, 2, 1, 100),
(1859, 2, 27, 693, NULL, 78, 1, 1, 100),
(1860, 2, 28, 693, NULL, 78, 3, 1, 100),
(1861, 2, 29, 693, NULL, 78, 4, 1, 100),
(1862, 2, 30, 693, NULL, 78, 1, 1, 100),
(1863, 2, 31, 693, NULL, 78, 3, 1, 100),
(1864, 2, 32, 693, NULL, 78, 2, 1, 100),
(1865, 2, 33, 693, NULL, 78, 1, 1, 100),
(1866, 2, 34, 693, NULL, 78, 3, 1, 100),
(1867, 2, 35, 693, NULL, 78, 1, 1, 100),
(1868, 2, 36, 693, NULL, 78, 3, 1, 100),
(1869, 2, 37, 693, NULL, 78, 2, 1, 100),
(1870, 2, 38, 693, NULL, 78, 4, 1, 100),
(1871, 2, 39, 693, NULL, 78, 1, 1, 100),
(1872, 2, 40, 693, NULL, 78, 3, 1, 100),
(1873, 2, 41, 693, NULL, 78, 2, 1, 100),
(1874, 2, 42, 693, NULL, 78, 3, 1, 100),
(1875, 2, 43, 693, NULL, 78, 4, 1, 100),
(1876, 2, 44, 693, NULL, 78, 1, 1, 100),
(1877, 2, 45, 693, NULL, 78, 3, 1, 100),
(1878, 2, 46, 693, NULL, 78, 2, 1, 100),
(1879, 2, 47, 693, NULL, 78, 1, 1, 100),
(1880, 2, 48, 693, NULL, 78, 3, 1, 100),
(1881, 2, 49, 693, NULL, 78, 2, 1, 100),
(1882, 2, 50, 693, NULL, 78, 4, 1, 100),
(1883, 2, 2, 693, NULL, 78, 2, 1, 100),
(1884, 2, 3, 693, NULL, 78, 2, 1, 100),
(1885, 2, 4, 693, NULL, 78, 1, 1, 100),
(1886, 2, 5, 693, NULL, 78, 2, 1, 100),
(1887, 2, 6, 693, NULL, 78, 1, 1, 100),
(1888, 2, 7, 693, NULL, 78, 2, 1, 100),
(1889, 2, 8, 693, NULL, 78, 1, 1, 100),
(1890, 2, 9, 693, NULL, 78, 3, 1, 100),
(1891, 2, 10, 693, NULL, 78, 3, 1, 100),
(1892, 2, 11, 693, NULL, 78, 1, 1, 100),
(1893, 2, 12, 693, NULL, 78, 1, 1, 100),
(1894, 2, 13, 693, NULL, 78, 2, 1, 100),
(1895, 2, 14, 693, NULL, 78, 2, 1, 100),
(1896, 2, 15, 693, NULL, 78, 3, 1, 100),
(1897, 2, 16, 693, NULL, 78, 4, 1, 100),
(1898, 2, 17, 693, NULL, 78, 2, 1, 100),
(1899, 2, 18, 693, NULL, 78, 1, 1, 100),
(1900, 2, 19, 693, NULL, 78, 2, 1, 100),
(1901, 2, 20, 693, NULL, 78, 2, 1, 100),
(1902, 2, 21, 693, NULL, 78, 3, 1, 100),
(1903, 2, 22, 693, NULL, 78, 4, 1, 100),
(1904, 2, 23, 693, NULL, 78, 1, 1, 100),
(1905, 2, 24, 693, NULL, 78, 1, 1, 100),
(1906, 2, 25, 693, NULL, 78, 2, 1, 100),
(1907, 2, 26, 693, NULL, 78, 3, 1, 100),
(1908, 2, 27, 693, NULL, 78, 1, 1, 100),
(1909, 2, 28, 693, NULL, 78, 2, 1, 100),
(1910, 2, 29, 693, NULL, 78, 3, 1, 100),
(1911, 2, 30, 693, NULL, 78, 2, 1, 100),
(1912, 2, 31, 693, NULL, 78, 1, 1, 100),
(1913, 2, 32, 693, NULL, 78, 3, 1, 100),
(1914, 2, 33, 693, NULL, 78, 2, 1, 100),
(1915, 2, 34, 693, NULL, 78, 3, 1, 100),
(1916, 2, 35, 693, NULL, 78, 1, 1, 100),
(1917, 2, 36, 693, NULL, 78, 3, 1, 100),
(1918, 2, 37, 693, NULL, 78, 2, 1, 100),
(1919, 2, 38, 693, NULL, 78, 1, 1, 100),
(1920, 2, 39, 693, NULL, 78, 4, 1, 100),
(1921, 2, 40, 693, NULL, 78, 3, 1, 100),
(1922, 2, 41, 693, NULL, 78, 2, 1, 100),
(1923, 2, 42, 693, NULL, 78, 1, 1, 100),
(1924, 2, 43, 693, NULL, 78, 3, 1, 100),
(1925, 2, 44, 693, NULL, 78, 2, 1, 100),
(1926, 2, 45, 693, NULL, 78, 2, 1, 100),
(1927, 2, 46, 693, NULL, 78, 4, 1, 100),
(1928, 2, 47, 693, NULL, 78, 1, 1, 100),
(1929, 2, 48, 693, NULL, 78, 3, 1, 100),
(1930, 2, 49, 693, NULL, 78, 2, 1, 100),
(1931, 2, 50, 693, NULL, 78, 4, 1, 100),
(1932, 2, 2, 707, 133, 78, 1, 1, 100),
(1933, 2, 3, 707, 133, 78, 1, 1, 100),
(1934, 2, 4, 707, 133, 78, 2, 1, 100),
(1935, 2, 5, 707, 133, 78, 2, 1, 100),
(1936, 2, 6, 707, 133, 78, 2, 1, 100),
(1937, 2, 7, 707, 133, 78, 2, 1, 100),
(1938, 2, 8, 707, 133, 78, 3, 1, 100),
(1939, 2, 9, 707, 133, 78, 2, 1, 100),
(1940, 2, 10, 707, 133, 78, 2, 1, 100),
(1941, 2, 11, 707, 133, 78, 4, 1, 100),
(1942, 2, 12, 707, 133, 78, 1, 1, 100),
(1943, 2, 13, 707, 133, 78, 3, 1, 100),
(1944, 2, 14, 707, 133, 78, 2, 1, 100),
(1945, 2, 15, 707, 133, 78, 4, 1, 100),
(1946, 2, 16, 707, 133, 78, 1, 1, 100),
(1947, 2, 17, 707, 133, 78, 3, 1, 100),
(1948, 2, 18, 707, 133, 78, 2, 1, 100),
(1949, 2, 19, 707, 133, 78, 4, 1, 100),
(1950, 2, 20, 707, 133, 78, 2, 1, 100),
(1951, 2, 21, 707, 133, 78, 2, 1, 100),
(1952, 2, 22, 707, 133, 78, 3, 1, 100),
(1953, 2, 23, 707, 133, 78, 2, 1, 100),
(1954, 2, 24, 707, 133, 78, 1, 1, 100),
(1955, 2, 25, 707, 133, 78, 4, 1, 100),
(1956, 2, 26, 707, 133, 78, 2, 1, 100),
(1957, 2, 27, 707, 133, 78, 1, 1, 100),
(1958, 2, 28, 707, 133, 78, 3, 1, 100),
(1959, 2, 29, 707, 133, 78, 1, 1, 100),
(1960, 2, 30, 707, 133, 78, 2, 1, 100),
(1961, 2, 31, 707, 133, 78, 4, 1, 100),
(1962, 2, 32, 707, 133, 78, 3, 1, 100),
(1963, 2, 33, 707, 133, 78, 2, 1, 100),
(1964, 2, 34, 707, 133, 78, 4, 1, 100),
(1965, 2, 35, 707, 133, 78, 3, 1, 100),
(1966, 2, 36, 707, 133, 78, 2, 1, 100),
(1967, 2, 37, 707, 133, 78, 1, 1, 100),
(1968, 2, 38, 707, 133, 78, 3, 1, 100),
(1969, 2, 39, 707, 133, 78, 2, 1, 100),
(1970, 2, 40, 707, 133, 78, 4, 1, 100),
(1971, 2, 41, 707, 133, 78, 2, 1, 100),
(1972, 2, 42, 707, 133, 78, 1, 1, 100),
(1973, 2, 43, 707, 133, 78, 3, 1, 100),
(1974, 2, 44, 707, 133, 78, 4, 1, 100),
(1975, 2, 45, 707, 133, 78, 2, 1, 100),
(1976, 2, 46, 707, 133, 78, 1, 1, 100),
(1977, 2, 47, 707, 133, 78, 2, 1, 100),
(1978, 2, 48, 707, 133, 78, 4, 1, 100),
(1979, 2, 49, 707, 133, 78, 3, 1, 100),
(1980, 2, 50, 707, 133, 78, 3, 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_respuestas_autoevaluacion_docente`
--

CREATE TABLE `t_respuestas_autoevaluacion_docente` (
  `id` int(11) NOT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_respuestas_autoevaluacion_docente`
--

INSERT INTO `t_respuestas_autoevaluacion_docente` (`id`, `id_encuesta`, `id_pregunta`, `id_docente`, `id_respuesta`, `estatus`, `duracion`) VALUES
(225, 1, 51, 129, 5, 1, 100),
(226, 1, 52, 129, 7, 1, 100),
(227, 1, 53, 129, 7, 1, 100),
(228, 1, 54, 129, 7, 1, 100),
(229, 1, 55, 129, 6, 1, 100),
(230, 1, 56, 129, 8, 1, 100),
(231, 1, 57, 129, 9, 1, 100),
(232, 1, 58, 129, 8, 1, 100),
(233, 1, 59, 129, 9, 1, 100),
(234, 1, 60, 129, 6, 1, 100),
(235, 1, 61, 129, 8, 1, 100),
(236, 1, 62, 129, 5, 1, 100),
(237, 1, 63, 129, 7, 1, 100),
(238, 1, 64, 129, 7, 1, 100),
(239, 1, 65, 129, 6, 1, 100),
(240, 1, 66, 129, 7, 1, 100),
(241, 1, 67, 129, 8, 1, 100),
(242, 1, 68, 129, 6, 1, 100),
(243, 1, 69, 129, 7, 1, 100),
(244, 1, 70, 129, 9, 1, 100),
(245, 1, 71, 129, 6, 1, 100),
(246, 1, 72, 129, 7, 1, 100),
(247, 1, 73, 129, 8, 1, 100),
(248, 1, 74, 129, 7, 1, 100),
(249, 1, 75, 129, 5, 1, 100),
(250, 1, 76, 129, 8, 1, 100),
(251, 1, 77, 129, 8, 1, 100),
(252, 1, 78, 129, 7, 1, 100),
(253, 1, 79, 129, 7, 1, 100),
(254, 1, 80, 129, 8, 1, 100),
(255, 1, 81, 129, 7, 1, 100),
(256, 1, 82, 129, 7, 1, 100),
(257, 1, 83, 129, 8, 1, 100),
(258, 1, 84, 129, 7, 1, 100),
(259, 1, 85, 129, 7, 1, 100),
(260, 1, 86, 129, 8, 1, 100),
(261, 1, 87, 129, 5, 1, 100),
(262, 1, 88, 129, 8, 1, 100),
(263, 1, 89, 129, 7, 1, 100),
(264, 1, 90, 129, 6, 1, 100),
(265, 1, 91, 129, 5, 1, 100),
(266, 1, 92, 129, 7, 1, 100),
(267, 1, 93, 129, 6, 1, 100),
(268, 1, 94, 129, 6, 1, 100),
(269, 1, 95, 129, 6, 1, 100),
(270, 1, 96, 129, 6, 1, 100),
(271, 1, 97, 129, 6, 1, 100),
(272, 1, 98, 129, 6, 1, 100),
(273, 1, 51, 130, 7, 1, 100),
(274, 1, 52, 130, 6, 1, 100),
(275, 1, 53, 130, 5, 1, 100),
(276, 1, 54, 130, 7, 1, 100),
(277, 1, 55, 130, 8, 1, 100),
(278, 1, 56, 130, 6, 1, 100),
(279, 1, 57, 130, 5, 1, 100),
(280, 1, 58, 130, 7, 1, 100),
(281, 1, 59, 130, 6, 1, 100),
(282, 1, 60, 130, 5, 1, 100),
(283, 1, 61, 130, 7, 1, 100),
(284, 1, 62, 130, 6, 1, 100),
(285, 1, 63, 130, 5, 1, 100),
(286, 1, 64, 130, 8, 1, 100),
(287, 1, 65, 130, 9, 1, 100),
(288, 1, 66, 130, 5, 1, 100),
(289, 1, 67, 130, 6, 1, 100),
(290, 1, 68, 130, 8, 1, 100),
(291, 1, 69, 130, 5, 1, 100),
(292, 1, 70, 130, 5, 1, 100),
(293, 1, 71, 130, 8, 1, 100),
(294, 1, 72, 130, 7, 1, 100),
(295, 1, 73, 130, 6, 1, 100),
(296, 1, 74, 130, 9, 1, 100),
(297, 1, 75, 130, 5, 1, 100),
(298, 1, 76, 130, 6, 1, 100),
(299, 1, 77, 130, 7, 1, 100),
(300, 1, 78, 130, 7, 1, 100),
(301, 1, 79, 130, 9, 1, 100),
(302, 1, 80, 130, 5, 1, 100),
(303, 1, 81, 130, 8, 1, 100),
(304, 1, 82, 130, 7, 1, 100),
(305, 1, 83, 130, 6, 1, 100),
(306, 1, 84, 130, 8, 1, 100),
(307, 1, 85, 130, 5, 1, 100),
(308, 1, 86, 130, 9, 1, 100),
(309, 1, 87, 130, 6, 1, 100),
(310, 1, 88, 130, 8, 1, 100),
(311, 1, 89, 130, 6, 1, 100),
(312, 1, 90, 130, 5, 1, 100),
(313, 1, 91, 130, 7, 1, 100),
(314, 1, 92, 130, 8, 1, 100),
(315, 1, 93, 130, 9, 1, 100),
(316, 1, 94, 130, 6, 1, 100),
(317, 1, 95, 130, 8, 1, 100),
(318, 1, 96, 130, 5, 1, 100),
(319, 1, 97, 130, 6, 1, 100),
(320, 1, 98, 130, 9, 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_respuestas_evaluacion_modelo_educativo`
--

CREATE TABLE `t_respuestas_evaluacion_modelo_educativo` (
  `id` int(11) NOT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_opcion_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `tiempo_dedicado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_respuestas_evaluacion_modelo_educativo`
--

INSERT INTO `t_respuestas_evaluacion_modelo_educativo` (`id`, `id_encuesta`, `id_pregunta`, `id_docente`, `id_opcion_respuesta`, `estatus`, `tiempo_dedicado`) VALUES
(122, 6, 209, 129, 83, 1, 100),
(123, 6, 210, 129, 87, 1, 100),
(124, 6, 211, 129, 89, 1, 100),
(125, 6, 212, 129, 93, 1, 100),
(126, 6, 213, 129, 96, 1, 100),
(127, 6, 214, 129, 100, 1, 100),
(128, 6, 215, 129, 102, 1, 100),
(129, 6, 216, 129, 104, 1, 100),
(130, 6, 217, 129, 108, 1, 100),
(131, 6, 218, 129, 124, 1, 100),
(132, 6, 219, 129, 127, 1, 100),
(133, 6, 220, 129, 113, 1, 100),
(134, 6, 221, 129, 115, 1, 100),
(135, 6, 222, 129, 119, 1, 100),
(136, 6, 223, 129, 122, 1, 100),
(152, 6, 209, 130, 84, 1, 100),
(153, 6, 210, 130, 87, 1, 100),
(154, 6, 211, 130, 89, 1, 100),
(155, 6, 212, 130, 94, 1, 100),
(156, 6, 213, 130, 96, 1, 100),
(157, 6, 214, 130, 98, 1, 100),
(158, 6, 215, 130, 103, 1, 100),
(159, 6, 216, 130, 105, 1, 100),
(160, 6, 217, 130, 107, 1, 100),
(161, 6, 218, 130, 125, 1, 100),
(162, 6, 219, 130, 126, 1, 100),
(163, 6, 220, 130, 113, 1, 100),
(164, 6, 221, 130, 115, 1, 100),
(165, 6, 222, 130, 119, 1, 100),
(166, 6, 223, 130, 121, 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_respuestas_heteroevaluacion_docente`
--

CREATE TABLE `t_respuestas_heteroevaluacion_docente` (
  `id` int(11) NOT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_respuestas_hetero_ev_des_prog`
--

CREATE TABLE `t_respuestas_hetero_ev_des_prog` (
  `id` int(11) NOT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `opcion_respuesta` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `plataforma` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_respuestas_hetero_ev_des_prog`
--

INSERT INTO `t_respuestas_hetero_ev_des_prog` (`id`, `id_encuesta`, `id_pregunta`, `id_alumno`, `opcion_respuesta`, `plataforma`) VALUES
(437, 7, 1, 77, 'c', 'tuxtla.sm'),
(438, 7, 2, 77, 'a', 'tuxtla.sm'),
(439, 7, 3, 77, 'a', 'tuxtla.sm'),
(440, 7, 4, 77, 'a', 'tuxtla.sm'),
(441, 7, 5, 77, 'b', 'tuxtla.sm'),
(442, 7, 6, 77, 'd', 'tuxtla.sm'),
(443, 7, 7, 77, 'd', 'tuxtla.sm'),
(444, 7, 8, 77, 'c', 'tuxtla.sm'),
(445, 7, 8, 77, 'f', 'tuxtla.sm'),
(446, 7, 8, 77, 'a', 'tuxtla.sm'),
(447, 7, 9, 77, 'a', 'tuxtla.sm'),
(448, 7, 10, 77, 'c', 'tuxtla.sm'),
(449, 7, 11, 77, 'a', 'tuxtla.sm'),
(450, 7, 12, 77, 'a', 'tuxtla.sm'),
(451, 7, 13, 77, 'b', 'tuxtla.sm'),
(452, 7, 14, 77, 'mi opinion', 'tuxtla.sm'),
(453, 7, 1, 79, 'a', 'tuxtla.sm'),
(454, 7, 2, 79, 'a', 'tuxtla.sm'),
(455, 7, 3, 79, 'a', 'tuxtla.sm'),
(456, 7, 4, 79, 'a', 'tuxtla.sm'),
(457, 7, 5, 79, 'a', 'tuxtla.sm'),
(458, 7, 6, 79, 'a', 'tuxtla.sm'),
(459, 7, 7, 79, 'a', 'tuxtla.sm'),
(460, 7, 8, 79, 'a', 'tuxtla.sm'),
(461, 7, 8, 79, 'b', 'tuxtla.sm'),
(462, 7, 8, 79, 'c', 'tuxtla.sm'),
(463, 7, 9, 79, 'a', 'tuxtla.sm'),
(464, 7, 10, 79, 'a', 'tuxtla.sm'),
(465, 7, 11, 79, 'a', 'tuxtla.sm'),
(466, 7, 12, 79, 'a', 'tuxtla.sm'),
(467, 7, 13, 79, 'a', 'tuxtla.sm'),
(468, 7, 14, 79, 'no se que decir', 'tuxtla.sm'),
(469, 7, 1, 81, 'b', 'tuxtla.ct'),
(470, 7, 2, 81, 'c', 'tuxtla.ct'),
(471, 7, 3, 81, 'd', 'tuxtla.ct'),
(472, 7, 4, 81, 'd', 'tuxtla.ct'),
(473, 7, 5, 81, 'd', 'tuxtla.ct'),
(474, 7, 6, 81, 'd', 'tuxtla.ct'),
(475, 7, 7, 81, 'd', 'tuxtla.ct'),
(476, 7, 8, 81, 'i', 'tuxtla.ct'),
(477, 7, 8, 81, 'e', 'tuxtla.ct'),
(478, 7, 8, 81, 'h', 'tuxtla.ct'),
(479, 7, 9, 81, 'b', 'tuxtla.ct'),
(480, 7, 10, 81, 'd', 'tuxtla.ct'),
(481, 7, 11, 81, 'b', 'tuxtla.ct'),
(482, 7, 12, 81, 'b', 'tuxtla.ct'),
(483, 7, 13, 81, 'b', 'tuxtla.ct'),
(484, 7, 14, 81, 'Me vale jajjaja', 'tuxtla.ct');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_subcategoria_preguntas`
--

CREATE TABLE `t_subcategoria_preguntas` (
  `id` int(11) NOT NULL,
  `nombre_subcategoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_subcategoria_preguntas`
--

INSERT INTO `t_subcategoria_preguntas` (`id`, `nombre_subcategoria`, `id_categoria`) VALUES
(2, 'IDENTIDAD INSTITUCIONAL', 1),
(3, 'PLANEACION DEL PROCESO DE APRENDIZAJE', 2),
(5, 'USO DEL TIEMPO', 2),
(6, 'FACILITACIÓN DE LAS INTERACCIONES', 2),
(9, 'ESTRATEGIAS PARA EL APRENDIZAJE', 2),
(11, 'USO DE LAS TECNOLOGIAS DE LA INFORMACION Y COMUNICACION', 2),
(13, 'EVALUACION DEL APRENDIZAJE', 2),
(15, 'PROFESIONAL', 3),
(16, 'PERSONAL', 4),
(17, 'TUTORIAS', 5),
(18, 'PAPEL DEL INSTRUCTOR', 6),
(19, 'MATERIAL DE APOYO DOCUMENTAL (BIBLIOGRAFIA)', 7),
(20, 'MATERIAL DE APOYO DIGITAL', 8),
(21, 'ASPECTOS SOBRE EL CURSO IMPARTIDO', 9),
(22, 'DOCENCIA', 2),
(25, 'EVALUACION MODELO EDUCATIVO', 10),
(26, 'COMO CONSIDERA', 11),
(27, 'TU OPINION NOS INTERESA', 12),
(28, 'COMENTARIOS', 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_alumnos`
--
ALTER TABLE `t_alumnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_categorias_preguntas`
--
ALTER TABLE `t_categorias_preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_categoria_persona`
--
ALTER TABLE `t_categoria_persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_curso`
--
ALTER TABLE `t_curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_curso_FK` (`id_ponente`);

--
-- Indices de la tabla `t_docente`
--
ALTER TABLE `t_docente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_encuesta`
--
ALTER TABLE `t_encuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_encuesta_t_periodo` (`id_periodo`),
  ADD KEY `t_encuesta_t_categoria_persona_FK` (`id_categoria_persona`);

--
-- Indices de la tabla `t_materias`
--
ALTER TABLE `t_materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_materias_t_docente_FK` (`id_docente`);

--
-- Indices de la tabla `t_opciones_respuestas`
--
ALTER TABLE `t_opciones_respuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_opciones_respuestas_hetero_ev_des_prog`
--
ALTER TABLE `t_opciones_respuestas_hetero_ev_des_prog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_opciones_respuestas_hetero_ev_des_prog_FK` (`id_pregunta`);

--
-- Indices de la tabla `t_opciones_respuestas_opcion_multiple`
--
ALTER TABLE `t_opciones_respuestas_opcion_multiple`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_opciones_respuestas_opcion_multiple_t_preguntas_FK` (`id_pregunta`);

--
-- Indices de la tabla `t_periodo`
--
ALTER TABLE `t_periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_ponente`
--
ALTER TABLE `t_ponente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_preguntas`
--
ALTER TABLE `t_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_preguntas_t_subcategoria_preguntas` (`id_subcategoria`),
  ADD KEY `FK_t_preguntas_t_encuesta` (`id_encuesta`),
  ADD KEY `FK_t_preguntas_t_respuestas` (`id_opciones_respuestas`) USING BTREE;

--
-- Indices de la tabla `t_preguntas_hetero_ev_des_prog`
--
ALTER TABLE `t_preguntas_hetero_ev_des_prog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_preguntas_hetero_ev_des_prog_t_encuesta_FK` (`id_encuesta`),
  ADD KEY `t_preguntas_hetero_ev_des_prog_t_subcategoria_preguntas_FK` (`id_subcategoria`);

--
-- Indices de la tabla `t_respuestas`
--
ALTER TABLE `t_respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_respuestas_t_encuesta` (`id_encuesta`),
  ADD KEY `FK_t_respuestas_t_materias` (`id_materia`),
  ADD KEY `FK_t_respuestas_t_docente` (`id_docente`),
  ADD KEY `FK_t_respuestas_t_alumnos` (`id_alumno`),
  ADD KEY `FK_t_respuestas_t_opciones_respuestas` (`id_opcion_respuesta`),
  ADD KEY `t_respuestas_t_preguntas_FK` (`id_pregunta`);

--
-- Indices de la tabla `t_respuestas_autoevaluacion_docente`
--
ALTER TABLE `t_respuestas_autoevaluacion_docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_respuestas_autoevaluacion_docente_t_encuesta_FK` (`id_encuesta`),
  ADD KEY `t_respuestas_autoevaluacion_docente_t_preguntas_FK` (`id_pregunta`),
  ADD KEY `t_respuestas_autoevaluacion_docente_t_docente_FK` (`id_docente`),
  ADD KEY `t_respuestas_autoevaluacion_docente_t_opciones_respuestas_FK` (`id_respuesta`);

--
-- Indices de la tabla `t_respuestas_evaluacion_modelo_educativo`
--
ALTER TABLE `t_respuestas_evaluacion_modelo_educativo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_respuestas_evaluacion_modelo_educativo_t_encuesta_FK` (`id_encuesta`),
  ADD KEY `t_respuestas_evaluacion_modelo_educativo_t_preguntas_FK` (`id_pregunta`),
  ADD KEY `t_respuestas_evaluacion_modelo_educativo_t_docente_FK` (`id_docente`),
  ADD KEY `ion_modelo_educativo_t_opciones_respiple_FK` (`id_opcion_respuesta`);

--
-- Indices de la tabla `t_respuestas_heteroevaluacion_docente`
--
ALTER TABLE `t_respuestas_heteroevaluacion_docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_respuestas_heteroevaluacion_docente_FK` (`id_encuesta`),
  ADD KEY `t_respuestas_heteroevaluacion_docente_FK_1` (`id_pregunta`),
  ADD KEY `t_respuestas_heteroevaluacion_docente_FK_2` (`id_docente`),
  ADD KEY `t_respuestas_heteroevaluacion_docente_FK_4` (`id_curso`),
  ADD KEY `t_respuestas_heteroevaluacion_docente_FK_3` (`id_respuesta`);

--
-- Indices de la tabla `t_respuestas_hetero_ev_des_prog`
--
ALTER TABLE `t_respuestas_hetero_ev_des_prog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_respuestas_hetero_ev_des_prog_FK` (`id_alumno`),
  ADD KEY `t_respuestas_hetero_ev_des_prog_FK_1` (`id_encuesta`),
  ADD KEY `t_respuestas_hetero_ev_des_prog_FK_2` (`id_pregunta`);

--
-- Indices de la tabla `t_subcategoria_preguntas`
--
ALTER TABLE `t_subcategoria_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_subcategoria_preguntas_t_categorias_preguntas` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_alumnos`
--
ALTER TABLE `t_alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `t_categorias_preguntas`
--
ALTER TABLE `t_categorias_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `t_categoria_persona`
--
ALTER TABLE `t_categoria_persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_curso`
--
ALTER TABLE `t_curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `t_docente`
--
ALTER TABLE `t_docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `t_encuesta`
--
ALTER TABLE `t_encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `t_materias`
--
ALTER TABLE `t_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=710;

--
-- AUTO_INCREMENT de la tabla `t_opciones_respuestas`
--
ALTER TABLE `t_opciones_respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `t_opciones_respuestas_hetero_ev_des_prog`
--
ALTER TABLE `t_opciones_respuestas_hetero_ev_des_prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `t_opciones_respuestas_opcion_multiple`
--
ALTER TABLE `t_opciones_respuestas_opcion_multiple`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `t_periodo`
--
ALTER TABLE `t_periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_ponente`
--
ALTER TABLE `t_ponente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `t_preguntas`
--
ALTER TABLE `t_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT de la tabla `t_preguntas_hetero_ev_des_prog`
--
ALTER TABLE `t_preguntas_hetero_ev_des_prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `t_respuestas`
--
ALTER TABLE `t_respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1981;

--
-- AUTO_INCREMENT de la tabla `t_respuestas_autoevaluacion_docente`
--
ALTER TABLE `t_respuestas_autoevaluacion_docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT de la tabla `t_respuestas_evaluacion_modelo_educativo`
--
ALTER TABLE `t_respuestas_evaluacion_modelo_educativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `t_respuestas_heteroevaluacion_docente`
--
ALTER TABLE `t_respuestas_heteroevaluacion_docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_respuestas_hetero_ev_des_prog`
--
ALTER TABLE `t_respuestas_hetero_ev_des_prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT de la tabla `t_subcategoria_preguntas`
--
ALTER TABLE `t_subcategoria_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_curso`
--
ALTER TABLE `t_curso`
  ADD CONSTRAINT `t_curso_FK` FOREIGN KEY (`id_ponente`) REFERENCES `t_ponente` (`id`);

--
-- Filtros para la tabla `t_encuesta`
--
ALTER TABLE `t_encuesta`
  ADD CONSTRAINT `FK_t_encuesta_t_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `t_periodo` (`id`),
  ADD CONSTRAINT `t_encuesta_t_categoria_persona_FK` FOREIGN KEY (`id_categoria_persona`) REFERENCES `t_categoria_persona` (`id`);

--
-- Filtros para la tabla `t_materias`
--
ALTER TABLE `t_materias`
  ADD CONSTRAINT `t_materias_t_docente_FK` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`);

--
-- Filtros para la tabla `t_opciones_respuestas_hetero_ev_des_prog`
--
ALTER TABLE `t_opciones_respuestas_hetero_ev_des_prog`
  ADD CONSTRAINT `t_opciones_respuestas_hetero_ev_des_prog_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas_hetero_ev_des_prog` (`id`);

--
-- Filtros para la tabla `t_opciones_respuestas_opcion_multiple`
--
ALTER TABLE `t_opciones_respuestas_opcion_multiple`
  ADD CONSTRAINT `t_opciones_respuestas_opcion_multiple_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`);

--
-- Filtros para la tabla `t_preguntas`
--
ALTER TABLE `t_preguntas`
  ADD CONSTRAINT `FK_t_preguntas_t_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `FK_t_preguntas_t_opciones_respuestas` FOREIGN KEY (`id_opciones_respuestas`) REFERENCES `t_opciones_respuestas` (`id`),
  ADD CONSTRAINT `FK_t_preguntas_t_subcategoria_preguntas` FOREIGN KEY (`id_subcategoria`) REFERENCES `t_subcategoria_preguntas` (`id`);

--
-- Filtros para la tabla `t_preguntas_hetero_ev_des_prog`
--
ALTER TABLE `t_preguntas_hetero_ev_des_prog`
  ADD CONSTRAINT `t_preguntas_hetero_ev_des_prog_t_encuesta_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `t_preguntas_hetero_ev_des_prog_t_subcategoria_preguntas_FK` FOREIGN KEY (`id_subcategoria`) REFERENCES `t_subcategoria_preguntas` (`id`);

--
-- Filtros para la tabla `t_respuestas`
--
ALTER TABLE `t_respuestas`
  ADD CONSTRAINT `FK_t_respuestas_t_alumnos` FOREIGN KEY (`id_alumno`) REFERENCES `t_alumnos` (`id`),
  ADD CONSTRAINT `FK_t_respuestas_t_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `FK_t_respuestas_t_materias` FOREIGN KEY (`id_materia`) REFERENCES `t_materias` (`id`),
  ADD CONSTRAINT `FK_t_respuestas_t_opciones_respuestas` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  ADD CONSTRAINT `t_respuestas_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`);

--
-- Filtros para la tabla `t_respuestas_autoevaluacion_docente`
--
ALTER TABLE `t_respuestas_autoevaluacion_docente`
  ADD CONSTRAINT `t_respuestas_autoevaluacion_docente_t_docente_FK` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  ADD CONSTRAINT `t_respuestas_autoevaluacion_docente_t_encuesta_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `t_respuestas_autoevaluacion_docente_t_opciones_respuestas_FK` FOREIGN KEY (`id_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  ADD CONSTRAINT `t_respuestas_autoevaluacion_docente_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`);

--
-- Filtros para la tabla `t_respuestas_evaluacion_modelo_educativo`
--
ALTER TABLE `t_respuestas_evaluacion_modelo_educativo`
  ADD CONSTRAINT `ion_modelo_educativo_t_opciones_respiple_FK` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `t_opciones_respuestas_opcion_multiple` (`id`),
  ADD CONSTRAINT `t_respuestas_evaluacion_modelo_educativo_t_docente_FK` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  ADD CONSTRAINT `t_respuestas_evaluacion_modelo_educativo_t_encuesta_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `t_respuestas_evaluacion_modelo_educativo_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`);

--
-- Filtros para la tabla `t_respuestas_heteroevaluacion_docente`
--
ALTER TABLE `t_respuestas_heteroevaluacion_docente`
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_1` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_2` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_3` FOREIGN KEY (`id_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_4` FOREIGN KEY (`id_curso`) REFERENCES `t_curso` (`id`);

--
-- Filtros para la tabla `t_respuestas_hetero_ev_des_prog`
--
ALTER TABLE `t_respuestas_hetero_ev_des_prog`
  ADD CONSTRAINT `t_respuestas_hetero_ev_des_prog_FK` FOREIGN KEY (`id_alumno`) REFERENCES `t_alumnos` (`id`),
  ADD CONSTRAINT `t_respuestas_hetero_ev_des_prog_FK_1` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `t_respuestas_hetero_ev_des_prog_FK_2` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas_hetero_ev_des_prog` (`id`);

--
-- Filtros para la tabla `t_subcategoria_preguntas`
--
ALTER TABLE `t_subcategoria_preguntas`
  ADD CONSTRAINT `FK_t_subcategoria_preguntas_t_categorias_preguntas` FOREIGN KEY (`id_categoria`) REFERENCES `t_categorias_preguntas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
