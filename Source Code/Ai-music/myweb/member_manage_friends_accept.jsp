<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	//String login_user=(String)session.getAttribute("user_id");
	String login_user = request.getParameter("user_id");
	String friend_id = request.getParameter("friend_id");//抓friend表格中的id
	//確認對方申請 並加成自己好友
	sql="INSERT INTO friend SET user_id='"+login_user+"',friend_id='"+friend_id+"',friend_check=1"; //將自己的帳號(login_user)塞入user_id欄位，代表將對方視為自己的好友，將對方帳號(friend_id)塞入friend_id欄位
	stmt.executeUpdate(sql);
	//更新friend_check
	sql = "UPDATE friend SET friend_check=? WHERE user_id=? AND friend_id=?"; 
	PreparedStatement prest = con.prepareStatement(sql);
 
	prest.setInt(1,1);
	prest.setString(2,friend_id); //將對方申請的資料更新，user_id會等於對方(申請方)的帳號(因為是對方登入時所提出的申請)，所以在這裡要塞friend_id的值給user_id欄位
	prest.setString(3,login_user); //本來資料的friend_id會等於自己的帳號，也就是login_user，所以將login_user塞給friend_id欄位
	prest.executeUpdate();
	response.sendRedirect("member_manage_friends.jsp");
%>