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
   String user="SELECT * FROM users WHERE user_id ='"+login_user+"'";
   rs = stmt.executeQuery(user);//查詢users 以便找到該會員密碼
   
   String password=null;
   while(rs.next()){
    password=rs.getString("user_password");
    }   
   String user_email = request.getParameter("user_email");
   String user_password = request.getParameter("user_password");
   if(password.equals(user_password)){
   //更新users的email資料
   sql = "UPDATE users SET user_email=? where user_id=?"; 
   //檢查輸入密碼
   PreparedStatement prest = con.prepareStatement(sql);
   //4.透過Statement物件執行SQL敘述
   //5.取得執行後的Resqult物件,或是被異動的資料筆數:

   prest.setString(1,user_email);
   prest.setString(2,login_user);
   prest.executeUpdate();
 
 
   rs.close();
   stmt.close();
   con.close();

   response.sendRedirect("member_manage.jsp");
   }
   else{
   out.print("<script language='javascript'>alert('密碼錯誤');");
   out.print("location.href='member_manage.jsp';");
   out.print("</script>");
   }
%>
</body>
</html>

