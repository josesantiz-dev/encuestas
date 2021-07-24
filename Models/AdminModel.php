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
    
    /*Obtener Lista de Participantes en AutoEvaluacion Docente*/
    public function selectAutoEvaluacionDocente($data){
        $sql = "SELECT doc.id,doc.nombre_docente,doc.apellidos_docente FROM t_respuestas_autoevaluacion_docente AS aut
        INNER JOIN t_docente AS doc ON aut.id_docente = doc.id
        WHERE aut.id_encuesta = $data
        GROUP BY doc.id,doc.nombre_docente,doc.apellidos_docente HAVING COUNT(*)>1";
        $request = $this->select_all($sql);
        return $request;
    }

    /*Obtener Lista de Participantes en HeteroEvaluacionDocente*/
    public function selectheteroEvalaucionDocente($data){
        /*$sql = "SELECT res.id,res.id_materia,CONCAT(doc.nombre_docente,' ',doc.apellidos_docente)AS nombreDocente,mat.nombre_materia,
        mat.plataforma,mat.nombre_carrera,mat.id AS mat_id FROM t_respuestas AS res
        INNER JOIN t_docente AS doc ON res.id_docente = doc.id
        INNER JOIN t_materias AS mat ON res.id_materia = mat.id
        WHERE res.id_encuesta = $data
        GROUP BY res.id_materia HAVING COUNT(*)>1";*/

        /*$sql = "SELECT res.id,res.id_materia,CONCAT(doc.nombre_docente,' ',doc.apellidos_docente)AS nombreDocente,mat.nombre_materia,
        mat.plataforma,mat.nombre_carrera FROM t_respuestas res 
        INNER JOIN t_docente AS doc ON res.id_docente = doc.id
        INNER JOIN t_materias AS mat ON res.id_materia = mat.id
        WHERE res.id_materia IN (SELECT id_materia FROM t_respuestas res 
        WHERE res.id_encuesta = $data
        GROUP BY res.id_materia  HAVING COUNT(*)>1) LIMIT 1 ";
        */
        $sql = "SELECT res.id_materia,doc.nombre_docente,doc.apellidos_docente,mat.nombre_materia,
        mat.plataforma,mat.nombre_carrera,mat.id AS mat_id FROM t_respuestas AS res
        INNER JOIN t_docente AS doc ON res.id_docente = doc.id
        INNER JOIN t_materias AS mat ON res.id_materia = mat.id
        WHERE res.id_encuesta = $data
        GROUP BY res.id_materia,doc.nombre_docente,doc.apellidos_docente HAVING COUNT(*)>1";
        $request = $this->select_all($sql);
        return $request;
    }

    //Obtener el Total de Participantes en una Enuesta en la Materia
    public function selectTotalPartEncMateria($data){
        $sql = "SELECT COUNT(*) FROM (SELECT id_alumno, COUNT(id) FROM t_respuestas WHERE id_materia = $data
        GROUP BY id_alumno HAVING COUNT(*)>1) t";
        $request = $this->select($sql);
        return $request;
    }

    /*Obtener todas las respuestas*/
    public function selectRespuestas($data){
        $sql = "SELECT res.id_pregunta,res.id_opcion_respuesta,op.nombre_respuesta,op.puntuacion,pr.id_subcategoria,sub.nombre_subcategoria,sub.id_categoria,cate.nombre_categoria FROM t_respuestas AS res
        INNER JOIN t_opciones_respuestas AS op ON res.id_opcion_respuesta = op.id
        INNER JOIN t_preguntas AS pr ON res.id_pregunta = pr.id
        INNER JOIN t_subcategoria_preguntas AS sub ON pr.id_subcategoria = sub.id
        INNER JOIN t_categorias_preguntas AS cate ON sub.id_categoria = cate.id
        WHERE res.id_materia = $data";
        $request = $this->select_all($sql);
        return $request;
    }

    //Obtener todas las respuestas del  AutoEvaluacion Docente por cada Participante
    public function selectRespuestasAutoEvaluacionDocente($data){
        $sql = "SELECT opc.nombre_respuesta,preg.nombre_pregunta,preg.id_subcategoria,sub.nombre_subcategoria FROM t_respuestas_autoevaluacion_docente AS res 
        INNER JOIN t_opciones_respuestas AS opc ON res.id_respuesta = opc.id
        INNER JOIN t_preguntas AS preg ON res.id_pregunta = preg.id
        INNER JOIN t_subcategoria_preguntas AS sub ON preg.id_subcategoria = sub.id
        WHERE res.id_docente = $data ORDER BY sub.id ASC";
        $request = $this->select_all($sql);
        return $request;
    }

    //Obtener todas las respuestas del AutoEvaluacion Docente

    public function selectReporteGralAutoEvaluacionDocente(){
        $sql = "SELECT id_pregunta,COUNT(*) FROM t_respuestas_autoevaluacion_docente
        GROUP BY id_pregunta HAVING COUNT(*)>1";
        $request = $this->select_all($sql);
        return $request;
    }

    public function selectRespuestasPreguntaIndivisual($data){
        $id = $data;
        $sql = "SELECT res.id_pregunta,res.id_respuesta,pr.nombre_pregunta,sub.nombre_subcategoria,opc.nombre_respuesta,COUNT(*) FROM t_respuestas_autoevaluacion_docente res
        INNER JOIN t_preguntas AS pr ON res.id_pregunta = pr.id
        INNER JOIN t_opciones_respuestas AS opc ON res.id_respuesta = opc.id
        INNER JOIN t_subcategoria_preguntas AS sub ON pr.id_subcategoria = sub.id
        WHERE res.id_pregunta = $id
        GROUP BY res.id_respuesta";
        $request = $this->select_all($sql);
        return $request;
    }
    /*
    public function selectReporteGralAutoEvaluacionDocente(){
        $sql = "SELECT res.id_pregunta,opc.id AS id_opcion_respuesta,opc.nombre_respuesta,preg.nombre_pregunta,sub.id AS id_subcategoria,sub.nombre_subcategoria FROM t_respuestas_autoevaluacion_docente AS res
        INNER JOIN t_opciones_respuestas AS opc ON res.id_respuesta = opc.id
        INNER JOIN t_preguntas AS preg ON res.id_pregunta = preg.id
        INNER JOIN t_subcategoria_preguntas AS sub ON preg.id_subcategoria = sub.id";
        $request = $this->select_all($sql);
        return $request;
    }*/

    //Obtener lista de Encuestas
    public function selectEncuestas(){
        $sql = "SELECT enc.id,enc.nombre_encuesta,enc.descripcion,enc.estatus,cat.nombre_categoria_persona,per.nombre_periodo FROM t_encuesta AS enc
        INNER JOIN t_categoria_persona AS cat ON enc.id_categoria_persona = cat.id
        INNER JOIN t_periodo AS per ON enc.id_periodo = per.id ";
        $request = $this->select_all($sql);
        return $request;
    }

    //Obtener datos de una Encuesta mediante ID
    public function selectEncuesta($data){
        $sql = "SELECT *FROM t_encuesta WHERE id = $data";
        $request = $this->select($sql);
        return $request;
    }
}
?>