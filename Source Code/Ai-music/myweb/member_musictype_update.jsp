<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
</head>

<body>
<% request.setCharacterEncoding("big5");%> 
<%
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	String d_music="DELETE FROM user_music WHERE user_id='"+login_user+"'";
	//���¦���ƧR�� �קKPK���ư��D
	stmt.executeUpdate(d_music);
  
	String Rock = request.getParameter("Rock");
	String Pop = request.getParameter("Pop");
	String Electronic = request.getParameter("Electronic");
	String Metal = request.getParameter("Metal");
	String HipHop = request.getParameter("HipHop");
	String Jazz = request.getParameter("Jazz");
	String Conutry = request.getParameter("Conutry");
 	String Folk = request.getParameter("Folk");
	String Classical = request.getParameter("Classical");
 	String Dance = request.getParameter("Dance");
	String RnB = request.getParameter("RnB");
	String Undefined = request.getParameter("Undefined");
	String type[]={Rock,Pop,Electronic,Metal,HipHop,Jazz,Conutry,Folk,Classical,Dance,RnB,Undefined};
	for(int i=0;i<12;i++)
	{
    	if(type[i]!=null)
		{
			String user_type = "INSERT INTO user_music(user_id,music_id) VALUES (?,?)";
			PreparedStatement music = con.prepareStatement(user_type);
			//4.�z�LStatement�������SQL�ԭz
			//5.���o����᪺Resqult����,�άO�Q���ʪ���Ƶ���:
	
			//�s�W����᪺������user_music
			music.setString(1,login_user);
			music.setString(2,type[i]);
			music.executeUpdate();
		}
	}
	stmt.close();
	con.close();
	out.print("<script language='javascript'>");
	out.print("history.back()");
	out.print("</script>");
%>
</body>
</html>