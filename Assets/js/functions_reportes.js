var tableBiblioteca;
let url = new URLSearchParams(location.search);
var u = url.get('id');
/*
let url1 = base_url+"/Admin/getHeteroEvaluacionDocente?id="+u;
        fetch(url1)
            .then(res => res.json())
            .then((out) => {
                console.log(out);
            })
            .catch(err => { throw err });
            */


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
            })
            .catch(err => { throw err });

}
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
            /*
            out.reduce(function(res,value){
                if(!res[value.id_subcategoria]){
                    res[value.id_subcategoria] = {Id:value.id_subcategoria, id_subcategoria:0};
                    resultados.push(res[value.id_subcategoria])
                }
                res[value.id_subcategoria].puntuacion += value.puntuacion;
                return res;
            });*/
            /*
            out.forEach(element => {
               var id_subcategoria = element.id_subcategoria;
               if(!resultados.includes(id_subcategoria)){
                   resultados.push(id_subcategoria);
               }
            });
            */
            var valores = [];
            Object.values(resultados).forEach(element => {
                valores.push(element/num);
            });
            var categorias = [];
            categorias = Object.keys(resultados);
            var puntuacionMaxima = [12,84,15,15,21];
            graficas(categorias,valores,num);
            mostrarTabla(resultados,categorias,puntuacionMaxima,num);

        })
        .catch(err => { throw err });

   // graficas(resultados);
  
}

// === include 'setup' then 'config' above ===
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

function mostrarTabla(resultados,categorias,puntuacionMaxima,num){
    var contador = 0;
    console.log(num);
    document.getElementById("valoresTabla").innerHTML = null;
    var total = 0;
    categorias.forEach(element => {
        contador += 1;
        total +=resultados[element]/num; 
        document.getElementById("valoresTabla").innerHTML +="<tr><td>"+contador+".</td><td>"+element+"</td><td><div class='progress progress-xs'><div class='progress-bar progress-bar-danger' style='width: "+((resultados[element]*100)/puntuacionMaxima[contador-1])/num+"%'></div></div></td><td>"+puntuacionMaxima[contador-1]+"</td><td><h4><b>"+resultados[element]/num+"</b></h4></td></tr>";

    });
    document.getElementById("totalPunto").innerHTML ="<div class='text-center'><h3><b>Total:</b> "+total+" de <small>"+147+" puntos</small></h3></div>";
}
