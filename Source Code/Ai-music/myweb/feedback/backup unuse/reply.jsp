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

<body>
<% request.setCharacterEncoding("big5");%> 
<%
String Id=request.getParameter("Id");
session.setAttribute("Id",Id);
	
%>
<form action="save_reply.jsp" method="post">

<table>
	<tr><td>回覆留言</td></tr>
    <tr>
    <td><textarea name="reply_text" cols="15" rows="5"></textarea></td>
    </tr>
    <tr>
    <td><input name="button" type="submit" value="reply"  /></td>
    </tr>
</table>
</form>

</body>
</html>