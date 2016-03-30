<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%
	String post_id = (String)session.getAttribute("user_id"); //登入者的帳號
	int track_id = Integer.parseInt(request.getParameter("track_id")); //音樂編號
	String opinion = new String(request.getParameter("opinion_text").getBytes("ISO8859_1")); //上一頁表單填的內容
	
	StringBuffer buf = new StringBuffer(opinion.length()+6);
	char ch = ' ';
	for(int p = 0;p < opinion.length();p++)//若遇到換行就轉為<br>
	{
		ch = opinion.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	opinion = buf.toString();
	
	String user_id = "", post_pic = "", post_nkname = "";
	
	Statement find_user = con.createStatement();
	String find_user_sql = "SELECT * FROM users,track WHERE track.track_id = '"+ track_id +"' AND users.user_id = '"+ post_id +"'";
	ResultSet find_user_data = find_user.executeQuery(find_user_sql);
	
	while(find_user_data.next()){
		user_id = find_user_data.getString("track.user_id");
		sql = "INSERT INTO opinion SET opinion=?,user_id=?,post_id=?,track_id=?"; 
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,opinion);
		pstmt.setString(2,user_id);
		pstmt.setString(3,post_id);
		pstmt.setInt(4,track_id);
		pstmt.executeUpdate();
		pstmt.close();
		//sql="INSERT INTO opinion SET opinion='"+opinion+"',user_id='"+user_id+"',post_id='"+post_id+"',track_id="+track_id;
		//stmt.executeUpdate(sql);
		out.print("<script language='javascript'>");
		out.print("parent.location.href = '../member_page_music_song.jsp?music_id=" + track_id + "';");
		out.print("</script>");
	}
	stmt.close();
	find_user_data.close();
	find_user.close();
%>