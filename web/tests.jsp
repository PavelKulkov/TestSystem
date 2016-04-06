<%@ page import="ru.kulkov.testsystem.DB.DB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Pavel Kulkov
  Date: 17.03.2016
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Список всех тестов</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
    if(request.getSession().getAttribute("isAdmin").equals("true")){
       try {
        Connection connection = DB.getCon();
        String query = "SELECT * FROM test_list";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(query);
%>
<div class="header"> Тестовая система </div>
<nav class="navigate">
    <a href="admin.html">Список тестов</a> |
    <a href="usersList.html">Список пользователей</a> |
    <a href="resultList.html">Список результатов</a>  |
    <a href="index.jsp">Выход</a>
</nav>
<div class="content">
    <div class="secondHead"> Список тестов </div>
    <div class="functional">
        <table border="1">
            <tr>
                <th>Название теста</th>
                <th>Группа</th>
                <th>Действия</th>
            </tr>
            <%
                while(rs.next()) {%>
                    <tr >
                    <td ><%= rs.getString("TESTNAME")%></td >
                    <td > 12 оит18к</td >
                        <td >
                            <a href="viewTest.jsp?test=<%=rs.getString("TESTPATH")%>"><img src="image/icons/view.png"></a>
                            <a href="#"><img src="image/icons/edit.png"></a>
                        </td >
                    </tr ><%
                }
                connection.close();
            }catch (SQLException e){
              e.printStackTrace();
            }

            %>
        </table>
    </div>
    <button type="button" class="button"> Добавить тест </button>
    <button type="button" class="button" onclick="openFilterTest()"> Фильтрация </button>
</div>
<%
    }else{
        request.getServletContext().getRequestDispatcher("/auth").forward(request,response);
    }
%>
</body>
</html>
