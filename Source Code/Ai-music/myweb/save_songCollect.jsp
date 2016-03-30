<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%
	int track_id=Integer.parseInt(request.getParameter("collect_track_id"));//該首歌的編號
	String user_id=request.getParameter("user_id");//是在誰的會員空間
	String login_id=request.getParameter("login_id");//登入者是誰
	
	java.sql.Date now_date=new java.sql.Date(System.currentTimeMillis());//抓現在日期
	sql="insert into music_collection set track_id="+track_id+",user_id='"+user_id+"',login_id='"+login_id+"',collect_date='"+now_date+"'";
	stmt.executeUpdate(sql);
	stmt.close();
	
	out.print("收藏音樂成功");
	//pic.close();
	con.close();
%>

