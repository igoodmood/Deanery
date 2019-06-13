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

$('#download5').click(function () {
    window.location = "http://localhost:8080/letters";
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

$('.reports').click(function () {
    window.location = "http://localhost:8080/reports";
});

$('.reports2').click(function () {
    window.location = "http://localhost:8080/report_stud";
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

$('#download').click(function () {
    window.location = "http://localhost:8080/register";
});

$('#download2').click(function () {
    window.location = "http://localhost:8080/login";
});

$('#facebook').click(function () {
    window.location = "https://uk.wikipedia.org/wiki/Facebook";
});

$('#google').click(function () {
    window.location = "https://uk.wikipedia.org/wiki/Google";
});

$('#pinterest').click(function () {
    window.location = "https://uk.wikipedia.org/wiki/Pinterest";
});

$('#tumblr').click(function () {
    window.location = "https://uk.wikipedia.org/wiki/Tumblr";
});

$('#twitter').click(function () {
    window.location = "https://uk.wikipedia.org/wiki/%D0%A2%D0%B2%D1%96%D1%82%D1%82%D0%B5%D1%80";
});

$('#dribble').click(function () {
    window.location = "https://twitter.com/dribbble";
});

$('#logo').click(function () {
    window.location = "http://localhost:8080/main";
});

$(document).ready(function () {
    get();
});