<%@ page import="java.sql.Connection" %>
<%@ page import="ru.kulkov.testsystem.DB.DB" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="ru.kulkov.testsystem.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.naming.Context" %><%--
  Created by IntelliJ IDEA.
  User: Pavel Kulkov
  Date: 18.03.2016
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактировать тест</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
    if(request.getSession().getAttribute("isAdmin").equals("true")){
            ServletContext context = request.getServletContext();
            String testPath = request.getParameter("test");
            ArrayList<String> questions = Test.getQuestions(context.getRealPath("Tests/"+testPath));
            ArrayList<String> answers = Test.getAnswers(context.getRealPath("Tests/"+testPath));

%>
<div class="header"> Тестовая система </div>
<div class="content">
    <div class="secondHead"><%= Test.getTestName(context.getRealPath("Tests/"+testPath))%></div>
    <div class="test">
        <form name="listTest" action="#">
            <%
               for(int i=0;i<questions.size();i++){%>
                 <%=i+1%>. <%= questions.get(i)%><br>
                <%String[] tmp = answers.get(i).split("%%");%>
                <%for(int j=0;j < tmp.length-1;j++){%>
                 <input type="<%=tmp[tmp.length-1]%>" name="<%=i%>"><%= tmp[j]%><br>
                <%}%>
              <%  }
              }
            %>
        </form>
        <form action="tests.jsp">
            <button class="button" type="submit">Назад</button>
        </form>
    </div>
</div>
</body>
</html>
