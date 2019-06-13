<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Деканат</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/buttons_style.css">
    <script>
        function get() {
            var myVar = '<%= request.getAttribute("username") %>';
            var adm = '<%= request.getAttribute("stats") %>';
            if (myVar == "null") {
                document.getElementById('download').style.visibility = "visible";
                document.getElementById('download2').style.visibility = "visible";
                //document.getElementById('download3').style.visibility = "hidden";
            }
            else {
                //document.getElementById('download').style.visibility = "hidden";
                //document.getElementById('download2').style.visibility = "hidden";
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
<div id="page-preloader"></div>
<div id="one">
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
    <ul>
        <li><a style="cursor: pointer" class="potok">Поток студентов</a></li>
        <li><a style="cursor: pointer" class="galer">Галерея</a></li>
        <li><a style="cursor: pointer" class="abit" >Абитуриенту</a></li>
        <li><a style="cursor: pointer" class="news">Новости</a></li>
        <li><a style="cursor: pointer" class="docer">Документы</a></li>
        <li><a style="cursor: pointer" class="flash">Обратная связь</a></li>
    </ul>
    <div id="stata" class="mover">
        <table class="table1">
            <tr class="spaceUnder">
                <th><img src="faculty.png">
                    <h1 class="count-this">17</h1>
                    <p>Направлений</p></th>
                <th><img src="recruitment.png">
                    <h1 class="count-this">324</h1>
                    <p>Набрано студентов</p></th>
                <th><img src="team.png">
                    <h1 class="count-this">43</h1>
                    <p>Группы</p></th>
            </tr>
            <tr>
                <th><img src="students.png">
                    <h1 class="count-this">${number}</h1>
                    <p>Студентов</p></th>
                <th><img src="new.png">
                    <h1 class="count-this">3</h1>
                    <p>Новых направления</p></th>
                <th></th>
            </tr>
        </table>
    </div>
    <div id="background"></div>
    <img width="166" height="35" id="logo" src="logo2.png">
</div>
<div id="twosection">
    <div class="maps" style="width: 300px;height: 365px;">
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5349.175029124605!2d33.4013124!3d47.9056685!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40db20bf457fad89%3A0xb8d8c11893ad3895!2z0JrRgNC40LLQvtGA0ZbQt9GM0LrQuNC5INCd0LDRhtGW0L7QvdCw0LvRjNC90LjQuSDQo9C90ZbQstC10YDRgdC40YLQtdGC!5e0!3m2!1suk!2sua!4v1539942813905"
                width="100%"
                height="365px"
                frameborder="0"
                style="box-shadow: inset 0 0 10px #000000;
    position: absolute;">
        </iframe>
    </div>
</div>
<div id="threesection">
    <div id="footerr"></div>
    <div style="margin: 10vh 160vh">
        <div class="below_menu">
            <ul>
                <li class="reports">Перечисления</li>
                <li class="reports2">Отчёты</li>
                <li class="docer">Документы</li>
                <li class="flash">Обратная связь</li>
                <li class="potok">Поток студентов</li>
            </ul>
        </div>
        <form id="searchthis" style="display:inline;" action="/main" method="post">
            <div id="tiler" style="align: center">Поиск студентов в базе</div>
            <input id="namanyay-search-box" name="fio" size="40" type="text" placeholder="Введите данные..."/>
            <input id="namanyay-search-btn" value="Поиск" type="submit"/>
        </form>
        <div id="soc"><p>Мы в социальных сетях</p></div>
        <table id="soc_med" class="table2">
            <tr>
                <th><img id="facebook" class="imgsc" src="css/facebook.png"></th>
                <th><img id="google" class="imgsc" src="css/google-plus.png"></th>
                <th><img id="dribble" class="imgsc" src="css/dribbble.png"></th>
            </tr>
            <tr>
                <th><img id="twitter" class="imgsc" src="css/twitter.png"></th>
                <th><img id="pinterest" class="imgsc" src="css/pinterest.png"></th>
                <th><img id="tumblr" class="imgsc" src="css/tumblr.png"></th>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
<script type="text/javascript" src="js/counter.js"></script>
</body>
</html>
