<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�Ʀ�]</title>

<!--�o�̥Ϊ�CSS-->
<link href="../CSSfile/index_ranking.css" rel="stylesheet" type="text/css" />
<!--���ҭ��O-->
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
	<div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm('<%=web_url%>')">�n�J</a></div>
	
<%
	}
	else
	{
%>

	<div class="font10" style="position:absolute; left: 832px; top: 8px; width: 35px; height: 38px;"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="40" /></a></div>
	<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 752px; top: 52px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
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
          <option value="song_name" selected>�q�W</option>
          <option value="member_name">�|��</option>
          </select></td>        
        <td width="82"><input type="submit" value="�j�M"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
  <div class="font10 style4 manubar" >
    <table width="972" class="font10">
      <tr>
        <td align="center" class="font10"><a href="member/index_discuss.jsp">�Q�װ�</a></td>
        <td align="center"><a href="index_activity.jsp">��������</a></td>
        <td align="center"><a href="index_music-list.jsp">�����˯�</a></td>
        <td align="center"><a href="index_ranking.jsp">�Ʀ�]</a></td>
        <td align="center"><a href="index_welcome.jsp">�[�J�|��</a></td>
      </tr>
    </table>
  </div>
</div>
<div id="container">

<p>&nbsp;</p>

<div id="mainContent" class="font10">
  <div id="TabbedPanels1" class="TabbedPanels" align="center">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">����²��</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">�ӤH����</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">½�ۺq���Ʀ�]</li>
      </ul>
      <div class="TabbedPanelsContentGroup-change"> 
      
		<!--�Ʀ�]1-->
		<div class="TabbedPanelsContent">
		<div class="border_intro" align="left">
        <pre><span class="style13">Ai-music</span>

Altnertive & Independent (�W�߻P�D�D�y)�OAi-Music�D�D���D�n�z��
�ڭ̴��ѵ����ֳЧ@�̩άO��³߷R���֪��H�@�ӵo�����x</pre>
        </div>
		</div>
        
		<!--�Ʀ�]2-->
		<div class="TabbedPanelsContent">
		<div class="border_intro" align="left">
        <pre><span class="style13">Ai-music</span>

Altnertive & Independent (�W�߻P�D�D�y)�OAi-Music�D�D���D�n�z��
�ڭ̴��ѵ����ֳЧ@�̩άO��³߷R���֪��H�@�ӵo�����x</pre>
		</div>
		</div>
        
		<!--�Ʀ�]3-->
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
		<td width="70" height="30" >�W��</td>
        <td align="left">�q���W��</td>
        <td width="133" >�|���W��</td>
		<td width="109">�I�\��</td>
		</tr>
		</table>
   <!--end of �ꨤ���--></div>
        </div>
      </div>
    </div>
    <div style="clear:both"></div>
  </div>
  
  
  
 <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--datacheck-->
<script type="text/javascript">
function datacheck(){	
	//�p�GID���ť� �B�z�P�m�W
	if(member.user_id.value==""){
		window.alert("ID���o���ť�!");
		//focusto(4);
		return false;
		}
	
//submit����Ʀ�WEBsever
	member.submit();
}
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>

</body>
</html>
