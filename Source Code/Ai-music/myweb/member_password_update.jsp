<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
</head>

<body>
<% request.setCharacterEncoding("big5");%> 
<%
   String login_user = (String)session.getAttribute("user_id");
   String user_password = request.getParameter("new_password");

   //��susers���K�X
   sql = "UPDATE users SET user_password=? where user_id=?"; 
   //�ˬd��J�K�X
   PreparedStatement prest = con.prepareStatement(sql);
   //4.�z�LStatement�������SQL�ԭz
   //5.���o����᪺Resqult����,�άO�Q���ʪ���Ƶ���:

   prest.setString(1,user_password);
   prest.setString(2,login_user);
   prest.executeUpdate();
 
   
   stmt.close();
   con.close();

   response.sendRedirect("member_manage.jsp");

%>
</body>
</html>

