<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>網站活動</title>

<!--這裡用的CSS-->

<link href="../CSSfile/index_activity_detail.css" rel="stylesheet" type="text/css" />
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
<div id="container">
  
  <p>&nbsp;</p>
  
  
  
      <% 
	int id = Integer.parseInt(request.getParameter("id")); 
	rs=stmt.executeQuery("SELECT *, DAYNAME(activity_date_s) AS DAYNAME_s, DAYNAME(activity_date_f) AS DAYNAME_f, RIGHT(activity_time_s,1) AS ST, RIGHT(activity_time_f,1) AS FT FROM activity_info WHERE activity_code = " +id);
	while(rs.next())
	{
		%>
        <div id="mainContent" class="font10">
<div class="center-title roundedCorners  style2"  align="center"><%= rs.getString("activity_title")%></div>
    <div class="table-padding">
        <table width="753" border="0">
          <tr>
            <td colspan="2" align="center"><div  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px"><img src="images/activity_pic/<%= rs.getString("activity_pic")%>" width="80%" height="80%" /></div></td>
          </tr>
          <tr>
            <td width="98" align="right"><div  class="col-padding"  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px">活動日期：</div></td>
            <td width="512"><div  class="col-padding"  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px"> <%= rs.getString("activity_date_s")%> (<%= rs.getString("DAYNAME_s")%>) ~ <%= rs.getString("activity_date_f")%> (<%= rs.getString("DAYNAME_f")%>) </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px">活動時間：</div></td>
            <td ><div  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px"> <%= rs.getString("activity_time_s")%> ~ <%= rs.getString("activity_time_f")%> </div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px">活動地點：</div></td>
            <td ><div  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px"> <%= rs.getString("activity_location")%> </div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px">活動對象：</div></td>
            <td ><div  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px"> <%= rs.getString("activity_target")%> </div></td>
          </tr>
          <tr>
            <td align="right" valign="top"><div  class="col-padding" style="margin-bottom:10px;border-bottom:1px #DADADA;padding-bottom:3px">活動介紹：</div></td>
            <td rowspan="2"><div  style="margin-bottom:10px;border-bottom:1px #DADADA dotted;padding-bottom:3px"><%= rs.getString("activity_content")%></div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:0px"></div></td>
          </tr>
          <tr>
            <td colspan="2" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">
            <div class="reset" align="center" onclick="history.back();">回上一頁</div></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      <%
	 }//rs
	 rs.close();
	stmt.close();
	 con.close();
%>
    </div>
    <!-- end #mainContent -->
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
var timerRunning = false;
function start(){  		
	setEnable();
}
function setEnable(){
	setTimeout("start()",5000);
	if(timerRunning){
		form1.Submit.disabled=false;
	}
	timerRunning=true;
}
        </script>

</body>
</html>
