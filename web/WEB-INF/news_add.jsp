<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Управление новостями</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/control_style.css">
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
        <li><a style="cursor: pointer" class="abit">Абитуриенту</a></li>
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
        <span class="contact100-form-title">Существующие новости</span>
        <div class="nws">${newser}</div>
        <form class="contact100-form2 validate-form" action="/control_news" method="post">
				<span class="contact100-form-title2">
					Добавить новость
				</span>

            <div class="wrap-input1002 rs1-wrap-input1002 validate-input2">
                <span class="label-input1002">День</span>
                <input id="day" required class="input1002" type="number" name="da" placeholder="Введите день">
                <span class="focus-input1002"></span>
            </div>

            <div class="wrap-input1002 rs1-wrap-input1002 validate-input2" data-validate="Поле пустое!">
                <span class="label-input1002">Месяц</span>
                <input id="month" required class="input1002" type="text" name="mo" placeholder="Введите месяц">
                <span class="focus-input1002"></span>
            </div>

            <div class="wrap-input1002 rs1-wrap-input1002 validate-input2" data-validate="Поле пустое!">
                <span class="label-input1002">Заголовок</span>
                <input id="title" required class="input1002" type="text" name="tit" placeholder="Введите заголовок">
                <span class="focus-input1002"></span>
            </div>

            <div class="wrap-input1002 rs1-wrap-input1002 validate-input2" data-validate = "Поле пустое!">
                <span class="label-input1002">Фото (ссылка)</span>
                <input id="photo" required class="input1002" type="url" name="ph" placeholder="Введите ссылку на фото">
                <span class="focus-input1002"></span>
            </div>

            <div class="wrap-input1002 validate-input2" data-validate = "Поле сообщения пустое!">
                <span class="label-input1002">Содержание новости</span>
                <textarea id="descipt" required class="input1002" name="con" placeholder="Введите содержание"></textarea>
                <span class="focus-input1002"></span>
            </div>

            <div class="container-contact1002-form-btn2">
                <button class="contact100-form-btn2">
						<span>
							Отправить
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
                </button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/stat_js.js"></script>
<script type="text/javascript" src="js/new.js"></script>
</body>
</html>
