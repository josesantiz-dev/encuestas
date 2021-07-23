-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 23-07-2021 a las 06:28:18
-- Versión del servidor: 5.7.32
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(13, 'EVALUACION DEL APRENDIZAJE', 2),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `t_encuesta`
--
ALTER TABLE `t_encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_materias`
--
ALTER TABLE `t_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=623;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1687;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
