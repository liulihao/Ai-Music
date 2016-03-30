<%@ page contentType="text/html; charset=Big5" 
	import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%!
String CheckLogin(String Login, String Password) throws Exception
{
	Connection con = null; //起始設定資料庫連結相關物件
	Statement stmt = null;
	ResultSet rs = null;
	String result = null;
	
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		//載入驅動程式類別

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=big5","root","root");
		//建立資料庫連線

		stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					     ResultSet.CONCUR_READ_ONLY);
		//建立Statement物件, 並設定記錄指標類型為可前後移動
		
		String strSQL = "SELECT * FROM admin " +
				"WHERE admin_id = '" + Login + "'";
		//欲執行查詢的SQL敘述

		rs = stmt.executeQuery(strSQL);
		//執行SQL敘述進行帳號查詢
	
		if(!rs.next()) //檢查記錄指標是否指到最後一筆記錄
		{ //若記錄指標在記錄集一開啟時便指到最後一筆記錄則表示沒有記錄
			result = "無此帳號";
		}		
		else if(!rs.getString("admin_password").equals(Password)) 
		{ //判斷密碼是否正確
			result = "密碼錯誤";
		}
		else //通過檢查表示帳號與密碼均正確成功登入
		{
			result = "成功登入";
				
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
		rs.close(); //關閉ResultSet物件
		stmt.close(); //關閉Statement物件
		con.close(); //關閉Connection物件
	}

	return result;
}
%>
<%
String user_id = request.getParameter("user_id");
//取得使用者輸入的帳號
String user_password  = request.getParameter("user_password");
//取得使用者輸入的密碼

//判斷使用者帳號與密碼所取得值是否為null, 是則將網頁導向LogFrm.htm
if(user_id == null || user_password == null)
	response.sendRedirect("register2.jsp");

String strCheckLogin = CheckLogin(user_id, user_password);
//呼叫CheckLogin函數進行帳號與密碼的檢查

if (strCheckLogin.equals("成功登入")) //判斷是否成功登入
{
	session.setAttribute("user_id",user_id); 
	//將登入帳號儲存進session物件中
	session.setAttribute("user_password",user_password);
	//將帳號密碼儲存進session物件中
	response.sendRedirect("admin_page_member_manage.jsp");
	//將顯示網頁導向member_manage.html網頁
}
%>
<HTML>
<HEAD>
<TITLE>使用者登入</TITLE>
</HEAD>
<BODY>
<CENTER>
<FONT SIZE = 5 COLOR = blue>使用者登入</FONT>
</CENTER>
<HR>
<Center>
<!--若登入失敗時才會執行至下面的敘述-->
<%= strCheckLogin %><P></P><A href = "Login_admin.jsp">請重新登入</A>
</Center>
</BODY>
</HTML>
