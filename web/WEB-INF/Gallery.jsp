<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Галерея</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="css/gallery_style.css">
    <script>
        function get() {
            var myVar = '<%= request.getAttribute("username") %>';
            var adm = '<%= request.getAttribute("stats") %>';
            if (myVar == "null") {
                document.getElementById('download').style.visibility = "visible";
                document.getElementById('download2').style.visibility = "visible";
            }
            else {
                if (adm == "Админ") { document.getElementById('download4').style.visibility = "visible"; }
                if (adm == "Сотрудник") { document.getElementById('download5').style.visibility = "visible"; }
                document.getElementById('download3').style.visibility = "visible";
                var div = document.getElementById('download3');
                div.innerHTML = myVar;
            }
        }
    </script>
</head>
<body>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
<div class="background">
    <img src="css/students.jpg"
         alt="">
</div>
<img id="logo" src="logo2.png">
<div class="menu">
    <ul>
        <li><a style="cursor: pointer" class="potok">Поток студентов</a></li>
        <li><a style="cursor: pointer" class="galer">Галерея</a></li>
        <li><a style="cursor: pointer" class="abit">Абитуриенту</a></li>
        <li><a style="cursor: pointer" class="news">Новости</a></li>
        <li><a style="cursor: pointer" class="docer">Документы</a></li>
        <li><a style="cursor: pointer" class="flash">Обратная связь</a></li>
    </ul>
</div>
<a id="download5">${stats}</a>
<div class="user-menu-wrap2">
    <a class="mini-photo-wrapper2" id="download4">${stats}</a>
    <div class="menu-container2">
        <ul class="user-menu2">
            <li class="user-menu__item2">
                <a id="st" class="user-menu-link2">Статусы</a>
                <a id="cm" class="user-menu-link2">Комментарии</a>
                <a id="nwr" class="user-menu-link2">Новости</a>
            </li>
        </ul>
    </div>
</div>
<div class="user-menu-wrap">
    <a class="mini-photo-wrapper" id="download3">${username}</a>
    <div class="menu-container">
        <ul class="user-menu">
            <li class="user-menu__item">
                <a id="exit" class="user-menu-link">Выход</a>
            </li>
        </ul>
    </div>
</div>
<a id="download">Создать</a>
<a id="download2">Войти</a>
<div id="top"></div>
<section id="sector" class="gallery">
    <div id="rower" class="row">${photos}</div>
</section>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="js/js_gallery.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
</body>
</html>
