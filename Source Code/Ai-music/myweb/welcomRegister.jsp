<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>加入會員</title>

<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>

<!--
function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
//-->
</script>

<style type="text/css">
<!--
  a:visted{color:#B3B3B3;}      /*點選過後的顏色*/
-->
</style>
</head>

<body class="oneColFixCtrHdr">
<div id="container">
  <div id="header">
  <div id="apDiv1" class="font10"><a href="file:///C|/Documents and Settings/BEE/桌面/Ai-Music/web/首頁.html">登出</a></div>
<div id="apDiv3">
 <table width="316" border="0">
      <tr>
        <td width="138"><input type="text" name="ct2" /></td>
        <td width="82"><select name="mn" class="font10">
          <option value="" selected="selected">全文檢索</option>
          <option value="01">會員</option>
          <option value="02">創作</option>
          <option value="03">哼哼唱唱</option>
        </select></td>
        <td width="82"><input name="SUBMIT" type="submit" onClick="window.location.replace('搜尋頁面.html')" value="搜尋"/></td>
      </tr>
    </table>
</div>
   <table width="880" height="78" border="0" class="font10 style4">
  
  <tr>
    <td height="36" colspan="5" class="tButton" scope="row"><a href="file:///C|/Documents and Settings/BEE/桌面/Ai-Music/web/首頁.html"><img src="file:///C|/Documents and Settings/BEE/桌面/Ai-Music/image/banner2-1.JPG" alt="" width="237" height="85" /><img src="file:///C|/Documents and Settings/BEE/桌面/Ai-Music/image/banner2-2.jpg" alt="" width="740" height="85" /></a></td>
    </tr>
  <tr>
    <td width="176" height="36" class="MenuBarHorizontal" scope="row"><ul id="MenuBar3" class="MenuBarHorizontal">
      <li><a href="file:///C|/Documents and Settings/BEE/桌面/Ai-Music/web/14.1討論區">討論區</a> </li>
    </ul>    </td>
    <td width="176" class="MenuBarHorizontal"><ul id="MenuBar4" class="MenuBarHorizontal">
      <li><a href="file:///C|/Documents and Settings/BEE/桌面/Ai-Music/web/活動.html">活動</a> </li>
    </ul></td>
    <td width="176" class="MenuBarHorizontal"><ul id="MenuBar1" class="MenuBarHorizontal">
      <li><a class="MenuBarItemSubmenu" href="#">音樂</a>
          <ul>
            <li><a href="#">創作歌曲</a></li>
            <li><a href="#">哼哼唱唱</a></li>
          </ul>
      </li>
      </ul>    </td>
    <td width="176" class="MenuBarHorizontal"><ul id="MenuBar2" class="MenuBarHorizontal">
      <li><a class="MenuBarItemSubmenu" href="#">排行榜</a>
          <ul>
            <li><a href="#">會員</a></li>
            <li><a href="#">創作歌曲</a></li>
            <li><a href="#">哼哼唱唱</a></li>
          </ul>
      </li>
      </ul>    </td>
    <td width="176" class="MenuBarHorizontal"><div align="center">
            <ul id="MenuBar5" class="MenuBarHorizontal">
             <li><a href="#">加入會員</a> </li>
            </ul>
    </div>  </td>
</tr>
</table>
   <!-- end #header -->
  </div>
  <div class="font 10" id="mainContent">
  <div align="center" id="div1">
    <table width="700" height="66" border="0" class="Tablestyle1">
      
        <tr>
          <td><p align="center" class="font10 style1 style3">無樂不作提供一個能讓你發表音樂、歌唱、創作的平台</p>
              <p align="center" class="font10 style1 style3">讓你的音樂思想及理念能傳播出去</p></td>
        </tr>
    </table>
    </div>
    <div align="center">
  
      <div id="box"  align="center" >
        <table width="672" height="578" border="0" cellpadding="0" class="font10 style1 formtype"  >
          <tr>
                <td width="666" bgcolor="#16A3EB" class="style2" scope="row"><div align="center">無樂不作 使用條款</div></td>
          </tr>
          <tr>
                <td class="style2 style4"  scope="row"><p align="left"><strong class="style1">更新日期：2009/5/20</strong> </p>
                <p align="left"><br />
                    <strong>第一條　授權使用原則</strong> <br />
                  經由註冊申請過程，成為無樂不作（以下簡稱本網站）網際網路服務使用者 (以下簡稱會員)，即得授權使用本網站所提供之網際網路                  服務，但此授權對象僅限會員本人，授權使用項目僅限本網站正式對外公告開放者，會員同意本網站對此授權並不具絕對全面服務性                  或任何保證使用的立場，且本網站乃此服務之合法授權者，會員未經本網站同意，在任何情形下，不得任意轉移、轉讓甚至轉售全部                  或部分本網站所提供之網際網路服務。 </p>
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
      <div id="line">
        <hr size="1" color="#B1D2F3" width="700"/>
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
      </div>
  <FORM name="form1" method="post" action="new_register.jsp">      
      <div align="center">
        <input name="Submit" type="Submit"  value="同意以上條款" />
        &nbsp;
        <input name="RESET" type="reset"  onclick="window.history.go(-1)"  value="不同意"; />
      </div>
  </FORM>
    </div>
  </div>
  <div class="font10" id="footer">
<p align="center" class="style2">無樂不作-獨立音樂網 Inc 2009</p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../SpryAssets/SpryMenuBarDownHover.gif", imgRight:"../SpryAssets/SpryMenuBarRightHover.gif"});
var MenuBar2 = new Spry.Widget.MenuBar("MenuBar2", {imgDown:"../SpryAssets/SpryMenuBarDownHover.gif", imgRight:"../SpryAssets/SpryMenuBarRightHover.gif"});
//-->
</script>
</body>
</html>
