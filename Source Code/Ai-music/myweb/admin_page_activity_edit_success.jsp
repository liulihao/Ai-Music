<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>修改活動成功</title>
<!--這裡用的css-->
<link href="../CSSfile/admin_page_post-activity.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--

.style13 {color: #FF0000}
.style11 {
	font-size: 20pt;
	font-family: "微軟正黑體";
}
-->
</style>
<script src="js/admin_manage.js" type="text/javascript"></script>
</head>

<body class="oneColFixCtrHdr" >
<% request.setCharacterEncoding("big5");%>
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
%>
<%
	//後台管理者資料
	String login_user=(String)session.getAttribute("user_id");
	Statement admin = con.createStatement();
	String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
	ResultSet admin_data = admin.executeQuery(admin_sql);
 
	int id = Integer.parseInt(request.getParameter("id")); //接受上一頁傳來的變數(id) (id值 = activity_code值)
	rs = stmt.executeQuery("SELECT * FROM activity_info WHERE activity_code = '"+id+"'");
	
/*	while(rs.next()){
		String file_activity_pic = rs.getString("activity_pic");
		String del_pic_pathfile = request.getRealPath("/") + "myweb/images/activity_pic/"+file_activity_pic;
	 	delFile(del_pic_pathfile);//刪除圖片
	}*/
	
	
	//[WHERE activity_code = '"+id+"']重要!!! 要記得加!
	
	
	/*---------------下面為修改活動，更新資料庫的程式碼------------------*/
	
	//檔案上傳部分
	String activity_pic = null;  //宣告檔案名稱
	String saveDirectory = request.getRealPath("/") + "myweb/images/activity_pic/"; //設定上傳路徑
	int maxPostSize = 3 * 1024 * 1024 ; //檔案大小限制3MB
	String enCoding = "big5"; //編碼
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, enCoding);
	Enumeration filesname = multi.getFileNames();
	while (filesname.hasMoreElements())
	{
		String name = (String)filesname.nextElement();  //抓檔案的名稱
        activity_pic = multi.getFilesystemName(name);   //將檔案名稱指定給activity_pic	
	}
	//抓前一頁表單裡的值
	String activity_title = multi.getParameter("activity_title");
	String activity_date_s = multi.getParameter("activity_date_s");
	String activity_date_f = multi.getParameter("activity_date_f");
	String activity_time_s = multi.getParameter("select_H_s") + ":" + multi.getParameter("select_M_s");
	String activity_time_f = multi.getParameter("select_H_f") + ":" + multi.getParameter("select_M_f");
	String activity_location = multi.getParameter("activity_location");
	String activity_target = multi.getParameter("activity_target");
	String activity_content = multi.getParameter("activity_content");
	
	//將activity_content裡面需要換行的地方轉成<br>
	StringBuffer buf = new StringBuffer(activity_content.length()+6);
	char ch = ' ';
	for(int p = 0;p < activity_content.length();p++)//若遇到換行就轉為<br>
	{
		ch = activity_content.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	activity_content = buf.toString();
	
	//用PreparedStatement，將修改後資料UPDATE至資料庫
	sql = "UPDATE activity_info SET activity_title=?,activity_date_s=?,activity_date_f=?,activity_time_s=?,activity_time_f=?,activity_location=?,activity_target=?,activity_content=?,activity_pic=?,activity_update=NOW() WHERE activity_code=?"; //[WHERE activity_code=?] 重要!!! 記得要加!
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,activity_title);
	pstmt.setString(2,activity_date_s);
	pstmt.setString(3,activity_date_f);
	pstmt.setString(4,activity_time_s);
	pstmt.setString(5,activity_time_f);
	pstmt.setString(6,activity_location);
	pstmt.setString(7,activity_target);
	pstmt.setString(8,activity_content);
	//pstmt.setString(10,NOW());  //直接在SQL語言中，將activity_update設定好，所以這句可以註解掉
	
	//判斷是否有新的圖片傳入
	if(activity_pic == null){ //如果activity_pic並沒有傳入值 代表圖片未更新 則使用原來的圖片檔案名稱
		while(rs.next()){
			activity_pic = rs.getString("activity_pic"); //取得原來的檔案名稱
        	pstmt.setString(9,activity_pic);
		}
	}
	else{ //否則就將新的路徑傳入資料庫
		rs = stmt.executeQuery("SELECT * FROM activity_info WHERE activity_code = '"+id+"'");
	
		while(rs.next()){
			String file_activity_pic = rs.getString("activity_pic");
			String del_pic_pathfile = request.getRealPath("/") + "myweb/images/activity_pic/"+file_activity_pic;
	 		delFile(del_pic_pathfile);//刪除圖片
		}
		pstmt.setString(9,activity_pic);
	}
	pstmt.setInt(10,id); //將id指定給activity_code
	pstmt.executeUpdate(); //全部變數都有傳送成功(set)才能執行這行

	pstmt.close();
	stmt.close();
	response.setHeader("Refresh","3; URL=admin_page_manage_activity.jsp");
