<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.Date"%>
<%@include file="opendata.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
</head>


<% request.setCharacterEncoding("big5");%> 
<%
String Id = (String)session.getAttribute("Id");
 String reply_text=request.getParameter("reply_text");
 
 Date Now=new Date();
 
 sql="UPDATE feedback SET reply_time=now(),"+ " reply_text = '"+ reply_text+ "' where Id='"+ Id+ "'";
 stmt.executeUpdate(sql);
 

stmt.close();
con.close();

response.sendRedirect("feedback_text.jsp");
%>

<body>
</body>
<script type="text/javascript">
parent.location.reload();
</script>
</html>
