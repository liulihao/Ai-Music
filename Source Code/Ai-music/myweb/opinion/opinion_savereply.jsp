<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@include file="convert.jsp"%>
<%
	int track_id = Integer.parseInt(request.getParameter("track_id"));
	int id = Integer.parseInt(request.getParameter("id"));
    String reply = new String(request.getParameter("reply_text").getBytes("ISO8859_1"));
	
	
	StringBuffer buf = new StringBuffer(reply.length()+6);
	char ch = ' ';
	for(int p = 0;p < reply.length();p++)//若遇到換行就轉為<br>
	{
		ch = reply.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	reply = buf.toString();
	
	sql = "UPDATE opinion SET reply=? WHERE id =?";
	PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,reply);
		pstmt.setInt(2,id);
		pstmt.executeUpdate();
		pstmt.close();
	
	out.print("<script language='javascript'>");
	out.print("parent.location.href = '../member_page_music_song.jsp?music_id=" + track_id + "';");
	out.print("</script>"); 
%>