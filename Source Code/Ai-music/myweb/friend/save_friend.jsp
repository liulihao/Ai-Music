<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="../opendata.jsp"%>
<%
  String user_id=request.getParameter("user_id");
  String friend_id=request.getParameter("friend_id");
  
  boolean Exist=false;
  Statement friend=con.createStatement();//抓朋友資料
  String friend_sql="select * from friend where friend_id='"+friend_id+"' and user_id='"+user_id+"'";
  ResultSet friend_data;
  friend_data=friend.executeQuery(friend_sql);
  
  while(friend_data.next()){
  	Exist=true;
  }
  if(Exist){
  	  out.print("你們已經是朋友了");
	  
    }
	else{
      sql="insert into friend set user_id='"+user_id+"',friend_id='"+friend_id+"'";
      stmt.executeUpdate(sql);
      stmt.close();
      con.close();
      out.print("以發送訊息，等待對方確認");
	}
  friend_data.close();
  friend.close();
     
%>

