<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.Date"%>
<%@include file="opendata.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>

</head>

<body>
<% request.setCharacterEncoding("big5");%> 
<%!    //�]�w�������
 static final String pattern =
            "yyyy-MM-dd KK:mm:ss";
%>
<%

	String login_user=request.getParameter("login_user");
	String user_id=request.getParameter("user_id");
	String f_title=request.getParameter("f_title");
	String f_text=request.getParameter("f_text");
  
	String other=request.getParameter("other");
	String f_time= (new java.text.SimpleDateFormat(pattern)).format(new java.util.Date());
	String f_url=request.getParameter("f_url");//���o�Q���|�Υ��������}
	
	StringBuffer buf = new StringBuffer(f_text.length()+6);
	char ch = ' ';
	for(int p = 0;p < f_text.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch = f_text.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	f_text = buf.toString();
	
	Statement find_user = con.createStatement();
	String find_user_sql = "SELECT * FROM users WHERE user_id = '"+user_id +"'";
	ResultSet find_user_data = find_user.executeQuery(find_user_sql);
	
	if(login_user.equals(user_id)){
		out.print("<script language='javascript'>alert('�A���i�H���|�ۤv');");
		out.print("parent.location.href = '"+f_url+"';");
		out.print("</script>");
	}
	else if(!find_user_data.next()){
		out.print("<script language='javascript'>alert('�S���o�ӱb��');");
		out.print("parent.location.href = '"+f_url+"';");
		out.print("</script>");	
	}
	else{
		if(other==""){
		sql="insert into feedback set f_title='"+f_title+"',f_text='"+f_text+"',user_id='"+user_id+"',post_id='"+login_user+"',f_time='"+f_time+"',f_url='"+f_url+"'";
		}
		else{
			sql="insert into feedback set f_title='"+other+"',f_text='"+f_text+"',user_id='"+user_id+"',post_id='"+login_user+"',f_time='"+f_time+"',f_url='"+f_url+"'";
		}
		stmt.executeUpdate(sql);
    
		stmt.close();
		con.close();
		out.print("<script language='javascript'>alert('���|���\');");
		out.print("parent.location.href = '"+f_url+"';");
		out.print("</script>");
	}
%>


</body>
<script type="text/javascript">
parent.location.reload();
</script>
</html>
