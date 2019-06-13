<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>День открытых дверей</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/style_abitur_helper.css">
    <link rel="stylesheet" href="css/buttons_style.css">
    <script>
        function get() {
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
<div class="background">
    <img src="../news/back.jpg" alt="">
</div>
<p align="center"><img style="cursor: pointer; margin-bottom: 20px; margin-top: -5px; alignment: center" id="logo"
                       src="../logo2.png"></p>
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
<div style="margin-top: 0em;" class="container-contact100">
    <div class="wrap-contact100" style="margin-top: 50px;">
        <form class="contact100-form validate-form">
            <span class="contact100-form-title">Абитуриенту -> День открытых дверей</span>
            <div class="titler">
                <p>По традиции перед каждым набором мы проводим день открытых дверей для всех, кому хотелось бы
                    подробнее узнать об Академии и курсах, познакомиться с лекторами и увидеть работы выпускников
                    прошлых наборов.</p>
                <p>Этой осенью в КНУ открыт набор на курсы по 6 направлениям:</p>
                <ul>
                    <li>Advertising & Marketing: Art Direction, Copywriting, Strategy, Digital Marketing, Brand
                        Management, Account Management.
                    </li>
                    <li>Film: Filmmaking</li>
                    <li>Design: Graphic Design Basic, Graphic Design Advanced, Web Design, UX Design</li>
                    <li>Creative Writing</li>
                    <li>Fashion</li>
                    <li>Contemporary Art: Artist, Art Management</li>
                </ul>
                <p>2 сентября на дне открытых дверей у вас будет возможность узнать об особенностях обучения в КАМА,
                    познакомиться с лекторами и кураторами курсов, а также получить ответы на все интересующие вопросы.
                    В этот день мы также представим новый курс Brand Management -- для маркетологов и бренд-менеджеров,
                    которые хотят научиться запускать и эффективно управлять брендами. </p>
                <p>Знакомим с таймингом нашего события. В 13:00 начнется короткая официальная часть и презентация КАМА,
                    с 14:00 до 15:00 вы сможете познакомиться с кураторами курсов, которые расскажут о программе курсов
                    и ответят на вопросы, а до 17:00 вы сможете увидеть работы выпускников прошлых наборов и пообщаться
                    с нашими менеджерами, которые помогут вам выбрать интересующий курс. </p>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/buttons_js.js"></script>
</body>
</html>
