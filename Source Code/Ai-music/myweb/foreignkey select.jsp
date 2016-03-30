<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
  
  String user_id="amemo";
  /*sql="select * from friend where user_id='"+user_id+"'";*/
  sql="select users.user_nkname,users.user_pic, friend.friend_id from friend INNER JOIN users ON users.user_id=friend.user_id and friend.user_id='"+user_id+"'"; 
  rs=stmt.executeQuery(sql);
  while(rs.next()){
  String name=rs.getString("user_nkname");
  String pic=rs.getString("user_pic");
  String id=rs.getString("friend_id");
   out.print(name+"&nbsp;<br>");
   out.print(pic+"&nbsp;");
   out.print(id+"<br>");
   }
   rs.close();
   con.close();
%>
