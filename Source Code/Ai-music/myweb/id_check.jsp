<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

<% request.setCharacterEncoding("big5");%> 
<%
  //�T�{�b�����פj�󤭭Ӧr��
  int length=Integer.parseInt(request.getParameter("id_length"));
	if(length<5){
		out.print("<font color='red'>�b�����׻ݶW�L���Ӧr</font>"); 
  	}else{//else //�T�{�O�_�����бb��
	  String user_id=request.getParameter("user_id");
	  boolean Exist=false;
  
 	 sql="select * from users where user_id='"+user_id+"'";
 	 rs = stmt.executeQuery(sql);
  
 	 	while(rs.next()){
 	  	 Exist=true;
 	 	}
		if(Exist){
			out.print("<font color='red'>�b���w���H�ϥ�</font>"); 
		}else{
		   out.print("<font color='green'>���b���i�ϥ�</font>"); 
  		}
		rs.close();
		stmt.close();
		con.close();
	}//else
	
	
%>


