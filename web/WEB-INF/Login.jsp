<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Войти</title>
    <link rel="shortcut icon" type="image/png" href="/css/artificial-intelligence.png"/>
    <link rel="stylesheet" href="css/style_login.css">
</head>
<body>
<div class="background">
    <img src="news/back.jpg"
         alt="">
</div>
<div class="content-w3ls">
    <div class="content-bottom">
        <p align="center"><img onclick="tomain()"
                               style="cursor: pointer; margin-bottom: 20px; margin-top: -5px; alignment: center"
                               id="logo" src="logo2.png"></p>
        <form action="#" method="post">
            <div class="field-group">
                <span class="fa fa-user" aria-hidden="true"></span>
                <div class="wthree-field">
                    <input name="text1" id="log" type="text" value="" placeholder="Логин" required>
                </div>
            </div>
            <div class="field-group">
                <span class="fa fa-lock" aria-hidden="true"></span>
                <div class="wthree-field">
                    <input name="password" id="pas" type="Password" placeholder="Пароль">
                </div>
            </div>
            <div class="field-group">
                <div class="check">
                    <label class="checkbox w3l">
                        <input type="checkbox" onclick="myFunction()">
                        <i> </i>Показать пароль</label>
                </div>
            </div>
            <div style="margin: -15px 0px 15px" class="check">
                <label class="checkbox w3l">
                    <input id="not_long" type="checkbox">
                    <i> </i>Чужой компьютер</label>
            </div>
            <div class="wthree-field">
                <input onclick="login()" type="button" value="Войти"/>
            </div>
            <p class="reg">Нет аккаунта? <a class="color">Регистрация</a></p>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/new.js"></script>
</body>
</html>
