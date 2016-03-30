<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	String user_id=request.getParameter("user");
	int id = Integer.parseInt(request.getParameter("id"));
	String reply = new String(request.getParameter("reply").getBytes("ISO8859_1"));
	
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
	
	sql = "UPDATE message SET reply=? WHERE id =?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,reply);
		pstmt.setInt(2,id);

		pstmt.executeUpdate();
		pstmt.close();
	
	con.close();
	out.print("<script type='text/javascript'>parent.location.href = 'member_page_message.jsp?user="+user_id+"';</script>");
%>