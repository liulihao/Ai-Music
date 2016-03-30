<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=Big5"%>
<%@include file="opendata.jsp"%>
<%
	String value;
	value = request.getParameter("page");
	if(value.equals("admin_page_post-activity_revise"))
	{
		int Message_code =Integer.parseInt(request.getParameter("Message_code"));
		response.sendRedirect("admin_page_post-activity_revise.jsp?Message_code"+Message_code);
	}
	else if(value.equals("manager"))
		response.sendRedirect("manager.jsp?pageno=1");
%>