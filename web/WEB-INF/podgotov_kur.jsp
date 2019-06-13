<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Подготовительные курсы</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="../css/style_abitur_helper.css">
    <link rel="stylesheet" href="../css/buttons_style.css">
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
<div class="container-contact100">
    <div class="wrap-contact100" style="margin-top: 350px;">
        <form class="contact100-form validate-form">
            <span class="contact100-form-title">Абитуриенту -> Подготовительные курсы</span>
            <div class="titler">
                <p>Система доуниверситеской подготовки Национального технического университета Украины «Криворожский
                    национальный университет» включает:</p>
                <ul>
                    <li>подготовительные курсы, которые осуществляют углубленную подготовку конкурсных дисциплин,
                        ориентированную на требования конкретных факультетов (принимаются ученики 10-11-х классов,
                        обучение платное),
                    </li>
                    <li>экстернат, осуществляет гибкое сочетание очной и заочной форм обучения, предоставляет
                        возможность подготовки к поступлению в университет независимо от объекта (принимаются ученики
                        10-11-х классов, обучение платное),
                    </li>
                    <li>отделения лицейних и специализированных классов, осуществляющие фундаментальную подготовку
                        учащихся на базе ведущих лицеев, гимназий, школ по методике ФДП (по соответствующим
                        соглашениям).
                    </li>
                    <li>подготовительное отделение, которое осуществляет стационарную подготовку молодежи, имеющее
                        среднее образование (обучение платное).
                    </li>
                </ul>
                <p>Для привлечения талантливой молодежи из колледжей и техникумов проводится работа по организации при
                    КНУ учебных научно-производственных комплексов вместе с профильными
                    заведениями.</p>
                <p>
                    Всего создано 18 КНУ, в состав которых входят 58 институтов, колледжей и техникумов, а обучение
                    осуществляется по интегрированным учебным планам. На условиях, указанных в соглашениях, возможно
                    зачисление выпускников этих учебных заведений для продолжения обучения по специальным программам с
                    сокращенным сроком подготовки специалистов или на 2-3 курсы для пополнения академических групп.
                </p>
                <p>Довузовскую подготовку осуществляют:</p>
                <ul>
                    <li>Институт мониторинга качества образования и его филиалы на базе ведущих учебных заведений
                        Украины.
                    </li>
                    <li>Факультет довузовской подготовки УНК "ИПСА".</li>
                    <li>Факультет довузовской подготовки ФТИ.</li>
                    <li>Политехнический лицей.</li>
                    <li>Технический лицей.</li>
                    <li>Лингво-природоведческий лицей "Интеллект".</li>
                    <li>Учебно-научные производственные комплексы.</li>
                    <li>Центр тестирования и мониторинга знаний.</li>
                </ul>
                <p>
                    Доуниверситетская подготовка иностранных граждан осуществляется Центром международного образования
                    на подготовительном отделении. Обучение ведется на трех языках: украинском, русском и английском (на
                    выбор). Занятия проводятся с сентября по июнь. Курсы осуществляют подготовку в университет. После
                    окончания курсов необходимо сдать экзамен. Образовательная программа данного курса предусматривает
                    получение студентами начальных знаний украинского / русского языка.
                </p>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
</body>
</html>
