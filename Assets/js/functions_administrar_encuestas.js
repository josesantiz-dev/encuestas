var tableBiblioteca;

document.addEventListener('DOMContentLoaded', function(){

	tableRoles = $('#tableRoles').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	//url:"<?php echo media(); ?>/plugins/Spanish.json"
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getEncuestas",
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
			{"data":"nombre_encuesta"},
			{"data":"descripcion"},
			{"data":"nombre_categoria_persona"},
			{"data":"estatus"},
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
	let id = answer.getAttribute("rl");
	location.href= base_url+"/Admin/reporteEncuesta?id="+id;

}


var idPublico;
var idEstatus;
function AgregarEncuesta(){
	var nombreEncuesta = document.getElementById("nomEncuesta").value;
	var descripcionEncuesta = document.getElementById("desEncuesta").value;
	console.log(nombreEncuesta);
	console.log(descripcionEncuesta);
	console.log(idPublico);
	console.log(idEstatus);
	if(nombreEncuesta =="" && descripcionEncuesta == "" && idEstatus == 'undefined' && idPublico == 'undefined'){
		console.log("hay  datos vacios");
	}else if(nombreEncuesta =="" && descripcionEncuesta == "" && idEstatus == "" && idPublico == ""){
		console.log("hay  datos vacios");
	}
	else{
		console.log("Enviando datos");
	}

}
function opcionPublico(valor){
	idPublico = valor;
}
function optionEstatus(valor){
	idEstatus = valor;
}
