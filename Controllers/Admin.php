<?php
	error_reporting(E_ALL ^ E_NOTICE);
    
    class Admin extends Controllers{
        public function __construct(){
            parent::__construct();
        }
        public function admin(){
            $data['page_functions_js'] = "functions_reportHeteroEstudiantes.js";
			$this->views->getView($this,"dashboard",$data);
        }

        public function getDocentes(){
            $arrData = $this->model->selectDocentes();                                  
                for ($i=0; $i < count($arrData); $i++) {
                    $arrData[$i]['options'] = '<div class="text-center">
                    <a href="Admin/reporte?id='.$arrData[$i]['id'].'"><button class="btn btn-primary btn-sm btnPermisosRol" rl="'.$arrData[$i]['id'].'" title="Permisos">Reporte</button></a>
                    </div>';
                }
                echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
                die();
        }
        public function reporte(){
            $id = $_GET['id'];
            $this->model->selectReport($id);
            $this->views->getView($this,"reporte",$id);

        }
        
    }

?>