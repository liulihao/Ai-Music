<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%
	int track_id=Integer.parseInt(request.getParameter("collect_track_id"));//�ӭ��q���s��
	String user_id=request.getParameter("user_id");//�O�b�֪��|���Ŷ�
	String login_id=request.getParameter("login_id");//�n�J�̬O��
	
	java.sql.Date now_date=new java.sql.Date(System.currentTimeMillis());//��{�b���
	sql="insert into music_collection set track_id="+track_id+",user_id='"+user_id+"',login_id='"+login_id+"',collect_date='"+now_date+"'";
	stmt.executeUpdate(sql);
	stmt.close();
	
	out.print("���í��֦��\");
	//pic.close();
	con.close();
%>

