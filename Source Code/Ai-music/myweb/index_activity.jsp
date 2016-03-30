<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>網站活動</title>

<!--這裡用的CSS-->

<link href="../CSSfile/index_activity.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="js/Login.js"></script>
<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>

<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>

</head>

<body class="thrColAbsHdr">
<script type="text/javascript">
window.addEvent('domready', function(){
				var myMenu = new ImageMenu($$('#imageMenu a'),{openWidth:310, border:2, onOpen:function(e,i){alert(e);}});
			});
</script>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3333085-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>
<div id="header" >
  <div style="padding-left:30px" align="left"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
      <%
	int year, month;
	String count_sql;
	try {
		year = Integer.parseInt(request.getParameter("year"));
	}
	catch(Exception e){
		year=0;
	}
	try {
		month = Integer.parseInt(request.getParameter("month"));
	}
	catch(Exception e){
		month=0;
	}
	
	
	String login_user=(String)session.getAttribute("user_id");
	if (login_user == null)
	{
%>
      <div class="font10 style4" style="position:absolute; left: 879px; top:9px; width: 89px; height: 14px;">
        <table>
          <tr>
            <td><a href="#" onclick="openConfirm('<%=web_url%>')">登入</a></td>
            <td><div style="margin-right:2px">|</div></td>
            <td><a href="index_welcome.jsp">註冊</a></td>
          </tr>
        </table>
      </div>
    <%
	}
	else
	{
%>
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
    <%
	}
%>
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
  <div class="font10  manubar  link" >
    <!-- end #header  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 386px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 777px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 582px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px;; background:#E5E5E5; left: 189px; top: 13px;"></div>-->
    <table width="980" class="font10" >
      <tr>
        <td width="196" align="center" ><a href="index.jsp">首頁</a></td>
        <td width="196" align="center" ><a href="member/index_discuss.jsp">討論區</a></td>
        <td width="196" align="center" ><a href="index_activity.jsp">網站活動</a></td>
        <td width="196" align="center" ><a href="index_music-list.jsp">音樂檢索</a></td>
        <td width="196" align="center" ><a href="index_ranking.jsp">排行榜</a></td>
      </tr>
    </table>
  </div>
</div>
<!-- end #header -->
<div id="container">
  
  <p>&nbsp;</p>
  <!--左邊div-->
  
  <!--右邊div-->
<div id="mainContent" class="font10 style4" align="center">
<div class="center-title roundedCorners style2">近期活動</div>


<%//活動列表頁碼
	int RowCount=0; //記錄筆數
	if(year == 0 && month == 0){
		sql = "SELECT *, CHAR_LENGTH(activity_title) AS title_num, LEFT(activity_title,25) AS c_activity_title FROM activity_info WHERE activity_date_f > CURDATE() ORDER BY activity_date_s ASC ";//叫資料出來
		count_sql = "SELECT COUNT(*) FROM activity_info WHERE activity_date_f > CURDATE() ORDER BY activity_date_s ASC ";
		rs = stmt.executeQuery(count_sql);//查詢SQL 該會員留言版的總筆數
		rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    	RowCount = rs.getInt(1); //取得記錄筆數
		rs.close();
		rs = stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上  
	}
	else if(year != 0 && month == 0){
		sql = "SELECT *, CHAR_LENGTH(activity_title) AS title_num, LEFT(activity_title,25) AS c_activity_title FROM activity_info WHERE YEAR(activity_date_f) = '" +year+ "' ORDER BY activity_date_s ASC ";//叫資料出來
		count_sql = "SELECT COUNT(*) FROM activity_info WHERE YEAR(activity_date_f) = '" +year+ "' ORDER BY activity_date_s ASC ";
		rs = stmt.executeQuery(count_sql);//查詢SQL 該會員留言版的總筆數
		rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    	RowCount = rs.getInt(1); //取得記錄筆數
		rs.close();
		rs = stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上  
	}
	else if(year == 0 && month != 0){
		sql = "SELECT *, CHAR_LENGTH(activity_title) AS title_num, LEFT(activity_title,25) AS c_activity_title FROM activity_info WHERE MONTH(activity_date_f) = '" +month+ "' ORDER BY activity_date_s ASC ";//叫資料出來
		count_sql = "SELECT COUNT(*) FROM activity_info WHERE MONTH(activity_date_f) = '" +month+ "' ORDER BY activity_date_s ASC ";
		rs = stmt.executeQuery(count_sql);//查詢SQL 該會員留言版的總筆數
    	rs.next();
		RowCount = rs.getInt(1); //取得記錄筆數
		rs.close();
		rs = stmt.executeQuery(sql);
	}
	else {
		sql = "SELECT *, CHAR_LENGTH(activity_title) AS title_num, LEFT(activity_title,25) AS c_activity_title FROM activity_info WHERE YEAR(activity_date_f) = '" +year+ "' AND MONTH(activity_date_f) = '" +month+ "' ORDER BY activity_date_s ASC ";//叫資料出來
		count_sql = "SELECT COUNT(*) FROM activity_info WHERE YEAR(activity_date_f) = '" +year+ "' AND MONTH(activity_date_f) = '" +month+ "' ORDER BY activity_date_s ASC ";
		rs = stmt.executeQuery(count_sql);//查詢SQL 該會員留言版的總筆數
    	rs.next();
		RowCount = rs.getInt(1); //取得記錄筆數
		rs.close();
		rs = stmt.executeQuery(sql);
	}
	
