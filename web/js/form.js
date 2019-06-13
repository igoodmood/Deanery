(function ($) {
    "use strict";

    /*==================================================================
    [ Focus Contact2 ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })
    })

    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        if (check) {
            $.ajax({
                url: 'feed',
                type: 'post',
                data: {
                    name: document.getElementById('n').value,
                    email: document.getElementById('e').value,
                    mess: document.getElementById('m').value
                },
            });
            alert("Ваше письмо отправлено! Ответ прийдёт на Вашу электронную почту!")
        }
        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
            hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }


    /*==================================================================
    [ Show / hide Form ]*/

    $('.contact100-btn-hide').on('click', function(){
        $('.wrap-contact100').fadeOut(400);
    });

    $('.contact100-btn-show').on('click', function(){
        $('.wrap-contact100').fadeIn(400);
    });

})(jQuery);

$(document).ready(function () {
    get();
});

$('.contact100-btn-show2').on('click', function(){
    alert("h")
});

$('.flash').click(function () {
    window.location = "http://localhost:8080/feed";
});

$('.abit').click(function () {
    window.location = "http://localhost:8080/abit";
});

$('.docer').click(function () {
    window.location = "http://localhost:8080/documents";
});

$('.galer').click(function () {
    window.location = "http://localhost:8080/gallery";
});

$('.potok').click(function () {
    window.location = "http://localhost:8080/students";
});

$('.news').click(function () {
    window.location = "http://localhost:8080/news";
});

document.querySelector('.mini-photo-wrapper').addEventListener('click', function() {
    document.querySelector('.menu-container').classList.toggle('active');
});

document.querySelector('.mini-photo-wrapper2').addEventListener('click', function() {
    document.querySelector('.menu-container2').classList.toggle('active');
});

$('#exit').click(function () {
    document.cookie = "identification=''";
    window.location = "http://localhost:8080/main";
});

$('#download').click(function () {
    window.location = "http://localhost:8080/register";
});


$('#download2').click(function () {
    window.location = "http://localhost:8080/login";
});

$('.news').click(function () {
    window.location = "http://localhost:8080/news";
});

$('.flash').click(function () {
    window.location = "http://localhost:8080/feed";
});

$('.abit').click(function () {
    window.location = "http://localhost:8080/abit";
});

$('.docer').click(function () {
    window.location = "http://localhost:8080/documents";
});

$('.galer').click(function () {
    window.location = "http://localhost:8080/gallery";
});

$('.potok').click(function () {
    window.location = "http://localhost:8080/students";
});

document.querySelector('.mini-photo-wrapper').addEventListener('click', function() {
    document.querySelector('.menu-container').classList.toggle('active');
});

document.querySelector('.mini-photo-wrapper2').addEventListener('click', function() {
    document.querySelector('.menu-container2').classList.toggle('active');
});