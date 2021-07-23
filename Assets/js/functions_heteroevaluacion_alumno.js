document.addEventListener('DOMContentLoaded', function(){
	tableRoles = $('#tableAlumnos').dataTable( {
		"aProcessing":true,
		"aServerSide":true,
        "language": {
        	"url": " "+base_url+"/Assets/plugins/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Alumnos/getAlumnos",
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
            {"data":"nombrecompleto"},
            {"data":"fecha"},
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
document.addEventListener("visibilitychange", function() {
    console.log( document.visibilityState );
    location.reload();
    if(document.visibilityState == "visible" || document.visibilityState == "hidden"){
        location.reload();
    }
  });
