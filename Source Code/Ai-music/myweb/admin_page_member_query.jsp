<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

<%

    String mode=request.getParameter("mode");//�ھڭ����̾�
	String order=request.getParameter("order");//�@�Ƨ�
	String query=mode+" "+order;
	
	response.sendRedirect("admin_page_member_manage.jsp?query="+query);
%>
