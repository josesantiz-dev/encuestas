const totalAlumno = [];
const plattaformaAlumno = [];
var plataforma = [];
var valores = [];
var idEncuesta;
var plataformaSeleccionada = "";
document.addEventListener('DOMContentLoaded', function(){
	tableAlumnos = $('#tableAlumnos').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	//url:"<?php echo media(); ?>/plugins/Spanish.json"
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getEvGuiasParticipantes",
            "dataSrc":""
        },
        "columns":[
            {"data":"numeracion"},
			{"data":"nombre"},
			{"data": "apellidos"},
			{"data":"plataforma"}
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
	fnParticipantesPlataforma();
	document.getElementById('graficacion').innerHTML = '<div class="alert" role="alert" style="background-color:#f8d7da">Click en el boton para ver la Gráfica<div>';


});

$('#tableAlumnos').DataTable();

function fnParticipantesPlataforma(){
	let url = base_url+"/Admin/getParticipantesPlataformaGuias";
	fetch(url).then(res => res.json()).then((out) => {
		var total = 0;
        out.forEach(element => {
            idEncuesta = element.id_encuesta;
           	totalAlumno.push(element.id_alumno);
           	if(plattaformaAlumno[element.plataforma] == undefined){
               	plattaformaAlumno[element.plataforma] = 0;
           	}
           	plattaformaAlumno[element.plataforma] += 1;
        });
        plataforma = Object.keys(plattaformaAlumno);
        plataforma.push("");
        valores = Object.values(plattaformaAlumno);
        valores.reverse();
        valores.push(0);
        mostrarTabla(idEncuesta);
        mostrarReporteGeneral(plattaformaAlumno,idEncuesta);
	}).catch(err => { throw err; }); 
}
function mostrarTabla(id){
    var contador = 0;
    var sortable = [];
    for (var vehicle in plattaformaAlumno) {
        sortable.push([vehicle, plattaformaAlumno[vehicle]]);
    }
    sortable.entries(function(a, b) {
        return a[1] - b[1];
    });
    sortable.forEach(element => {
        contador += 1;
        document.getElementById("valoresTabla").innerHTML +="<tr><td>"+contador+".</td><td>"+element[0]+"</td><td>"+element[1]+"</td><td><button type='button' class='btn btn-primary btn-sm' p='"+element[0]+"' e='"+id+"' t='"+element[1]+"' onclick='reporteIndEvGuiasPorPlataforma(this)'><i class='fas fa-eye'></i>Ver</button></td></tr>";
    });
}

