<?php

class HomeModel extends Mysql
{
	public function __construct()
	{
		parent::__construct();
	}

    /*consultar token del usuario*/
    public function consultarToken($data){
		$username = $data['username'];
		$password = $data['password'];
		$plataforma = $data['plataforma'];
		$_NOMBRE_SERVICIO = "moodle_mobile_app";
		$URL = "https://".$plataforma.".seuatvirtual.mx/login/token.php?username=".$username."&password=".$password."&service=".$_NOMBRE_SERVICIO;
		$json = file_get_contents($URL);
		$request = json_decode($json, TRUE);
		return $request;
	}

    /*Consultar Datos personales Usuario en la Plataforma */
    public function consultarDatosUsuario($data){
        $URL = "https://".$data['plataforma'].".seuatvirtual.mx/webservice/rest/server.php?moodlewsrestformat=json&wstoken=".$data['token']."&wsfunction=core_webservice_get_site_info";
        $json = file_get_contents($URL);
        $request = json_decode($json, TRUE);
        $datos['nombre'] = $request['firstname'];
        $datos['apellidos'] = $request['lastname'];
        $datos['userid'] = $request['userid'];
        $datos['pictureurl'] = $request['userpictureurl'];
        return $datos;
    }

    /*Guardar Datos Alumno a la BD */
    public function guardarDatosAlumnoBD($data){
        $username = $data['username'];
        $nombre = $data['datos']['nombre'];
        $apellidos = $data['datos']['apellidos'];
        $sql_datos_alumno = "INSERT INTO t_alumnos (nombre_usuario,nombre,apellidos) SELECT * FROM (SELECT '$username','$nombre','$apellidos')
        AS al WHERE NOT EXISTS (SELECT nombre_usuario FROM t_alumnos WHERE nombre_usuario = '$username') LIMIT 1";
        $request_datos_alumno = $this->insert($sql_datos_alumno,array($username,$nombre,$apellidos));
        return $request_datos_alumno;
        
    }

    /*Consultar lista de materias matriculadas al Alumno*/
    public function consultarMateriasAlumno($data){
        $URL = "https://".$data['plataforma'].".seuatvirtual.mx/API/Alumno/user_list_course.php?visible=1&username=".$data['username'];
		$json = file_get_contents($URL);
		$request = json_decode($json, TRUE);
		return $request;
    }

    /*verificar si el alumno ya contesto la encuesta de la materia */
    public function consultarStatusEncuestaMateria($data){
        $username = $data['username'];
        $status;
        foreach($data['materias'] as $datos){
            $id_materia = $datos['id_course'];
            $sql_status_materia = "SELECT tm.id_curso_plataforma,ta.nombre_usuario FROM t_respuestas tr 
            INNER JOIN t_materias tm ON tr.id_materia = tm.id INNER JOIN t_alumnos ta ON tr.id_alumno =
            ta.id WHERE tm.id_curso_plataforma = $id_materia AND ta.nombre_usuario  = '$username'";
            $request_status_materia = $this->select_all($sql_status_materia);
            $estado;
            if(sizeof($request_status_materia) == 0){
                $estado = 0;
            }else{
                $estado = 1;
            }
            $status[$id_materia] = $estado;
        }
        return $status;
    }

    /* Guardar Datos de Materias en la BD */
    public function guardarMateriasBD($data){
        $plataforma = $data['plataforma'];
        foreach($data['materias'] as $materia){
            $id_course = $materia['id_course'];
            $course = $materia['fullname_course'];
            $category = $materia['category_course'];

            $URL = "https://".$plataforma.".seuatvirtual.mx/API/Docente/user_list_course.php?id=".$id_course;
            $json = file_get_contents($URL);
            $request = json_decode($json, TRUE);
            $id_docente = $request[0]['id_user'];
          
            $sql_docente = "SELECT id FROM t_docente WHERE id_usuario_plataforma = '$id_docente' LIMIT 1";
            $request_docente = $this->select_all($sql_docente);
            $id_docente_bd = $request_docente[0]['id'];

            $sql_exist = "SELECT id FROM t_materias WHERE id_curso_plataforma = '$id_course' AND id_docente = '$id_docente_bd' AND plataforma = '$plataforma' LIMIT 1";
            $req_exist = $this->select_all($sql_exist);

            if(sizeof($req_exist) == 0){
                $sql_materia = "INSERT INTO t_materias (id_curso_plataforma,id_docente,plataforma,nombre_materia,nombre_carrera) VALUES (?,?,?,?,?)";
                $request_materia = $this->insert($sql_materia,array($id_course,$id_docente_bd,$plataforma,$course,$category));
            }  
        }
    }

