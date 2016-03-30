<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>

<body>
<% request.setCharacterEncoding("big5");%> 
<%
   String login_user = (String)session.getAttribute("user_id");
   String user_password = request.getParameter("new_password");

   //更新users的密碼
   sql = "UPDATE users SET user_password=? where user_id=?"; 
   //檢查輸入密碼
   PreparedStatement prest = con.prepareStatement(sql);
   //4.透過Statement物件執行SQL敘述
   //5.取得執行後的Resqult物件,或是被異動的資料筆數:

   prest.setString(1,user_password);
   prest.setString(2,login_user);
   prest.executeUpdate();
 
   
   stmt.close();
   con.close();

   response.sendRedirect("member_manage.jsp");

%>
</body>
</html>

