<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

<% request.setCharacterEncoding("big5");%> 
<%
  //確認帳號長度大於五個字元
  int length=Integer.parseInt(request.getParameter("id_length"));
	if(length<5){
		out.print("<font color='red'>帳號長度需超過五個字</font>"); 
  	}else{//else //確認是否有重覆帳號
	  String user_id=request.getParameter("user_id");
	  boolean Exist=false;
  
 	 sql="select * from users where user_id='"+user_id+"'";
 	 rs = stmt.executeQuery(sql);
  
 	 	while(rs.next()){
 	  	 Exist=true;
 	 	}
		if(Exist){
			out.print("<font color='red'>帳號已有人使用</font>"); 
		}else{
		   out.print("<font color='green'>此帳號可使用</font>"); 
  		}
		rs.close();
		stmt.close();
		con.close();
	}//else
	
	
%>


