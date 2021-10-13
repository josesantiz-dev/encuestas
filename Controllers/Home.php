<?php
	error_reporting(E_ALL ^ E_NOTICE);
	
	class Home extends Controllers{
		public function __construct()
		{
			parent::__construct();
		}
        
        //Funcion Principal */uuuu
		public function home(){
			$data['page_tag'] = "Heteroevaluacion Docente _ SEUAT";
			$data['page_title'] = "Encuestas SEUAT";
			$data['page_name'] = "home";
			$data['page_functions_js'] = "functions_home.js";
			$this->views->getView($this,"Home/login",$data);

		}
        //Funcion para consultar Tokem, Datos del Usuario y sus Materias */
        public function usuario(){
            $username = $_POST['username'];
            $plataforma = $_POST['plataforma'];
            $password = $_POST['password'];
            $rol = $_POST['rol'];
            $data['username'] = $username;
            $data['plataforma'] = $plataforma;
            $data['password'] = $password;
            $token = $this->model->consultarToken($data);
            if($token['token']){
                $data['token'] = $token['token'];
                if($rol == "estudiante"){
                    //consultar datos usuario
                    $datos_usuario = $this->model->consultarDatosUsuario($data);
                    $data['datos'] = $datos_usuario;
                    if($datos_usuario){
                        // guardar datos usuario a la BD 
                        $this->model->guardarDatosAlumnoBD($data);
                        // consultar materias del Alumno 
                        //$materias = $this->model->consultarMateriasAlumno($data);
                        //$data_materias['username'] = $username;
                        //$data_materias['plataforma'] = $plataforma;
                        //$data_materias['materias'] = $materias;
                        //Guardar Docente en la BD
                        //$this->model->guardarDocenteBD($data_materias);
                        //guardar todas las materias en la _BD 
                        //$this->model->guardarMateriasBD($data_materias);
                        // consultar el status de evaluacion de la materia 
                        //$status = $this->model->consultarStatusEncuestaMateria($data_materias);
                        //$data_materias['status'] = $status;
                        $encuestas = $this->model->consultarListaEncuestasAlumno();
                        $data['encuestas'] = $encuestas;
                        // Mostrar vista y enviar Array de datos de la Materias
                        $data['page_functions_js'] = "functions_heteroevaluacion_alumno.js";
                        $this->views->getView($this,"Home/encuestas",$data);

                    }
                }elseif($rol == "docente"){
                    $datos_usuario = $this->model->consultarDatosUsuario($data);
                    $data['datos'] = $datos_usuario;
                    $data['page_tag'] = "Evaluaciones Docente";
                    $data['page_title'] = "Evaluaciones Docente";
                    $data['page_functions_js'] = "functions_docente.js";
                    $data['id_bd_docente'] = $this->model->guardarDocenteEvBD($data);
                    $data['estatus_encuesta_autoevaluacion'] = $this->model->estatusEncuestaAutoEvDocente($data['id_bd_docente'][0]['id']);
                    $data['estatus_encuesta_modelo_educativo'] = $this->model->estatusEncuestaModeloEducativo($data['id_bd_docente'][0]['id']);
                    $this->views->getView($this,"Home/docente",$data);
                    
   
                }else{
                    echo("No tienes acceso al Sistema");
                    
                }
            }else{
                $msessage = base64_encode($token['error']);
				$this->exit($msessage);
            }
        }

        public function encuesta(){

            $datos = $_GET;
            $idEncuesta = base64_decode($datos['id']);
            $username = base64_decode($datos['u']);
            $plataforma = base64_decode($datos['p']);
            $datos['plataforma'] = $plataforma;
            $datos['username'] = $username;
            $datos['id_encuesta'] = $idEncuesta;
            if($idEncuesta == 2){
                $materias = $this->model->consultarMateriasAlumno($datos);
                $datos['materias'] = $materias;
                $this->views->getview($this,"Home/alumno",$datos);
            }else if($idEncuesta == 7){
                $datos['preguntas'] = $this->model->getPreguntasHeteroEvDesProg($datos);
                $datos['opciones'] = $this->model->selectOpcionesHeteroEcDesProg($datos);
                $datos['page_functions_js'] = "functions_heteroevaluacion_ev_des_prog.js";
                $this->views->getview($this,"Home/heteroevaluacion_ev_des_prog",$datos);
            }
        }

        /*Funcion para traer y mostrar todas las preguntas de la evaluacion */
        public function heteroevaluacion_alumno(){
            $data['id_materia'] = $_GET['id'];
            $data['plataforma'] = $_GET['p'];
            $data['usuario'] = base64_decode($_GET['u']);
            $data['materia'] = $this->model->consultarDatosMateria($data);
            $data['page_functions_js'] = "functions_evaluacion_alumno.js";
            $data['preguntas'] = $this->model->consultarPreguntas();
            $this->views->getView($this,"Home/heteroevaluacion_alumno",$data); 
        }	
        
        /* Funcion para la Vista de Autoevaluacion */
        public function autoevaluacion(){
            $datos['preguntas'] = $this->model->consultarPreguntasAutoevaluacion();
            $datos['page_functions_js'] = "functions_autoevaluacion_docente.js";
            $this->views->getView($this,"Home/autoevaluacion_docente",$datos);
            
        }

        /*Funcion para la Vista de Heteroevaluacion */
        public function heteroevaluacion(){
            $datos['preguntas'] = $this->model->consultarPreguntasHeteroevaluacion();
            $datos['page_functions_js'] = "functions_heteroevaluacion_docente.js";
            $this->views->getView($this,"Home/heteroevaluacion_docente",$datos);
            
        }

        public function heteroevaluacion_induccion()
        {

            $this->views->getView($this, "Home/heteroevaluacion_induccion");
        }
        /*Funcion para la Vista de Evaluacion - Modelo Educativo */
        public function modeloEducativo(){
            $datos['preguntas'] = $this->model->selectPreguntasModeloEducativo();
            $datos['opciones'] = $this->model->selectOpcionesModeloEducativo();
            $datos['page_functions_js'] = "functions_evaluacion_modelo_educativo.js";
            $this->views->getView($this,"Home/evaluacion_modelo_educativo",$datos);
            
        }

         /*Funcion para Guardar Respuestas de la Evaluacion a Alumnos */
         public function recRespuestasHeteroevaluacionAlumno(){
            $valor_r = $_GET['res'];
            $valor_d = $_GET['dat'];
            $valor_res = json_decode($valor_r,JSON_UNESCAPED_UNICODE);
            $valor_dat = json_decode($valor_d,JSON_UNESCAPED_UNICODE);
            $valor['res'] = $valor_res;
            $valor['dat'] = $valor_dat;
            $request = $this->model->guardadResultadoHeteroevaluacionAlumnoBD($valor);
            if($request){
                echo json_encode($request, JSON_UNESCAPED_UNICODE);
		        die();
            }
        }

        /*Funcion para Guardar Respuestas de la Evaluacion a Alumnos */
        public function recRespuestasAutoevaluacionDocente(){
            $valor_r = $_GET['res'];
            $valor_d = $_GET['dat'];
            $valor_res = json_decode($valor_r,JSON_UNESCAPED_UNICODE);
            $valor_dat = json_decode($valor_d,JSON_UNESCAPED_UNICODE);
            $valor['res'] = $valor_res;
            $valor['dat'] = $valor_dat;
            $request = $this->model->guardadResultadoAutoEvaluacionDocenteBD($valor);
            if($request){
                echo json_encode($request, JSON_UNESCAPED_UNICODE);
		        die();
            }
        }

        /* Funcion para Guardar Respuestas de la HeteroEvaluacion Docente */
        public function recRespuestasHeteroevaluacionDocente(){
            $valor_r = $_GET['res'];
            $valor_d = $_GET['dat'];
            $valor_res = json_decode($valor_r,JSON_UNESCAPED_UNICODE);
            $valor_dat = json_decode($valor_d,JSON_UNESCAPED_UNICODE);
            $valor['res'] = $valor_res;
            $valor['dat'] = $valor_dat;
            $request = $this->model->guardadResultadoHeteroevaluacionDocenteBD($valor);
            if($request){
                echo json_encode($request, JSON_UNESCAPED_UNICODE);
		        die();
            }
        }

        /*Funcion para Guardar Respuestas de la Evaluacion de Modelo Eductaivo*/
        public function recRespuestasModeloEducativo(){
            $valor_r = $_GET['res'];
            $valor_d = $_GET['dat'];
            $valor_res = json_decode($valor_r, JSON_UNESCAPED_UNICODE);
            $valor_dat = json_decode($valor_d,JSON_UNESCAPED_UNICODE);
            $valor['res'] = $valor_res;
            $valor['dat'] = $valor_dat;
            $request = $this->model->guardarResultadoModeloEducativoBD($valor);
            if($request){
                echo json_encode($request,JSON_UNESCAPED_UNICODE);
                die();
            }
        }

        public function recRespuestasHetero_ev_des_prog(){
            $valor_r = $_GET['res'];
            $valor_d = $_GET['dat'];
            $valor_res = json_decode($valor_r, JSON_UNESCAPED_UNICODE);
            $valor_dat = json_decode($valor_d,JSON_UNESCAPED_UNICODE);
            $valor['res'] = $valor_res;
            $valor['dat'] = $valor_dat;
            $request = $this->model->guardarResultadoHetero_ev_des_prog_BD($valor);
            if($request){
                echo json_encode($request,JSON_UNESCAPED_UNICODE);
                die();
            }
        }

        /* funcion para Cerrar Sesion */
        public function exit($msessage){
            header("Location:".BASE_URL."?message=".$msessage);

        }
        public function salir(){
            header("Location:".BASE_URL);

        }
        public function estadoEncuesta(){
            $id = $_GET['id'];
            $u = $_GET['u'];
            $request = $this->model->selectStatusEncuesta($id,$u);
            echo json_encode($request,JSON_UNESCAPED_UNICODE);
            die(); 
        }
	}
?>