<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Отчёты</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/css_report.css">
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
<div class="background">
    <img src="news/back.jpg" alt="">
</div>
<div class="menur">
    <ul>
        <li><a style="cursor: pointer" class="potok">Поток студентов</a></li>
        <li><a style="cursor: pointer" class="galer">Галерея</a></li>
        <li><a style="cursor: pointer" class="abit" >Абитуриенту</a></li>
        <li><a style="cursor: pointer" class="news">Новости</a></li>
        <li><a style="cursor: pointer" class="docer">Документы</a></li>
        <li><a style="cursor: pointer" class="flash">Обратная связь</a></li>
    </ul>
</div>
<p align="center"><img style="cursor: pointer; margin-bottom: 20px; margin-top: -5px; alignment: center" id="logo"
                       src="logo2.png"></p>
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
<div class="container-contact100">
    <div class="wrap-contact100">
        <div class="wrapper typo">Отображение
            <div class="list"><span class="placeholder">выберите</span>
                <ul class="list__ul">
                    <li><a id="all" class="selecter" href="">всех</a></li>
                    <li><a id="1_2014" class="selecter" href="">1-й курс 2014г.</a></li>
                    <li><a id="2_2014" class="selecter" href="">2-й курс 2014г.</a></li>
                    <li><a id="3_2014" class="selecter" href="">3-й курс 2014г.</a></li>
                    <li><a id="4_2014" class="selecter" href="">4-й курс 2014г.</a></li>
                    <li><a id="5_2014" class="selecter" href="">5-й курс 2014г.</a></li>
                    <li><a id="1_2015" class="selecter" href="">1-й курс 2015г.</a></li>
                    <li><a id="2_2015" class="selecter" href="">2-й курс 2015г.</a></li>
                    <li><a id="3_2015" class="selecter" href="">3-й курс 2015г.</a></li>
                    <li><a id="4_2015" class="selecter" href="">4-й курс 2015г.</a></li>
                    <li><a id="5_2015" class="selecter" href="">5-й курс 2015г.</a></li>
                    <li><a id="1_2016" class="selecter" href="">1-й курс 2016г.</a></li>
                    <li><a id="2_2016" class="selecter" href="">2-й курс 2016г.</a></li>
                    <li><a id="3_2016" class="selecter" href="">3-й курс 2016г.</a></li>
                    <li><a id="4_2016" class="selecter" href="">4-й курс 2016г.</a></li>
                    <li><a id="5_2016" class="selecter" href="">5-й курс 2016г.</a></li>
                    <li><a id="1_2017" class="selecter" href="">1-й курс 2017г.</a></li>
                    <li><a id="2_2017" class="selecter" href="">2-й курс 2017г.</a></li>
                    <li><a id="3_2017" class="selecter" href="">3-й курс 2017г.</a></li>
                    <li><a id="4_2017" class="selecter" href="">4-й курс 2017г.</a></li>
                    <li><a id="5_2017" class="selecter" href="">5-й курс 2017г.</a></li>
                    <li><a id="1_2018" class="selecter" href="">1-й курс 2018г.</a></li>
                    <li><a id="2_2018" class="selecter" href="">2-й курс 2018г.</a></li>
                    <li><a id="3_2018" class="selecter" href="">3-й курс 2018г.</a></li>
                    <li><a id="4_2018" class="selecter" href="">4-й курс 2018г.</a></li>
                    <li><a id="5_2018" class="selecter" href="">5-й курс 2018г.</a></li>
                </ul>
            </div>
        </div>
        <div id="resl">${resle_deduct}</div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/stat_js.js"></script>
<script type="text/javascript" src="js/js_report.js"></script>
</body>
</html>
