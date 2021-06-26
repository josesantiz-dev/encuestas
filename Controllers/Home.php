<?php
	error_reporting(E_ALL ^ E_NOTICE);
	
	class Home extends Controllers{
		public function __construct()
		{
			parent::__construct();
		}
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
                    /*consultar datos usuario*/
                    $datos_usuario = $this->model->consultarDatosUsuario($data);
                    $data['datos'] = $datos_usuario;
                    if($datos_usuario){
                        /* guardar datos usuario a la BD */
                        $this->model->guardarDatosAlumnoBD($data);
                        /* consultar materias del Alumno */
                        $materias = $this->model->consultarMateriasAlumno($data);
                        $data_materias['username'] = $username;
                        $data_materias['plataforma'] = $plataforma;
                        $data_materias['materias'] = $materias;
                        /*guardar todas las materias en la _BD */
                        $this->model->guardarMateriasBD($data_materias);
                        /*Guardar Docente en la BD*/
                        $this->model->guardarDocenteBD($data_materias);
                        /* consultar el status de evaluacion de la materia */
                        $status = $this->model->consultarStatusEncuestaMateria($data_materias);
                        $data_materias['status'] = $status;
                        /* Mostrar vista y enviar Array de datos de la Materias */
                        $data_materias['page_functions_js'] = "functions_home.js";
                        $this->views->getView($this,"Home/alumno",$data_materias);

                    }
                }elseif($rol == "docente"){
                    $datos_usuario = $this->model->consultarDatosUsuario($data);
                    $data['datos'] = $datos_usuario;
                    $data['page_tag'] = "Evaluaciones Docente";
                    $data['page_title'] = "Evaluaciones Docente";
                    $data['id_bd_docente'] = $this->model->guardarDocenteEvBD($data);
                    $this->views->getView($this,"Home/docente",$data);
                    
   
                }else{
                    echo("No tienes acceso al Sistema");
                    
                }
            }else{
				header("Location:".BASE_URL."?message=".base64_encode($token['error']));
            }
        }

        /*Funcion para traer y mostrar todas las preguntas de la evaluacion */
        public function evaluacion(){
            $data['id_materia'] = $_GET['id'];
            $data['plataforma'] = $_GET['p'];
            $data['usuario'] = base64_decode($_GET['u']);
            $data['materia'] = $this->model->consultarDatosMateria($data);
            $data['page_functions_js'] = "functions_evaluacion.js";
            $data['preguntas'] = $this->model->consultarPreguntas();
            $this->views->getView($this,"Home/heteroevaluacion_alumno",$data);   
            /*
            $request = $this->model->consultaDatosMateria($data);
            if($request){
                $data['datos_materia'] = $request;
                $data['datos_preguntas'] = $this->model->consultarPreguntas();
                $data['page_functions_js'] = "functions_evaluacion.js";
                $this->views->getView($this,"Home/evaluacion",$data);
                //guardar datos del docente de las materias
                $this->model->detDatosDocente($data);
                $this->model->detDatosEncuesta($data);
            }*/
        
        }	
        
        public function recRespuestasPreguntas(){
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

        public function autoevaluacion(){
            $datos['preguntas'] = $this->model->consultarPreguntasAutoevaluacion();
            $datos['page_functions_js'] = "functions_autoevaluacion_docente.js";
            $this->views->getView($this,"Home/autoevaluacion_docente",$datos);
            
        }

        public function heteroevaluacion(){
            $datos['preguntas'] = $this->model->consultarPreguntasHeteroevaluacion();
            $datos['page_functions_js'] = "functions_heteroevaluacion_docente.js";
            $this->views->getView($this,"Home/heteroevaluacion_docente",$datos);
            
        }

        public function exit(){
            header('Location:'.BASE_URL);
        }
	}
?>