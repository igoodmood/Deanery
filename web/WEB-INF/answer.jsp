<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ответ пользователю</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/feedback_style.css">
    <link rel="stylesheet" href="css/buttons_style.css">
    <script>
        function get() {
            var myVar = '<%= request.getAttribute("username") %>';
            var userpick = '<%= request.getAttribute("namer") %>';
            var mes = '<%= request.getAttribute("messag") %>';
            var adm = '<%= request.getAttribute("stats") %>';
            if (myVar == "null") {
                document.getElementById('download').style.visibility = "visible";
                document.getElementById('download2').style.visibility = "visible";
                //document.getElementById('download3').style.visibility = "hidden";
            }
            else {
                if (adm == "Админ") { document.getElementById('download4').style.visibility = "visible"; }
                if (adm == "Сотрудник") { document.getElementById('download5').style.visibility = "visible"; }
                document.getElementById('download3').style.visibility = "visible";
                var div = document.getElementById('download3');
                document.getElementById('answr').value = "Здравствуйте, " + userpick + "! ";
                document.getElementById('quest').value = mes;
                document.getElementById('login').value = userpick;
                div.innerHTML = myVar;
            }
        }
    </script>
</head>
<body>
<img id="logo" src="logo2.png">
<div class="background">
    <img src="css/spotti.png"
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
        <ul class="user-menu">
            <li class="user-menu__item">
                <a id="exit" class="user-menu-link">Выход</a>
            </li>
        </ul>
    </div>
</div>
<a id="download">Создать</a>
<a id="download2">Войти</a>
<div style="margin-left: -5.5vh" class="menur">
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
    <div class="wrap-contact100">
        <form class="contact100-form validate-form" action="SendEmail" method="post">
				<span class="contact100-form-title">
					Ответ пользователю ${namer}
				</span>

            <div class="wrap-input100 validate-input" data-validate = "Поле сообщения пустое!">
                <textarea id="quest" class="input100" name="message"></textarea>
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate = "Поле сообщения пустое!">
                <span class="label-input100">Введите текст Вашего ответа</span>
                <textarea id="answr" class="input100" name="ans" placeholder="Ваш ответ здесь..."></textarea>
                <span class="focus-input100"></span>
            </div>
            <input type="hidden" id="login" name="usern">
            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn">
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
<script type="text/javascript" src="js/buttons_js.js"></script>
<script type="text/javascript" src="js/form2.js"></script>
</body>
</html>
