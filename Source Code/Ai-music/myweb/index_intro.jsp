<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>排行榜</title>

<!--這裡用的CSS-->
<link href="../CSSfile/index_ranking.css" rel="stylesheet" type="text/css" />
<!--標籤面板-->
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="js/Login.js"></script>

<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
    
    <link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
    
    <link href="../SpryAssets/SpryTabbedPanels_list.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
<!--
.style13 {
	font-size: 18pt;
	font-weight: bold;
}
-->
    </style>
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
<div id="header">
<div style="padding-left:30px" align="left"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
<%
	String login_user=(String)session.getAttribute("user_id");
	if (login_user == null)
	{
%>
	<div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm('<%=web_url%>')">登入</a></div>
	
<%
	}
	else
	{
%>

	<div class="font10" style="position:absolute; left: 832px; top: 8px; width: 35px; height: 38px;"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="40" /></a></div>
	<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 752px; top: 52px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
	<div class="font10" style="position:absolute; left: 877px; top: 8px; width: 35px; height: 38px;"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a></div>
    <div class="font10" style="position:absolute; left: 920px; top: 8px; width: 35px; height: 39px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="40" /></a></div>
    <%
	}
%>
<form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
   <div id="search"  style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;">  
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text"/></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10">
          <option value="song_name" selected>歌名</option>
          <option value="member_name">會員</option>
          </select></td>        
        <td width="82"><input type="submit" value="搜尋"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
  <div class="font10 style4 manubar" >
    <table width="972" class="font10">
      <tr>
        <td align="center" class="font10"><a href="member/index_discuss.jsp">討論區</a></td>
        <td align="center"><a href="index_activity.jsp">網站活動</a></td>
        <td align="center"><a href="index_music-list.jsp">音樂檢索</a></td>
        <td align="center"><a href="index_ranking.jsp">排行榜</a></td>
        <td align="center"><a href="index_welcome.jsp">加入會員</a></td>
      </tr>
    </table>
  </div>
</div>
<div id="container">

<p>&nbsp;</p>

<div id="mainContent" class="font10">
  <div id="TabbedPanels1" class="TabbedPanels" align="center">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">網站簡介</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">個人頁面</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">翻唱歌曲排行榜</li>
      </ul>
      <div class="TabbedPanelsContentGroup-change"> 
      
		<!--排行榜1-->
		<div class="TabbedPanelsContent">
		<div class="border_intro" align="left">
        <pre><span class="style13">Ai-music</span>

Altnertive & Independent (獨立與非主流)是Ai-Music訴求的主要理念
我們提供給音樂創作者或是單純喜愛音樂的人一個發表的平台</pre>
        </div>
		</div>
        
		<!--排行榜2-->
		<div class="TabbedPanelsContent">
		<div class="border_intro" align="left">
        <pre><span class="style13">Ai-music</span>

Altnertive & Independent (獨立與非主流)是Ai-Music訴求的主要理念
我們提供給音樂創作者或是單純喜愛音樂的人一個發表的平台</pre>
		</div>
		</div>
        
		<!--排行榜3-->
		<div class="TabbedPanelsContent">
		<div class="border">
		<table width="694" cellpadding="4" cellspacing="8" bgcolor="#FFFFFF">
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		  <td height="30" >&nbsp;</td>
		  <td align="left">&nbsp;</td>
		  <td >&nbsp;</td>
		  <td>&nbsp;</td>
		  </tr>
		<tr align="center" >
		<td width="70" height="30" >名次</td>
        <td align="left">歌曲名稱</td>
        <td width="133" >會員名稱</td>
		<td width="109">點閱數</td>
		</tr>
		</table>
   <!--end of 圓角邊框--></div>
        </div>
      </div>
    </div>
    <div style="clear:both"></div>
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
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>

</body>
</html>
