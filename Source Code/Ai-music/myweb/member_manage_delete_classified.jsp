<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<% request.setCharacterEncoding("big5");%> 
<%
	String classify_id=request.getParameter("user_classify");
	sql="delete from user_track_classify where classify_id ='"+classify_id+"'";
	stmt.executeUpdate(sql);
	response.sendRedirect("member_manage_classified.jsp");
%>