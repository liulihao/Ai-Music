<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�|�����U����</title>

<!--�o�̥Ϊ�CSS-->

<link href="../CSSfile/index_welcome.css" rel="stylesheet" type="text/css" />
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
<!--
      <div class="font10 style4" style="position:absolute; left: 879px; top:9px; width: 89px; height: 14px;">
        <table>
          <tr>
            <td><a href="#" onclick="openConfirm('<%=web_url%>')">�n�J</a></td>
            <td><div style="margin-right:2px">|</div></td>
            <td><a href="index_welcome.jsp">���U</a></td>
          </tr>
        </table>
      </div>-->
    <%
	}
	else
	{
%>
<!--
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>�ڪ��޲z����</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>-->
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search"> <span class="font10 style4">�п�J�j�M�r��</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style" >
                    <option value="song_name" selected="selected">�q�W</option>
                    <option value="member_name">�|��</option>
                </select></td>
                <td width="82"><input type="submit" value="�j�M" class="search-style"/></td>
              </tr>
            </table>
        </div>
      </form>
  </div>
  <div class="font10  manubar  link" >
    <table width="980" class="font10" >
      <tr>
        <td width="196" align="center" ><a href="index.jsp">����</a></td>
        <td width="196" align="center" ><a href="member/index_discuss.jsp">�Q�װ�</a></td>
        <td width="196" align="center" ><a href="index_activity.jsp">��������</a></td>
        <td width="196" align="center" ><a href="index_music-list.jsp">�����˯�</a></td>
        <td width="196" align="center" ><a href="index_ranking.jsp">�Ʀ�]</a></td>
      </tr>
    </table>
  </div>
</div>
<div id="container">
  
  <p>&nbsp;</p>
  
  
  <div id="mainContent" class="font10">
