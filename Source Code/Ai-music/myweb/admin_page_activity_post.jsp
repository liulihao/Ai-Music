<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>發表活動</title>
<!--這裡用的css-->
<link href="../CSSfile/admin_page_post-activity.css" rel="stylesheet" type="text/css" />
<link href="../CSSfile/calendar.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/common.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/CalendarPopup.js"></script>
<script src="js/admin_manage.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript"> 
	var cal = new CalendarPopup("cal_div");
	cal.offsetX = -330;
	cal.offsetY = -420;
	cal.setCssPrefix("TEST");
	function check(){
	if(document.getElementById("activity_title").value=="") //這種寫法Firefox才接受
	{
		window.alert("活動名稱不得為空白!");
		return false;
	}
	if(document.getElementById("activity_time_s").value=="") 
	{
		window.alert("活動開始日期不得為空白!");
		return false;
	}
	if(document.getElementById("activity_time_f").value=="") 
	{
		window.alert("活動結束日期不得為空白!");
		return false;
	}
	if(document.getElementById("activity_target").value=="") 
	{
		window.alert("活動對象不得為空白!");
		return false;
	}
	if(document.getElementById("activity_content").value=="") 
	{
		window.alert("活動內容不得為空白!");
		return false;  
	}
	if(document.getElementById("activity_pic").value=="") 
	{
		window.alert("沒有選擇活動圖片!");
		return false;
	}
	if(document.getElementById("activity_time_s").value > document.getElementById("activity_time_f").value)
	{
		window.alert("活動開始時間晚於結束時間! 請重新輸入!");
		return false;
	}
	return true;
}
</script>
<% //後台管理者資料 
	String login_user=(String)session.getAttribute("user_id");
	Statement admin = con.createStatement();
	String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
	ResultSet admin_data = admin.executeQuery(admin_sql);
%>
</head>
<body class="oneColFixCtrHdr" >
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

<!--會員標頭-->
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
<div  id="bigright" class="font10 style4 right roundedCorners" align="left">
  <!--裝飾用的空白-->
  <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
  <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
  <!--end of 裝飾用的空白-->
  <div class="space">
   <div id="activity-title" >
     <div  class="font10 style2" style="padding-left:10px">活動發表</div>
   </div>
    <div class="table-padding">
       <!---------------------月曆 預設為隱藏--------------------->
	<div ID="cal_div" STYLE="position:absolute; visibility:visible; background-color:white; layer-background-color:white;"></div>
      <form id="form1" method="post" action="admin_page_activity_post_success.jsp" enctype="multipart/form-data">
        <table width="620" border="0">
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">活動名稱：</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_title" class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">
              <p>活動日期：</p>
            </div></td>
            <td><div style="margin-bottom:10px">開始
              <input name="activity_date_s" type="text" id="activity_date_s" size=10 maxlength="0"  class="font10 input-style">
              <A HREF="" onClick="cal.select(document.forms[1].activity_date_s,'anchor1','yyyy-MM-dd'); return false;" TITLE="選擇日期" NAME="anchor1" ID="anchor1"> 選擇日期</A><br>
                結束
              <input name="activity_date_f" type="text" id="activity_date_f" size=10 maxlength="0"  class="font10 input-style">
              <A HREF="" onClick="cal.select(document.forms[1].activity_date_f,'anchor2','yyyy-MM-dd'); return false;" TITLE="選擇日期" NAME="anchor2" ID="anchor2"> 選擇日期</A></div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">活動時間：</div></td>
            <td ><div style="margin-bottom:10px">開始
                <select name="select_H_s" id="select_H_s">
                  <option value="00">00</option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                </select>
              時
              <select name="select_M_s" id="select_M_s">
                <option value="00">00</option>
                <option value="15">15</option>
                <option value="30">30</option>
                <option value="45">45</option>
              </select>
              分<br>
              結束
              <select name="select_H_f" id="select_H_f">
                <option value="00">00</option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
              </select>
              時
              <select name="select_M_f" id="select_M_f">
                <option value="00">00</option>
                <option value="15">15</option>
                <option value="30">30</option>
                <option value="45">45</option>
              </select>
              分</div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">活動地點：</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_location"  class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">活動對象：</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_target"  class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">活動介紹：</div></td>
            <td rowspan="2"><div  style="margin-bottom:10px"></div>
              <span style="margin-bottom:10px">
              <textarea name="activity_content" cols="50" rows="10"  class="font10 input-style"></textarea>
              </span></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
          </tr>
          
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">活動圖片</div></td>
            <td><div  style="margin-bottom:10px">
              <input name="activity_pic" type="file" id="activity_pic" />
            </div></td>
          </tr>
          <tr>
            <td colspan="2" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><input type="submit" value="發表活動" onClick="return check()" class="agree style4"/>
              <input type="button" value="回上一頁" onclick="window.history.back()" class="agree style4"/></td>
            <td width="9">&nbsp;</td>
            <div style="clear:both"></div>                <td width="-1"></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <% 
 	}//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
	 
%>
          </form>
    </div> <!--end of 包起來的padding-->
   </div>
  <!---------end of bigright --------->
</div>
<!--end of mainContent-->
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


</body>
</html>
