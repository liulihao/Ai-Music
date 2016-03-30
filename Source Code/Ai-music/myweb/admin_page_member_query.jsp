<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

<%

    String mode=request.getParameter("mode");//根據哪類依據
	String order=request.getParameter("order");//作排序
	String query=mode+" "+order;
	
	response.sendRedirect("admin_page_member_manage.jsp?query="+query);
%>
