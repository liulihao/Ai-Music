<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>會員註冊條款</title>

<!--這裡用的CSS-->

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
<!--
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
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
  
  
  <div id="mainContent" class="font10">
<div class="center-title roundedCorners  style2"  align="center">Ai-music 會員條款</div>
    <div class="center-block roundedCorners" style="margin-bottom:20px; " align="center">
      <table width="672" height="578" border="0" cellpadding="0" class="font10 style1 formtype"  >
        
        <tr>
          <td class="style2 style4"  scope="row"><p align="left"><strong class="style1">更新日期：2009/9/20</strong> </p>
              <p align="left"><br />
                  <strong>第一條　授權使用原則</strong> <br />
                經由註冊申請過程，成為Ai-music（以下簡稱本網站）網際網路服務使用者 (以下簡稱會員)，即得授權使用本網站所提供之網際網路                  服務，但此授權對象僅限會員本人，授權使用項目僅限本網站正式對外公告開放者，會員同意本網站對此授權並不具絕對全面服務性                  或任何保證使用的立場，且本網站乃此服務之合法授權者，會員未經本網站同意，在任何情形下，不得任意轉移、轉讓甚至轉售全部                  或部分本網站所提供之網際網路服務。 </p>
            <p align="left"><br />
                  <strong>第二條　隱私權保護</strong> <br />
              會員於使用本網站所提供網路服務時，因註冊會員、參與本站舉辦之網路活動和調查所留下的個人資料均受到本網站妥善的保護，除僅                供本網站作為服務和活動設計參考之外，不會任意出售、交換或出租給第三者使用。 本網站提供的網路服務：個人簡介、歌曲推薦、播                放清單、評價討論，以及從本站連結出去之廣告廠商及網站上的會員行為，並不在上列隱私權的保護權責下，會員須知此為公開區域，                張貼之任何言論文字與因網路而產生的行為均由會員個人自行負責。 會員註冊成為會員後，可利用個人的帳號與密碼隨時修改個人資料                並保護個人隱私，若有密碼外洩疑慮，應立即更換或通知本站服務人員處理，否則責任後果應由個人自負。 若會員有觸犯法律或破壞網                路系統之嫌疑時，配合司法單位及相關網路管理單位之請求，本網站得提出會員的個人資料及所有直接或間接的可能連線記錄以供調查。 </p>
            <p align="left"><br />
                  <strong>第三條　智慧財產權</strong> <br />
              本網站有權對於會員所提供之資料或使用紀錄，進行任何形式直接或間接使用、分析及出版。其衍生性直接或間接之使用權益，本網站                具唯一之專有性。 網際網路上可擷取之任何資訊之智慧財產權，皆屬該資訊所有者擁有，非經資訊所有者公開開放或授權，會員及非會                員的一般瀏覽者僅得瀏覽觀看，不得侵害資訊所有者之智慧財產權，違反時由會員自負一切法律責任。</p>
            <p align="left"> <br />
                  <strong>第四條　授權終止</strong> <br />
              會員須同意其使用行為，出現有下列任一可能時，本網站有權暫時或永久終止本授權，並保留法律追訴權： </p>
            <div align="left">
                <ol>
                  <li>違反會員現居地現行法令之行為。 </li>
                  <li>違反國際間一般通訊規則或慣例之行為。 </li>
                  <li>當會員之操作或使用影響本網站整體網路服務系統運作或進行直接、間接破壞網路上任何其他系統之行為。 </li>
                  <li>會員以本網站所提供的網路服務從事任何不合法的活動，如恐嚇，侵害他人智慧財產、販售非正式授權軟體、色情光碟、毒品等之行為。 </li>
                  <li>會員其個人行為嚴重影響他人之權利時，如散播病毒、惡意散播不實言論等。 </li>
                  <li>會員未依本條款規定，盡其該有之義務時。 </li>
                </ol>
            </div>
            <p align="left">※或會員本身同時亦為本網站之內容提供者時，請另行詳讀並遵守內容提供者合約（於內容上傳前由本網站提供）。 <br />
                  <strong>第五條　免責條款</strong> </p>
            <div align="left">
                <p>會員使用本網站之網際網路服務產生之任何行為，僅代表會員本身之立場，概由會員自行負責。本網站不僅不具備任何連代保證之                     責任，其言論或行為更不代表本網站之立場。</p>
              <p>&nbsp;</p>
            </div></td>
        </tr>
      </table>
      

      
    </div>
  <FORM name="form1" method="post" action="new_register.jsp">      
      <div align="center" class="style4"> 
      
      <div align="center"  class="block1" style="float:left ; margin-left:300px; margin-right:40px"  onclick="form1.submit();" > 我同意以上條款</div>
      <div align="center"  class="block2" style="float:left" onclick="history.back()">我不同意</div>
      
      </div>
  </FORM>
    
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
