<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="../myweb/opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>�L�֤��@���ֺ�</title>
<!-- TemplateEndEditable -->
<!--�o�̥Ϊ�CSS-->
<link href="../CSSfile/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../myweb/js/prototype.js"> </script>
<script type="text/javascript" src="../myweb/js/index.js"> </script>
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="../myweb/imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="../myweb/_common/js/mootools.js" type="text/javascript"></script>
<link href="../myweb/imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="../myweb/box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="../myweb/box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="../myweb/box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="../myweb/box sample1/javascripts/debug.js"> </script>
	<link href="../myweb/box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="../myweb/box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="../myweb/box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript">
			window.addEvent('domready', function(){
				var myMenu = new ImageMenu($$('#imageMenu a'),{openWidth:310, border:2, onOpen:function(e,i){alert(e);}});
			});

var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));

var pageTracker = _gat._getTracker("UA-3333085-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>

<!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->
</head>
<body class="thrColAbsHdr">

<div id="header">
<div style="padding-left:30px" align="left"><a href="../myweb/index.jsp"><img src="../music3.jpg" width="320" /></a>
<%
	String login_user=(String)session.getAttribute("user_id");
	if (login_user == null)
	{
%>
	<div class="font10" style="position:absolute; left: 924px; top:39px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm()">�n�J</a></div>
	
<%
	}
	else
	{
%>

	<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px;"><a href="../myweb/member_page.jsp"><img src="../images/Login.png" width="40" height="40" /></a> 
    
    <span>�ڪ��Ŷ�</span>
    </div>
	
	<div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px;"><a href="../myweb/member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a>
    <span>�ڪ��޲z����</span>
    </div>
     
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 39px;"><a href="../myweb/logout.jsp"><img src="../images/Door.png" alt="" width="40" height="40" /></a>
    
    <span>�n�X</span>
    </div>
    
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
<%
	}
%>
    <form action="../myweb/search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
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
        <td align="center" class="font10"><div class="info_discuss"><a href="../myweb/member/index_discuss.jsp">�Q�װ�</a>
        <span></span></div></td>
        <td align="center"><div class="info_activity"><a href="../myweb/index_activity.jsp">��������</a>
        <span></span></div></td>
        <td align="center"><a href="../myweb/index_music-list.jsp">�����˯�</a></td>
        <td align="center"><a href="../myweb/index_ranking.jsp">�Ʀ�]</a></td>
        <td align="center"><a href="../myweb/index_welcome.jsp">�[�J�|��</a></td>
      </tr>
    </table>
  </div>
</div>




<!--�n�J���u������-->
<script type="text/javascript">
function openConfirm() {
    Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp"})
}

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
</script>

</body>
</html>
