<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/style_reg.css">
</head>
<body>
<div class="background">
    <img src="news/back.jpg"
         alt="">
</div>
<div class="content-w3ls">
    <div class="content-bottom">
        <p onclick="tomain()" align="center"><img style="cursor: pointer; margin-bottom: 20px; margin-top: -5px; alignment: center" id="logo" src="logo2.png"></p>
        <form action="#" method="post">
            <div class="field-group">
                <span class="fa fa-user" aria-hidden="true"></span>
                <div class="wthree-field">
                    <input name="text1" id="namer" type="text" value="" placeholder="Логин" required>
                </div>
            </div>
            <div class="field-group">
                <span class="fa fa-lock" aria-hidden="true"></span>
                <div class="wthree-field">
                    <input name="ema" id="mail" type="email" placeholder="E-mail">
                </div>
            </div>
            <div class="field-group">
                <span class="fa fa-lock" aria-hidden="true"></span>
                <div class="wthree-field">
                    <input name="password" id="pass" type="Password" placeholder="Пароль">
                </div>
            </div>
            <div class="field-group">
                <span class="fa fa-lock" aria-hidden="true"></span>
                <div class="wthree-field">
                    <input name="password" id="pass2" type="Password" placeholder="Повторите пароль">
                </div>
            </div>
            <div class="field-group">
                <div class="check">
                    <label class="checkbox w3l">
                        <input type="checkbox" onclick="myFunction2()">
                        <i> </i>Показать пароль</label>
                </div>
            </div>
            <div class="wthree-field">
                <input onclick="regis()" type="button" value="Зарегистрироваться" />
            </div>
            <div class="field-group">
                <p class="reg">Есть аккаунт? <a class="color2">Войти</a></p>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/new.js"></script>
</body>
</html>
