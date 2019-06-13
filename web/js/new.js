function tomain() {
    window.location.replace("http://localhost:8080/main");
}

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validateWord(login) {
    var re = /^[A-Za-z]+$/;
    return re.test(login);
}

function myFunction() {
    var x = document.getElementById("pas");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function login() {
    $.ajax({
        url: 'login',
        type: 'post',
        data: {
            name: document.getElementById('log').value,
            pass: document.getElementById('pas').value,
            time: document.querySelector('#not_long').checked
        },
        success: function (data) {
            var result = data.toString();
            if (result.slice(0, 4) == 'true') window.location.replace("http://localhost:8080/main");
            else swal("Упс!", "Введенные Вами данные неверны!", "error");
        }
    });
}

function myFunction2() {
    var x = document.getElementById("pass");
    var x2 = document.getElementById("pass2");
    if (x.type === "password" && x2.type === "password") {
        x.type = "text";
        x2.type = "text";
    } else {
        x.type = "password";
        x2.type = "password";
    }
}

function regis() {
    var check = true;
    if (document.getElementById('namer').value == "" || document.getElementById('pass2').value == "" || document.getElementById('mail').value == "") {
        swal("Упс!", "Все поля должны быть заполнены!", "error");
        check = false;
    }
    else if (!validateEmail(document.getElementById('mail').value)) {
        swal("Упс!", "Пример почты : 'example@examole.com'", "error");
        check = false;
    }
    else if (!validateWord(document.getElementById('namer').value)) {
        swal("Упс!", "Данные должны быть на английском без пробелов!", "error");
        check = false;
    }
    else if (document.getElementById('pass2').value.length < 8 || document.getElementById('pass2').value.length < 8) {
        swal("Упс!", "Длина пароля не менее 8 символов!", "error");
        check = false;
    }
    else if (document.getElementById('pass2').value != document.getElementById('pass').value) {
        swal("Упс!", "Введенные Вами пароли не совпадают!", "error");
        check = false;
    }
    if (check) {
        $.ajax({
            url: 'register',
            type: 'post',
            data: {
                namer: document.getElementById('namer').value,
                passer: document.getElementById('pass2').value,
                mail: document.getElementById('mail').value
            },
            success: function (data) {
                var answer = data.toString();
                if (answer.length == 9) {
                    swal("Поздравляем!", "Вы успешно зарегистрированы!", "success");
                    setTimeout(function(){ window.location = "http://localhost:8080/login" }, 3000);
                }
                if (answer.length == 7) swal("Упс!", "Пользователь с такими данными уже существует!", "error");
            }
        });
    }
}

// function feedb() {
//     window.location.replace("http://localhost:8080/feed");
// }
//
// function cours() {
//     window.location = "http://localhost:8080/podgotov_kur.jsp";
// }
//
// function door() {
//     window.location = "http://localhost:8080/open_door.jsp";
// }
//
// function naprav() {
//     window.location = "http://localhost:8080/naprav_podg.jsp";
// }
//
// function spec() {
//     document.getElementById("containerw").style.marginTop = "-155px";
// }
//
// function backlavr() {
//     document.getElementById("containerw").style.marginTop = "370px";
// }
//
// function magistr() {
//     document.getElementById("containerw").style.marginTop = "840px";
// }

function request(path, params) {
    method = "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
}

$('.podg').click(function () {
    window.location = "http://localhost:8080/podgotov";
});

$('.den_ot').click(function () {
    window.location = "http://localhost:8080/day_open";
});

$('.naprav').click(function () {
    window.location = "http://localhost:8080/naprav";
});

$('.feedbacker').click(function () {
    window.location = "http://localhost:8080/feed";
});

var el = {};

$('.placeholder').on('click', function (ev) {
    $('.placeholder').css('opacity', '0');
    $('.list__ul').toggle();
});

$('.list__ul a').on('click', function (ev) {
    ev.preventDefault();
    var index = $(this).parent().index();

    $('.placeholder').text( $(this).text() ).css('opacity', '1');

    console.log($('.list__ul').find('li').eq(index).html());

    $('.list__ul').find('li').eq(index).prependTo('.list__ul');
    $('.list__ul').toggle();

});


$('select').on('change', function (e) {

    // Set text on placeholder hidden element
    $('.placeholder').text(this.value);

    // Animate select width as placeholder
    $(this).animate({width: $('.placeholder').width() + 'px' });

});

$('.selecter').click(function () {
    $.ajax({
        url: 'reports',
        type: 'post',
        data: {
            select: this.id
        },
        success: function (data) {
            document.getElementById("resl").innerHTML = data;
        }
    });
});

function delere(id) {
    $.ajax({
        url: 'comments',
        type: 'post',
        data: {
            dele: id.slice(5, id.length)
        },
        success: function (data) {
            document.getElementById("cms").innerHTML = data;
        }
    });
}

function new_dele(id) {
    $.ajax({
        url: 'delete_new',
        type: 'post',
        data: {
            deler: id.slice(5, id.length)
        },
        success: function (data) {
            location.reload()
        }
    });
}

$('.color').click(function () {
    window.location = "http://localhost:8080/register";
});


$('.color2').click(function () {
    window.location = "http://localhost:8080/login";
});