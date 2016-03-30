<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>活動管理</title>
<!--這裡用的css-->
<link href="../CSSfile/admin_page_manage-activity.css" rel="stylesheet" type="text/css" />
<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="js/prototype.js"></script>
<script src="js/admin_manage.js"></script>

<script language='javascript'>
function changeMenuFMGS(id){
	objDaughter=document.getElementById('iDMenu'+id);
	if (objDaughter.style.display=='none'){
		objDaughter.style.display='block';
	} else {
		if(objDaughter.style.display=='block'){
			objDaughter.style.display='none'; 
		} 
	} 
}
</script>
</head>
<% //後台管理者資料
 
 String login_user=(String)session.getAttribute("user_id");
 Statement admin = con.createStatement();
 String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
 ResultSet admin_data = admin.executeQuery(admin_sql);

 %>
<body class="oneColFixCtrHdr" >
<div id="header">
<div style="padding-left:30px" align="left"><img src="../music3.jpg" width="320" />

<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>管理者您好</div>
   <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>登出</span>
    </div>

    <form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
   <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search">  
   
   <span class="font10 style4">請輸入搜尋字串</span>
   
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style" >
          <option value="song_name" selected>歌名</option>
          <option value="member_name">會員</option>
          </select></td>        
        <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
</div>



<div id="container"  align="left">
<p>&nbsp;</p>
  <div class="font 10" id="mainContent" align="right">
<div id="showid" class="font10 style4" align="left">
<!--會員標頭-->
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
          <span class="style12">&gt;</span><a href="admin_page_activity_post.jsp"> 活動發表</a> </td>
      <td width="545" align="right">您好，<span class="style13"><%=admin_data.getString("user_nkname")%></span>，登入時間：<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
<%
	
%>
</div>

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
<div  id="bigright" class="font10 right roundedCorners" align="left">

 <!--裝飾用的空白-->
 <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
 <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
<!--end of 裝飾用的空白-->

<div class="space">
  
  <div id="activity-title" ><div  class="font10 style2 roundedCorners" style=" padding-left:10px">活動管理</div></div>

<%
	int id = 0;
	rs=stmt.executeQuery("SELECT *, DAYNAME(activity_date_s) AS DAYNAME_s, DAYNAME(activity_date_f) AS DAYNAME_f FROM activity_info ORDER BY activity_insert DESC");
	while(rs.next())
	{
		id = rs.getInt("activity_code");
		%>
		<div class="table-padding font10 style4">
        <form action="delete.jsp" method="post" onsubmit"">
		<table width="600"  >
  		<tr>
    	<td width="84"><div align="center">活動編號：</div></td>
    	<td width="504"><%=rs.getInt("activity_code")%> </td>
 	 	</tr>
  		<tr>
  		  <td ><div align="center">活動名稱：</div></td>
  		  <td ><%=rs.getString("activity_title")%></td>
		  </tr>
  		<tr>
  		  <td><div align="center">活動日期：</div></td>
  		  <td ><%= rs.getString("activity_date_s")%>&nbsp;(<%= rs.getString("DAYNAME_s")%>) ~ <%= rs.getString("activity_date_f")%>&nbsp;(<%= rs.getString("DAYNAME_f")%>)</td>
		  </tr>
  		<tr>
  		  <td><div align="center">活動地點：</div></td>
  		  <td ><%=rs.getString("activity_location")%></td>
		  </tr>
  		<tr>
  		  <td><div align="center">活動對象：</div></td>
    	<td ><%=rs.getString("activity_target")%></td>
		  </tr>
  		<tr>
  		  <td><div align="center">上傳時間：</div></td>
  		  <td ><%=rs.getDate("activity_insert")%>&nbsp;<%=rs.getTime("activity_insert")%></td>
		  </tr>
<%
		if(rs.getString("activity_update") == null){
		}
		else{
%>
  		<tr>
  		  <td><div align="center">修改時間：</div></td>
  		  <td ><%=rs.getString("activity_update")%></td>
		  </tr>
<%
		}//else
%>
		</table>
        <td width='85'>
        <div align="center" class="small-grayblock2"><a href='admin_page_activity_edit.jsp?id=<%=id%>'>修改</a></div>
      	<div align="center" class="small-grayblock2"><a href='admin_page_activity_del.jsp?id=<%=id%>'>刪除</a></div>
        <div style="clear:both"></div>
        </form>
        <hr size="1" style="margin-bottom:20px;width:635px" color="#E5E5E5" />
		</div><p>
		  <%        
	}
	
	rs.close();
	stmt.close();
	}//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
%>

<!--end of 包起來的padding-->
<!--end of space--></div>
<!--end of bigright--></div>
<!--end of mainContent--></div>

<!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

</body>
</html>
