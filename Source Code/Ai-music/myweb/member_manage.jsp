<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%@ include file="opendata.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>個人資料管理</title>
<!--這裡用的css-->

<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>

<script src="js/member_manage.js" type="text/javascript"></script>
<script src="js/check_password.js" type="text/javascript"></script>
<script src="js/prototype.js" type="text/javascript"></script>
<script language='javascript'>

function changeMenuFMGS(id){
	objDaughter=document.getElementById('iDMenu'+id);
	if (objDaughter.style.display=='none'){
		objDaughter.style.display='block';
	} else {
		if(objDaughter.style.display=='block'){
			objDaughter.style.display='none'; 
		} 
	} 
}

</script>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/common.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/CalendarPopup.js"></script>
<SCRIPT LANGUAGE="JavaScript" ID="jsB"> 
	var cal = new CalendarPopup("cal_div"); 
	cal.offsetX = -420;
	cal.offsetY = -430;
	cal.setTodayText("");
	cal.showNavigationDropdowns();
	cal.setCssPrefix("TEST");
</SCRIPT>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
<link href="../CSSfile/member_manage.css" rel="stylesheet" type="text/css">
<link href="../CSSfile/calendar.css" rel="stylesheet" type="text/css">
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
</head>
<% request.setCharacterEncoding("big5");%> 
<%
  /*String user_id = request.getParameter("user");//抓會員空間的會員資料
  */
  /*if(user_id==null){//如果抓不到會員空間網址後?user=xxx的話 表示是本人登入 則登入者id=會員id
   user_id=login_user;
  }*/ 
	String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
   sql="SELECT *, REPLACE(user_intro, '<br>', '') AS change_user_intro FROM users WHERE user_id ='"+login_user+"'";
   rs = stmt.executeQuery(sql);
   
   //讀取喜歡的音樂類型
   PreparedStatement music_type=con.prepareStatement("SELECT * FROM user_music WHERE user_id=?");
	music_type.setString(1, login_user);
	ResultSet music;
	
	//讀取顯示年齡與居住地欄位
	PreparedStatement visible_type=con.prepareStatement("SELECT * FROM visible WHERE user_id=?");
	visible_type.setString(1, login_user);
	ResultSet visible;
	
%>
<body class="oneColFixCtrHdr">
<div id="header">
<div style="padding-left:30px" align="left"><a href="index.jsp"><div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" />
<span class="font10">回首頁</span>
</div></a>
<%
	if (login_user == null)
	{
%>
	<div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm()">登入</a></div>
	
<%
	}
	else
	{
%>

<!--<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a>
    
    <span >我要檢舉</span>
    </div>-->
	<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> 
    
    <span>我的空間</span>
    </div>
	<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
	<div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a>
    <span>我的管理頁面</span>
    </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>登出</span>
    </div>
    <%
	}
%>
<form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
<div   style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;" class="info_search">
   <span class="font10 style4">請輸入搜尋字串</span>  
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class=" search-style"></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style">
          <option value="song_name" selected>歌名</option>
          <option value="member_name">會員</option>
          </select></td>        
        <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
  <div class="font10 style4 manubar link" >
    <table width="972">
      <tr>
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=login_user%>">個人空間</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=login_user%>">最新訊息</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=login_user%>">音樂作品</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=login_user%>"> 音樂收藏 </a></td>
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=login_user%>">我的朋友</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=login_user%>">留言版</a> </td>
      </tr>
    </table>
  </div>
</div>


<div id="container"  align="left">
 

<!--會員標頭-->
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">個人資料管理</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >我的管理中心</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">個人資料管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">音樂收藏管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">好友管理</a></div>
  </div>
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners  title" >音樂管理</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">音樂作品管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">管理自定分類</a></div>
  </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->

