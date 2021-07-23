var data_respuestas = [];
var data_datos = [];
let url = new URLSearchParams(location.search);
var id = url.get('id');
var plataforma = url.get('p');
var usuario = url.get('u');
data_datos.push({id:id,plataforma:plataforma,usuario:usuario});
$(document).ready(function(){
    
    var current_fs, next_fs, previous_fs; //fieldsets
    var opacity;
    var current = 1;
    var steps = $("fieldset").length;
    setProgressBar(current);
    $(".next").click(function(){
        current_fs = $(this).parent();
        next_fs = $(this).parent().next();
        //Add Class Active
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now) {
                // for making fielset appear animation
                opacity = 1 - now;
                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                next_fs.css({'opacity': opacity});
            },
            duration: 500
        });
        setProgressBar(++current);
        
        
    });

    $(".previous").click(function(){
        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();
        //Remove class active
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
        //show the previous fieldset
        previous_fs.show();
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now) {
                // for making fielset appear animation
                opacity = 1 - now;
                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                previous_fs.css({'opacity': opacity});
            },
            duration: 500
        });
        setProgressBar(--current);
    });
    $(".finalize").click(function(){ 
 
        if(data_respuestas.length == steps-1){
            Swal.fire({
                title: 'Enviar todo y terminar?',
                text: "Enviar todo y guardar los resultados",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, terminar'
                }).then((result) => {
                if (result.isConfirmed) {
                    guardarDatos();
                    Swal.fire(
                    'Terminado',
                    'Gracias por contestar.',
                    'success'
                    ).then((result) =>{
                        if(result.isConfirmed){
                            
                            window.close();        
                        }
                    }) 
                }
                })          
        }else{
            Swal.fire(
                'Te falta preguntas por responder',
                'Reponde todas las preguntas',
                'warning'
              )
        }
    })
    function setProgressBar(curStep){
        var percent = parseFloat(100 / steps) * curStep;
        percent = percent.toFixed();
            $(".progress-bar").css("width",percent+"%")
    }
    $(".submit").click(function(){
        return false;
    })
});


const option_list = document.querySelector(".option_list");
const seccion_list = document.querySelector("section");
let tickIconTag = '<div class="icon tick"><i class="fas fa-check"></i></div>';
function optionSelected(answer){
    let p = answer.id;
    let indice = p.indexOf("+");
    let pre = p.substring(0,indice);
    var d = document.getElementById(p);
    answer.insertAdjacentHTML("beforeend", tickIconTag);
    const allOptions = option_list.children.length;
    d.className += " correct";
    let opcion_s = p.split("+");
    data_respuestas.push({id_pregunta:pre,respuesta:opcion_s[1]});
    for(i=0;i<allOptions;i++){
        var d = document.getElementById(pre+"+"+i);
        d.className += " disabled";
    }
}
function guardarDatos(){
    const respuestas_preguntas = JSON.stringify(data_respuestas);
    const datos_usuario = JSON.stringify(data_datos);
    let url = base_url+"/Home/recRespuestasHeteroevaluacionAlumno?res="+respuestas_preguntas+"&dat="+datos_usuario;
    fetch(url)
            .then(res => res.json())
            .then((out) => {
                console.log(out);
            })
            .catch(err => { 
            
                throw err; 
        });   
}

function enviar(answer){
    console.log(answer);
}

document.addEventListener("DOMContentLoaded",function(){
    Swal.fire({
        title: 'Mensaje',
        text: 'Estimado(a) estudiante, tu opinión acerca de la forma como el dicente organiza, desarrolla y evalúa el curso es muy importante para nuestra institución educativa. A continuación se presenta una serie de aspectos relevantes en este sentido, para que valores el desempeño del docente con la mayor objetividad posible, seleccionando cada aspecto la opción que mejor respresente tu opinión.',
      })
})