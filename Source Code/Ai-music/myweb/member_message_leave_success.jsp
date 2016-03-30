<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	String user_id = new String(request.getParameter("user").getBytes("ISO8859_1"));//該會員空間的帳號
	String subject = new String(request.getParameter("subject").getBytes("ISO8859_1"));
	String content = new String(request.getParameter("content").getBytes("ISO8859_1"));
	String post_id = new String(request.getParameter("login").getBytes("ISO8859_1"));//登入者的帳號
	
	StringBuffer buf = new StringBuffer(content.length()+6);
	char ch = ' ';
	for(int p = 0;p < content.length();p++)//若遇到換行就轉為<br>
	{
		ch = content.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	content = buf.toString();
	
	
	Statement user=con.createStatement();
	String user_sql="SELECT * FROM users WHERE user_id='"+post_id+"'";//查詢登入者的資料
	ResultSet user_data;
	user_data=user.executeQuery(user_sql);
	
	while(user_data.next()){
		String post_nkname=user_data.getString("user_nkname");//登入者暱稱
		sql="INSERT INTO message SET subject=?,memo=?,user_id=?,post_id=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,subject);
		pstmt.setString(2,content);
		pstmt.setString(3,user_id);
		pstmt.setString(4,post_id);
		pstmt.executeUpdate();
		pstmt.close();
		//把剛存的留言的id抓出來
		/*sql="select * from message where post_id='"+post_id+"' order by time desc";
		rs=stmt.executeQuery(sql);
		rs.absolute(1);
		int message_id=rs.getInt("id");
	
		Statement u_friend=con.createStatement();//把資料塞到好友互動資料表
		sql="select * from friend where friend_id='"+user_id+"' AND friend_check=1";			     						
		//在朋友資料表找尋是否有人收藏此會員空間帳號為好友
		ResultSet user_friend=u_friend.executeQuery(sql);
		while(user_friend.next()){
			String user_user=user_friend.getString("user_id");//取朋友資料表中的原加入者
			if(!user_user.equals("")){//如果此會員空間帳號被收為好友的話
				sql="insert into friend_interactive set user_id='"+user_user+"',friend_id='"+user_id+"',friend_message_id="+message_id;//就塞進friend_interactive資料表中
				stmt.executeUpdate(sql);
			}
		}*/
	}
	
	user_data.close();
	user.close();
	out.print("<script type='text/javascript'>parent.location.href = 'member_page_message.jsp?user="+user_id+"';</script>");
%>