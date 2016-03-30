<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>
<%!/** 
   * 刪除文件 
   * @param filePathAndName String 文件路徑及名稱 如c:/fqf.txt 
   * @param fileContent String 
   * @return boolean 
   */ 
  public void delFile(String filePathAndName) { 
    try { 
      String filePath = filePathAndName; 
      filePath = filePath.toString(); 
      java.io.File myDelFile = new java.io.File(filePath); 
      myDelFile.delete(); 

    } 
    catch (Exception e) { 
      System.out.println("刪除文件操作出錯"); 
      e.printStackTrace(); 

    }

  }
  
//正規表示式 檢查欄位格式是否正確
	String check(String reg,String check_text) throws Exception{
	try{
		String result;
		if(check_text.matches(reg)) 
            result="格式正確"; 
        else 
            result="格式錯誤";
			return result;
		}catch(Exception ex){
			throw ex;
		}
	}
%>
<body>
<% request.setCharacterEncoding("big5");%> 
<%
   //String user_id = request.getParameter("user");//抓會員空間的會員資料
   String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
   /*if(user_id==null){//如果抓不到會員空間網址後?user=xxx的話 表示是本人登入 則登入者id=會員id
    user_id=login_user;
   }*/
   String user="SELECT * FROM users WHERE user_id ='"+login_user+"'";
   rs = stmt.executeQuery(user);//查詢users 以便找到age_visible city_visible的資料
   
    String saveDirectory = request.getRealPath("/") + "myweb\\user\\"+login_user;//上傳路徑
    int    maxPostSize = 1024 * 1024 ; //檔案大小限制1MB
	String user_pic = null;  //檔案名稱
	String enCoding = "big5"; //編碼
try {//try
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, enCoding);
  
    //  取得所有上傳之檔案輸入型態名稱及敘述
   Enumeration filesname = multi.getFileNames();
   while (filesname.hasMoreElements())
   {
       String name = (String)filesname.nextElement();
        user_pic = multi.getFilesystemName(name);   //取得上傳檔案的名稱
   }
   
  String user_name = multi.getParameter("user_name");
  String user_nkname = multi.getParameter("user_nkname");
  String user_gen =multi.getParameter("user_gen");
  String user_birth = multi.getParameter("user_birth");
  String user_city = multi.getParameter("user_city");
  String user_intro = multi.getParameter("user_intro");
  
  //欄位檢查
  
  String user_name_check=check("^[a-zA-Z\u0391-\uFFE5]*$",user_name);
  String user_nkname_check = check("^[a-zA-Z\u0391-\uFFE5]*$",user_nkname);
  String user_city_check = check("^[a-zA-Z\u0391-\uFFE5]*$",user_city);
  if(user_name.equals("")){//檢查姓名
		out.print("<script language='javascript'>alert('姓名不得為空白!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(user_name.length()<2){
		out.print("<script language='javascript'>alert('姓名不會少於兩個字!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(!user_name_check.equals("格式正確")){
		out.print("<script language='javascript'>alert('會員姓名格式錯誤!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(user_nkname_check.equals("")){//檢查會員暱稱
		out.print("<script language='javascript'>alert('會員暱稱不得為空白');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(!user_nkname_check.equals("格式正確")){
		out.print("<script language='javascript'>alert('會員暱稱格式錯誤');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(user_city_check.equals("")){//檢查居住城市
		out.print("<script language='javascript'>alert('請填入居住城市!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(!user_city_check.equals("格式正確")){
		out.print("<script language='javascript'>alert('居住城市格式錯誤');");
		out.print("location.href='member_manage.jsp';</script>");
	//END OF 欄位檢查
  }else{
  
	StringBuffer buf = new StringBuffer(user_intro.length()+6);
	char ch = ' ';
	for(int p = 0;p < user_intro.length();p++)//若遇到換行就轉為<br>
	{
		ch = user_intro.charAt(p);
		if(ch == '\n')
			buf.append("<br>");	
									
		else 
			buf.append(ch);
	}
 	user_intro = buf.toString();
	//更新users的資料
	sql = "UPDATE users SET user_name=?,user_nkname=?,user_gen=?,user_birth=?,user_city=?,user_pic=?, user_intro=? where user_id=?"; 

	PreparedStatement prest = con.prepareStatement(sql);

	prest.setString(1,user_name);
	prest.setString(2,user_nkname);
	prest.setString(3,user_gen);
	prest.setString(4,user_birth);
	prest.setString(5,user_city);
	//判斷是否有新的圖片傳入
	if(user_pic==null){  //如果user_pic並沒有傳入值 代表圖片未更新 則使用原來的路徑
	while(rs.next()){
   	  String pic=rs.getString("user_pic");
  	      prest.setString(6,pic);
			}

	}
	else{  //否則就將新的路徑傳入資料庫
		while(rs.next()){
     		String pic1=rs.getString("user_pic");
			String del_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/"+pic1;
			delFile(del_pathfile);//刪除圖片檔案
			}
	prest.setString(6,user_pic);

	}
	prest.setString(7,user_intro);
	prest.setString(8,login_user);
	prest.executeUpdate();//更新users基本資料
 
 //把原來的age_visible.city_visible的資料刪掉
 /*Statement visible_update=con.createStatement();
 String d_visible="DELETE FROM visible WHERE user_id='"+login_user+"'";//
 visible_update.executeUpdate(d_visible);
 
 //更新age_visible和city_visible的資料
  String visible_type = "INSERT INTO visible(user_id,age_visible,city_visible) VALUES (?,?,?)";
  PreparedStatement visible = con.prepareStatement(visible_type);
  visible.setString(1,login_user);
  visible.setString(2,age_visible);
  visible.setString(3,city_visible);
  visible.executeUpdate();*/
	rs.close();
	stmt.close();
	con.close();

	response.sendRedirect("member_manage.jsp");
	}
}catch(Exception e){
	
		out.print("<script language='javascript'>alert('上傳的圖片檔不得超過1MB');");
		out.print("history.back();");
		out.print("</script>");
	
}
%>
</body>
</html>

