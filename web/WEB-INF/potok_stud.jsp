<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Поток студентов</title>
    <link rel="stylesheet" href="css/css_potok.css">
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <script>
        function get() {
            var c0 = '<%= request.getAttribute("c0") %>';
            var c1 = '<%= request.getAttribute("c1") %>';
            var c2 = '<%= request.getAttribute("c2") %>';
            var c3 = '<%= request.getAttribute("c3") %>';
            var c4 = '<%= request.getAttribute("c4") %>';
            var div1 = document.getElementById('c1');
            var div2 = document.getElementById('c2');
            var div3 = document.getElementById('c3');
            var div4 = document.getElementById('c4');
            var div5 = document.getElementById('c5');
            div1.innerHTML = "1 курс (" + c0 + " студ.)";
            div2.innerHTML = "2 курс (" + c1 + " студ.)";
            div3.innerHTML = "3 курс (" + c2 + " студ.)";
            div4.innerHTML = "4 курс (" + c3 + " студ.)";
            div5.innerHTML = "5 курс (" + c4 + " студ.)";
            var myVar = '<%= request.getAttribute("username") %>';
            var adm = '<%= request.getAttribute("stats") %>';
            if (myVar == "null") {
                document.getElementById('download').style.visibility = "visible";
                document.getElementById('download2').style.visibility = "visible";
            }
            else {
                if (adm == "Админ") {
                    document.getElementById('download4').style.visibility = "visible";
                }
                if (adm == "Сотрудник") {
                    document.getElementById('download5').style.visibility = "visible";
                }
                document.getElementById('download3').style.visibility = "visible";
                var div = document.getElementById('download3');
                div.innerHTML = myVar;
            }
        }
    </script>
</head>
<body>
<a id="download5">${stats}</a>
<div class="user-menu-wrap2">
    <a class="mini-photo-wrapper2" id="download4">${stats}</a>
    <div class="menu-container2">
        <ul style="right: -32vh; top: 0vw" class="user-menu2">
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
        <ul style="right: -32vh; top: 0vw" class="user-menu">
            <li class="user-menu__item">
                <a id="exit" class="user-menu-link">Выход</a>
            </li>
        </ul>
    </div>
</div>
<a id="download">Создать</a>
<a id="download2">Войти</a>
<ul class="me">
    <li><a style="cursor: pointer" class="potok">Поток студентов</a></li>
    <li><a style="cursor: pointer" class="galer">Галерея</a></li>
    <li><a style="cursor: pointer" class="abit">Абитуриенту</a></li>
    <li><a style="cursor: pointer" class="news">Новости</a></li>
    <li><a style="cursor: pointer" class="docer">Документы</a></li>
    <li><a style="cursor: pointer" class="flash">Обратная связь</a></li>
</ul>
<img id="logo" src="logo2.png">
<div class="background">
    <img src="css/students.jpg"
         alt="">
</div>
<div id="helper"><img src="css/helpex.png"></div>
<div class="container">
    <h1>Slidin' Slidey Things</h1>
    <div class="slides">
        <div class="slide">
            <a id="c1" onclick="stud(1, 'all')" href="#"></a>
            <div id="1" on class="content"></div>
        </div>

        <div class="slide">
            <a id="c2" onclick="stud(2, 'all')" href="#"></a>
            <div id="2" class="content"></div>
        </div>

        <div class="slide">
            <a id="c3" onclick="stud(3, 'all')" href="#"></a>
            <div id="3" class="content"></div>
        </div>

        <div class="slide">
            <a id="c4" onclick="stud(4, 'all')" href="#"></a>
            <div id="4" class="content"></div>
        </div>

        <div class="slide">
            <a id="c5" onclick="stud(5, 'all')" href="#"></a>
            <div id="5" class="content"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/js_potok.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
</body>
</html>
