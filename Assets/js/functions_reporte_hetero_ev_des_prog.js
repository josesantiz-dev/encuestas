//Mostrar Lista de Alumnos que han Contestado la Encuesta
document.addEventListener('DOMContentLoaded', function(){
	tableAlumnos = $('#tableAlumnos').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	//url:"<?php echo media(); ?>/plugins/Spanish.json"
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getAlumnosHeteroEvDesProg",
            "dataSrc":""
        },
        "columns":[
            {"data":"numeracion"},
            {"data":"nombre_completo"},
            {"data":"plataforma"},
            {"data":"options"},

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
    obtenerTotalParticipantesPlantel();
    //var ctx = document.getElementById('myChart').getContext('2d');
    document.getElementById('graficacion').innerHTML = '<div class="alert" role="alert" style="background-color:#f8d7da">Click en el boton para ver la Gráfica<div>';
    
    
});
$('#tableAlumnos').DataTable();

const totalAlumno = [];
const plattaformaAlumno = [];
var plataforma = [];
var valores = [];
var idEncuesta;
function obtenerTotalParticipantesPlantel(){
    let url = base_url+"/Admin/getTotalParticipantesPlantelHetEvDesProg";
    fetch(url)
    .then(res => res.json())
    .then((out) => {
        //console.table(out);
        var total = 0;
        out.forEach(element => {
            idEncuesta = element.id_encuesta;
           totalAlumno.push(element.id);
           if(plattaformaAlumno[element.plataforma] == undefined){
               plattaformaAlumno[element.plataforma] = 0;
           }
           plattaformaAlumno[element.plataforma] += 1;
        });
        plataforma = Object.keys(plattaformaAlumno);
        plataforma.push("");
        valores = Object.values(plattaformaAlumno);
        valores.push("0");
        mostrarTabla(idEncuesta);
    })
    .catch(err => { 
        throw err; 
    }); 
    
}
function verGrafica(){
   // console.log(plataforma);
    document.getElementById('graficacion').innerHTML = '<canvas id="myChart" width="auto" height="auto"></canvas><h1></h1>';
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: plataforma,
        datasets: [{
            label: '# Alumnos',
            data: valores,
            backgroundColor: [
                'rgba(255, 99, 132)',
                'rgba(54, 162, 235)',
                'rgba(255, 206, 86)',
                'rgba(75, 192, 192)',
                'rgba(153, 102, 255)',
                'rgba(255, 99, 132)',
                'rgba(54, 162, 235)',
                'rgba(255, 206, 86)',
                'rgba(75, 192, 192)',
                'rgba(153, 102, 255)',
                'rgba(255, 99, 132)',
                'rgba(54, 162, 235)',
                'rgba(255, 206, 86)',
                'rgba(75, 192, 192)',
                'rgba(153, 102, 255)',
                'rgba(255, 159, 64)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
}

function mostrarTabla(id){
    var contador = 0;
    for ( const [key,value] of Object.entries( plattaformaAlumno ) ) {
        contador += 1;
        document.getElementById("valoresTabla").innerHTML +="<tr><td>"+contador+".</td><td>"+key+"</td><td>"+value+"</td><td><button type='button' class='btn btn-primary btn-sm' p='"+key+"' e='"+id+"' t='"+value+"' onclick='reporteIndModeloEduvativoPorPlataforma(this)'><i class='fas fa-eye'></i>Ver</button></td></tr>";

    }
}

function reporteIndModeloEduvativo(answer){
    var nombreCompleto = answer.getAttribute('rl');
    var idAlumno = answer.getAttribute('n');
    document.getElementById('nombreAlumno').innerHTML = nombreCompleto;
    let url = base_url+"/Admin/getRespuestasAlumnoHetEvDesProg?id="+idAlumno;
    let url1 = base_url+"/Admin/getOpcionResHetEvDesProg?id="+idAlumno;
    fetch(url)
    .then(res => res.json())
    .then((out) => {
        document.getElementById('valoresTablaResultadosAlumno').innerHTML = "";
        document.getElementById('valoresTablaResultadosAlumnoAbierta').innerHTML = "";
        out.forEach(element => {
           if(element.tipo_opcion_respuesta == "multiple" && element.id != '8'){
               //console.log(element.id);
               let url2 = base_url+"/Admin/getOpcionResHetEvDesProg1?id="+idAlumno+"&idP="+element.id;
               fetch(url2)
                .then(res => res.json())
                .then((out) => {
                    //console.log(out);
                    document.getElementById('valoresTablaResultadosAlumno').innerHTML += "<tr><td><i class='fas fa-asterisk'></i></td><td>"+out[0].nombre_pregunta+"</td><td>"+out[0].nombre_respuesta+"</td></tr>";
                })
                .catch(err =>{
                    throw err;
                });

           }else if(element.tipo_opcion_respuesta == "multiple" && element.id == '8'){
                
           }else{
               //console.log(element);
                document.getElementById('valoresTablaResultadosAlumnoAbierta').innerHTML += "<tr><td>Pregunta</td><td>"+element.nombre_pregunta+"</td></tr>";
                document.getElementById('valoresTablaResultadosAlumnoAbierta').innerHTML += "<tr><td>Respuesta</td><td>"+element.opcion_respuesta+"</td></tr>";
           }
        });
    })
    .catch(err => { 
        throw err; 
    });
    fetch(url1)
    .then(res => res.json())
    .then((out) => {
        document.getElementById('valoresTablaResultadosAlumno').innerHTML += "<tr><td><i class='fas fa-asterisk'></i></td><td>"+out[1]+"</td><td>"+out[0]+"</td></tr>";

    })
    .catch(err =>{
        throw err;
    });

}

function reporteIndModeloEduvativoPorPlataforma(answer){
    document.querySelector('#cardPorPlataforma').style.display = "block";
    var idEncuesta = answer.getAttribute('e');
    var plataforma = answer.getAttribute('p');
    var totalParticipante = answer.getAttribute('t');
    let url = base_url+"/Admin/getNumeroHetEvDesProgPorPlantel?id="+idEncuesta+"&pl="+plataforma;
    document.getElementById('reportePorPlataforma').innerHTML = "";
    fetch(url)
    .then(res => res.json())
    .then((out) =>{
        var contador = 0;
        out.forEach(element => {
            contador += 1;
            var idPregunta = element.id_pregunta;
            var nombrePregunta = element.nombre_pregunta;
            var respuestas = element.respuestas;
            var puntosTotales = element.puntos_totales;
            
            var htmlPregunta = "<h5 class='card-title'>"+"<b>"+contador+".- </b>"+nombrePregunta+"</h5><br>";
            var htmlTabla = "<div class='row'><div class='col-md-6 col-sm-12'><table class='table table-striped'><thead><tr><th scope='col'>#</th><th scope='col'>Respuesta</th><th scope='col'>Numero de respuestas</th></tr></thead><tbody id='respuestasTabla"+idPregunta+"'></tbody></table></div>";
            var htmlGrafica = "<div class='col-md-6 col-sm-12'><canvas id='oilChart"+idPregunta+"' width='auto' height='auto'></canvas></div></div>";
            if(element.nombre_pregunta != null){
                document.getElementById('reportePorPlataforma').innerHTML += "<div class='card'><div class='card-body'>"+htmlPregunta+htmlTabla+htmlGrafica+"</div></div>";            
            }
            var contadorRespuestas = 0;
            var sizeRespuestas = (Object.entries(respuestas).length);
            for ( const [key,value] of Object.entries( respuestas ) ) {
                contadorRespuestas += 1;
                document.getElementById('respuestasTabla'+idPregunta+'').innerHTML += "<tr><th scope = 'row'>"+contadorRespuestas+"</th><td>"+key+"</td><td>"+value+"</td></tr>";
                if(contadorRespuestas == sizeRespuestas){
                    document.getElementById('respuestasTabla'+idPregunta+'').innerHTML += "<tr><th scope = 'row'><h5>Puntuación (promedio): <b>"+ puntosTotales/totalParticipante+" Puntos</b></h5></th><td></td><td></td></tr>";
                }
            }
        });
        out.forEach(element1 => {
            var nombreRespuestas = [];
            var numeroRespuestas = [];
            for ( const [key,value] of Object.entries(element1.respuestas ) ) {
                nombreRespuestas.push(key);
                numeroRespuestas.push(value);
            }
            var ctx = document.getElementById("oilChart"+element1.id_pregunta);
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: nombreRespuestas,
                    datasets: [{
                      data: numeroRespuestas,
                      backgroundColor: [
                        'rgba(255, 99, 132)',
                        'rgba(54, 162, 235)',
                        'rgba(255, 206, 86)',
                        'rgba(75, 192, 192)',
                        'rgba(153, 102, 255)',
                        'rgba(255, 99, 132)',
                        'rgba(54, 162, 235)',
                        'rgba(255, 206, 86)',
                        'rgba(75, 192, 192)',
                        'rgba(153, 102, 255)',
                        'rgba(255, 99, 132)',
                        'rgba(54, 162, 235)',
                        'rgba(255, 206, 86)',
                        'rgba(75, 192, 192)',
                        'rgba(153, 102, 255)',
                        'rgba(255, 159, 64)'
                      ],
                      hoverOffset: 4
                    }]
                  }  
            });
        });
    }).catch(err =>{
        throw err;
    });

}
