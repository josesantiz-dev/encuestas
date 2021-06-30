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
    public function selectMaterias($data){
        $sql = "SELECT res.id,res.id_materia,mat.nombre_materia,mat.plataforma,doc.nombre_docente,doc.apellidos_docente FROM t_respuestas AS res
        INNER JOIN t_docente AS doc ON res.id_docente = doc.id
        INNER JOIN t_materias AS mat ON res.id_materia = mat.id
        WHERE res.id_docente = '$data' GROUP BY res.id_materia";
        $request = $this->select_all($sql);
        return $request;
    }
}
?>