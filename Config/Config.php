<?php

	const BASE_URL = "http://192.168.1.70:8888/encuestas";

	//Zona horaria
	date_default_timezone_set('America/Mexico_City');

	const DB_HOST = "localhost:8889";
	const DB_NAME = "encuestas";
	const DB_USER = "root";
	const DB_PASSWORD = "root";
	const DB_CHARSET = "utf8";

	//Delimitadores decimal y millar Ej. 27,1985.00
	const SPD = "."; //Separador de decimales
	const SPM = ","; //Separador de millares

?>