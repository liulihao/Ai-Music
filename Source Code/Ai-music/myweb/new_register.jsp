<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>註冊所需資料</title>

<!--這裡用的CSS-->

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
            <td><a href="#" onclick="openConfirm('<%=web_url%>')">登入</a></td>
            <td><div style="margin-right:2px">|</div></td>
            <td><a href="index_welcome.jsp">註冊</a></td>
          </tr>
        </table>
      </div>-->
    <%
	}
	else
	{
%>
      <!--<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>-->
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
  <div id="mainContent" >
   <div align="center">
   <div align="center" class="center-title font10 roundedCorners" style="margin-bottom:30px" >註冊所需資料</div>
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
              <td colspan="2"   scope="row"><div align="right" class="col-padding">姓名</div></td>
              <td width="673"   align="left"><input id="user_name" name="user_name" type="text" class="font10 style9  input-style"  /></td>
            </tr>
            <tr>
              <td colspan="2"    scope="row"><div align="center"></div></td>
              <td   class="style3" align="left">請填寫真實姓名,格式為中文或英文</td>
            </tr>
            <tr>
              <td colspan="2" align="right"   scope="row"><div align="right" class="col-padding" style="margin-top:10px">會員暱稱</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input name="user_nkname" type="text" class="font10 input-style style9" id="user_nkname" maxlength="6"  />
              </div></td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"></td>
              <td align="left" class="style3">請填入英文字母或中文,至多6個字元，此為您的顯示名稱</td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="right" class="col-padding" style="margin-top:10px">帳號</div></td>
              <td ><div align="left" style="margin-top:10px">
                <input name="user_id" type="text" id="user_id" class="font10 input-style style9"  onkeyup="chkAccount()"  maxlength="12"  />
              </div>
              <div class="style3" id="divAccount" >帳號檢查</div>              </td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="center"></div></td>
              <td  align="left" class="style3" >請填入英文字母、數字及符號,需英文字母開頭,5到12個字元</td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="right" class="col-padding" style="margin-top:10px">密碼</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input name="user_password" type="password" class="font10 input-style style9" id="user_password" maxlength="10"/>
              </div></td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="center"></div></td>
              <td class="style3" align="left">請填入英文字母、數字但不包含空白鍵,5到10個字元</td>
            </tr>
            <tr>
              <td height="22" colspan="2"  scope="row"><div align="right" style="margin-top:10px">確認密碼:</div></td>
              <td><div align="left" style="margin-top:10px">
                  <input name="user_checkpswd" type="password" class="font10 input-style style9" id="user_checkpswd" maxlength="10" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2" scope="row"><div align="center"></div></td>
              <td ><div align="left" class="style3">請再輸入一次密碼</div></td>
            </tr>
            <tr>
              <td colspan="2" align="center"   scope="row"><div align="right" class="col-padding" style="margin-top:10px">Email</div></td>
              <td ><div align="left" style="margin-top:10px">
                  <input id="user_email" name="user_email" type="text" class="font10 input-style style9" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2"   scope="row"><div align="center"></div></td>
              <td align="left" class="style3">請確定此電子郵件為可用狀態，以避免收信時發生錯誤</td>
            </tr>
            <tr>
              <td colspan="2" align="center"  scope="row"><div align="right" class="col-padding" style="margin-top:10px">性別</div></td>
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
              <td colspan="2" align="center"  scope="row"><div align="right" class="col-padding">生日</div></td>
              <td ><p align="left">
                  <input name="user_birth" type="text" id="user_birth" size="10" maxlength="0" class="font10 input-style style9" />
                &nbsp;<a href="#" onclick="cal.select(document.forms[1].user_birth,'anchor18','yyyy/MM/dd'); return false;" title="選擇日期" name="anchor18" id="anchor18"><b>按此選擇日期</b></a></p></td>
            </tr>
            <tr>
              <td colspan="2"  scope="row"><div align="center"></div></td>
              <td >&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" align="center"   scope="row"><div align="right" class="col-padding" style="margin-top:0px">居住城市</div></td>
              <td ><div align="left" style="margin-top:0px">
                  <input id="user_city" name="user_city" type="text" class="font10 input-style style9" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2"    scope="row"><div align="center"></div></td>
              <td   class="style3" align="left">請填入中文或英文</td>
            </tr>
            <tr>
              <td colspan="3"  scope="row"><div align="center" style="margin-top:20px"></div></td>
            </tr>
            <!--
            <tr>
              <td width="7"  scope="row">&nbsp;</td>
              <td width="116"  scope="row" align="center"><div align="center" style="border:1px solid #dadada;width:100px; margin-left:5px" >
                  <p>喜歡音樂類型<br />
                    (可複選)</p>
                <p>做為推薦音樂<br />
                  的參考依據</p>
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
              <td colspan="3"  scope="row"><input type="submit" name="sub1" value="送出" onclick="return check()" class="small-grayblock-agree pointer style4"/>
               <input type="reset" name="RESET" value="重填" class="reset style4" />
              <div align="center"></div></td>
            </tr>
        </table>
        <input type="hidden" name="MM_insert" value="form1" />
        </form>
    </div>
    <!-- end #mainContent -->
  </div>
  <div id="footer" class="font10 style2" align="center">
<p><span class="font10 style2">Ai-Music 獨立音樂網 Inc 2009 </span></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--登入的彈跳視窗-->
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
