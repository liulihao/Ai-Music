<%@ page contentType="text/html; charset=Big5" 
	import="java.sql.*"%>
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
		//���J�X�ʵ{�����O

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=big5","root","root");
		//�إ߸�Ʈw�s�u

		stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					     ResultSet.CONCUR_READ_ONLY);
		//�إ�Statement����, �ó]�w�O�������������i�e�Ჾ��
		
		String strSQL = "SELECT * FROM admin " +
				"WHERE admin_id = '" + Login + "'";
		//������d�ߪ�SQL�ԭz

		rs = stmt.executeQuery(strSQL);
		//����SQL�ԭz�i��b���d��
	
		if(!rs.next()) //�ˬd�O�����ЬO�_����̫�@���O��
		{ //�Y�O�����Цb�O�����@�}�ҮɫK����̫�@���O���h��ܨS���O��
			result = "�L���b��";
		}		
		else if(!rs.getString("admin_password").equals(Password)) 
		{ //�P�_�K�X�O�_���T
			result = "�K�X���~";
		}
		else //�q�L�ˬd��ܱb���P�K�X�����T���\�n�J
		{
			result = "���\�n�J";
				
	      Date Now=new Date();
          strSQL="UPDATE admin SET login_time=now() where admin_id='"+Login+"'";
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

//�P�_�ϥΪ̱b���P�K�X�Ҩ��o�ȬO�_��null, �O�h�N�����ɦVLogFrm.htm
if(user_id == null || user_password == null)
	response.sendRedirect("register2.jsp");

String strCheckLogin = CheckLogin(user_id, user_password);
//�I�sCheckLogin��ƶi��b���P�K�X���ˬd

if (strCheckLogin.equals("���\�n�J")) //�P�_�O�_���\�n�J
{
	session.setAttribute("user_id",user_id); 
	//�N�n�J�b���x�s�isession����
	session.setAttribute("user_password",user_password);
	//�N�b���K�X�x�s�isession����
	response.sendRedirect("admin_page_member_manage.jsp");
	//�N��ܺ����ɦVmember_manage.html����
}
%>
<HTML>
<HEAD>
<TITLE>�ϥΪ̵n�J</TITLE>
</HEAD>
<BODY>
<CENTER>
<FONT SIZE = 5 COLOR = blue>�ϥΪ̵n�J</FONT>
</CENTER>
<HR>
<Center>
<!--�Y�n�J���Ѯɤ~�|����ܤU�����ԭz-->
<%= strCheckLogin %><P></P><A href = "Login_admin.jsp">�Э��s�n�J</A>
</Center>
</BODY>
</HTML>
