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
        document.getElementById("valoresTabla").innerHTML +="<tr><td>"+contador+".</td><td>"+key+"</td><td>"+value+"</td><td><button type='button' class='btn btn-primary btn-sm' p='"+key+"' e='"+id+"' onclick='reporteIndModeloEduvativoPorPlataforma(this)'><i class='fas fa-eye'></i>Ver</button></td></tr>";

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
    let url = base_url+"/Admin/getNumeroHetEvDesProgPorPlantel?id="+idEncuesta+"&pl="+plataforma;
    document.getElementById('reportePorPlataforma').innerHTML = "";
    fetch(url)
    .then(res => res.json())
    .then((out) =>{
        out.forEach(element => {
            var idPregunta = element.id_pregunta;
            let url1 = base_url+"/Admin/getRespuestasHetEvDesProgPorPlantel?id="+idPregunta+"&pl="+plataforma;
            fetch(url1)
            .then(res1 => res1.json())
            .then((out1) => {
                //console.log(out1);
                if(out1.length >= 1){
                    document.getElementById('reportePorPlataforma').innerHTML += "<h1 id='pregunta'>"+out1[0].nombre_pregunta+"</h1>";
                    out1.forEach(element => {
                        console.log(element);
                        document.getElementById('reportePorPlataforma').innerHTML += "<h3 id='pregunta'>"+element.nombre_respuesta+" = "+element.puntos+"</h3>";

                    });
                }
            }).catch(err =>{
                throw err;
            });
        });
    }).catch(err =>{
        throw err;
    });

}
