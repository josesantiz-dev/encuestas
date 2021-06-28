/* Funcion para ver Password en el Login */
document.addEventListener('DOMContentLoaded', function(){
    verPassword();
});
function verPassword(){
    $(document).ready(function(){
        $('#customControlInline').click(function(){
            if($('#customControlInline').is(':checked')){
                $('#password').attr('type','text');
            }else{
                $('#password').attr('type','password');
            }
        });
    });
}

