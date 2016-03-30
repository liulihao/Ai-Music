<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
<%
Statement stmt=con.createStatement();
String sqll;
int title_id,discuss_subject;

title_id = Integer.parseInt(request.getParameter("title_id"));
discuss_subject= Integer.parseInt(request.getParameter("discuss_subject"));

sql="delete from reply where title_id ="+title_id;
       stmt.executeUpdate(sql);


sql="delete from title where title_id ="+title_id;
       smt.executeUpdate(sql);


response.sendRedirect("admin_page_discuss.jsp?discuss_subject="+discuss_subject+"");
%>
