-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-07-2021 a las 02:31:50
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
(65, 'alumno.prueba23', 'ALUMNO 1', 'PRUEBA'),
(66, 'jose.santiz', 'José', 'Santíz Ruíz');

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
(9, 'ASPECTOS SOBRE EL CURSO IMPARTIDO');

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
(111, 228, 'docente.virtual', 'JOSE', 'SANTIZ RUIZ'),
(112, 246, 'jesus.jimenez', 'JESUS ALEJANDRO', 'JIMENEZ MORALES'),
(113, 811, 'lubeydi.lopez', 'LUBEYDI', 'LOPEZ RAMIREZ');

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
(2, 'HETEROEVALUACION', 'EVALUACIÓN DEL DESEMPEÑO DOCENTE', 2, 2, 1),
(5, 'HETEROEVALUACION CURSO', 'DESEMPEÑO DEL CURSO DE CAPACITACION', 3, 2, 0);

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
(448, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(449, '813', 112, 'tuxtla.sm', 'FUNDAMENTOS DE FÍSICA', 'Licenciatura en T.S.U. en Imagenología'),
(450, '831', 113, 'tuxtla.sm', 'MANEJO DE APARATOS ELECTROMEDICOS', 'Licenciatura en Enfermería'),
(451, '850', 111, 'tuxtla.sm', 'QUIMICA I', NULL),
(452, '851', 111, 'tuxtla.sm', 'MATEMATICAS I', NULL),
(453, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(454, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(455, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(456, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(457, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(458, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(459, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL),
(460, '511', NULL, 'tuxtla.sm', 'Capacitacion', NULL);

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
(13, 'NM1', 12, 1);

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
(129, 'Evaluacion general del curso', 5, 21, NULL);

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
(613, 2, 2, 448, NULL, 65, 1, 1, 100),
(614, 2, 3, 448, NULL, 65, 2, 1, 100),
(615, 2, 4, 448, NULL, 65, 1, 1, 100),
(616, 2, 5, 448, NULL, 65, 2, 1, 100),
(617, 2, 6, 448, NULL, 65, 1, 1, 100),
(618, 2, 7, 448, NULL, 65, 2, 1, 100),
(619, 2, 8, 448, NULL, 65, 3, 1, 100),
(620, 2, 9, 448, NULL, 65, 2, 1, 100),
(621, 2, 10, 448, NULL, 65, 2, 1, 100),
(622, 2, 11, 448, NULL, 65, 2, 1, 100),
(623, 2, 12, 448, NULL, 65, 1, 1, 100),
(624, 2, 13, 448, NULL, 65, 2, 1, 100),
(625, 2, 14, 448, NULL, 65, 1, 1, 100),
(626, 2, 15, 448, NULL, 65, 2, 1, 100),
(627, 2, 16, 448, NULL, 65, 2, 1, 100),
(628, 2, 17, 448, NULL, 65, 1, 1, 100),
(629, 2, 18, 448, NULL, 65, 2, 1, 100),
(630, 2, 19, 448, NULL, 65, 2, 1, 100),
(631, 2, 20, 448, NULL, 65, 2, 1, 100),
(632, 2, 21, 448, NULL, 65, 3, 1, 100),
(633, 2, 22, 448, NULL, 65, 4, 1, 100),
(634, 2, 23, 448, NULL, 65, 1, 1, 100),
(635, 2, 24, 448, NULL, 65, 2, 1, 100),
(636, 2, 25, 448, NULL, 65, 3, 1, 100),
(637, 2, 26, 448, NULL, 65, 4, 1, 100),
(638, 2, 27, 448, NULL, 65, 3, 1, 100),
(639, 2, 28, 448, NULL, 65, 2, 1, 100),
(640, 2, 29, 448, NULL, 65, 2, 1, 100),
(641, 2, 30, 448, NULL, 65, 3, 1, 100),
(642, 2, 31, 448, NULL, 65, 3, 1, 100),
(643, 2, 32, 448, NULL, 65, 1, 1, 100),
(644, 2, 33, 448, NULL, 65, 4, 1, 100),
(645, 2, 34, 448, NULL, 65, 3, 1, 100),
(646, 2, 35, 448, NULL, 65, 2, 1, 100),
(647, 2, 36, 448, NULL, 65, 1, 1, 100),
(648, 2, 37, 448, NULL, 65, 2, 1, 100),
(649, 2, 38, 448, NULL, 65, 1, 1, 100),
(650, 2, 39, 448, NULL, 65, 2, 1, 100),
(651, 2, 40, 448, NULL, 65, 1, 1, 100),
(652, 2, 41, 448, NULL, 65, 3, 1, 100),
(653, 2, 42, 448, NULL, 65, 2, 1, 100),
(654, 2, 43, 448, NULL, 65, 2, 1, 100),
(655, 2, 44, 448, NULL, 65, 1, 1, 100),
(656, 2, 45, 448, NULL, 65, 2, 1, 100),
(657, 2, 46, 448, NULL, 65, 2, 1, 100),
(658, 2, 47, 448, NULL, 65, 2, 1, 100),
(659, 2, 48, 448, NULL, 65, 1, 1, 100),
(660, 2, 49, 448, NULL, 65, 2, 1, 100),
(661, 2, 50, 448, NULL, 65, 4, 1, 100),
(662, 2, 2, 449, 112, 65, 2, 1, 100),
(663, 2, 3, 449, 112, 65, 3, 1, 100),
(664, 2, 4, 449, 112, 65, 1, 1, 100),
(665, 2, 5, 449, 112, 65, 2, 1, 100),
(666, 2, 6, 449, 112, 65, 3, 1, 100),
(667, 2, 7, 449, 112, 65, 4, 1, 100),
(668, 2, 8, 449, 112, 65, 3, 1, 100),
(669, 2, 9, 449, 112, 65, 1, 1, 100),
(670, 2, 10, 449, 112, 65, 2, 1, 100),
(671, 2, 11, 449, 112, 65, 3, 1, 100),
(672, 2, 12, 449, 112, 65, 2, 1, 100),
(673, 2, 13, 449, 112, 65, 4, 1, 100),
(674, 2, 14, 449, 112, 65, 2, 1, 100),
(675, 2, 15, 449, 112, 65, 1, 1, 100),
(676, 2, 16, 449, 112, 65, 2, 1, 100),
(677, 2, 17, 449, 112, 65, 1, 1, 100),
(678, 2, 18, 449, 112, 65, 2, 1, 100),
(679, 2, 19, 449, 112, 65, 3, 1, 100),
(680, 2, 20, 449, 112, 65, 1, 1, 100),
(681, 2, 21, 449, 112, 65, 2, 1, 100),
(682, 2, 22, 449, 112, 65, 4, 1, 100),
(683, 2, 23, 449, 112, 65, 3, 1, 100),
(684, 2, 24, 449, 112, 65, 1, 1, 100),
(685, 2, 25, 449, 112, 65, 2, 1, 100),
(686, 2, 26, 449, 112, 65, 2, 1, 100),
(687, 2, 27, 449, 112, 65, 3, 1, 100),
(688, 2, 28, 449, 112, 65, 2, 1, 100),
(689, 2, 29, 449, 112, 65, 4, 1, 100),
(690, 2, 30, 449, 112, 65, 1, 1, 100),
(691, 2, 31, 449, 112, 65, 2, 1, 100),
(692, 2, 32, 449, 112, 65, 2, 1, 100),
(693, 2, 33, 449, 112, 65, 2, 1, 100),
(694, 2, 34, 449, 112, 65, 3, 1, 100),
(695, 2, 35, 449, 112, 65, 2, 1, 100),
(696, 2, 36, 449, 112, 65, 1, 1, 100),
(697, 2, 37, 449, 112, 65, 2, 1, 100),
(698, 2, 38, 449, 112, 65, 1, 1, 100),
(699, 2, 39, 449, 112, 65, 1, 1, 100),
(700, 2, 40, 449, 112, 65, 2, 1, 100),
(701, 2, 41, 449, 112, 65, 2, 1, 100),
(702, 2, 42, 449, 112, 65, 3, 1, 100),
(703, 2, 43, 449, 112, 65, 1, 1, 100),
(704, 2, 44, 449, 112, 65, 1, 1, 100),
(705, 2, 45, 449, 112, 65, 3, 1, 100),
(706, 2, 46, 449, 112, 65, 3, 1, 100),
(707, 2, 47, 449, 112, 65, 1, 1, 100),
(708, 2, 48, 449, 112, 65, 4, 1, 100),
(709, 2, 49, 449, 112, 65, 2, 1, 100),
(710, 2, 50, 449, 112, 65, 4, 1, 100),
(711, 2, 2, 450, 113, 65, 2, 1, 100),
(712, 2, 3, 450, 113, 65, 1, 1, 100),
(713, 2, 4, 450, 113, 65, 2, 1, 100),
(714, 2, 5, 450, 113, 65, 2, 1, 100),
(715, 2, 6, 450, 113, 65, 1, 1, 100),
(716, 2, 7, 450, 113, 65, 2, 1, 100),
(717, 2, 8, 450, 113, 65, 3, 1, 100),
(718, 2, 9, 450, 113, 65, 3, 1, 100),
(719, 2, 10, 450, 113, 65, 2, 1, 100),
(720, 2, 11, 450, 113, 65, 1, 1, 100),
(721, 2, 12, 450, 113, 65, 1, 1, 100),
(722, 2, 13, 450, 113, 65, 2, 1, 100),
(723, 2, 14, 450, 113, 65, 2, 1, 100),
(724, 2, 15, 450, 113, 65, 1, 1, 100),
(725, 2, 16, 450, 113, 65, 4, 1, 100),
(726, 2, 17, 450, 113, 65, 1, 1, 100),
(727, 2, 18, 450, 113, 65, 2, 1, 100),
(728, 2, 19, 450, 113, 65, 3, 1, 100),
(729, 2, 20, 450, 113, 65, 4, 1, 100),
(730, 2, 21, 450, 113, 65, 1, 1, 100),
(731, 2, 22, 450, 113, 65, 2, 1, 100),
(732, 2, 23, 450, 113, 65, 3, 1, 100),
(733, 2, 24, 450, 113, 65, 4, 1, 100),
(734, 2, 25, 450, 113, 65, 1, 1, 100),
(735, 2, 26, 450, 113, 65, 2, 1, 100),
(736, 2, 27, 450, 113, 65, 4, 1, 100),
(737, 2, 28, 450, 113, 65, 2, 1, 100),
(738, 2, 29, 450, 113, 65, 1, 1, 100),
(739, 2, 30, 450, 113, 65, 2, 1, 100),
(740, 2, 31, 450, 113, 65, 3, 1, 100),
(741, 2, 32, 450, 113, 65, 1, 1, 100),
(742, 2, 33, 450, 113, 65, 1, 1, 100),
(743, 2, 34, 450, 113, 65, 3, 1, 100),
(744, 2, 35, 450, 113, 65, 2, 1, 100),
(745, 2, 36, 450, 113, 65, 4, 1, 100),
(746, 2, 37, 450, 113, 65, 2, 1, 100),
(747, 2, 38, 450, 113, 65, 1, 1, 100),
(748, 2, 39, 450, 113, 65, 3, 1, 100),
(749, 2, 40, 450, 113, 65, 4, 1, 100),
(750, 2, 41, 450, 113, 65, 2, 1, 100),
(751, 2, 42, 450, 113, 65, 1, 1, 100),
(752, 2, 43, 450, 113, 65, 3, 1, 100),
(753, 2, 44, 450, 113, 65, 4, 1, 100),
(754, 2, 45, 450, 113, 65, 2, 1, 100),
(755, 2, 46, 450, 113, 65, 1, 1, 100),
(756, 2, 47, 450, 113, 65, 2, 1, 100),
(757, 2, 48, 450, 113, 65, 3, 1, 100),
(758, 2, 49, 450, 113, 65, 3, 1, 100),
(759, 2, 50, 450, 113, 65, 4, 1, 100),
(760, 2, 2, 451, 111, 65, 3, 1, 100),
(761, 2, 3, 451, 111, 65, 2, 1, 100),
(762, 2, 4, 451, 111, 65, 3, 1, 100),
(763, 2, 5, 451, 111, 65, 3, 1, 100),
(764, 2, 6, 451, 111, 65, 2, 1, 100),
(765, 2, 7, 451, 111, 65, 1, 1, 100),
(766, 2, 8, 451, 111, 65, 2, 1, 100),
(767, 2, 9, 451, 111, 65, 4, 1, 100),
(768, 2, 10, 451, 111, 65, 3, 1, 100),
(769, 2, 11, 451, 111, 65, 2, 1, 100),
(770, 2, 12, 451, 111, 65, 1, 1, 100),
(771, 2, 13, 451, 111, 65, 2, 1, 100),
(772, 2, 14, 451, 111, 65, 2, 1, 100),
(773, 2, 15, 451, 111, 65, 3, 1, 100),
(774, 2, 16, 451, 111, 65, 4, 1, 100),
(775, 2, 17, 451, 111, 65, 3, 1, 100),
(776, 2, 18, 451, 111, 65, 1, 1, 100),
(777, 2, 19, 451, 111, 65, 2, 1, 100),
(778, 2, 20, 451, 111, 65, 1, 1, 100),
(779, 2, 21, 451, 111, 65, 3, 1, 100),
(780, 2, 22, 451, 111, 65, 4, 1, 100),
(781, 2, 23, 451, 111, 65, 2, 1, 100),
(782, 2, 24, 451, 111, 65, 2, 1, 100),
(783, 2, 25, 451, 111, 65, 1, 1, 100),
(784, 2, 26, 451, 111, 65, 3, 1, 100),
(785, 2, 27, 451, 111, 65, 2, 1, 100),
(786, 2, 28, 451, 111, 65, 4, 1, 100),
(787, 2, 29, 451, 111, 65, 2, 1, 100),
(788, 2, 30, 451, 111, 65, 1, 1, 100),
(789, 2, 31, 451, 111, 65, 3, 1, 100),
(790, 2, 32, 451, 111, 65, 2, 1, 100),
(791, 2, 33, 451, 111, 65, 1, 1, 100),
(792, 2, 34, 451, 111, 65, 2, 1, 100),
(793, 2, 35, 451, 111, 65, 3, 1, 100),
(794, 2, 36, 451, 111, 65, 4, 1, 100),
(795, 2, 37, 451, 111, 65, 1, 1, 100),
(796, 2, 38, 451, 111, 65, 1, 1, 100),
(797, 2, 39, 451, 111, 65, 2, 1, 100),
(798, 2, 40, 451, 111, 65, 3, 1, 100),
(799, 2, 41, 451, 111, 65, 4, 1, 100),
(800, 2, 42, 451, 111, 65, 1, 1, 100),
(801, 2, 43, 451, 111, 65, 2, 1, 100),
(802, 2, 44, 451, 111, 65, 2, 1, 100),
(803, 2, 45, 451, 111, 65, 3, 1, 100),
(804, 2, 46, 451, 111, 65, 1, 1, 100),
(805, 2, 47, 451, 111, 65, 1, 1, 100),
(806, 2, 48, 451, 111, 65, 3, 1, 100),
(807, 2, 49, 451, 111, 65, 1, 1, 100),
(808, 2, 50, 451, 111, 65, 3, 1, 100),
(809, 2, 2, 452, 111, 65, 2, 1, 100),
(810, 2, 3, 452, 111, 65, 2, 1, 100),
(811, 2, 4, 452, 111, 65, 2, 1, 100),
(812, 2, 5, 452, 111, 65, 2, 1, 100),
(813, 2, 6, 452, 111, 65, 4, 1, 100),
(814, 2, 7, 452, 111, 65, 2, 1, 100),
(815, 2, 8, 452, 111, 65, 2, 1, 100),
(816, 2, 9, 452, 111, 65, 3, 1, 100),
(817, 2, 10, 452, 111, 65, 4, 1, 100),
(818, 2, 11, 452, 111, 65, 2, 1, 100),
(819, 2, 12, 452, 111, 65, 1, 1, 100),
(820, 2, 13, 452, 111, 65, 3, 1, 100),
(821, 2, 14, 452, 111, 65, 3, 1, 100),
(822, 2, 15, 452, 111, 65, 2, 1, 100),
(823, 2, 16, 452, 111, 65, 1, 1, 100),
(824, 2, 17, 452, 111, 65, 2, 1, 100),
(825, 2, 18, 452, 111, 65, 2, 1, 100),
(826, 2, 19, 452, 111, 65, 1, 1, 100),
(827, 2, 20, 452, 111, 65, 2, 1, 100),
(828, 2, 21, 452, 111, 65, 3, 1, 100),
(829, 2, 22, 452, 111, 65, 1, 1, 100),
(830, 2, 23, 452, 111, 65, 2, 1, 100),
(831, 2, 24, 452, 111, 65, 3, 1, 100),
(832, 2, 25, 452, 111, 65, 4, 1, 100),
(833, 2, 26, 452, 111, 65, 2, 1, 100),
(834, 2, 27, 452, 111, 65, 1, 1, 100),
(835, 2, 28, 452, 111, 65, 1, 1, 100),
(836, 2, 29, 452, 111, 65, 2, 1, 100),
(837, 2, 30, 452, 111, 65, 2, 1, 100),
(838, 2, 31, 452, 111, 65, 2, 1, 100),
(839, 2, 32, 452, 111, 65, 3, 1, 100),
(840, 2, 33, 452, 111, 65, 4, 1, 100),
(841, 2, 34, 452, 111, 65, 1, 1, 100),
(842, 2, 35, 452, 111, 65, 2, 1, 100),
(843, 2, 36, 452, 111, 65, 4, 1, 100),
(844, 2, 37, 452, 111, 65, 2, 1, 100),
(845, 2, 38, 452, 111, 65, 1, 1, 100),
(846, 2, 39, 452, 111, 65, 2, 1, 100),
(847, 2, 40, 452, 111, 65, 3, 1, 100),
(848, 2, 41, 452, 111, 65, 3, 1, 100),
(849, 2, 42, 452, 111, 65, 1, 1, 100),
(850, 2, 43, 452, 111, 65, 2, 1, 100),
(851, 2, 44, 452, 111, 65, 2, 1, 100),
(852, 2, 45, 452, 111, 65, 3, 1, 100),
(853, 2, 46, 452, 111, 65, 4, 1, 100),
(854, 2, 47, 452, 111, 65, 1, 1, 100),
(855, 2, 48, 452, 111, 65, 2, 1, 100),
(856, 2, 49, 452, 111, 65, 1, 1, 100),
(857, 2, 50, 452, 111, 65, 3, 1, 100),
(858, 2, 2, 451, 111, 66, 4, 1, 100),
(859, 2, 3, 451, 111, 66, 4, 1, 100),
(860, 2, 4, 451, 111, 66, 4, 1, 100),
(861, 2, 5, 451, 111, 66, 4, 1, 100),
(862, 2, 6, 451, 111, 66, 4, 1, 100),
(863, 2, 7, 451, 111, 66, 3, 1, 100),
(864, 2, 8, 451, 111, 66, 4, 1, 100),
(865, 2, 9, 451, 111, 66, 3, 1, 100),
(866, 2, 10, 451, 111, 66, 4, 1, 100),
(867, 2, 11, 451, 111, 66, 4, 1, 100),
(868, 2, 12, 451, 111, 66, 4, 1, 100),
(869, 2, 13, 451, 111, 66, 4, 1, 100),
(870, 2, 14, 451, 111, 66, 4, 1, 100),
(871, 2, 15, 451, 111, 66, 4, 1, 100),
(872, 2, 16, 451, 111, 66, 4, 1, 100),
(873, 2, 17, 451, 111, 66, 4, 1, 100),
(874, 2, 18, 451, 111, 66, 4, 1, 100),
(875, 2, 19, 451, 111, 66, 4, 1, 100),
(876, 2, 20, 451, 111, 66, 4, 1, 100),
(877, 2, 21, 451, 111, 66, 4, 1, 100),
(878, 2, 22, 451, 111, 66, 4, 1, 100),
(879, 2, 23, 451, 111, 66, 4, 1, 100),
(880, 2, 24, 451, 111, 66, 4, 1, 100),
(881, 2, 25, 451, 111, 66, 4, 1, 100),
(882, 2, 26, 451, 111, 66, 4, 1, 100),
(883, 2, 27, 451, 111, 66, 4, 1, 100),
(884, 2, 28, 451, 111, 66, 3, 1, 100),
(885, 2, 29, 451, 111, 66, 4, 1, 100),
(886, 2, 30, 451, 111, 66, 4, 1, 100),
(887, 2, 31, 451, 111, 66, 4, 1, 100),
(888, 2, 32, 451, 111, 66, 4, 1, 100),
(889, 2, 33, 451, 111, 66, 4, 1, 100),
(890, 2, 34, 451, 111, 66, 4, 1, 100),
(891, 2, 35, 451, 111, 66, 4, 1, 100),
(892, 2, 36, 451, 111, 66, 4, 1, 100),
(893, 2, 37, 451, 111, 66, 4, 1, 100),
(894, 2, 38, 451, 111, 66, 4, 1, 100),
(895, 2, 39, 451, 111, 66, 4, 1, 100),
(896, 2, 40, 451, 111, 66, 4, 1, 100),
(897, 2, 41, 451, 111, 66, 4, 1, 100),
(898, 2, 42, 451, 111, 66, 4, 1, 100),
(899, 2, 43, 451, 111, 66, 4, 1, 100),
(900, 2, 44, 451, 111, 66, 4, 1, 100),
(901, 2, 45, 451, 111, 66, 4, 1, 100),
(902, 2, 46, 451, 111, 66, 4, 1, 100),
(903, 2, 47, 451, 111, 66, 4, 1, 100),
(904, 2, 48, 451, 111, 66, 4, 1, 100),
(905, 2, 49, 451, 111, 66, 4, 1, 100),
(906, 2, 50, 451, 111, 66, 4, 1, 100),
(907, 2, 2, 452, 111, 66, 1, 1, 100),
(908, 2, 3, 452, 111, 66, 1, 1, 100),
(909, 2, 4, 452, 111, 66, 1, 1, 100),
(910, 2, 5, 452, 111, 66, 1, 1, 100),
(911, 2, 6, 452, 111, 66, 1, 1, 100),
(912, 2, 7, 452, 111, 66, 1, 1, 100),
(913, 2, 8, 452, 111, 66, 1, 1, 100),
(914, 2, 9, 452, 111, 66, 1, 1, 100),
(915, 2, 10, 452, 111, 66, 1, 1, 100),
(916, 2, 11, 452, 111, 66, 1, 1, 100),
(917, 2, 12, 452, 111, 66, 1, 1, 100),
(918, 2, 13, 452, 111, 66, 1, 1, 100),
(919, 2, 14, 452, 111, 66, 1, 1, 100),
(920, 2, 15, 452, 111, 66, 1, 1, 100),
(921, 2, 16, 452, 111, 66, 1, 1, 100),
(922, 2, 17, 452, 111, 66, 1, 1, 100),
(923, 2, 18, 452, 111, 66, 1, 1, 100),
(924, 2, 19, 452, 111, 66, 1, 1, 100),
(925, 2, 20, 452, 111, 66, 1, 1, 100),
(926, 2, 21, 452, 111, 66, 1, 1, 100),
(927, 2, 22, 452, 111, 66, 1, 1, 100),
(928, 2, 23, 452, 111, 66, 1, 1, 100),
(929, 2, 24, 452, 111, 66, 1, 1, 100),
(930, 2, 25, 452, 111, 66, 1, 1, 100),
(931, 2, 26, 452, 111, 66, 1, 1, 100),
(932, 2, 27, 452, 111, 66, 1, 1, 100),
(933, 2, 28, 452, 111, 66, 1, 1, 100),
(934, 2, 29, 452, 111, 66, 1, 1, 100),
(935, 2, 30, 452, 111, 66, 1, 1, 100),
(936, 2, 31, 452, 111, 66, 1, 1, 100),
(937, 2, 32, 452, 111, 66, 1, 1, 100),
(938, 2, 33, 452, 111, 66, 1, 1, 100),
(939, 2, 34, 452, 111, 66, 1, 1, 100),
(940, 2, 35, 452, 111, 66, 1, 1, 100),
(941, 2, 36, 452, 111, 66, 1, 1, 100),
(942, 2, 37, 452, 111, 66, 1, 1, 100),
(943, 2, 38, 452, 111, 66, 1, 1, 100),
(944, 2, 39, 452, 111, 66, 1, 1, 100),
(945, 2, 40, 452, 111, 66, 1, 1, 100),
(946, 2, 41, 452, 111, 66, 1, 1, 100),
(947, 2, 42, 452, 111, 66, 1, 1, 100),
(948, 2, 43, 452, 111, 66, 1, 1, 100),
(949, 2, 44, 452, 111, 66, 1, 1, 100),
(950, 2, 45, 452, 111, 66, 1, 1, 100),
(951, 2, 46, 452, 111, 66, 1, 1, 100),
(952, 2, 47, 452, 111, 66, 1, 1, 100),
(953, 2, 48, 452, 111, 66, 1, 1, 100),
(954, 2, 49, 452, 111, 66, 1, 1, 100),
(955, 2, 50, 452, 111, 66, 1, 1, 100);

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
(13, 'EVALUACION DEL APRENDIZAJE', 3),
(15, 'PROFESIONAL', 3),
(16, 'PERSONAL', 4),
(17, 'TUTORIAS', 5),
(18, 'PAPEL DEL INSTRUCTOR', 6),
(19, 'MATERIAL DE APOYO DOCUMENTAL (BIBLIOGRAFIA)', 7),
(20, 'MATERIAL DE APOYO DIGITAL', 8),
(21, 'ASPECTOS SOBRE EL CURSO IMPARTIDO', 9),
(22, 'DOCENCIA', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `t_categorias_preguntas`
--
ALTER TABLE `t_categorias_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `t_encuesta`
--
ALTER TABLE `t_encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_materias`
--
ALTER TABLE `t_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;

--
-- AUTO_INCREMENT de la tabla `t_opciones_respuestas`
--
ALTER TABLE `t_opciones_respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT de la tabla `t_respuestas`
--
ALTER TABLE `t_respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=956;

--
-- AUTO_INCREMENT de la tabla `t_respuestas_autoevaluacion_docente`
--
ALTER TABLE `t_respuestas_autoevaluacion_docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `t_respuestas_heteroevaluacion_docente`
--
ALTER TABLE `t_respuestas_heteroevaluacion_docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `t_subcategoria_preguntas`
--
ALTER TABLE `t_subcategoria_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
-- Filtros para la tabla `t_preguntas`
--
ALTER TABLE `t_preguntas`
  ADD CONSTRAINT `FK_t_preguntas_t_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `FK_t_preguntas_t_opciones_respuestas` FOREIGN KEY (`id_opciones_respuestas`) REFERENCES `t_opciones_respuestas` (`id`),
  ADD CONSTRAINT `FK_t_preguntas_t_subcategoria_preguntas` FOREIGN KEY (`id_subcategoria`) REFERENCES `t_subcategoria_preguntas` (`id`);

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
-- Filtros para la tabla `t_respuestas_heteroevaluacion_docente`
--
ALTER TABLE `t_respuestas_heteroevaluacion_docente`
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_1` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_2` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_3` FOREIGN KEY (`id_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  ADD CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_4` FOREIGN KEY (`id_curso`) REFERENCES `t_curso` (`id`);

--
-- Filtros para la tabla `t_subcategoria_preguntas`
--
ALTER TABLE `t_subcategoria_preguntas`
  ADD CONSTRAINT `FK_t_subcategoria_preguntas_t_categorias_preguntas` FOREIGN KEY (`id_categoria`) REFERENCES `t_categorias_preguntas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
