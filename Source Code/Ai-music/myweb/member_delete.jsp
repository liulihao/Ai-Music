<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
<%
	String id=request.getParameter("id");
	
	sql="DELETE FROM evaluatioin,users WHERE evaluation.user_id = users.user_id OR evalution.post_id = users.user_id AND users.id ="+id;
	stmt.executeUpdate(sql);
	
	sql="DELETE FROM friend,users WHERE friend.user_id = users.user_id OR friend.friend_id = users.user_id AND users.id ="+id;
	stmt.executeUpdate(sql);
	
	sql="DELETE FROM friend_interactive WHERE friend_interactive.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;
sql="DELETE FROM friend, friend_interactive, message, music_collection, opinion, reply, subject, title, track, visible WHERE (evaluation.user_id = users.user_id OR evaluation.post_id = users.user_id) AND (feedback.post_id = users.user_id OR feedback.user_id = users.user_id) AND (friend.user_id = users.user_id OR friend.friend_id = users.user_id) AND () id ="+id;

response.sendRedirect("admin_page_member_manage.jsp");
%>
