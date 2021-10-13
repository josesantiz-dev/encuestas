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
        $exist = "SELECT *FROM t_alumnos WHERE nombre_usuario = '$username' LIMIT 1";
        $request_esist = $this->select($exist);
        $request;
        if($request_esist){
            $request = $request_esist;
        }else{
            $sql_datos_alumno = "INSERT INTO t_alumnos (nombre_usuario,nombre,apellidos) VALUES (?,?,?)";
            $request_datos_alumno = $this->insert($sql_datos_alumno,array($username,$nombre,$apellidos));

        }
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
            $request_docente = $this->insert($sql_docente,array($id_user,$username,$nombre,$apellidos));  
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
        t_subcategoria_preguntas.id_categoria  = t_categorias_preguntas.id
        WHERE t_preguntas.id_encuesta = 2";
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
        $resultados;
        $resultados['0'] = 1;
        $resultados['1'] = 2;
        $resultados['2'] = 3;
        $resultados['3'] = 4;
        foreach($data['res'] as $valores){
            $id_pregunta = $valores['id_pregunta'];
            $respuesta = $valores['respuesta'];
            $sql = "INSERT INTO t_respuestas(id_encuesta,id_pregunta,id_materia,id_docente,id_alumno,id_opcion_respuesta,estatus,tiempo_dedicado)
            VALUES (?,?,?,?,?,?,?,?)";
            $this->insert($sql,array(2,$id_pregunta,$id_materia_bd,$id_docente_bd,$id_usuario_bd,$resultados[$respuesta],1,100));
        }
        return $data;


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
        return $data;

    }
    /*Guardar resultados Evaluacion Modelo Educativo */
    public function guardarResultadoModeloEducativoBD($data){
        $idDocente = $data['dat'][0]['idbd'];
        foreach ($data['res'] as $value) {
            $numPregunta = $value['id_pregunta'];
            $opcionRespuesta = $value['respuesta'];
            $idOpcionRespuesta = $value['idOpcionSel'];
            $sql = "INSERT INTO t_respuestas_evaluacion_modelo_educativo (id_encuesta,id_pregunta,id_docente,id_opcion_respuesta,estatus,tiempo_dedicado)
                VALUES (?,?,?,?,?,?)";
            $this->insert($sql,array(6,$numPregunta,$idDocente,$idOpcionRespuesta,1,100));
        }
        return $data;
    }

    public function guardarResultadoHetero_ev_des_prog_BD($data){
        $usuario = $data['dat'][0]['u'];
        $idEncuesta = $data['dat'][0]['id'];
        $plataforma = $data['dat'][0]['p'];
        $sql_alumno = "SELECT id FROM t_alumnos WHERE nombre_usuario = '$usuario'";
        $id_alumno = $this->select($sql_alumno);
        foreach ($data['res'] as $key => $value) {
            $tipo = $value['tipo'];
            if($tipo == "array"){
                foreach ($value['datos'] as $key => $valores) {
                    $sql_c = "INSERT INTO t_respuestas_hetero_ev_des_prog (id_encuesta,id_pregunta,id_alumno,opcion_respuesta,plataforma)
                    VALUES (?,?,?,?,?)";
                    $this->insert($sql_c,array($idEncuesta,$valores['id_pregunta'],$id_alumno['id'],$valores['respuesta'],$plataforma));
                }
            }else{
                $id_pregunta = $value['id_pregunta'];
                $respuesta = $value['respuesta'];
                $sql = "INSERT INTO t_respuestas_hetero_ev_des_prog (id_encuesta,id_pregunta,id_alumno,opcion_respuesta,plataforma)
                    VALUES (?,?,?,?,?)";
                $this->insert($sql,array($idEncuesta,$id_pregunta,$id_alumno['id'],$respuesta,$plataforma));

            }
            
        }
        return $data;
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
        WHERE t_preguntas.id_encuesta = 5 LIMIT 5";
		$request = $this->select_all($sql);
		return $request;
    }

    function estatusEncuestaAutoEvDocente($data){
        $estatusParticipado = 1;
        $estatusNoParticipado = 0;
        $sql = "SELECT id_docente FROM t_respuestas_autoevaluacion_docente WHERE id_docente = $data LIMIT 1";
        $request = $this->select($sql);
        if($request){
            return $estatusParticipado;
        }else{
            return $estatusNoParticipado;
        }
    }
    function estatusEncuestaModeloEducativo($data){
        $estatusParticipado = 1;
        $estatusNoParticipado = 0;
        $sql = "SELECT id_docente FROM t_respuestas_evaluacion_modelo_educativo WHERE id_docente = $data LIMIT 1";
        $request = $this->select($sql);
        if($request){
            return $estatusParticipado;
        }else{
            return $estatusNoParticipado;
        }
    }
    //Select a Preguntas del Modelo Educativo
    function selectPreguntasModeloEducativo(){
        $sql = "SELECT pr.id,pr.nombre_pregunta,sub.nombre_subcategoria FROM t_preguntas AS pr
        INNER JOIN t_subcategoria_preguntas AS sub ON pr.id_subcategoria = sub.id
        WHERE pr.id_encuesta = 6";
        $request = $this->select_all($sql);
        return $request;
    }
    //select a Opciones de Respuestas del Modelo Educativo
    function selectOpcionesModeloEducativo(){
        $sql = "SELECT *FROM t_opciones_respuestas_opcion_multiple";
        $request = $this->select_all($sql);
        return $request;
    }
    //Select a Lista de Encuestas Activas de Alumnos
    function consultarListaEncuestasAlumno(){
        $sql = "SELECT enc.id, enc.nombre_encuesta, enc.descripcion, enc.estatus FROM t_encuesta AS enc
        INNER JOIN t_categoria_persona AS cat ON enc.id_categoria_persona = cat.id
        WHERE cat.nombre_categoria_persona = 'Alumno' ORDER BY id DESC";
        $request = $this->select_all($sql);
        return $request;
    }
    
    function getPreguntasHeteroEvDesProg($data){
        //$sql = "SELECT preg.id,preg.nombre_pregunta,preg.id_encuesta,preg.id_subcategoria,preg.tipo_opcion_respuesta,
        //op.identificador,op.nombre_respuesta,op.puntos,op.id_pregunta FROM t_preguntas_hetero_ev_des_prog AS preg
        //INNER JOIN t_opciones_respuestas_hetero_ev_des_prog AS op ON op.id_pregunta = preg.id
        //WHERE preg.id_encuesta = 7";
        $idEncuesta = $data['id_encuesta'];
        $sql = "SELECT preg.id,preg.nombre_pregunta,preg.id_encuesta,preg.id_subcategoria,preg.tipo_opcion_respuesta FROM t_preguntas_hetero_ev_des_prog AS preg
        WHERE preg.id_encuesta = $idEncuesta";
        $request = $this->select_all($sql);
        return $request;
    }
    function selectOpcionesHeteroEcDesProg($datos){
        $idEncuesta = $datos['id_encuesta'];
        $sql = "SELECT preg.id,op.identificador,op.nombre_respuesta,op.puntos,op.id_pregunta,op.nombre_inciso FROM t_preguntas_hetero_ev_des_prog AS preg
        INNER JOIN t_opciones_respuestas_hetero_ev_des_prog AS op ON op.id_pregunta = preg.id
        WHERE preg.id_encuesta = $idEncuesta";
        $request = $this->select_all($sql);
        return $request;
    }
    function selectStatusEncuesta($id, $u){
        $sql = "SELECT * FROM t_alumnos 
        WHERE nombre_usuario = '$u'";
        $request = $this->select($sql);
        $id_alumno = $request['id'];
        $sql_a = "SELECT * FROM t_respuestas_hetero_ev_des_prog WHERE id_encuesta = $id AND id_alumno = $id_alumno";
        $request_a = $this->select_all($sql_a);
        if($request_a){
            return "contestado";
        }
    }
}
?>