%>
<div align="center">
<table width="0">
  <tr>
    <td width="360">
      <form id="form1" name="form1" method="post" action="">
      年度:<select name="year" id="year">
          <option>請選擇年份</option>
          <option value="nodefine" <%
					if(year == 0){
						out.print("selected=\"selected\"");
					}
				%>>不限</option>
          <option value="2009" <%
					if(year == 2009){
						out.print("selected=\"selected\"");
					}
				%>>2009</option>
          <option value="2010" <%
					if(year == 2010){
						out.print("selected=\"selected\"");
					}
				%>>2010</option>
                </select>
      
      月份:<select name="month" id="month">
        <option>請選擇月份</option>
        <option value="nodefine" <%
					if(month == 0){
						out.print("selected=\"selected\"");
					}
				%>>不限</option>
        <option value="1" <%
					if(month == 1){
						out.print("selected=\"selected\"");
					}
				%>>一月</option>
        <option value="2" <%
					if(month == 2){
						out.print("selected=\"selected\"");
					}
				%>>二月</option>
        <option value="3" <%
					if(month == 3){
						out.print("selected=\"selected\"");
					}
				%>>三月</option>
        <option value="4" <%
					if(month == 4){
						out.print("selected=\"selected\"");
					}
				%>>四月</option>
        <option value="5" <%
					if(month == 5){
						out.print("selected=\"selected\"");
					}
				%>>五月</option>
        <option value="6" <%
					if(month == 6){
						out.print("selected=\"selected\"");
					}
				%>>六月</option>
        <option value="7" <%
					if(month == 7){
						out.print("selected=\"selected\"");
					}
				%>>七月</option>
        <option value="8" <%
					if(month == 8){
						out.print("selected=\"selected\"");
					}
				%>>八月</option>
        <option value="9" <%
					if(month == 9){
						out.print("selected=\"selected\"");
					}
				%>>九月</option>
        <option value="10" <%
					if(month == 10){
						out.print("selected=\"selected\"");
					}
				%>>十月</option>
        <option value="11" <%
					if(month == 11){
						out.print("selected=\"selected\"");
					}
				%>>十一月</option>
        <option value="12" <%
					if(month == 12){
						out.print("selected=\"selected\"");
					}
				%>>十二月</option>
            </select>

      <input type="submit" name="button" id="button" value="送出" class="input-style"/>
      </form>      </td>
  </tr>
</table>
</div>

<div style="margin-bottom:15px;margin-top:15px">
目前的範圍為：<%if(year==0){out.print("未指定");}else{out.print(year);}%>年/<%if(month==0){out.print("未指定");}else{out.print(month);}%>月/活動總筆數：<%=RowCount%><br />
<%if(year==0 && month==0){out.print("<font color='red'>未指定年及月的話會<strong>顯示所有尚未結束的活動</strong></font>");}%>
</div>
<%
	
    while(rs.next()){
	//放要叫出來的東西們和程式碼
%>
	

<div class="center-block roundedCorners" style="margin-bottom:15px;padding:15px 0 5px 10px" align="left">
   	  <div style="margin-left:0px"><table width="589" border="0">
        <tr>
          <td width="68" rowspan="3"><a href="index_activity_detail.jsp?id=<%=rs.getInt("activity_code")%>"><img src="/Ai-music/myweb/images/activity_pic/<%= rs.getString("activity_pic")%>" width="70" height="70" /></a></td>
        <td width="78"  class="font10"><div align="right" style="padding-right:5px">活動名稱:</div></td>
        <td width="429" class="font10"><div align="left"><a href="index_activity_detail.jsp?id=<%=rs.getInt("activity_code")%>"><%if(rs.getInt("title_num") > 24){%><%=rs.getString("c_activity_title")%>...<%}else{%><%=rs.getString("activity_title")%><%}%></a></div></td>
        </tr>
        <tr>
          <td width="78" class="font10"><div align="right" style="padding-right:5px">活動日期:</div></td>
          <td class="font10"><div align="left"><%= rs.getString("activity_date_s")%> ~ <%= rs.getString("activity_date_f")%></div></td>
        </tr>
        <tr>
          <td width="78" class="font10"><div align="right" style="padding-right:5px">活動對象:</div></td>
          <td class="font10"><div align="left"><%=rs.getString("activity_target")%></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="font10">&nbsp;</td>
          <td class="font10"><div align="right"><a href="index_activity_detail.jsp?id=<%=rs.getInt("activity_code")%>">more...</a></div></td>
        </tr>
      </table></div>
    </div>
<%
	}
%>
    <!-- end #mainContent -->
  </div>
  
  <div id="bigleft" class="font10" style="float:left">
    <div class="roundedTopCorners ">
      <div class="title roundedCorners style2" align="center" style="">最新公告活動</div>
      <!--1欄-->
      <%
		sql="SELECT *, CHAR_LENGTH(activity_title) AS title_num, LEFT(activity_title,14) AS c_activity_title FROM activity_info WHERE activity_date_f > CURDATE() ORDER BY activity_insert DESC LIMIT 5 ";//叫資料出來
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
		%>
      <div class='block1 style4' align='left' >
        <div align='left'><span class='standingname Tabletype'><strong>&nbsp;&nbsp;<a href = "index_activity_detail.jsp?id=<%=rs.getInt("activity_code")%>"><%if(rs.getInt("title_num") > 15){
		%><%=rs.getString("c_activity_title")%>...<%}else{%><%=rs.getString("activity_title")%><%}%></a></strong><br/>
          &nbsp;&nbsp;公告時間：<%=rs.getDate("activity_insert")%></span></div>
        <div style='clear:both'></div>
      </div>
      <%}%>
      <!--end of 灰色大框-->
    </div>
  </div>
  
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>
<!--datacheck-->
<script type="text/javascript">
function datacheck(){	
	//如果ID為空白 處理同姓名
	if(member.user_id.value==""){
		window.alert("ID不得為空白!");
		//focusto(4);
		return false;
		}
	
//submit表單資料至WEBsever
	member.submit();
}
</script>

</body>
</html>
