<%@ page contentType="text/html; charset=Big5" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%!
String CheckLogin(String Login, String Password) throws Exception
{
	Connection con = null; //�_�l�]�w��Ʈw�s����������
	Statement stmt = null;
	ResultSet rs = null;
	String result = null;
	
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=big5","root","prott");
		stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					     ResultSet.CONCUR_READ_ONLY);
		//�إ�Statement����, �ó]�w�O�������������i�e�Ჾ��
		String strSQL = "SELECT * FROM users " +
				"WHERE user_id = '" + Login + "'";
		//������d�ߪ�SQL�ԭz
		rs = stmt.executeQuery(strSQL);
		//����SQL�ԭz�i��b���d��
		if(!rs.next()) //�ˬd�O�����ЬO�_����̫�@���O��
		{ //�Y�O�����Цb�O�����@�}�ҮɫK����̫�@���O���h��ܨS���O��
			result = "�L���b��,�е��U";
		}		
		else if(!rs.getString("user_password").equals(Password)) 
		{ //�P�_�K�X�O�_���T
			result = "�K�X���~"; 
		}
		else if(rs.getInt("user_authority")==1) 
		{ //�P�_�K�X�O�_���T
			result = "�A�Q���v��";
		}
		else if(rs.getInt("user_authority")==3)
		{
		    result="�޲z�̵n�J";
			Date Now=new Date();
            strSQL="UPDATE users SET login_time=NOW() where user_id='"+Login+"'";
            stmt.executeUpdate(strSQL);
		}
		else //�q�L�ˬd��ܱb���P�K�X�����T���\�n�J
		{
			result = "���\�n�J";
			
	      Date Now=new Date();
          strSQL="UPDATE users SET login_time=now() where user_id='"+Login+"'";
          stmt.executeUpdate(strSQL);
		}		
	}
	catch(Exception ex)
	{
		throw ex;
	}
	finally
	{	
		rs.close(); //����ResultSet����
		stmt.close(); //����Statement����
		con.close(); //����Connection����
	}

	return result;
}
%>
<%
	String user_id = request.getParameter("user_id");
	//���o�ϥΪ̿�J���b��
	String user_password  = request.getParameter("user_password");
	//���o�ϥΪ̿�J���K�X

	//�P�_�ϥΪ̱b���P�K�X�Ҩ��o�ȬO�_��null
	if(user_id == null || user_password == null)
		response.sendRedirect("index.jsp");
	String web_url=request.getParameter("web_url");//�O�q�����n�J��
	String strCheckLogin = CheckLogin(user_id, user_password);
	//�I�sCheckLogin��ƶi��b���P�K�X���ˬd

	if (strCheckLogin.equals("���\�n�J")) //�P�_�O�_���\�n�J
	{
		session.setAttribute("user_id",user_id); 
		//�N�n�J�b���x�s�isession����
		session.setAttribute("user_password",user_password);
		//�N�b���K�X�x�s�isession����
		out.print("<script language='javascript'>");
		if(web_url.equals("new_register")){
			web_url="/Ai-music/myweb/member_page.jsp?user="+user_id;
			}
		out.print("parent.location.href = '"+web_url+"';");//�g�JSESSION�^��ӭ�
		out.print("</script>");
	}
	if(strCheckLogin.equals("�޲z�̵n�J")){
		session.setAttribute("user_id",user_id); 
		//�N�n�J�b���x�s�isession����
		session.setAttribute("user_password",user_password);
   		out.print("<script type='text/javascript'>");
   		out.print("parent.location.href = 'admin_page_member_manage.jsp';");
   		out.print("</script>");
	}
%>
<!--�Y�n�J���Ѯɤ~�|����ܤU�����ԭz-->
<%
	out.print("<script language='javascript'>");
	out.print("window.alert('"+strCheckLogin+"');");
	out.print("parent.location.href = 'index.jsp';");
	out.print("</script>");
%>