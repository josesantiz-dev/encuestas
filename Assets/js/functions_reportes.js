var tableBiblioteca;
let url = new URLSearchParams(location.search);
var u = url.get('id');
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
    respuestas(id);
    let url = base_url+"/Admin/getTotalParticipantesEncuesta?id="+id;
        fetch(url)
            .then(res => res.json())
            .then((out) => {
                document.getElementById("ct-libros").innerHTML = out['COUNT(*)'];
            })
            .catch(err => { throw err });

}
function respuestas(valor){
    let url = base_url+"/Admin/getRespuestas?id="+valor;
    var resultados = new Array;
    fetch(url)
        .then(res => res.json())
        .then((out) => {
            out.forEach(element => {
               var id_subcategoria = element.id_subcategoria;
               if(!resultados.includes(id_subcategoria)){
                   resultados.push(id_subcategoria);
                
               }
            });
        })
        .catch(err => { throw err });
   // console.log(resultados);
}
