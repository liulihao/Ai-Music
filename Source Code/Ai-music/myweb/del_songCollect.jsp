<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%

  int track_id=Integer.parseInt(request.getParameter("track_id"));//�ӭ��q���s��
  String login_id=request.getParameter("login_id");//�n�J�̬O��
  
  sql="delete from music_collection where login_id='"+login_id+"' and track_id="+track_id;
  stmt.executeUpdate(sql);
  
  response.sendRedirect("member_manage_interactive.jsp");
%>

