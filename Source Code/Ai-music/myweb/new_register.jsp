<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���U�һݸ��</title>

<!--�o�̥Ϊ�CSS-->

<link href="../CSSfile/register.css" rel="stylesheet" type="text/css" />
<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<link href="../CSSfile/calendar.css" rel="stylesheet" type="text/css">
</head>
<!--<script type="text/javascript" src="js/check_id.js"></script> -->
<script type="text/javascript" src="js/register.js" ></script>
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/Login.js"></script>

<script src="SpryAssets/SpryValidationTextField.css" type="text/javascript"></script>
<script src="SpryAssets/SpryMenuBar.js"type="text/javascript"></script>

<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>

<script language="javascript" type="text/javascript">
	window.addEvent('domready', function()
		{
				var myMenu = new ImageMenu($$('#imageMenu a'),{openWidth:310, border:2, onOpen:function(e,i){alert(e);}});
		});

	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' 						type='text/javascript'%3E%3C/script%3E"));

	var pageTracker = _gat._getTracker("UA-3333085-1");
	pageTracker._initData();
	pageTracker._trackPageview();
</script>
<script language="javascript" src="calendar_js/common.js"></script>
<script language="javascript" src="calendar_js/CalendarPopup.js"></script>
<script language="javascript" id="jsB"> 
	var cal = new CalendarPopup("cal_div"); 
	cal.offsetX = -90;
	cal.offsetY = -430;
	cal.setTodayText("");
	cal.showNavigationDropdowns();
	cal.setCssPrefix("TEST");