    /* Guardar Docentes en BD */
    public function guardarDocenteBD($data){
        $plataforma = $data['plataforma'];
        $datos_materias;
        foreach($data['materias'] as $materia){
            $id_course = $materia['id_course'];
            $datos;
            $URL = "https://".$plataforma.".seuatvirtual.mx/API/Docente/user_list_course.php?id=".$id_course;
            $json = file_get_contents($URL);
            $request = json_decode($json, TRUE);
            if($request[0]['category_course'] != NULL){
                $datos['id_user'] = $request[0]['id_user'];
                $datos['username'] = $request[0]['teacher_username'];
                $datos['nombre'] = $request[0]['teacher_firstname'];
                $datos['apellidos'] = $request[0]['teacher_lastname'];
                $id_user = $datos['id_user'];
                $username = $datos['username'];
                $nombre = $datos['nombre'];
                $apellidos = $datos['apellidos']; 
                $datos_materias[$id_course] = $datos;   
                /*Guardar Datos del Docente en la BD */
  
            $sql_docente= "INSERT INTO t_docente (id_usuario_plataforma,usuario_docente,nombre_docente,apellidos_docente) SELECT * FROM (SELECT $id_user,'$username','$nombre','$apellidos')
            AS doc WHERE NOT EXISTS (SELECT usuario_docente FROM t_docente WHERE usuario_docente = '$username') LIMIT 1";
            $request_docente = $this->insert($sql_docente,array($id_user,$usernme,$nombre,$apellidos));  
            }             
        }
       return $datos_materias;
    }

    /* Guardar datos Docente en Evaluaciones (Heteroevaluacion y Autoevaluacion) */
    public function guardarDocenteEvBD($data){
        $id_username = $data['datos']['userid'];
        $username_docente = $data['username'];
        $nombre_docente = $data['datos']['nombre'];
        $apellidos_docente = $data['datos']['apellidos'];
        $sql_docente = "SELECT id FROM t_docente WHERE id_usuario_plataforma = '$id_username' LIMIT 1";
        $request_docente = $this->select_all($sql_docente);
        if(sizeof($request_docente) == 0){
            $sql = "INSERT INTO t_docente (id_usuario_plataforma,usuario_docente,nombre_docente,apellidos_docente) VALUES (?,?,?,?)";
            $request = $this->insert($sql,array($id_username,$username_docente,$nombre_docente,$apellidos_docente));
            return $request;
        }
        return $request_docente;
    }


    /*Consultar preguntas */
    public function consultarPreguntas(){
        $sql = "SELECT t_preguntas.id AS id_pr, t_preguntas.nombre_pregunta AS nom_pr, t_subcategoria_preguntas.id as id_sub,
        t_subcategoria_preguntas.nombre_subcategoria as nom_sub,
        t_categorias_preguntas.id as id_cat, t_categorias_preguntas.nombre_categoria as nom_cat FROM t_preguntas
        INNER JOIN t_subcategoria_preguntas ON
        t_preguntas.id_subcategoria  = t_subcategoria_preguntas.id
        INNER JOIN t_categorias_preguntas ON
        t_subcategoria_preguntas.id_categoria  = t_categorias_preguntas.id LIMIT 3";
		$request = $this->select_all($sql);
		return $request;
    }

    /*Consultar datos de la Materia */
    public function consultarDatosMateria($data){
        $plataforma = $data['plataforma'];
        $id_course = $data['id_materia'];
        $URL = "https://".$data['plataforma'].".seuatvirtual.mx/API/Docente/user_list_course.php?id=".$data['id_materia'];
		$json = file_get_contents($URL);
		$request = json_decode($json, TRUE);
        $sql_m = "SELECT id FROM t_materias WHERE id_curso_plataforma = '$id_course' AND plataforma = '$plataforma'";
        $request_m = $this->select_all($sql_m);
        $datos['request'] = $request;
        $datos['req_mat'] = $request_m;
		return $datos;
    }
    
