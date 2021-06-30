document.addEventListener('DOMContentLoaded', function(){
	var url = new URLSearchParams(location.search);
	var id = url.get('id');
	tableRoles = $('#tableAlumnos').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getMaterias?id="+id,
            "dataSrc":""
        },
        "columns":[
            {"data":"id_materia"},
			{"data":"nombre_materia"},
			{"data":"plataforma"},
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
	    "order": [[ 0, "desc" ]],
	    "iDisplayLength": 25
    });

	

});
$('#tableAlumnos').DataTable();