<div  id="bigright" class="font10 style4" align="left">
  <!--標籤面板-->
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab " tabindex="0">基本資料</li>
      <li class="TabbedPanelsTab" tabindex="0">帳戶資料</li>
      <!--<li class="TabbedPanelsTab" tabindex="0">音樂偏好</li>-->
    </ul>
    <div class="TabbedPanelsContentGroup">
    
    <form enctype="multipart/form-data" ACTION="member_basic_update.jsp" METHOD="POST" name="member_manage" onsubmit="return member_basic_check()">
    <div ID="cal_div" STYLE="position:absolute; visibility:visible; background-color:white; layer-background-color:white;"></div>
      <!--基本資料標籤內容-->
      <div class="TabbedPanelsContent">
        <div class="space">
          <div class="table-padding">
  <%//從資料庫抓資料結果
  while(rs.next()){
  %> 
            <table width="621" border="0">
              <tr>
                <td height="26" align="right" class="col-padding minwidth">姓名</td>
                <td><input name="user_name" id="user_name" type="text" class="input-style font10" value="<%=rs.getString("user_name")%>"/></td>
              </tr>
              <tr>
                <td height="20" align="right" class="col-padding minwidth">&nbsp;</td>
                 <td   class="style3" align="left">請填寫真實姓名,格式為中文或英文</td>
              </tr>
              <tr>
                <td width="71" height="26" align="right" class="col-padding minwidth">會員暱稱</td>
                <td width="540"><input name="user_nkname" type="text" class="input-style font10" id="user_nkname" value="<%=rs.getString("user_nkname")%>" maxlength="6"/></td>
              </tr>
              <tr>
                <td align="right" class="col-padding">&nbsp;</td>
                 <td align="left" class="style3">請填入英文字母或中文,至多6個字元，此為您的顯示名稱</td>
              </tr>
              <tr>
                <td align="right" class="col-padding minwidth">圖片</td>
                <td><div style="margin-bottom:10px">
                <div style="border:1px solid #E5E5E5;width:90px"> <img src="user/<%=login_user%>/<%=rs.getString("user_pic")%>" width="90" height="90"/></div></div></td>
              </tr>
              <tr>
                <td align="right" class="col-padding">&nbsp;</td>
                <td><input type="button" onClick="document.getElementById('pic').style.display='block'" value="變更圖片" class="save-block style4"/>
                  <span style="display:'none'">
                  
                  </span><!--打開隱藏的瀏覽列-->※上傳圖片檔案大小不得超過<span style="color:#ff091a"><b>1MB</b></span>;檔案名稱須為<span style="color:#ff091a"><b>英文檔名</b></span>。</td>
              </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td><div id="pic"  style="display:none"><input type="file" name="user_pic" /></div></td>
              </tr>
              <tr>
                <td align="right" class="col-padding minwidth">生日</td>
                <td>
                <input name="user_birth"type="text" class="input-style font10" id="user_birth" value="<%=rs.getString("user_birth")%>" size="10" maxlength="0"/>
                &nbsp;<a href="#" onclick="cal.select(document.forms[1].user_birth,'anchor18','yyyy/MM/dd'); return false;" title="選擇日期" name="anchor18" id="anchor18"><b>按此選擇日期</b></a></td>
              </tr>
              <tr>
                <td align="right" class="col-padding">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="right" class="col-padding minwidth">城市 </td>
                <td><input name="user_city" id="user_city" type="text" value="<%=rs.getString("user_city")%>" class="input-style font10"/></td>
              </tr>
              <tr>
                <td align="right" class="col-padding">&nbsp;</td>
                <td   class="style3" align="left">請填入中文或英文</td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">性別</td>
                <td ><input type="radio" name="user_gen" value="Male" 
                  <%if(rs.getString("user_gen").equals("Male")){
				    out.print("checked=\"checked\"");
					}
				  %> />
                  Male&nbsp;&nbsp;
                  <input type="radio" name="user_gen" value="Female" 
                <%if(rs.getString("user_gen").equals("Female")){
				    out.print("checked=\"checked\"");
					}
					%>/>
                  Female</td>
              </tr>
              <tr >
                <td align="right" class="col-padding">&nbsp;</td>
                <td >&nbsp;</td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">簡介</td>
               
                <td ><textarea name="user_intro"  cols="40" rows="8" class="font10 input-style"><%=rs.getString("change_user_intro")%></textarea> </td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">&nbsp;</td>
                <td >&nbsp;</td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">&nbsp;</td>
                <td ><input type="submit" class="save-block style4" value="儲存設定" /></td>
              </tr>
            </table>
          </div>
        <!--end of 包起來的padding-->
        </div>
        <!--end of 基本資料標籤-->
      </div>
      </form>
      
      <!--帳戶資料標籤內容-->
      <div class="TabbedPanelsContent">
        <!--包起來的padding-->
        <div class="space">
          <div class="font10-2" style="margin-bottom:10px;padding-left:10px">修改收信用Email:</div>
          <div class="table-padding">
          <form name="member_email_update" action="member_email_update.jsp" method="post" onSubmit="return check_mail()">
            <table width="298" border="0">
              <tr>
                <td width="76" height="26" align="right" class="col-padding">Email</td>
                <td width="212"><input name="user_email" id="user_email" type="text" value="<%=rs.getString("user_email")%>"  class="input-style font10"/></td>
              </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td><span class="font11 style4 ">Email修改後必須重新驗證</span></td>
              </tr>
              <tr>
                <td align="right" class="col-padding">密碼</td>
                <td><input name="user_password" id="user_password" type="password" onKeyUp="chkPassword() "  class="input-style font10"/></td>
              </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td><span class="font11 style4" id="divPassword">請輸入目前密碼</span></td>
              </tr>
              <tr>
                <td align="right"><input name="user_id" id="user_id" type="hidden" value="<%=rs.getString("user_id")%>"/></td>
                <td><input type="submit" class="save-block style4" value="更新Email" /></td>
              </tr>
            </table>
            </form>
          </div>
          <!--end of 包起來的padding-->
        </div>
        <hr size="1" color="#E5E5E5"/>
        <!--包起來的padding-->
        <div class="space">
          <div class="font10-2" style="margin-bottom:10px;padding-left:10px">修改密碼:</div>
          <div class="table-padding">
          <form name="member_password_update" action="member_password_update.jsp" method="post" onSubmit="return check_password()">
            <table width="601" border="0">
              <tr>
                <td width="93" align="right"><div  class="col-padding"  style="margin-bottom:10px">舊密碼</div></td>
                <td width="334" ><div  style="margin-bottom:10px">
                  <input name="user_password" id="user_password" type="password" value="<%=rs.getString("user_password")%>"  class="input-style font10"/>
                </div></td>
              </tr>
              <tr>
                <td align="right"><div  class="col-padding"  style="margin-bottom:10px">新密碼</div></td>
                <td ><div  style="margin-bottom:10px">
                  <input name="new_password" type="password"  class="input-style font10" id="new_password" maxlength="10"/>
                </div></td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                 <td class="style3" align="left">請填入英文字母、數字但不包含空白鍵,5到10個字元</td>
              </tr>
              <tr>
                <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">確認密碼</div></td>
                <td ><div  style="margin-bottom:10px">
                  <input name="new_password_chk" id="new_password_chk" type="password"  class="input-style font10"/>
                </div></td>
              </tr>
              <tr>
                <td align="right"></td>
                <td><input type="submit" class="save-block style4" value="更新密碼" /></td>
              </tr>
            </table>
            </form>
          </div>
          <!--end of 包起來的padding-->
        </div>
      </div>
      
<%--<!--音樂偏好標籤-->
 <form name="member_music_type" action="member_musictype_update.jsp" method="post">
       <div id="TabbedPanelsContent">
       <div class="space">
       <div class="font10-2" style="margin-bottom:10px;padding-left:10px">請選擇喜好的音樂類型:
       <input type="hidden" name="userid" value="<%=login_user%>" /></div>
          <div class="table-padding"> 
               <table width="515" border="0">
                 <tr class="style4">
                   <td><span style="margin-top:10px;">
                     <input name="Rock" type="checkbox" id="Rock"  value="1"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("1")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     搖滾(Rock)</span></td>
                   <td><span style="margin-top:10px;">
                     <input name="Pop" type="checkbox" id="Pop"  value="2"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("2")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     流行(Pop)</span></td>
                   <td><span style="margin-top:10px;">
                     <input name="Electronic" type="checkbox" id="Electronic" value="3" <%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("3")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     電子(Electronic)</span></td>
                 </tr>
                 <tr class="style4">
                   <td><input name="Metal" type="checkbox" id="Metal"  value="4"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("4")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     金屬(Metal) </td>
                   <td> <input name="HipHop" type="checkbox" id="HipHop"  value="5"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("5")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     嘻哈(Hip Hop) </td>
                   <td><input name="Jazz" type="checkbox" id="Jazz"  value="6"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("6")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     爵士(Jazz)</td>
                 </tr>
                 <tr class="style4">
                   <td> <input name="Conutry" type="checkbox" id="Country"  value="7"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("7")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     鄉村(Country) </td>
                   <td><input name="Folk" type="checkbox" id="Folk" value="8" <%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("8")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     民謠(Folk)</td>
                   <td><input name="Classical" type="checkbox" id="Classical" value="9" <%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("9")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     古典(Classical)</td>
                 </tr>
                 <tr class="style4">
                   <td>
                       <input name="Dance" type="checkbox" id="Dance" value="10" <%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("10")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     舞曲(Dance) </td>
                   <td>
                       <input name="RnB" type="checkbox" id="RnB" value="11" <%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("11")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     節奏藍調(R&amp;B)</td>
                   <td>
                       <input name="Undefined" type="checkbox" id="Undefined" value="12" <%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("12")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                     無法定義 </td>
                 </tr>
                
                <tr class="Tabletype2">
                  <td width="157">&nbsp;</td>
                  <td width="168">&nbsp;</td>
                  <td width="176">&nbsp;</td>
                </tr>
                <tr class="Tabletype2">
                  <td><input type="submit" class="save-block style4" value="儲存設定"></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table>
 
<!--end of 表格padding--></div>
<!--end of 音樂偏好標籤--></div>
    <!--end of 標籤面板--></div>
      </form>
--%>
<%
 }
  rs.close();
stmt.close();

con.close();
%>
    </div>
  </div>
  
  <!---------end of bigright ---------></div>
  
  
  
  
  
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
function openConfirm() {
    Dialog.confirm("登入", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp"})
}
</script>
</body>
</html>
