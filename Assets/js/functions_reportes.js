//Obtener el Id de la Encuesta mediante GET
let url = new URLSearchParams(location.search);
var u = url.get('id');
var idMateria = "";
////Mostrar en Datatable lista de Docetes Encuestados en Heteroevaluacion Alumno
document.addEventListener('DOMContentLoaded', function(){
	tableRoles = $('#tableRoles').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	//url:"<?php echo media(); ?>/plugins/Spanish.json"
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getHeteroEvaluacionDocente?id="+u,
            "dataSrc":""
        },
        "columns":[
            {"data":"numeracion"},
			{"data":"nombreDocente"},
			{"data":"nombre_materia"},
			{"data":"plataforma"},
			{"data":"nombre_carrera"},
            {"data":"options"}

        ],
        "responsive": true,
	    "paging": true,
	    "lengthChange": true,
	    "searching": true,
	    "ordering": true,
	    "info": true,
	    "autoWidth": false,
	    "scrollY": '42vh',
	    "scrollCollapse": true,
	    "bDestroy": true,
	    "order": [[ 0, "asc" ]],
	    "iDisplayLength": 25
    });


});
$('#tableRoles').DataTable();


//Funcion para obtener total de Participantes de una Encuesta del HeteroEvalaucionDocente*/
function reporteEncuesta(answer){
    let materia = answer.getAttribute("m");
    let docente = answer.getAttribute("d");
    let id = answer.getAttribute("rl");
    document.getElementById("nombreMateria").innerHTML = materia;
    document.getElementById("nombreDocente").innerHTML = docente;
    let url = base_url+"/Admin/getTotalParticipantesEncuesta?id="+id;
        fetch(url)
            .then(res => res.json())
            .then((out) => {
                document.getElementById("ct-libros").innerHTML = out['COUNT(*)'];
                respuestas(id,out['COUNT(*)']);
                mostrarListaParticipantes(id);
            })
            .catch(err => { throw err });
}

function mostrarListaParticipantes(id)
{
    datos = document.querySelector('#datos');
    let url = base_url+'/Admin/getParticipantesHeteroevaluacion/'+id;
    fetch(url)
    .then(response => response.json())
    .then(data =>{
        datos.innerHTML = "";
        idMateria = id;
        for (let i = 0; i < data.length; i++) {
            const nombre = 'ANÓNIMO';
            //const nombre = data[i]['nombre']+" "+data[i]['apellidos'];
            datos.innerHTML += '<tr><td><a href="#" onClick="obtenerRespuestas(this)" rl="'+ data[i]['id_alumno'] +'">' + nombre + '<br></a></td></tr>';
        }
    })
}

function obtenerRespuestas(nombre)
{
    var idAlumno = nombre.getAttribute('rl');
    $('#ModalRespuestas').modal('show');
    document.querySelector('#nombreParticipante').innerHTML = "Nombre participante: " + nombre.text;
    let url = base_url+'/Admin/getPregResp?idAl='+idAlumno+'&idMat='+idMateria;
    fetch(url)
        .then(response => response.json())
        .then(data =>{
            //console.log(data);
            var numero = document.querySelector('#num');
            var contador = 0;
            var coleccion = document.querySelector('#contenido');
            coleccion.innerHTML = "";
            for (let i = 0; i < data.length; i++) {
                var contador = contador+1;
                var respuesta = "";
                if (data[i]['nombre_respuesta'] == 'S') {
                    respuesta = "<span class='badge badge-success'>Siempre</span>";
                }
                else if(data[i]['nombre_respuesta'] == 'CS')
                {
                    respuesta = "<span class='badge badge-info'>Casi siempre</span>";
                }
                else if(data[i]['nombre_respuesta'] == 'AV')
                {
                    respuesta = "<span class='badge badge-warning'>Algunas veces</span>";
                }
                else if(data[i]['nombre_respuesta'] == 'N')
                {
                    respuesta = "<span class='badge badge-danger'>Nunca</span>";
                }
                coleccion.innerHTML += "<tr><td>"+contador+"</td><td class='text-justify'><b>"+data[i]['nombre_pregunta']+"</b></td><td width='200px' class='text-center'>"+respuesta+"</td></tr>"
            }
        })

    //Vaciar los datos de la consulta (preguntas y respuestas con fetch).
}

 //Funcion para obtener las respuestas y sumarlo por categorias
