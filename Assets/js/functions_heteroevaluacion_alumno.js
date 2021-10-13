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
/*document.addEventListener("visibilitychange", function() {
    console.log( document.visibilityState );
    location.reload();
    if(document.visibilityState == "visible" || document.visibilityState == "hidden"){
        location.reload();
    }
  });*/

function estatusEncuesta(amswer){
    var rl = amswer.getAttribute('rl');
    var id = atob(amswer.id);
    var u = atob(amswer.getAttribute('u'));
    let url_a = base_url+'/Home/'+rl;
    let url = base_url+"/Home/estadoEncuesta?id="+id+"&u="+u;
    fetch(url)
            .then(res => res.json())
            .then((out) => {
                if(out == "contestado"){
                    Swal.fire({
                        title: "<h2><b>Contestado</b></h2>", 
                        html: "<span style='font-size: 5em; color: orange;'><i class='fas fa-exclamation-triangle'></i></span><h2>Ya haz contestado esta encuesta</h2><h2>Gracias!</h1>", 
                        confirmButtonText: "Cerrar", 
                        confirmButtonColor:"#0069D9",
                      });

                }else{

                    //window.open(url_a, '_blank');
                    //window.open('http://www.google.com', '_blank');
                    /*$(".btnResponder").on('click', function(){
                        window.open("http://www.someone.com/","_blank");
                    });*/
                    //$('.btnResponder').click(function(){window.open("http://google.com");​​​​})​

                    /*window.open(
                        'https://support.wwf.org.uk/earth_hour/index.php?type=individual',
                        '_blank' // <- This is what makes it open in a new window.
                    );*/

                    location.href=url_a;
                }
            })
            .catch(err => { 
            
                throw err; 
        });
        
}


