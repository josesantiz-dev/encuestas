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
        
    }

?>