function respuestas(valor,num){
    let url = base_url+"/Admin/getRespuestas?id="+valor;
    let resultados = [];
    fetch(url)
        .then(res => res.json())
        .then((out) => {
            $.each(out,function(index,element){
                
                if(resultados[element.nombre_categoria]==undefined){
                    resultados[element.nombre_categoria] =0;
                }
                resultados[element.nombre_categoria] += parseInt(element.puntuacion,10);
            });
            var valores = [];
            Object.values(resultados).forEach(element => {
                valores.push(element/num);
            });
            var categorias = [];
            categorias = Object.keys(resultados);
            var puntuacionMaxima = [12,84,15,15,21];
            //graficas(categorias,valores,num);
            mostrarTabla(resultados,categorias,puntuacionMaxima,num);

        })
        .catch(err => { throw err });  
}

//Funcion para Mostrar en grafica de barra horizontal resultados de HeteroEvaluacionDocente
function graficas(categorias,sumatorias,num){     
    document.getElementById("myChart").innerHTML = null;  
    var MeSeContext = document.getElementById('myChart').getContext('2d');
    var MeSeData = {
        labels: categorias,
        datasets: [{
            label: "Total de Puntos",
            data: sumatorias,
            backgroundColor: ["#669911", "#119966","#669911", "#119966","#669911"],
            hoverBackgroundColor: ["#66A2EB", "#FCCE56","#66A2EB", "#FCCE56","#66A2EB"]
        }]
    };
    var MeSeChart = new Chart(MeSeContext, {
        type: 'horizontalBar',
        data: MeSeData,
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        min: 1
                    }
                }],
                yAxes: [{
                    stacked: true
                }]
            }
    
        }
    });
}
//Funcion para Mostrar Tabla de Resultados de HeteroEvaluacionDocente
function mostrarTabla(resultados,categorias,puntuacionMaxima,num){
    var contador = 0;
    document.getElementById("valoresTabla").innerHTML = null;
    var total = 0;
    categorias.forEach(element => {
        contador += 1;
        total +=resultados[element]/num; 
        document.getElementById("valoresTabla").innerHTML +="<tr><td>"+contador+".</td><td>"+element+"</td><td><div class='progress progress-xs'><div class='progress-bar progress-bar-danger' style='width: "+(((resultados[element]*100)/puntuacionMaxima[contador-1])/num).toFixed(1)+"%'></div></div></td><td>"+(resultados[element]/num).toFixed(1)+"</td><td>"+(puntuacionMaxima[contador-1]).toFixed(1)+"</td></tr>";

        
        


    });
    document.getElementById("totalPunto").innerHTML ="<div class='text-center'><h3><b>Total:</b> "+(total).toFixed(1)+" de <small>"+147+" puntos</small></h3></div>";
}


//Mostrar en Datatable lista de Docetes Encuestados en Autoevaluacion Docente
document.addEventListener('DOMContentLoaded', function(){
	tableRoles = $('#tableAutoEvaluacionDocente').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	//url:"<?php echo media(); ?>/plugins/Spanish.json"
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getAutoEvaluacionDocente?id="+u,
            "dataSrc":""
        },
        "columns":[
            {"data":"numeracion"},
			{"data":"nombre_docente"},
			{"data":"apellidos_docente"},
            {"data":"options"}

        ],
        "responsive": true,
	    "paging": true,
	    "lengthChange": true,
	    "searching": true,
	    "ordering": true,
	    "info": true,
	    "autoWidth": false,
	    "scrollY": '42vh',
	    "scrollCollapse": true,
	    "bDestroy": true,
	    "order": [[ 0, "asc" ]],
	    "iDisplayLength": 25
    });
});
$('#tableAutoEvaluacionDocente').DataTable();
//Funcion  para reporteEncuestaAutoEvalaucionDocente
function reporteEncuestaAutoEvalaucionDocente(valor){
    let nombre = valor.getAttribute("n");
    let id = valor.getAttribute("rl");
    var contador = 0;
    document.getElementById("nombreDocente").innerHTML =nombre;
    let url = base_url+"/Admin/getResultadosAutoEvaluacionDocente?id="+id;
        fetch(url)
            .then(res => res.json())
            .then((out) => {
                document.getElementById("valoresTablaAutoEvaluacionDocente").innerHTML = null;
                out.forEach(element => {
                    contador +=1;
                    var nombrePregunta = element.nombre_pregunta;
                    var nombreArea = element.nombre_subcategoria;
                    var nivelNecesidad = element.nombre_respuesta;
                    document.getElementById("valoresTablaAutoEvaluacionDocente").innerHTML +="<tr><td>"+contador+".</td><td>"+nombrePregunta+"</td><td>"+nombreArea+"</td><td>"+nivelNecesidad+"</td></tr>";
                });
            })
            .catch(err => { throw err });
}

