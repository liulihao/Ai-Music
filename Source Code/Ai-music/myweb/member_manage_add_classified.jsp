<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<% request.setCharacterEncoding("big5");%> 
<%
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	String classify_name=request.getParameter("classify");
	sql="insert into user_track_classify set user_id='"+login_user+"',classify_name='"+classify_name+"'";
	stmt.executeUpdate(sql);
	response.sendRedirect("member_manage_classified.jsp");
%>