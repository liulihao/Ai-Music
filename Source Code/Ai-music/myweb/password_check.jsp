<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("utf8");%> 
<%
  String user_id=request.getParameter("user_id");
  String user_password=request.getParameter("user_password");
  boolean Exist=false;
  boolean passed;
  String message;
   
  String strSQL="select * from users where user_id='"+user_id+"'and user_password='"+user_password+"'";
  Statement user_stmt=con.createStatement();
  ResultSet user_rs;
  user_rs = user_stmt.executeQuery(strSQL);
 
  while(user_rs.next()){
    Exist=true;
  }
  if(Exist){
  user_stmt.close();
  user_rs.close();
  passed = false;
  message = "±K½X¥¿½T"; 
  }
   else{
   passed = true; 
   message = "±K½X¦³»~"; 
  }
 response.setCharacterEncoding("utf-8");
response.addHeader("Cache-Control", "no-cache"); 
con.close();
%>
<response> 
  <passed><%=(passed?"true":"false") %></passed> 
  <message><%=message %></message> 
</response>