//Funcion para reporte general de la AutoEvaluacionDocente
reporteGeneralAutoEvaluacionDocente();
function reporteGeneralAutoEvaluacionDocente(){
    let url = base_url+"/Admin/getReporteGeneralAutoEvaluacionDocente";
        fetch(url)
            .then(res => res.json())
            .then((out) => {
                var contador = 0;
                out.forEach(element => {
                    var id = element.id_pregunta;
                    var url_valores = base_url+"/Admin/getRespuestasPreguntaIndividual?id="+id;
                    fetch(url_valores)
                        .then(res => res.json())
                        .then((resultado) => {
                            contador += 1;
                            var nombrePregunta = resultado[0].nombre_pregunta;
                            var nombreSubcategoria = resultado[0].nombre_subcategoria;
                            var cantPrioritario = resultado[0].PR;
                            var cantAlto = resultado[0].AL;
                            var cantMedio = resultado[0].ME;
                            var cantBajo = resultado[0].BA;
                            var cantNecesitaMeorar = resultado[0].NM;
                            //document.getElementById("reporteGeneralAutoEvaluacionDocente").innerHTML +="<tr><td>"+contador+"</td><td>"+nombrePregunta+"</td><td>"+nombreSubcategoria+"</td><td>"+cantPrioritario+"</td><td>"+cantAlto+".</td><td>"+cantMedio+"</td><td>"+cantBajo+"</td><td>"+cantNecesitaMeorar+"</td></tr>";
                            
                        })
                        .catch(err => { throw err });
                        
                        });
                 
                })
            .catch(err => { throw err });
 
}
// reportesModeloEducativo();
// function reportesModeloEducativo(){
//     listaParticipantes();
//     reporteGeneralModeloEducativoDocente();
// }
function listaParticipantes(){
        document.addEventListener('DOMContentLoaded', function(){
            tableRoles = $('#tableListaModeloEducativo').dataTable( {
                "aProcessing":true,
                "aServerSide":true,
                "language": {
                    //url:"<?php echo media(); ?>/plugins/Spanish.json"
                    "url": " "+base_url+"/Assets/plugins/Spanish.json"
                },
                "ajax":{
                    "url": " "+base_url+"/Admin/getListaParticipantesModeloEducativo",
                    "dataSrc":""
                },
                "columns":[
                    {"data":"numeracion"},
                    {"data":"nombre_docente"},
                    {"data":"apellidos_docente"},
                    {"data":"options"}
        
                ],
                "responsive": true,
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "scrollY": '42vh',
                "scrollCollapse": true,
                "bDestroy": true,
                "order": [[ 0, "asc" ]],
                "iDisplayLength": 25
            });
        
        
        });
        $('#tableListaModeloEducativo').DataTable();    
}
function  reporteIndModeloEduvativo(answer){
    const idDocente = answer.getAttribute('rl');
    let docente = answer.getAttribute("n");
    var calificacion;
    document.getElementById("nombreDocente").innerHTML = docente;
    let url = base_url+"/Admin/getReporteIndModeloEducativo?id="+idDocente;
    fetch(url)
        .then(res => res.json())
        .then((resultado) =>{
            var sizeArray = resultado.length;
            var contador = 0;
            document.getElementById("resultadoIndividualModeloEducativo").innerHTML = null;
            resultado.forEach(element => {
                contador += 1;
                if(calificacion==undefined){
                    calificacion =0;
                }
                document.getElementById("resultadoIndividualModeloEducativo").innerHTML +="<tr><td>"+contador+"</td><td>"+element['nombre_pregunta']+"</td><td>"+element['nombre_respuesta']+"</td><td>"+element['resultado']+"</td></tr>";
                calificacion += parseInt(element['puntuacion']);
            });
            var porcentaje = (100*calificacion)/sizeArray;
            porResultado(porcentaje);
            function porResultado(porcentaje) {
                console.log(Number.parseFloat(porcentaje).toFixed(2));
                document.getElementById("totalPunto").innerHTML = "<div class='text-center'><h2><b>"+Number.parseFloat(porcentaje).toFixed(2)+" %</b> de 100%</h2></div>";
                document.getElementById("ct-promedio").innerHTML = Number.parseFloat(porcentaje).toFixed(2)+"%";

              }
        })
}
// function reporteGeneralModeloEducativoDocente(){
//     let url = base_url+"/Admin/getReporteGeneralModeloEducativoDocente";
//     fetch(url)
//         .then(res => res.json())
//         .then((resultado) =>{
//             //console.table(resultado);
//         })
// }
