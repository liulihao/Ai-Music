<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	String user_id = new String(request.getParameter("user").getBytes("ISO8859_1"));//�ӷ|���Ŷ����b��
	String subject = new String(request.getParameter("subject").getBytes("ISO8859_1"));
	String content = new String(request.getParameter("content").getBytes("ISO8859_1"));
	String post_id = new String(request.getParameter("login").getBytes("ISO8859_1"));//�n�J�̪��b��
	
	StringBuffer buf = new StringBuffer(content.length()+6);
	char ch = ' ';
	for(int p = 0;p < content.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch = content.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	content = buf.toString();
	
	
	Statement user=con.createStatement();
	String user_sql="SELECT * FROM users WHERE user_id='"+post_id+"'";//�d�ߵn�J�̪����
	ResultSet user_data;
	user_data=user.executeQuery(user_sql);
	
	while(user_data.next()){
		String post_nkname=user_data.getString("user_nkname");//�n�J�̼ʺ�
		sql="INSERT INTO message SET subject=?,memo=?,user_id=?,post_id=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,subject);
		pstmt.setString(2,content);
		pstmt.setString(3,user_id);
		pstmt.setString(4,post_id);
		pstmt.executeUpdate();
		pstmt.close();
		//���s���d����id��X��
		/*sql="select * from message where post_id='"+post_id+"' order by time desc";
		rs=stmt.executeQuery(sql);
		rs.absolute(1);
		int message_id=rs.getInt("id");
	
		Statement u_friend=con.createStatement();//���ƶ��n�ͤ��ʸ�ƪ�
		sql="select * from friend where friend_id='"+user_id+"' AND friend_check=1";			     						
		//�b�B�͸�ƪ��M�O�_���H���æ��|���Ŷ��b�����n��
		ResultSet user_friend=u_friend.executeQuery(sql);
		while(user_friend.next()){
			String user_user=user_friend.getString("user_id");//���B�͸�ƪ�����[�J��
			if(!user_user.equals("")){//�p�G���|���Ŷ��b���Q�����n�ͪ���
				sql="insert into friend_interactive set user_id='"+user_user+"',friend_id='"+user_id+"',friend_message_id="+message_id;//�N��ifriend_interactive��ƪ�
				stmt.executeUpdate(sql);
			}
		}*/
	}
	
	user_data.close();
	user.close();
	out.print("<script type='text/javascript'>parent.location.href = 'member_page_message.jsp?user="+user_id+"';</script>");
%>