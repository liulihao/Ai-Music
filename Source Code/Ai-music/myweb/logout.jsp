<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	String login_user=(String)session.getAttribute("user_id");
	String logout_sql = "UPDATE users SET logout_time = NOW() WHERE user_id = '"+login_user+"'";
	stmt.executeUpdate(logout_sql);
	session.removeAttribute("user_id");
	session.invalidate();
	response.sendRedirect("index.jsp");
%>