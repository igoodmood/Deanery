<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Форма обратной связи</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/feedback_style.css">
    <link rel="stylesheet" href="css/buttons_style.css">
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
                var mail = '<%= request.getAttribute("mailer") %>';
                document.getElementById('e').value = mail;
                document.getElementById('n').value = myVar;
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
    <div class="wrap-contact100">
        <form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Форма обратной связи
				</span>

            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Поле имя пустое!">
                <span class="label-input100">Как Вас зовут?</span>
                <input id="n" class="input100" type="text" name="name" placeholder="Введите Ваше имя">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Пример эл.почты: ex@abc.xyz">
                <span class="label-input100">Какой у Вас электронный адрес?</span>
                <input id="e" class="input100" type="text" name="email" placeholder="Введите Ваш электронный адрес">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Поле сообщения пустое!">
                <span class="label-input100">Введите текст Вашего обращения</span>
                <textarea id="m" class="input100" name="message" placeholder="Ваше обращение здесь..."></textarea>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn">
						<span>
							Отправить
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
                </button>
                <span class="contact100-more">
				Ответ приходит в течении <span class="contact100-more-highlight">трех рабочих дней</span>
			</span>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/buttons_js.js"></script>
<script type="text/javascript" src="js/form.js"></script>
</body>
</html>