%>
<div id="header">
  <div style="padding-left:30px" align="left"><img src="../music3.jpg" width="320" />
      <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>管理者您好</div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search"> <span class="font10 style4">請輸入搜尋字串</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style" >
                    <option value="song_name" selected="selected">歌名</option>
                    <option value="member_name">會員</option>
                </select></td>
                <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
              </tr>
            </table>
        </div>
    </form>
  </div>
  <!-- end #header -->
</div>
<div id="container"  align="left">
<p>&nbsp;</p>
  <div class="font 10" id="mainContent" align="right">
<div id="showid" class="font10 style4" align="left">
<%
	while(admin_data.next()){
		int authority=admin_data.getInt("user_authority");
		if(authority==0){//if
			out.print("<script language='javascript'>");
			out.print("window.alert('你沒有權限進入後台');");
			out.print("location.href = 'index.jsp';");
			out.print("</script>");
			
		}
		else{//else
	%>
    <table width="940" border="0">
    <tr>
      <td width="385"><a href="admin_page_member_manage.jsp">後台管理首頁</a>
          <!-- end of 會員標頭-->
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp">活動管理</a>
            <!-- end of 會員標頭-->
          <span class="style12">&gt;</span>活動修改</td>
      <td width="545" align="right">您好，<span class="style13"><%=admin_data.getString("user_nkname")%></span>，登入時間：<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
<%
	
%>
</div>
  <!-- end of 會員標頭-->
  




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >會員管理</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="admin_page_member_manage.jsp">會員資料</a></div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="admin_page_member-feedback.jsp">會員檢舉</a></div>
  </div>
  <!--活動管理-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners  title" >活動管理</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_activity_post.jsp">活動發表</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp">活動管理</a></div>
  </div>
   <!--討論區.地區分類-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners title" >討論區管理</div>
    <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">地區分類</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=12">華語音樂</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=13">東洋音樂</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=14">西洋音樂</a></a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=15">其他音樂</a></div>
    <!--討論區管理.音樂類型-->
        <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">音樂類型</div>
	<div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=1">搖滾(Rock)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=2">流行(Pop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=3">電子(Electronic)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=4">金屬(Metal)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=5">嘻哈(HipHop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=6">爵士(Jazz)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=7">鄉村(Country)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=8">民謠(Folk)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=9">古典(Classical)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=10">舞曲(Dance)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=11">節奏藍調(R&amp;B)</a></div>
        </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->
<div  id="bigright" class="font10 style4 right roundedCorners" align="left">
  <!--裝飾用的空白-->
  <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px; z-index:1000"></div>
  <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px; z-index:1000"></div>
  <!--end of 裝飾用的空白-->
  <div class="space">
    <div id="activity-title" >
      <div  class="font10 style2" style="padding-left:10px">活動修改</div>
    </div>
    <div class="table-padding">
     <span class="table-padding style11">活動修改完成,3秒後為您轉回活動管理頁面。</span>
    </div>
    <!--end of 包起來的padding-->
    <%
 	}//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
	 %>
  </div>
  <!--end of space-->
  <!---------end of bigright --------->
</div>
<!--end of mainContent--></div>

  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

</body>
</html>