    /*Guardar resultados Encuesta a la BD */
    public function guardadResultadoHeteroevaluacionAlumnoBD($data){
        $resultado = "Enviado";
        $resultado_res = $data['res'];
        $id_materia = $data['dat'][0]['id'];
        $plataforma = $data['dat'][0]['plataforma'];
        $usuario = base64_decode($data['dat'][0]['usuario']);
        $sql_user = "SELECT id FROM t_alumnos WHERE nombre_usuario = '$usuario' LIMIT 1";
        $req_user = $this->select_all($sql_user);
        $sql_mat = "SELECT id,id_docente FROM t_materias WHERE id_curso_plataforma = '$id_materia' AND plataforma =
        '$plataforma' LIMIT 1";
        $req_mat = $this->select_all($sql_mat);
        
        $id_usuario_bd = $req_user[0]['id'];
        $id_materia_bd = $req_mat[0]['id'];
        $id_docente_bd = $req_mat[0]['id_docente'];
        foreach($data['res'] as $valores){
            $id_pregunta = $valores['id_pregunta'];
            $respuesta = $valores['respuesta'];
            $sql = "INSERT INTO t_respuestas(id_encuesta,id_pregunta,id_materia,id_docente,id_alumno,id_opcion_respuesta,estatus,tiempo_dedicado)
            VALUES (?,?,?,?,?,?,?,?)";
            $this->insert($sql,array(2,$id_pregunta,$id_materia_bd,$id_docente_bd,$id_usuario_bd,$respuesta,1,100));
        }
        return $resultado_res;


    }
    /*Guardar resultados AutoEvaluacionDocente a la BD */
    public function guardadResultadoAutoEvaluacionDocenteBD($data){
        $resultado = "Enviado";
        $resultado_res = $data['res'];
        $resultado_dat = $data['dat'];
        $usuario = $resultado_dat[0]['u'];
        $id_plataforma = $resultado_dat[0]['id_p'];
        $id_bd = $resultado_dat[0]['idbd'];
        $resultados;
        $resultados['0'] = 5;
        $resultados['1'] = 6;
        $resultados['2'] = 7;
        $resultados['3'] = 8;
        $resultados['4'] = 9;
        foreach($data['res'] as $valores){
            $id_pregunta = $valores['id_pregunta'];
            $respuesta = $valores['respuesta'];
            $sql = "INSERT INTO t_respuestas_autoevaluacion_docente(id_encuesta,id_pregunta,id_docente,id_respuesta,estatus,duracion)
            VALUES (?,?,?,?,?,?)";
            $this->insert($sql,array(1,$id_pregunta,$id_bd,$resultados[$respuesta],1,100));
        }
        return $id_bd;

    }

     /*Guardar resultados HeteroevaluacionDocente a la BD */
     public function guardadResultadoHeteroevaluacionDocenteBD($data){
        $resultado = "Enviado";
        $resultado_res = $data['res'];
        $resultado_dat = $data['dat'];
        $usuario = $resultado_dat[0]['u'];
        $id_plataforma = $resultado_dat[0]['id_p'];
        $id_bd = $resultado_dat[0]['idbd'];
        $resultados;
        $resultados['0'] = 10;
        $resultados['1'] = 11;
        $resultados['2'] = 12;
        $resultados['3'] = 13;
        foreach($data['res'] as $valores){
            $id_pregunta = $valores['id_pregunta'];
            $respuesta = $valores['respuesta'];
            $sql = "INSERT INTO t_respuestas_heteroevaluacion_docente(id_curso,id_encuesta,id_pregunta,id_docente,id_respuesta,estatus,duracion)
            VALUES (?,?,?,?,?,?,?)";
            $this->insert($sql,array(1,5,$id_pregunta,$id_bd,$resultados[$respuesta],1,100));
        }
        return $resultado;

    }

    /*Consultar preguntas Docente */
    public function consultarPreguntasAutoevaluacion(){
        $sql = "SELECT t_preguntas.id AS id_pr, t_preguntas.nombre_pregunta AS nom_pr, t_subcategoria_preguntas.id as id_sub,
        t_subcategoria_preguntas.nombre_subcategoria as nom_sub,
        t_categorias_preguntas.id as id_cat, t_categorias_preguntas.nombre_categoria as nom_cat FROM t_preguntas
        INNER JOIN t_subcategoria_preguntas ON
        t_preguntas.id_subcategoria  = t_subcategoria_preguntas.id
        INNER JOIN t_categorias_preguntas ON
        t_subcategoria_preguntas.id_categoria  = t_categorias_preguntas.id
        WHERE t_preguntas.id_encuesta = 1";
		$request = $this->select_all($sql);
		return $request;
    }

    /*Consultar preguntas EvaluacionCurso */
    public function consultarPreguntasHeteroevaluacion(){
        $sql = "SELECT t_preguntas.id AS id_pr, t_preguntas.nombre_pregunta AS nom_pr, t_subcategoria_preguntas.id as id_sub,
        t_subcategoria_preguntas.nombre_subcategoria as nom_sub,
        t_categorias_preguntas.id as id_cat, t_categorias_preguntas.nombre_categoria as nom_cat FROM t_preguntas
        INNER JOIN t_subcategoria_preguntas ON
        t_preguntas.id_subcategoria  = t_subcategoria_preguntas.id
        INNER JOIN t_categorias_preguntas ON
        t_subcategoria_preguntas.id_categoria  = t_categorias_preguntas.id
        WHERE t_preguntas.id_encuesta = 5 LIMIT 3";
		$request = $this->select_all($sql);
		return $request;
    }
}
?>