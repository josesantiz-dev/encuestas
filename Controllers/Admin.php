<?php
	error_reporting(E_ALL ^ E_NOTICE);
    
    class Admin extends Controllers{
        public function __construct(){
            parent::__construct();
        }


        public function admin(){
            $data['page_tag'] = "Administrar Encuestas";
			$data['page_title'] = "Administrar Encuestas";
			$data['page_name'] = "administrar encuestas";
            $data['page_functions_js'] = "functions_administrar_encuestas.js";
			$this->views->getView($this,"administrar_encuestas",$data);
        }
        
        public function AdministrarEncuestas(){
            $data['page_tag'] = "Administrar Encuestas";
			$data['page_title'] = "Administrar Encuestas";
			$data['page_name'] = "administrar encuestas";
            $data['page_functions_js'] = "functions_administrar_encuestas.js";
            $this->views->getView($this,"administrar_encuestas",$data);

        }
        public function ListaDocentes(){
            $data['page_tag'] = "Lista de Docentes";
			$data['page_title'] = "Lista de Docentes";
			$data['page_name'] = "lista de docentes";
            $data['page_functions_js'] = "functions_lista_docentes.js";
            $this->views->getView($this,"lista_docentes",$data);
        }

        public function ListaAlumnos(){
            $data['page_tag'] = "Lista de Estudiantes";
			$data['page_title'] = "Lista de Estudiantes";
			$data['page_name'] = "lista de estudiantes";
            $data['page_functions_js'] = "functions_lista_estudiantes.js";
            $this->views->getView($this,"lista_estudiantes",$data);
        }

        //Mostrar Vista de Cada Reporte
        public function reporteEncuesta(){
            $data['page_tag'] = "Reportes";
			$data['page_title'] = "Reportes de Encuestas";
			$data['page_name'] = "Reportes";
            $data['id'] = $_GET['id'];
            $data['datos_encuesta'] =  $this->model->selectEncuesta($_GET['id']);
            $data['page_functions_js'] = "functions_reportes.js";
            if($_GET['id'] == 2){
                $this->views->getView($this,"reporteHeteroEvaluacionAlumno",$data);
            }if($_GET['id'] == 1){
                $this->views->getView($this,"reporteAutoEvaluacionDocente",$data);
            }if($_GET['id'] == 6){
                $this->views->getView($this,"reporteModeloEducativo",$data);
            }if($_GET['id'] == 7){
                $data['page_functions_js'] = "functions_reporte_hetero_ev_des_prog.js";
                $this->views->getView($this,"reporteHeteroEvaluacionEvDesProg",$data);
            }
    
        }



        //Obtener lista de Encuestas
        public function getEncuestas(){
            $arrData = $this->model->selectEncuestas();
            for ($i=0; $i < count($arrData); $i++) {
                if($arrData[$i]['estatus'] == 1)
				{   
					$arrData[$i]['estatus'] = '<span class="badge badge-success">Activo</span>';
                    $arrData[$i]['options'] = '<div class="text-center">
                    <button class="btn btn-secondary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Ver" onclick="reporteEncuesta(this)"><i class="fas fa-eye"></i></button>
				    </div>';
				}else{
					$arrData[$i]['estatus'] = '<span class="badge badge-danger">Inactivo</span>';
                    $arrData[$i]['options'] = '<div class="text-center">
                    <button class="btn btn-secondary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Ver" onclick="reporteEncuesta(this)" disabled><i class="fas fa-eye"></i></button>
				    </div>';
				}
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();

        }
        
        public function getDocentes(){
            $arrData = $this->model->selectDocentes();                                  
                for ($i=0; $i < count($arrData); $i++) {
                    $arrData[$i]['nombre'] = $arrData[$i]['nombre_docente']." ".$arrData[$i]['apellidos_docente'];
                    $arrData[$i]['options'] = '<div class="text-center">
                    <a href="Admin/reporte?id='.$arrData[$i]['id'].'"><button class="btn btn-primary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Permisos" disabled>Ver</button></a>
                    </div>';
                }
                echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
                die();
        }
        public function getEstudiantes(){
            $arrData = $this->model->selectEstudiantes();                                  
                for ($i=0; $i < count($arrData); $i++) {
                    $arrData[$i]['options'] = '<div class="text-center">
                    <a href="Admin/reporte?id='.$arrData[$i]['id'].'"><button class="btn btn-primary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Permisos" disabled>Ver</button></a>
                    </div>';
                }
                echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
                die();
        }

        /*Obtener lista de Participantes en HeteroEvaluacion Docente*/
        public function getHeteroEvaluacionDocente(){
            $id = $_GET['id'];
            $arrData = $this->model->selectheteroEvalaucionDocente($id);
            for ($i=0; $i < count($arrData); $i++) {
                $arrData[$i]['numeracion'] = $i+1;
                $arrData[$i]['nombreDocente'] = $arrData[$i]['nombre_docente']." ".$arrData[$i]['apellidos_docente'];
                $arrData[$i]['options'] = '<div class="text-center">
                <button class="btn btn-secondary btn-sm" rl="'.$arrData[$i]['id_materia'].'" m="'.$arrData[$i]['nombreDocente'].'" d="'.$arrData[$i]['nombre_materia'].'" title="Ver" onclick="reporteEncuesta(this)"><i class="fas fa-eye"></i></button>
				</div>';
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }

        /*Obtener lista de Participantes en HeteroEvaluacion Docente*/
        public function getAutoEvaluacionDocente(){
            $id = $_GET['id'];
            $arrData = $this->model->selectAutoEvaluacionDocente($id);
            for ($i=0; $i < count($arrData); $i++) {
                $arrData[$i]['numeracion'] = $i+1;
                $arrData[$i]['nombreDocente'] = $arrData[$i]['nombre_docente']." ".$arrData[$i]['apellidos_docente'];
                $arrData[$i]['options'] = '<div class="text-center">
                <button class="btn btn-secondary btn-sm" rl="'.$arrData[$i]['id'].'" n="'.$arrData[$i]['nombreDocente'].'" title="Ver" onclick="reporteEncuestaAutoEvalaucionDocente(this)"><i class="fas fa-eye"></i></button>
				</div>';
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        /*Obtener Resultados de la Encuesta de un Docente */
        public function getResultadosAutoEvaluacionDocente(){
            $id = $_GET['id'];
            $arrData = $this->model->selectRespuestasAutoEvaluacionDocente($id);
            for ($i=0; $i < count($arrData); $i++) {
                if($arrData[$i]['nombre_respuesta'] =='PR'){
                    $arrData[$i]['nombre_respuesta'] = 'Prioritario';
                }if($arrData[$i]['nombre_respuesta'] =='AL'){
                    $arrData[$i]['nombre_respuesta'] = 'Alto';
                }if($arrData[$i]['nombre_respuesta'] =='ME'){
                    $arrData[$i]['nombre_respuesta'] = 'Medio';
                }if($arrData[$i]['nombre_respuesta'] =='BA'){
                    $arrData[$i]['nombre_respuesta'] = 'Bajo';
                }if($arrData[$i]['nombre_respuesta'] =='NM'){
                    $arrData[$i]['nombre_respuesta'] = 'Necesita Mejorar';
                }
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }

        /*Obtener el Reporte General de la Encuesta AutoEvaluacionDocente*/
        public function getReporteGeneralAutoEvaluacionDocente(){
            $arrData = $this->model->selectReporteGralAutoEvaluacionDocente();
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }

        public function getRespuestasPreguntaIndividual(){
            $id = $_GET['id'];
            $arrData = $this->model->selectRespuestasPreguntaIndivisual($id);
            for ($i=0; $i < count($arrData); $i++) {
                if($arrData[$i]['nombre_respuesta'] =='PR'){
                    $arrData[$i]['nombre_respuesta'] = 'Prioritario';
                }if($arrData[$i]['nombre_respuesta'] =='AL'){
                    $arrData[$i]['nombre_respuesta'] = 'Alto';
                }if($arrData[$i]['nombre_respuesta'] =='ME'){
                    $arrData[$i]['nombre_respuesta'] = 'Medio';
                }if($arrData[$i]['nombre_respuesta'] =='BA'){
                    $arrData[$i]['nombre_respuesta'] = 'Bajo';
                }if($arrData[$i]['nombre_respuesta'] =='NM'){
                    $arrData[$i]['nombre_respuesta'] = 'Necesita Mejorar';
                }
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getListaParticipantesModeloEducativo(){
            $arrData = $this->model->selectListaParticipantesModeloEducativo();
            for ($i = 0; $i < count($arrData); $i++){
                $arrData[$i]['numeracion'] = $i+1;
                $arrData[$i]['nombreDocente'] = $arrData[$i]['nombre_docente']." ".$arrData[$i]['apellidos_docente'];
                $arrData[$i]['options'] = '<div class="text-center">
                <button class="btn btn-secondary btn-sm" rl="'.$arrData[$i]['id_docente'].'" n="'.$arrData[$i]['nombreDocente'].'" title="Ver" onclick="reporteIndModeloEduvativo(this)"><i class="fas fa-eye"></i></button>
				</div>';
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getReporteIndModeloEducativo(){
            $idDocente = $_GET['id'];
            $arrData = $this->model->selectResIndModeloEduvativo($idDocente);
            for ($i=0; $i < count($arrData); $i++) {
                if($arrData[$i]['puntuacion'] == 1){
                    $arrData[$i]['resultado'] = '<span class="badge badge-success">Correcto</span>';
                }else{
                    $arrData[$i]['resultado'] = '<span class="badge badge-danger">Incorrecto</span>';
                }
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getReporteGeneralModeloEducativoDocente(){
            $arrData = $this->model->selectReporteGralModeloEducativoDocente();
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        //Obtener el Total de Participantes de la Encuesta en una Materia
        public function getTotalParticipantesEncuesta(){
            $id = $_GET['id'];
            $arrData = $this->model->selectTotalPartEncMateria($id);
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }

        /*Obtener Respuestas*/
        public function getRespuestas(){
            $id = $_GET['id'];
            $arrData = $this->model->selectRespuestas($id);
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }







        /*Obtener Respuestas Global*/
        public function getRespuestasGlobalPlataforma(){
            $idEncuesta = $_GET['id'];
            $plataforma = $_GET['pl'];
            $arrData = $this->model->selectRespuestasGlobalPlataforma($idEncuesta,$plataforma);
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }













        public function getParticipantesHeteroevaluacion($idMateria)
        {
            $id = $idMateria;
            $arrData = $this->model->selectListaParticipantesHeteroevaluacion($id);
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }

        public function getPregResp()
        {
            $idAlum = $_GET['idAl'];
            $idMat = $_GET['idMat'];
            $arrData = $this->model->selectPreguntasRespuestas($idAlum, $idMat);
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }
        
        public function reporte(){
            $data['page_functions_js'] = "functions_list_materias_docentes.js";
            $this->views->getView($this,"reporte",$data);

        }
        
        public function getMaterias(){
            $id = $_GET['id'];
            $arrData = $this->model->selectMaterias($id);
            for($i = 0; $i<count($arrData); $i++){
                $arrData[$i]['options'] = '<div class="text-center">
                    <a href="viewpdf?id='.$arrData[$i]['id'].'" target=”_blank”><button class="btn btn-primary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Permisos">Reporte</button></a>
                    </div>';
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        // public function viewpdf(){
        //     $this->views->getView($this,"viewpdf",$data);
        // }

        //Obtener Lista de Alumnos que han Contestado Encuesta en Heteroevaluacion - Evaluacion del Desempeño del Pograma
        public function getAlumnosHeteroEvDesProg(){
            $arrData = $this->model->selectAlumnosHeteroEvDesProg();

            for($i = 0; $i<count($arrData); $i++){
                $arrData[$i]['numeracion'] = $i+1;
                $arrData[$i]['options'] = '
                <div class="text-center">
                <button type="button" class="btn btn-primary btn-sm" rl="'.$arrData[$i]['nombre_completo'].'" n="'.$arrData[$i]['id_alumno'].'" onclick="reporteIndModeloEduvativo(this)" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-eye"></i>
                    Ver
                </button>
				</div>';
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getTotalParticipantesPlantelHetEvDesProg(){
            $arrData = $this->model->selectTotalParticipantesPlantelHetEvDesPro();
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getRespuestasAlumnoHetEvDesProg(){
            $id = $_GET['id'];
            $arrData = $this->model->selectRespuestasAlumnoHetEvDesProg($id);
            /* $array;
            $array1;
            foreach ($arrData as $key => $value) {
               if($array[$value['id']] == ""){
                   $array[$value['id']] = 0;
               }
               $array[$value['id']] += 1;
            } 
            foreach ($array as $key => $value) {
                if($value <= 1){
                    //$array1[$key] = $value;
                    foreach ($arrData as $key1 => $value1) {
                        $array1[$key] = $value1;
                    }
                }
            } */
            /* foreach ($arrData as $key => $value) {
                if($preguntasRepetidas[$value['id']] == ""){
                    $preguntasRepetidas[$value['id']] = 0;
                }
                $preguntasRepetidas[$value['id']] += 1;
            } */
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getOpcionResHetEvDesProg(){
            $id = $_GET['id'];
            $arrData = $this->model->selectOpRespuestasAlumnoHetEvDesProg($id);
            $array;
            foreach ($arrData as $key => $value) {
                $array[0] .= "*".$value['nombre_respuesta']."<br>";
                $array[1] = $value['nombre_pregunta'];
            }
            echo json_encode($array,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getOpcionResHetEvDesProg1(){
            $id = $_GET['id'];
            $idP = $_GET['idP'];
            $arrData = $this->model->selectOpRespuestasAlumnoHetEvDesProg1($id,$idP);
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getNumeroHetEvDesProgPorPlantel(){
            $idEn = $_GET['id'];
            $Pla = $_GET['pl'];
            $arrData = $this->model->selectNumeroHetEvDesPorPlantel($idEn,$Pla);
            $array;
            foreach ($arrData as $key => $value) {
                $idPregunta = $value['id_pregunta'];
                $valor = $this->model->selectrespuestasHetEvDesProPorPlantel($idPregunta,$Pla);
                $respuestas;
                $puntuacion = 0;
                foreach ($valor as $key1 => $value1) {
                    if($respuestas[$value1['nombre_respuesta']] == null){
                        $respuestas[$value1['nombre_respuesta']] = 0; 
                    }
                    $respuestas[$value1['nombre_respuesta']] += 1;
                    $puntuacion += $value1['puntos'];
                }
                arsort($respuestas);
                $array[$key] =  array('id_pregunta' => $idPregunta,'nombre_pregunta' => $valor[0]['nombre_pregunta'],'respuestas' => $respuestas,'puntos_totales' => $puntuacion);
                $respuestas = array();

            }
            echo json_encode($array,JSON_UNESCAPED_UNICODE);
            die();
        }
        public function getReporteHetEvDesProgGral(){
            $idEncuesta = $_GET['idEncuesta'];
            $arrData = $this->model->selectNumeroHetEvDesGeneral($idEncuesta);
            $array;
            foreach ($arrData as $key => $value) {
                $idPregunta = $value['id_pregunta'];
                $valor = $this->model->selectrespuestasHetEvDesProGeneral($idPregunta);
                $respuestas;
                $puntuacion = 0;
                foreach ($valor as $key1 => $value1) {
                    if($respuestas[$value1['nombre_respuesta']] == null){
                        $respuestas[$value1['nombre_respuesta']] = 0; 
                    }
                    $respuestas[$value1['nombre_respuesta']] += 1;
                    $puntuacion += $value1['puntos'];
                }
                arsort($respuestas);
                $array[$key] =  array('id_pregunta' => $idPregunta,'nombre_pregunta' => $valor[0]['nombre_pregunta'],'respuestas' => $respuestas,'puntos_totales' => $puntuacion);
                $respuestas = array();

            }
            echo json_encode($array,JSON_UNESCAPED_UNICODE);
            die();
        }


      public function getReporteHetEvDesDocPorPlataforma(){
          $plataforma = $_GET['id'];
          $idEncuesta = $_GET['idenc'];
          $array;
          $totalParticipantes = $this->model->selectTotalPartHetEvDesDocPorPlataforma($plataforma,$idEncuesta);
          $idPreguntas = $this->model->selectIdPreguntasHetEvDesDocPorPlataforma($plataforma,$idEncuesta);
          foreach ($idPreguntas as $key => $value) {
                $idPregunta = $value['id'];
                $arrData = $this->model->selectReporteHetEvDesDocPorPlataforma($plataforma,$idEncuesta,$idPregunta);
                $respuestas;
                $puntuacion = 0;
                foreach ($arrData as $key1 => $value1) {
                    if($respuestas[$value1['nombre_respuesta']] == null){
                        $respuestas[$value1['nombre_respuesta']] = 0; 
                    }
                    $respuestas[$value1['nombre_respuesta']] += 1;
                    $puntuacion += $value1['puntuacion'];
                }
                arsort($respuestas);
                $array[$key] =  array('id_pregunta' => $idPregunta,'nombre_pregunta' => $arrData[0]['nombre_pregunta'],'respuestas' => $respuestas,'puntos_totales' => $puntuacion,'total_participantes' => count($totalParticipantes));
                $respuestas = array();
          }
          echo json_encode($array,JSON_UNESCAPED_UNICODE);
          die();
      }
        
    }

?>