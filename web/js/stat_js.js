function adm(id_adm) {
    var inf = id_adm.split('_');
    $.ajax({
        url: 'status',
        type: 'post',
        data: {
            stat: inf[0],
            id: inf[1]
        },
        success: function (data) {
            location.reload();
        }
    });
}

function answr(id_adm) {
    window.location = "http://localhost:8080/answer?id_us=" + id_adm.slice(5, id_adm.length);
}

$('#logo').click(function () {
    window.location = "http://localhost:8080/main";
});

$(document).ready(function () {
    get();
});

document.querySelector('.mini-photo-wrapper').addEventListener('click', function() {
    document.querySelector('.menu-container').classList.toggle('active');
});

$('#exit').click(function () {
    document.cookie = "identification=''";
    window.location = "http://localhost:8080/main";
});

document.querySelector('.mini-photo-wrapper2').addEventListener('click', function() {
    document.querySelector('.menu-container2').classList.toggle('active');
});

$('#st').click(function () {
    window.location = "http://localhost:8080/status";
});

$('#cm').click(function () {
    window.location = "http://localhost:8080/comments";
});

$('#nwr').click(function () {
    window.location = "http://localhost:8080/control_news";
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