function mostrarReporteGeneral(plattaformaAlumno,idEncuesta){
    var totalParticipantes = 0;
    for ( const [key,value] of Object.entries( plattaformaAlumno ) ) {
        totalParticipantes += value;
    }
   	let url = base_url+"/Admin/getReporteEvGuiasGral?idEncuesta="+idEncuesta;
    document.getElementById('reporteGeneral').innerHTML = "";
    document.getElementById('reporteGeneral').innerHTML = "<div class='col-12 col-sm-6 col-md-3'><div class='info-box mb-3'><span class='info-box-icon bg-warning elevation-1'><i class='fas fa-users'></i></span><div class='info-box-content'><span class='info-box-text'>Total Participantes</span><span class='info-box-number'>"+totalParticipantes+"</span></div></div>";
    fetch(url)
    .then(res => res.json())
    .then((out) => {
        var contador = 0;
        out.forEach(element => {
            contador += 1;
            var idPregunta = element.id_pregunta;
            var nombrePregunta = element.nombre_pregunta;
            var respuestas = element.respuestas;
            var htmlPregunta = "<h5 class='card-title'>"+"<b>"+contador+".- </b>"+nombrePregunta+"</h5><br>";
            var htmlTabla = "<div class='row'><div class='col-md-6 col-sm-12'><table class='table table-striped'><thead><tr><th scope='col' style='width:10%'>#</th><th scope='col'>Respuesta</th><th scope='col'>Numero de respuestas</th></tr></thead><tbody id='respuestasTablaGral"+idPregunta+"'></tbody></table></div>";
            var htmlGrafica = "<div class='col-md-6 col-sm-12'><div id='oilChartGral"+idPregunta+"' width='auto' height='auto'></div></div></div>";
            if(element.nombre_pregunta != null){
                document.getElementById('reporteGeneral').innerHTML += "<div class='card'><div class='card-body'>"+htmlPregunta+htmlTabla+htmlGrafica+"</div></div>";            
            }
            var contadorRespuestas = 0;
            var sizeRespuestas = (Object.entries(respuestas).length);
            for ( const [key,value] of Object.entries( respuestas ) ) {
                contadorRespuestas += 1;
                document.getElementById('respuestasTablaGral'+idPregunta+'').innerHTML += "<tr><th scope = 'row'>"+contadorRespuestas+"</th><td>"+key+"</td><td>"+value+"</td></tr>";
                if(contadorRespuestas == sizeRespuestas){
                    document.getElementById('respuestasTablaGral'+idPregunta+'').innerHTML += "<tr><th scope = 'row'></th><td style='width:100%'><h5>Total participantes: <b>"+ (totalParticipantes)+"</b></h5></td></tr>";
                } 
            }
        });
        out.forEach(element1 => {
            var mostrarRespuestas = [];
            for ( const [key,value] of Object.entries(element1.respuestas ) ) {
                var array = [];
                array.push(key);
                array.push(value);
                mostrarRespuestas.push(array);
            }
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows(mostrarRespuestas);
                var options = {'title':'',
                    'width':'auto',
                    'height':'auto'};
                var chart = new google.visualization.PieChart(document.getElementById("oilChartGral"+element1.id_pregunta));
                chart.draw(data, options);
            }
             
        })
    })
    .catch(err => { 
        throw err; 
    });
    
}
function reporteIndEvGuiasPorPlataforma(answer){
    document.querySelector('#cardPorPlataforma').style.display = "block";
    document.querySelector('#cardReporteGeneral').style.display = "none";
    var idEncuesta = answer.getAttribute('e');
    var plataforma = answer.getAttribute('p');
    var totalParticipante = answer.getAttribute('t');
    let url = base_url+"/Admin/getNumeroHetEvGuiasPorPlantel?id="+idEncuesta+"&pl="+plataforma;
	document.getElementById('reportePorPlataforma').innerHTML = "";
	var platCompuesta = plataforma.split('.');
	var nombrePlataforma = "";
	if(platCompuesta[1] == "sm"){
		nombrePlataforma = capitalizarPrimeraLetra(platCompuesta[0])+" Semestral";
	}else if(platCompuesta[1] == 'ct'){
		nombrePlataforma = capitalizarPrimeraLetra(platCompuesta[0])+" Cuatrimestral";
	}else{
		nombrePlataforma = capitalizarPrimeraLetra(plataforma);
	}
	//console.log(nombrePlataforma);
	document.querySelector('#nombrePlataformaIndividual').innerHTML = "<i class='far fa-chart-bar'> Reporte de la plataforma:   "+nombrePlataforma+"</i>";
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
            var htmlTabla = "<div class='row'><div class='col-md-6 col-sm-12'><table class='table table-striped'><thead><tr><th scope='col' style='width:10%'>#</th><th scope='col'>Respuesta</th><th scope='col'>Numero de respuestas</th></tr></thead><tbody id='respuestasTabla"+idPregunta+"'></tbody></table></div>";
            var htmlGrafica = "<div class='col-md-6 col-sm-12'><div id='oilChart"+idPregunta+"' width='auto' height='auto'></div></div></div>";
            if(element.nombre_pregunta != null){
                document.getElementById('reportePorPlataforma').innerHTML += "<div class='card'><div class='card-body'>"+htmlPregunta+htmlTabla+htmlGrafica+"</div></div>";            
            }
            var contadorRespuestas = 0;
            var sizeRespuestas = (Object.entries(respuestas).length);
            for ( const [key,value] of Object.entries( respuestas ) ) {
                contadorRespuestas += 1;
                document.getElementById('respuestasTabla'+idPregunta+'').innerHTML += "<tr><th scope = 'row'>"+contadorRespuestas+"</th><td>"+key+"</td><td>"+value+"</td></tr>";
                if(contadorRespuestas == sizeRespuestas){
                    //document.getElementById('respuestasTabla'+idPregunta+'').innerHTML += "<tr><th scope = 'row'></th><td style='width:100%'><h5>Puntuación (promedio): <b>"+ (puntosTotales/totalParticipante).toFixed(2)+" Puntos</b></h5></td></tr>";
					document.getElementById('respuestasTabla'+idPregunta+'').innerHTML += "<tr><th scope = 'row'></th><td style='width:100%'><h5>Total participantes: <b>"+ (totalParticipante)+"</b></h5></td></tr>";

                }
            }
        });
        out.forEach(element1 => {
            var mostrarRespuestas = [];
            for ( const [key,value] of Object.entries(element1.respuestas ) ) {
                var array = [];
                array.push(key);
                array.push(value);
                mostrarRespuestas.push(array);
            }
            if(element1.id_pregunta != 8){
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);
                function drawChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Slices');
                    data.addRows(mostrarRespuestas);
                    var options = {'title':'',
                        'width':'auto',
                        'height':'auto'};
                    var chart = new google.visualization.PieChart(document.getElementById("oilChart"+element1.id_pregunta));
                    chart.draw(data, options);
                }
            }else{
                var mostrarRespuestasBarra = [["Element","Alumnos",{role: "style"}]];
                for ( const [key,value] of Object.entries(element1.respuestas ) ) {
                    var array = [];
                    var randomColor = Math.floor(Math.random()*16777215).toString(16);
                    array.push(key);
                    array.push(value);
                    array.push(randomColor);
                    mostrarRespuestasBarra.push(array);
                }
                google.charts.load("current", {packages:['corechart']});
                google.charts.setOnLoadCallback(drawChart);
                function drawChart() {
                    var data = google.visualization.arrayToDataTable(mostrarRespuestasBarra);
                    var view = new google.visualization.DataView(data);
                    view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

                    var options = {
                        width: 600,
                        height: 400,
                        bar: {groupWidth: "95%"},
                            legend: { position: "none" },
                        };
                    var chart = new google.visualization.ColumnChart(document.getElementById("oilChart"+element1.id_pregunta));
                    chart.draw(view, options);
                }
            }    
        })
    }).catch(err =>{
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

function capitalizarPrimeraLetra(str) {
	return str.charAt(0).toUpperCase() + str.slice(1);
  }