</script>
<body class="thrColAbsHdr">
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
      <!--<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
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
  <div id="mainContent" >
   <div align="center">
   <div align="center" class="center-title font10 roundedCorners" style="margin-bottom:30px" >���U�һݸ��</div>
   <div ID="cal_div" STYLE="position:absolute; visibility:visible; background-color:white; layer-background-color:white;"></div>
  <form   action="save_register.jsp" method="post" name="register" id="register"  >
          <table width="820" height="523" border="0"  cellpadding="0" class="font10  style4  roundedCorners block"  >
            <tr>
              <td colspan="3"  scope="row" ></td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="right"></div></td>
              <td   class="font10">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="right" class="col-padding">�m�W</div></td>
              <td width="673"   align="left"><input id="user_name" name="user_name" type="text" class="font10 style9  input-style"  /></td>
            </tr>
            <tr>
              <td colspan="2"    scope="row"><div align="center"></div></td>
              <td   class="style3" align="left">�ж�g�u��m�W,�榡������έ^��</td>
            </tr>
            <tr>
              <td colspan="2" align="right"   scope="row"><div align="right" class="col-padding" style="margin-top:10px">�|���ʺ�</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input name="user_nkname" type="text" class="font10 input-style style9" id="user_nkname" maxlength="6"  />
              </div></td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"></td>
              <td align="left" class="style3">�ж�J�^��r���Τ���,�ܦh6�Ӧr���A�����z����ܦW��</td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="right" class="col-padding" style="margin-top:10px">�b��</div></td>
              <td ><div align="left" style="margin-top:10px">
                <input name="user_id" type="text" id="user_id" class="font10 input-style style9"  onkeyup="chkAccount()"  maxlength="12"  />
              </div>
              <div class="style3" id="divAccount" >�b���ˬd</div>              </td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="center"></div></td>
              <td  align="left" class="style3" >�ж�J�^��r���B�Ʀr�βŸ�,�ݭ^��r���}�Y,5��12�Ӧr��</td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="right" class="col-padding" style="margin-top:10px">�K�X</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input name="user_password" type="password" class="font10 input-style style9" id="user_password" maxlength="10"/>
              </div></td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="center"></div></td>
              <td class="style3" align="left">�ж�J�^��r���B�Ʀr�����]�t�ť���,5��10�Ӧr��</td>
            </tr>
            <tr>
              <td height="22" colspan="2"  scope="row"><div align="right" style="margin-top:10px">�T�{�K�X:</div></td>
              <td><div align="left" style="margin-top:10px">
                  <input name="user_checkpswd" type="password" class="font10 input-style style9" id="user_checkpswd" maxlength="10" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2" scope="row"><div align="center"></div></td>
              <td ><div align="left" class="style3">�ЦA��J�@���K�X</div></td>
            </tr>
            <tr>
              <td colspan="2" align="center"   scope="row"><div align="right" class="col-padding" style="margin-top:10px">Email</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input id="user_email" name="user_email" type="text" class="font10 input-style style9" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="center"></div></td>
              <td align="left" class="style3">�нT�w���q�l�l�󬰥i�Ϊ��A�A�H�קK���H�ɵo�Ϳ��~</td>
            </tr>
            <tr>
              <td colspan="2" align="center"  scope="row"><div align="right" class="col-padding" style="margin-top:10px">�ʧO</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input id="user_gen" type="radio" name="user_gen" value="Male" checked="checked"/>
                Male&nbsp;&nbsp;&nbsp;
                <input id="user_gen" type="radio" name="user_gen" value="Female"/>
                Female</div></td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="center"></div></td>
              <td >&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" align="center"  scope="row"><div align="right" class="col-padding">�ͤ�</div></td>
              <td ><p align="left">
                  <input name="user_birth" type="text" id="user_birth" size="10" maxlength="0" class="font10 input-style style9" />
                &nbsp;<a href="#" onclick="cal.select(document.forms[1].user_birth,'anchor18','yyyy/MM/dd'); return false;" title="��ܤ��" name="anchor18" id="anchor18"><b>������ܤ��</b></a></p></td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="center"></div></td>
              <td >&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" align="center"   scope="row"><div align="right" class="col-padding" style="margin-top:0px">�~����</div></td>
              <td ><div align="left" style="margin-top:0px">
                  <input id="user_city" name="user_city" type="text" class="font10 input-style style9" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2"    scope="row"><div align="center"></div></td>
              <td   class="style3" align="left">�ж�J����έ^��</td>
            </tr>
            <tr>
              <td colspan="3"  scope="row"><div align="center" style="margin-top:20px"></div></td>
            </tr>
            <!--
            <tr>
              <td width="7"  scope="row">&nbsp;</td>
              <td width="116"  scope="row" align="center"><div align="center" style="border:1px solid #dadada;width:100px; margin-left:5px" >
                  <p>���w��������<br />
                    (�i�ƿ�)</p>
                <p>�������˭���<br />
                  ���ѦҨ̾�</p>
              </div></td>
              <td ><table width="346" border="0" align="left" class="Tabletype2" style="background-color:#F5F5F5">
                  <tr>
                    <td ><div align="left" >
                        <input name="Rock" type="checkbox" id="Rock" value="1"/>
                      Rock</div></td>
                    <td ><div align="left">
                        <input name="Pop" type="checkbox" id="Pop" value="2"/>
                      Pop</div></td>
                    <td ><div align="left">
                        <input name="Electronic" type="checkbox" id="Electronic" value="3"/>
                      Electronic </div></td>
                  </tr>
                  <tr>
                    <td><div align="left">
                        <input name="Metal" type="checkbox" id="Metal" value="4"/>
                      Metal</div></td>
                    <td><div align="left">
                        <input name="HipHop" type="checkbox" id="HipHop" value="5"/>
                      Hip Hop</div></td>
                    <td><div align="left">
                        <input name="Jazz" type="checkbox" id="Jazz" value="6"/>
                      Jazz</div></td>
                  </tr>
                  <tr>
                    <td><div align="left">
                        <input name="Conutry" type="checkbox" id="Country" value="7"/>
                      Country</div></td>
                    <td><div align="left">
                        <input name="Folk" type="checkbox" id="Folk" value="8"/>
                        <span class="style4 Tabletype2">Folk</span></div></td>
                    <td><div align="left"><span class="style4 Tabletype2">
                        <input name="Classical" type="checkbox" id="Classical" value="9"/>
                      Classical</span></div></td>
                  </tr>
                  <tr>
                    <td><div align="left">
                        <input name="Dance" type="checkbox" id="Dance" value="10"/>
                        <span class="style4 Tabletype2">Dance</span> </div></td>
                    <td><div align="left">
                        <input name="RnB" type="checkbox" id="RnB" value="11"/>
                        <span class="style4 Tabletype2">R&amp;B</span></div></td>
                    <td>&nbsp;</td>
                  </tr>
              </table>--></td>
            </tr>
            <tr>
              <td colspan="3"  scope="row">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3"  scope="row"><input type="submit" name="sub1" value="�e�X" onclick="return check()" class="small-grayblock-agree pointer style4"/>
               <input type="reset" name="RESET" value="����" class="reset style4" />
              <div align="center"></div></td>
            </tr>
        </table>
        <input type="hidden" name="MM_insert" value="form1" />
        </form>
    </div>
    <!-- end #mainContent -->
  </div>
  <div id="footer" class="font10 style2" align="center">
<p><span class="font10 style2">Ai-Music �W�߭��ֺ� Inc 2009 </span></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--�n�J���u������-->
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

</body>
</html>
