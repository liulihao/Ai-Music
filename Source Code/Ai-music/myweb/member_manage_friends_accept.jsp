<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%
	//String login_user=(String)session.getAttribute("user_id");
	String login_user = request.getParameter("user_id");
	String friend_id = request.getParameter("friend_id");//��friend��椤��id
	//�T�{���ӽ� �å[���ۤv�n��
	sql="INSERT INTO friend SET user_id='"+login_user+"',friend_id='"+friend_id+"',friend_check=1"; //�N�ۤv���b��(login_user)��Juser_id���A�N��N�������ۤv���n�͡A�N���b��(friend_id)��Jfriend_id���
	stmt.executeUpdate(sql);
	//��sfriend_check
	sql = "UPDATE friend SET friend_check=? WHERE user_id=? AND friend_id=?"; 
	PreparedStatement prest = con.prepareStatement(sql);
 
	prest.setInt(1,1);
	prest.setString(2,friend_id); //�N���ӽЪ���Ƨ�s�Auser_id�|������(�ӽФ�)���b��(�]���O���n�J�ɩҴ��X���ӽ�)�A�ҥH�b�o�̭n��friend_id���ȵ�user_id���
	prest.setString(3,login_user); //���Ӹ�ƪ�friend_id�|����ۤv���b���A�]�N�Ologin_user�A�ҥH�Nlogin_user�뵹friend_id���
	prest.executeUpdate();
	response.sendRedirect("member_manage_friends.jsp");
%>