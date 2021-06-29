<?php
class AdminModel extends Mysql{
    public function __construct(){
        parent::__construct();
    }

    public function selectDocentes(){
            $sql = "SELECT * FROM t_docente";
			$request = $this->select_all($sql);      
                                          
			return $request;
    }
    public function selectReport($data){
        $sql = "SELECT *FROM t_respuestas WHERE id_docente='$data'";
        $request = $this->select_all($sql);
        return $request;
    }
}
?>