<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Абитуриенту</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/style_abitur.css">
    <link rel="stylesheet" href="css/buttons_style.css">
    .
    <script>
        function get() {
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
<div class="background">
    <img src="news/back.jpg" alt="">
</div>
<a id="download5">${stats}</a>
<div class="user-menu-wrap2">
    <a class="mini-photo-wrapper2" id="download4">${stats}</a>
    <div class="menu-container2">
        <ul style="right: 2.5vh; top: 0vw" class="user-menu2">
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
        <ul style="right: 3vh; top: 0vw" class="user-menu">
            <li class="user-menu__item">
                <a id="exit" class="user-menu-link">Выход</a>
            </li>
        </ul>
    </div>
</div>
<a id="download">Создать</a>
<a id="download2">Войти</a>
<div class="menur">
    <ul>
        <li><a style="cursor: pointer" class="potok">Поток студентов</a></li>
        <li><a style="cursor: pointer" class="galer">Галерея</a></li>
        <li><a style="cursor: pointer" class="abit">Абитуриенту</a></li>
        <li><a style="cursor: pointer" class="news">Новости</a></li>
        <li><a style="cursor: pointer" class="docer">Документы</a></li>
        <li><a style="cursor: pointer" class="flash">Обратная связь</a></li>
    </ul>
</div>
<p align="center"><img style="cursor: pointer; margin-bottom: 20px; margin-top: -5px; alignment: center" id="logo"
                       src="logo2.png"></p>
<div class="container-contact100">
    <div class="wrap-contact100">
        <form class="contact100-form validate-form">
            <span class="contact100-form-title">Абитуриенту</span>
            <h4 class="inftitle">На данной странице предоставлена вся справочная информация, которая только может
                пригодится для ознакомления будущим студентам.</h4>
            <table>
                <tr>
                    <th class="podg" style="cursor: pointer">
                        <img src="podgotov.PNG">
                        <h3 class="titler">Подготовительные курсы</h3>
                        <div class="titler2">Система доуниверситетской подготовки включает подготовительные курсы,
                            которые осуществляют углубленную подготовку конкурсных дисциплин, ориентированную на
                            требования конкретных факультетов, экстернат, отделения лицейних и специализированных
                            классов.
                        </div>
                    </th>
                    <th style="cursor: pointer" class="den_ot">
                        <img src="den_door.PNG">
                        <h3 class="titler">День открытых дверей</h3>
                        <div class="titler2">На дне открытых дверей у вас будет возможность узнать об особенностях
                            обучения, познакомиться с лекторами и кураторами курсов, а также получить ответы на все
                            интересующие вопросы.
                        </div>
                    </th>
                    <th style="cursor: pointer" class="naprav">
                        <img src="napravlen.PNG">
                        <h3 class="titler">Направление подготовки</h3>
                        <div class="titler2">Перечень направлений подготовки (специальностей), на которые в 2018 году
                            объявляется набор на первый курс для обучения по программам бакалавриата, программам
                            специалитета и программам магистратуры.
                        </div>
                    </th>
                </tr>
            </table>
        </form>
        <div style="left: 80vh; bottom: 38vh; position: absolute" class="titler"><h1>Остались вопросы?</h1>
        </div>
        <div class="titler" style="position: absolute; left: 65vh; bottom: 25vh">
            <h2>Задавай их через <span style="cursor: pointer"
                                       class="feedbacker">Форму обратной связи</span></h2>
        </div>
        <img style="margin-left: 15vh" src="assistent.png">
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
<script type="text/javascript" src="js/new.js"></script>
</body>
</html>