<div class="center-title roundedCorners  style2"  align="center">Ai-music �|������</div>
    <div class="center-block roundedCorners" style="margin-bottom:20px; " align="center">
      <table width="672" height="578" border="0" cellpadding="0" class="font10 style1 formtype"  >
        
        <tr>
          <td class="style2 style4"  scope="row"><p align="left"><strong class="style1">��s����G2009/9/20</strong> </p>
              <p align="left"><br />
                  <strong>�Ĥ@���@���v�ϥέ�h</strong> <br />
                �g�ѵ��U�ӽйL�{�A����Ai-music�]�H�U²�٥������^���ں����A�ȨϥΪ� (�H�U²�ٷ|��)�A�Y�o���v�ϥΥ������Ҵ��Ѥ����ں���                  �A�ȡA�������v��H�ȭ��|�����H�A���v�ϥζ��ضȭ�������������~���i�}��̡A�|���P�N�������惡���v�ä��㵴������A�ȩ�                  �Υ���O�ҨϥΪ��߳��A�B�������D���A�Ȥ��X�k���v�̡A�|�����g�������P�N�A�b���󱡧ΤU�A���o���N�ಾ�B�����Ʀ�������                  �γ����������Ҵ��Ѥ����ں����A�ȡC </p>
            <p align="left"><br />
                  <strong>�ĤG���@���p�v�O�@</strong> <br />
              �|����ϥΥ������Ҵ��Ѻ����A�ȮɡA�]���U�|���B�ѻP�����|�줧�������ʩM�լd�үd�U���ӤH��Ƨ����쥻�����������O�@�A����                �ѥ������@���A�ȩM���ʳ]�p�ѦҤ��~�A���|���N�X��B�洫�ΥX�����ĤT�̨ϥΡC ���������Ѫ������A�ȡG�ӤH²���B�q�����ˡB��                ��M��B�����Q�סA�H�αq�����s���X�h���s�i�t�Ӥκ����W���|���欰�A�ä��b�W�C���p�v���O�@�v�d�U�A�|�������������}�ϰ�A                �i�K�����󨥽פ�r�P�]�����Ӳ��ͪ��欰���ѷ|���ӤH�ۦ�t�d�C �|�����U�����|����A�i�Q�έӤH���b���P�K�X�H�ɭק�ӤH���                �ëO�@�ӤH���p�A�Y���K�X�~���ü{�A���ߧY�󴫩γq�������A�ȤH���B�z�A�_�h�d����G���ѭӤH�ۭt�C �Y�|����Ĳ�Ǫk�ߩί}�a��                ���t�Τ����îɡA�t�X�q�k���ά��������޲z��줧�ШD�A�������o���X�|�����ӤH��ƤΩҦ������ζ������i��s�u�O���H�ѽլd�C </p>
            <p align="left"><br />
                  <strong>�ĤT���@���z�]���v</strong> <br />
              ���������v���|���Ҵ��Ѥ���ƩΨϥά����A�i�����Φ������ζ����ϥΡB���R�ΥX���C��l�ͩʪ����ζ������ϥ��v�q�A������                ��ߤ@���M���ʡC ���ں����W�i�^���������T�����z�]���v�A���ݸӸ�T�Ҧ��֦̾��A�D�g��T�Ҧ��̤��}�}��α��v�A�|���ΫD�|                �����@���s���̶ȱo�s���[�ݡA���o�I�`��T�Ҧ��̤����z�]���v�A�H�Ϯɥѷ|���ۭt�@���k�߳d���C</p>
            <p align="left"> <br />
                  <strong>�ĥ|���@���v�פ�</strong> <br />
              �|�����P�N��ϥΦ欰�A�X�{���U�C���@�i��ɡA���������v�ȮɩΥä[�פ���v�A�ëO�d�k�߰l�D�v�G </p>
            <div align="left">
                <ol>
                  <li>�H�Ϸ|���{�~�a�{��k�O���欰�C </li>
                  <li>�H�ϰ�ڶ��@��q�T�W�h�κD�Ҥ��欰�C </li>
                  <li>��|�����ާ@�Ψϥμv�T��������������A�Ȩt�ιB�@�ζi�檽���B�����}�a�����W�����L�t�Τ��欰�C </li>
                  <li>�|���H�������Ҵ��Ѫ������A�ȱq�ƥ��󤣦X�k�����ʡA�p���~�A�I�`�L�H���z�]���B�c��D�������v�n��B�ⱡ���СB�r�~�����欰�C </li>
                  <li>�|����ӤH�欰�Y���v�T�L�H���v�Q�ɡA�p�����f�r�B�c�N�������ꨥ�׵��C </li>
                  <li>�|�����̥����ڳW�w�A�ɨ�Ӧ����q�ȮɡC </li>
                </ol>
            </div>
            <p align="left">���η|�������P�ɥ笰�����������e���Ѫ̮ɡA�Хt���Ū�ÿ�u���e���Ѫ̦X���]�󤺮e�W�ǫe�ѥ��������ѡ^�C <br />
                  <strong>�Ĥ����@�K�d����</strong> </p>
            <div align="left">
                <p>�|���ϥΥ����������ں����A�Ȳ��ͤ�����欰�A�ȥN��|���������߳��A���ѷ|���ۦ�t�d�C���������Ȥ���ƥ���s�N�O�Ҥ�                     �d���A�䨥�שΦ欰�󤣥N���������߳��C</p>
              <p>&nbsp;</p>
            </div></td>
        </tr>
      </table>
      

      
    </div>
  <FORM name="form1" method="post" action="new_register.jsp">      
      <div align="center" class="style4"> 
      
      <div align="center"  class="block1" style="float:left ; margin-left:300px; margin-right:40px"  onclick="form1.submit();" > �ڦP�N�H�W����</div>
      <div align="center"  class="block2" style="float:left" onclick="history.back()">�ڤ��P�N</div>
      
      </div>
  </FORM>
    
    <!-- end #mainContent -->
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
</script>
 <script type="text/javascript">
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
