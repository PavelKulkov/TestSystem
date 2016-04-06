<%--
  Created by IntelliJ IDEA.
  User: Pavel Kulkov
  Date: 17.03.2016
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Тестовая система</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
  <%
    request.getSession().setAttribute("isAdmin","false");
  %>
  <div class="header"> Тестовая система </div>
  <div class="content">
    <div class="secondHead"> Авторизация </div>

    <div class="authorization">
      <form action="/auth" method="post">
        Имя пользователя<br>
        <input type="text" name="login" placeholder="ФИО" required><br>
        Пароль<br>
        <input type="password" name="password" required><br>
        <input type="submit" value="Войти">
      </form>
    </div>
    </div>
  </body>
</html>
