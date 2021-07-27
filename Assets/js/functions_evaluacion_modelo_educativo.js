var data_respuestas = [];
var data_datos = [];
let url = new URLSearchParams(location.search);
var u = url.get('u');
var id_p = url.get('id');
var nom = url.get('n');
var idbd = url.get('idbd');
data_datos.push({u:u,id_p:id_p,name:nom,idbd:idbd});

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
        
        var contador = 0;
        data_respuestas.forEach(element => {
            contador +=1;
        });
        if(contador == steps-1){
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
                            history.go(-1);
                            
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
function optionSelected(answer){
    let idOpcion = answer.getAttribute('rl');
    let p = answer.id;
    let indice = p.indexOf("+");
    let pre = p.substring(0,indice);
    var d = document.getElementById(p);
    const allOptions = option_list.children.length;
    d.className += " correct";
    let opcion_s = p.split("+");
    var arreglo = ['a','b','c','d'];
    data_respuestas[pre] = ({id_pregunta:pre,respuesta:opcion_s[1],idOpcionSel:idOpcion});
    for(i=0;i<allOptions;i++){
        var d = document.getElementById(pre+"+"+arreglo[i]);
        if(p == pre+"+"+arreglo[i]){
            d.className += " disabled";
        }else{
            d.className = "option";
        }
    }
}
function guardarDatos(){
    var datos = [];
    const datos_usuario = JSON.stringify(data_datos);
    data_respuestas.forEach(element => {
        if(element != null){
            datos.push(element);
        }
    });
    const respuestas_preguntas = JSON.stringify(datos);

    let url = base_url+"/Home/recRespuestasModeloEducativo?res="+respuestas_preguntas+"&dat="+datos_usuario;
    fetch(url)
            .then(res => res.json())
            .then((out) => {
                console.log(out);
            })
            .catch(err => { 
            
                throw err; 
        }); 
    
}

document.addEventListener("DOMContentLoaded",function(){
    Swal.fire({
        title: 'Mensaje',
        text: 'Contestar correctamente las siguientes preguntas, seleccionando una de las opciones enlistadas.',
      })
})