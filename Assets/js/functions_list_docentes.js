document.addEventListener('DOMContentLoaded', function(){
	tableRoles = $('#tableAlumnos').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Admin/getDocentes",
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
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
	    "order": [[ 0, "desc" ]],
	    "iDisplayLength": 25
    });

	

});
$('#tableAlumnos').DataTable();
