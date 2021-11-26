var data_respuestas = [];
var comentarios = [];
var data_datos = [];
let url = new URLSearchParams(location.search);
var id = url.get('id'); //id_encuesta
var user = url.get('u') //nombre_usuario
var plataforma = url.get('p'); //nombre_plataforma
data_datos.push({id:id,usr:user,plt:plataforma});

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
        var idPregunta = current_fs[0].getElementsByTagName('INPUT')[0].value;
        var comentario = document.getElementById(idPregunta).value;
        comentarios[idPregunta] = comentario;
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
        //hide the current fieldset with styl
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
                title: '¿Enviar todo y terminar?',
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
                    'Has terminado',
                    'Gracias por tu participación.',
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
    let idOption = answer.id;
    let idCompuesto = idOption.split("+");
    let idPregunta = idCompuesto[1]; 
    let idRespuesta = idCompuesto[0]; 
    var divOption = document.getElementById(idOption);
    const allOptions = option_list.children.length;
    divOption.className += " correct";
    data_respuestas[idPregunta] = ({id_pregunta:idPregunta,respuesta:idRespuesta});
    for(i=1;i<=allOptions;i++){
        var d = document.getElementById(i+"+"+idPregunta);
        d.className += " disabled";
    }
}

function guardarDatos(){
    var datos = [];
    const datos_usuario = JSON.stringify(data_datos);
    data_respuestas.forEach(element =>{
        if(element != null)
        {
            var elementos = {id_pregunta:element.id_pregunta,respuesta:element.respuesta,comentario:comentarios[element.id_pregunta]}
            datos.push(elementos);
        }
    });
    const preguntas_respuesta = JSON.stringify(datos);
    
    let url = base_url+"/Home/recRespuestasEvGuias?res="+preguntas_respuesta+"&dat="+datos_usuario;
    fetch(url)
        .then(res => res.json())
        .then((out) => {
            console.log(out);
        })
        .catch(err => {
            throw err;
        });
}