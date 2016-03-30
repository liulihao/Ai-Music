<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%@ include file="opendata.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>個人資料管理</title>
<!--這裡用的css-->

<!--標籤面板-->


<script src="js/member_manage.js" type="text/javascript"></script>
<script src="js/check_password.js" type="text/javascript"></script>
<script src="js/prototype.js" type="text/javascript"></script>
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
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

<link href="../CSSfile/member_manage_manage-music_upload.css" rel="stylesheet" type="text/css">
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
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
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
  <div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">音樂作品管理</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music_upload.jsp">音樂上傳</a></div>
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
  <div  id="bigright" class="font10" align="left">
    <!--標籤面板-->
    <div id="TabbedPanels1" class="TabbedPanels">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab " tabindex="0">音樂上傳</li>
      </ul>
      <div class="TabbedPanelsContentGroup">
        <!--基本資料標籤內容-->
        <div class="TabbedPanelsContent">
          <!--form 頭-->
          <form id="form1" method="post" action="member_manage_manage-music_success.jsp" enctype="multipart/form-data" >
            <div class="table-padding">
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p><span class="style13">‧上傳注意事項</span><br />
                  <br />
                (1) 僅接受<span style="color:#ff091a"> <b>MP3</b></span> 格式的音樂檔案。</p>
              <p>(2) 檔案名稱必須為 <span style="color:#ff091a"><b>英文檔名</b></span> 。<br />
              </p>
              <p>(3) 上傳檔案的大小不得超過 <span style="color:#ff091a"><b>10MB</b></span>。</p>
              <div style="margin-top:15px">
                <table width="617" border="0">
                  <tr>
                    <td width="73">歌曲名稱: </td>
                    <td width="534"><input name="song" id="song" type="text" class="input-style"/>                    </td>
                  </tr>
                  <tr>
                    <td><div style="margin-top:3px">演唱人:</div></td>
                    <td><div style="margin-top:3px">
                      <input name="singer" id="singer" type="text" class="input-style"/>
                    </div></td>
                  </tr>
                  <tr>
                    <td><div style="margin-top:3px">演唱類型:</div></td>
                    <td><div style="margin-top:3px">
                      <select name="sing_type" class="font10 input-style">
                        <option value="1">創作</option>
                        <option value="2">翻唱</option>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td><div style="margin-top:3px">音樂檔案:</div></td>
                    <td><div style="margin-top:3px">
                      <input name="music" type="file" />
                    </div></td>
                  </tr>
                </table>
              </div>
              <div style="margin:20px 0px">
                <p class="style9"><b>提醒您，請勿上傳非您自己所創作的作品，或侵犯它人著作權的的檔案，以免犯觸法律。</b></p>
                <p class="style9"><b>若被網站管理者發現，一概刪除。若因此而衍生法律責任，一概由上傳者自行承擔。 </b></p>
              </div>
              <div >
                <input type="submit" class="small-grayblock-agree style4 " value="我同意上述條款並開始上傳"s="s"/>
                <input type="button" class="small-grayblock-back style4" value="回上一頁" onclick="location.href='member_manage_manage-music.jsp'" />
                <div style="clear:both"></div>
              </div>
              <!--end of 包起來的padding-->
            </div>
            <!--end of 上傳音樂-->
          </form>
        </div>
      </div>
    </div>
    <!---------end of bigright --------->
</div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
  <!-- end #container -->
</div>
<script type="text/javascript">
<!--
//-->
function openConfirm() {
    Dialog.confirm("登入", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp"})
}
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>
