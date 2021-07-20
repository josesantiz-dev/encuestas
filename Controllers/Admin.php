<?php
	error_reporting(E_ALL ^ E_NOTICE);
    
    class Admin extends Controllers{
        public function __construct(){
            parent::__construct();
        }


        public function admin(){
            $data['page_functions_js'] = "functions_list_docentes.js";
			$this->views->getView($this,"dashboard",$data);
        }
        
        public function AdministrarEncuestas(){
            $data['page_tag'] = "Administrar Encuestas";
			$data['page_title'] = "Administrar Encuestas";
			$data['page_name'] = "administrar encuestas";
            $data['page_functions_js'] = "functions_administrar_encuestas.js";
            $this->views->getView($this,"administrar_encuestas",$data);

        }
        public function getEncuestas(){
            $arrData = $this->model->selectEncuestas();
            for ($i=0; $i < count($arrData); $i++) {
                if($arrData[$i]['estatus'] == 1)
				{
					$arrData[$i]['estatus'] = '<span class="badge badge-success">Activo</span>';
				}else{
					$arrData[$i]['estatus'] = '<span class="badge badge-danger">Inactivo</span>';
				}
                $arrData[$i]['options'] = '<div class="text-center">

				<button class="btn btn-secondary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Ver"><i class="fas fa-eye"></i></button>
				<button type="button" class="btn btn-primary btn-sm btnEditRol" data-toggle="modal" data-target="#modalAlumno" rl="'.$arrData[$i]['id'].'" title="Editar"><i class="fas fa-pencil-alt"></i></button>
				</div>';
            }
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
            die();

        }
        
        /*
        public function getDocentes(){
            $arrData = $this->model->selectDocentes();                                  
                for ($i=0; $i < count($arrData); $i++) {
                    $arrData[$i]['options'] = '<div class="text-center">
                    <a href="Admin/reporte?id='.$arrData[$i]['id'].'"><button class="btn btn-primary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Permisos">Ver</button></a>
                    </div>';
                }
                echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
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
        public function viewpdf(){
            $this->views->getView($this,"viewpdf",$data);
        }
        */
        
    }

?>