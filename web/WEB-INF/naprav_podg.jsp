<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Направление подготовки</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="../css/style_naprav.css">
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
<div style="margin-top: -0.7vh" class="menur">
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
<div style="margin-top: -20.5em;" class="container-contact100">
    <div id="containerw" class="wrap-contact100" style="margin-top: 370px;">
        <form class="contact100-form validate-form">
            <span style="font-size: 5vh" class="contact100-form-title">Абитуриенту -> Направление подготовки</span>
            <div class="titler">
                <div id="conta">
                    <input id="tab1" type="radio" name="tabs" checked>
                    <label for="tab1">Бакалавриат</label>

                    <input id="tab2" type="radio" name="tabs">
                    <label for="tab2">Специалитет</label>

                    <input id="tab3" type="radio" name="tabs">
                    <label for="tab3">Магистратура</label>

                    <section id="content1">
                        <p align="center">ИНСТИТУТ ЭКОНОМИКИ И УПРАВЛЕНИЯ</p>
                        <p>38.03.01 "Экономика"</p>
                        <ul>
                            <li>Профиль "Международная экономика".</li>
                            <li>Профиль "Внешнеэкономическая деятельность".</li>
                        </ul>
                        <p>38.03.01 "Экономика"</p>
                        <ul>
                            <li>Профиль "Экономика предприятия".</li>
                            <li>Профиль "Экономико-правовое обеспечение предприятия".</li>
                        </ul>
                        <p>38.03.02 "Менеджмент"</p>
                        <ul>
                            <li>Профиль "Менеджмент организаций".</li>
                            <li>Профиль "Логистика".</li>
                        </ul>
                        <p>38.03.03 "Управление персоналом"</p>
                        <p align="center">ИНСТИТУТ УЧЕТА И ФИНАНСОВ</p>
                        <p>38.03.01 "Экономика"</p>
                        <ul>
                            <li>Профиль "Финансы и кредит".</li>
                            <li>Профиль "Финансы и кредит (Пенсионный фонд)".</li>
                            <li>Профиль  "Банковское дело".</li>
                        </ul>
                        <p>38.03.01 "Экономика"</p>
                        <ul>
                            <li>Профиль "Учет и аудит".</li>
                            <li>Профиль "Бухгалтерский  учет и правовое обеспечение бизнеса".</li>
                        </ul>
                        <p align="center">ИНСТИТУТ ПИЩЕВЫХ ПРОИЗВОДСТВ</p>
                        <p>13.03.03 "Энергетическое машиностроение"</p>
                        <ul>
                            <li>Профиль "Холодильные машины и установки".</li>
                        </ul>
                    </section>

                    <section id="content2">
                        <p align="center">ИНСТИТУТ УЧЕТА И ФИНАНСОВ</p>
                        <p>38.05.01 "Экономическая безопасность"</p>
                        <p align="center">ФАКУЛЬТЕТ МАРКЕТИНГА, ТОРГОВЛИ И ТАМОЖЕННОГО ДЕЛА</p>
                        <p>38.05.02 "Таможенное дело"</p>
                    </section>

                    <section id="content3">
                        <p align="center">ИНСТИТУТ УЧЕТА И ФИНАНСОВ</p>
                        <p>38.04.08 "Финансы и кредит"</p>
                        <ul>
                            <li>Магистерская программа «Финансы и кредит»</li>
                            <li>Магистерская программа «Финансы и кредит (Пенсионный фонд)»</li>
                            <li>Магистерская программа «Банковское дело»</li>
                        </ul>
                        <p>38.04.09 "Государственный аудит"</p>
                        <ul>
                            <li>Магистерская программа "Учет и аудит"</li>
                            <li>Магистерская программа "Бухгалтерский учет и правовое обеспечение бизнеса"</li>
                            <li>Магистерская программа "Государственный аудит"</li>
                        </ul>
                        <p align="center">ИНСТИТУТ ЭКОНОМИКИ И УПРАВЛЕНИЯ</p>
                        <p>38.04.01 "Экономика"</p>
                        <ul>
                            <li>Магистерская программа "Международная экономика"</li>
                            <li>Магистерская программа "Экономика предприятия"</li>
                            <li>Магистерская программа "Экономико-правовое обеспечение предприятия"</li>
                        </ul>
                        <p>38.04.02 "Менеджмент"</p>
                        <ul>
                            <li>Магистерская программа "Менеджмент организаций и администрирование"</li>
                            <li>Магистерская программа «Логистика»</li>
                        </ul>
                        <p>38.04.04 Государственное и муниципальное управление</p>
                        <ul>
                            <li>Магистерская программа "Бизнес-администрирование"</li>
                            <li>Магистерская программа "Административный менеджмент"</li>
                        </ul>
                        <p align="center">ИНСТИТУТ ПИЩЕВЫХ ПРОИЗВОДСТВ</p>
                        <p>15.04.02 "Технологические машины и оборудование"</p>
                        <ul>
                            <li>Магистерская программа"Оборудование перерабатывающих и пищевых производств"</li>
                        </ul>
                        <p align="center">ФАКУЛЬТЕТ МАРКЕТИНГА, ТОРГОВЛИ И ТАМОЖЕННОГО ДЕЛА</p>
                        <p>38.04.01 "Экономика"</p>
                        <ul>
                            <li>Магистерская программа"Маркетинг"</li>
                            <li>Магистерская программа "Рекламный бизнес"</li>
                        </ul>
                        <p>38.04.07 "Товароведение"</p>
                        <ul>
                            <li>Магистерская программа "Товароведение непродовольственных товаров и коммерческая деятельность"</li>
                            <li>Магистерская программа "Товароведение продовольственных товаров и коммерческая деятельность"</li>
                            <li>Магистерская программа "Товароведение и экспертиза в таможенном деле"</li>
                            <li>Магистерская программа "Организация оптовой и розничной торговли"</li>
                        </ul>
                        <p align="center">ФАКУЛЬТЕТ РЕСТОРАННО-ГОСТИНИЧНОГО БИЗНЕСА</p>
                        <p>19.04.04 "Технология продукции и организация общественного питания"</p>
                        <p>43.04.02 "Туризм"</p>
                        <ul>
                            <li>Магистерская программа "Туризмоведение"</li>
                        </ul>
                        <p>43.04.03 "Гостиничное дело"</p>
                        <ul>
                            <li>Магистерская программа "Гостиничное и ресторанное дело"</li>
                        </ul>
                    </section>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/buttons_js.js"></script>
<script type="text/javascript" src="../js/new.js"></script>
</body>
</html>
