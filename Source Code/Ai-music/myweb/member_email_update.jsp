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
   String user="SELECT * FROM users WHERE user_id ='"+login_user+"'";
   rs = stmt.executeQuery(user);//�d��users �H�K���ӷ|���K�X
   
   String password=null;
   while(rs.next()){
    password=rs.getString("user_password");
    }   
   String user_email = request.getParameter("user_email");
   String user_password = request.getParameter("user_password");
   if(password.equals(user_password)){
   //��susers��email���
   sql = "UPDATE users SET user_email=? where user_id=?"; 
   //�ˬd��J�K�X
   PreparedStatement prest = con.prepareStatement(sql);
   //4.�z�LStatement�������SQL�ԭz
   //5.���o����᪺Resqult����,�άO�Q���ʪ���Ƶ���:

   prest.setString(1,user_email);
   prest.setString(2,login_user);
   prest.executeUpdate();
 
 
   rs.close();
   stmt.close();
   con.close();

   response.sendRedirect("member_manage.jsp");
   }
   else{
   out.print("<script language='javascript'>alert('�K�X���~');");
   out.print("location.href='member_manage.jsp';");
   out.print("</script>");
   }
%>
</body>
</html>

