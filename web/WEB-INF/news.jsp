<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Новости</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/css/swiper.min.css'>
    <script type="text/javascript" src="js/counter.js"></script>
    <link rel="stylesheet" href="css/news_style.css">
    <link rel="stylesheet" href="css/buttons_style.css">
    <script>
        function get() {
            var newr = '<%= request.getAttribute("news") %>';
            var div = document.getElementById('newser');
            div.innerHTML = newr;
            var myVar = '<%= request.getAttribute("username") %>';
            var adm = '<%= request.getAttribute("stats") %>';
            if (myVar == "null") {
                document.getElementById('download').style.visibility = "visible";
                document.getElementById('download2').style.visibility = "visible";
            } else {
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
<img onclick="tomain()" id="logo" src="logo2.png">
<div class="wrapper">
    <div class="background">
        <img src="news/back.jpg"
             alt="">
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
            <ul  class="user-menu">
                <li class="user-menu__item">
                    <a id="exit" class="user-menu-link">Выход</a>
                </li>
            </ul>
        </div>
    </div>
    <a id="download">Создать</a>
    <a id="download2">Войти</a>
    <ul>
        <li><a style="cursor: pointer" class="potok">Поток студентов</a></li>
        <li><a style="cursor: pointer" class="galer">Галерея</a></li>
        <li><a style="cursor: pointer" class="abit">Абитуриенту</a></li>
        <li><a style="cursor: pointer" class="news">Новости</a></li>
        <li><a style="cursor: pointer" class="docer">Документы</a></li>
        <li><a style="cursor: pointer" class="flash">Обратная связь</a></li>
    </ul>
    <div class="item-bg"></div>
    <div class="news-slider">
        <div id="newser" class="news-slider__wrp swiper-wrapper">
        </div>
    </div>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/js/swiper.min.js'></script>
<script type="text/javascript" src="js/counter.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
<script src="algore.js"></script>
</body>
</html>
