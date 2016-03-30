<%@ page contentType="text/html; charset=Big5" import="java.sql.*"%>
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
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=big5","root","prott");
		stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					     ResultSet.CONCUR_READ_ONLY);
		//建立Statement物件, 並設定記錄指標類型為可前後移動
		String strSQL = "SELECT * FROM users " +
				"WHERE user_id = '" + Login + "'";
		//欲執行查詢的SQL敘述
		rs = stmt.executeQuery(strSQL);
		//執行SQL敘述進行帳號查詢
		if(!rs.next()) //檢查記錄指標是否指到最後一筆記錄
		{ //若記錄指標在記錄集一開啟時便指到最後一筆記錄則表示沒有記錄
			result = "無此帳號,請註冊";
		}		
		else if(!rs.getString("user_password").equals(Password)) 
		{ //判斷密碼是否正確
			result = "密碼錯誤"; 
		}
		else if(rs.getInt("user_authority")==1) 
		{ //判斷密碼是否正確
			result = "你被停權中";
		}
		else if(rs.getInt("user_authority")==3)
		{
		    result="管理者登入";
			Date Now=new Date();
            strSQL="UPDATE users SET login_time=NOW() where user_id='"+Login+"'";
            stmt.executeUpdate(strSQL);
		}
		else //通過檢查表示帳號與密碼均正確成功登入
		{
			result = "成功登入";
			
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

	//判斷使用者帳號與密碼所取得值是否為null
	if(user_id == null || user_password == null)
		response.sendRedirect("index.jsp");
	String web_url=request.getParameter("web_url");//是從哪頁登入的
	String strCheckLogin = CheckLogin(user_id, user_password);
	//呼叫CheckLogin函數進行帳號與密碼的檢查

	if (strCheckLogin.equals("成功登入")) //判斷是否成功登入
	{
		session.setAttribute("user_id",user_id); 
		//將登入帳號儲存進session物件中
		session.setAttribute("user_password",user_password);
		//將帳號密碼儲存進session物件中
		out.print("<script language='javascript'>");
		if(web_url.equals("new_register")){
			web_url="/Ai-music/myweb/member_page.jsp?user="+user_id;
			}
		out.print("parent.location.href = '"+web_url+"';");//寫入SESSION回到該頁
		out.print("</script>");
	}
	if(strCheckLogin.equals("管理者登入")){
		session.setAttribute("user_id",user_id); 
		//將登入帳號儲存進session物件中
		session.setAttribute("user_password",user_password);
   		out.print("<script type='text/javascript'>");
   		out.print("parent.location.href = 'admin_page_member_manage.jsp';");
   		out.print("</script>");
	}
%>
<!--若登入失敗時才會執行至下面的敘述-->
<%
	out.print("<script language='javascript'>");
	out.print("window.alert('"+strCheckLogin+"');");
	out.print("parent.location.href = 'index.jsp';");
	out.print("</script>");
%>