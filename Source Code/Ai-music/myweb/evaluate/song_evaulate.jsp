<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="../opendata.jsp"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%

	int track_id=Integer.parseInt(request.getParameter("track_id"));
	String user_id=request.getParameter("user_id");
	int star=Integer.parseInt(request.getParameter("star"));
	String post_id=request.getParameter("post_id");
	sql="insert into evaluation set track_id="+track_id+",user_id='"+user_id+"',star="+star+",post_id='"+post_id+"'";
	stmt.executeUpdate(sql);
	out.println("µû¤À¦¨¥\");
	//evaluate_data.close();
	//evaluate.close();
%>