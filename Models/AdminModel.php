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

    public function selectEstudiantes(){
        $sql = "SELECT * FROM t_alumnos";
		$request = $this->select_all($sql);   
		return $request;
    }
    
    public function selectheteroEvalaucionDocente($data){
        $sql = "SELECT res.id,CONCAT(doc.nombre_docente,' ',doc.apellidos_docente)AS nombreDocente,mat.nombre_materia,
        mat.plataforma,mat.nombre_carrera,mat.id AS mat_id FROM t_respuestas res
        INNER JOIN t_docente AS doc ON res.id_docente = doc.id
        INNER JOIN t_materias AS mat ON res.id_materia = mat.id
        WHERE res.id_encuesta = $data
        GROUP BY res.id_materia HAVING COUNT(*)>1";
        $request = $this->select_all($sql);
        return $request;
    }

    //Obtener el Total de Participantes en una Enuesta en la Materia
    public function selectTotalPartEncMateria($data){
        $sql = "SELECT COUNT(*) FROM (SELECT COUNT(id) FROM t_respuestas WHERE id_materia = $data
        GROUP BY id_materia HAVING COUNT(*)>1) t";
        $request = $this->select($sql);
        return $request;
    }

    /*Obtener todas las respuestas*/
    public function selectRespuestas($data){
        $sql = "SELECT res.id_pregunta,res.id_opcion_respuesta,op.nombre_respuesta,op.puntuacion,pr.id_subcategoria,sub.nombre_subcategoria FROM t_respuestas AS res
        INNER JOIN t_opciones_respuestas AS op ON res.id_opcion_respuesta = op.id
        INNER JOIN t_preguntas AS pr ON res.id_pregunta = pr.id
        INNER JOIN t_subcategoria_preguntas AS sub ON pr.id_subcategoria = sub.id
        WHERE res.id_materia = $data";
        $request = $this->select_all($sql);
        return $request;
    }
    
    public function selectEncuestas(){
        $sql = "SELECT enc.id,enc.nombre_encuesta,enc.descripcion,enc.estatus,cat.nombre_categoria_persona FROM t_encuesta AS enc
        INNER JOIN t_categoria_persona AS cat ON enc.id_categoria_persona = cat.id ";
        $request = $this->select_all($sql);
        return $request;
    }
    public function selectEncuesta($data){
        $sql = "SELECT *FROM t_encuesta WHERE id = $data";
        $request = $this->select($sql);
        return $request;
    }
}
?>