<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<% request.setCharacterEncoding("big5");%> 
<%
	String classify_name=request.getParameter("update_classify");
	String classify_id=request.getParameter("user_classify");

	sql = "UPDATE user_track_classify SET classify_name=? where classify_id=?";
	PreparedStatement prest = con.prepareStatement(sql);
	prest.setString(1,classify_name);
	prest.setString(2,classify_id);
	prest.executeUpdate();
	response.sendRedirect("member_manage_classified.jsp");
%>