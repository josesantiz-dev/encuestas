document.addEventListener('DOMContentLoaded', function(){
    console.log("Password");
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

