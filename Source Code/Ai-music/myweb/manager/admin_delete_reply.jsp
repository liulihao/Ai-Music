<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
<%
Statement stmt=con.createStatement();
String sqll;
int title_id,reply_id;

title_id = Integer.parseInt(request.getParameter("title_id"));
reply_id = Integer.parseInt(request.getParameter("reply_id"));

sql="delete from reply where reply_id ="+reply_id;
       stmt.executeUpdate(sql);





response.sendRedirect("admin_page_discuss_content.jsp?title_id="+title_id+"");
%>
