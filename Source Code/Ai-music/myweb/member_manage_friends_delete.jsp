<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	String friend_user_id=request.getParameter("user_id");
	String friend_friend_id=request.getParameter("friend_id");
	
	String del_sql;
	Statement del_friend=con.createStatement();
	/*del_sql="delete from friend_interactive where user_id='"+friend_user_id+"' AND friend_id='"+friend_friend_id+"'";//奔friend_interactiveいtrack_id㎝user_id常才
	del_friend.executeUpdate(del_sql);
		
	del_sql="delete from friend_interactive where user_id='"+friend_friend_id+"' AND friend_id='"+friend_user_id+"'";//奔friend_interactiveいtrack_id㎝user_id常才
	del_friend.executeUpdate(del_sql);*/
	del_sql="DELETE FROM friend where user_id='"+friend_user_id+"' AND friend_id='"+friend_friend_id+"'";
	del_friend.executeUpdate(del_sql);
	
	del_sql="DELETE FROM friend where user_id='"+friend_friend_id+"' AND friend_id='"+friend_user_id+"'";
	del_friend.executeUpdate(del_sql);
	
    response.sendRedirect("member_manage_friends.jsp");
%>