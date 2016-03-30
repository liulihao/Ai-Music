<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>管理自定分類</title>
<!--這裡用的css-->

<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

<script src="js/member_manage.js" type="text/javascript"></script>
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
<link href="../CSSfile/member_manage_classified.css" rel="stylesheet" type="text/css" />
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
<% //會員資料
 String user_id = request.getParameter("user");//抓會員空間的會員資料
 String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
 if(user_id==null){//如果抓不到會員空間網址後?user=xxx的話 表示是本人登入 則登入者id=會員id
  user_id=login_user;
  }
 Statement user=con.createStatement();
 String user_sql="select * from users where user_id='"+user_id+"'";
 ResultSet user_data;
 user_data=user.executeQuery(user_sql);

 %>
<body vlink="#5F5F5F" class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><a href="index.jsp">
    <div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" /> <span class="font10">回首頁</span> </div>
    </a>
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
      <!--<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >我要檢舉</span> </div>-->
    <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div   style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;" class="info_search"> <span class="font10 style4">請輸入搜尋字串</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class=" search-style" /></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style">
                    <option value="song_name" selected="selected">歌名</option>
                    <option value="member_name">會員</option>
                </select></td>
                <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
              </tr>
            </table>
        </div>
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
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">管理自定分類</a><a href="member_manage_manage-music.jsp"></a></div>




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
      <li class="TabbedPanelsTab " tabindex="0">管理自定分類</li>
      </ul>
    <div class="TabbedPanelsContentGroup">
      <!--基本資料標籤內容-->
      <div class="TabbedPanelsContent">
      <form action="member_manage_add_classified.jsp?user=<%=user_id%>" method="post" name="add_classified"  onsubmit="return add_classified_check()">
          <div class="table-padding font10">
            <p><span class="style4">在此自定分類,以方便您分門別類管理您的音樂作品。</span></p>
            <p>&nbsp;</p>
            <span class="style4">分類名稱</span>
            <input type="text" name="classify" id="classify" class="input-style" />
             
            <span class="style4">(限<span class="style9">12</span>個中文字以內)</span>
            <input type="submit" class="new-block style4" value="新增分類"/>
            <div  align="center" onclick="add_classified.submit();"></div>
            <hr size="1" color="#dadada" style="width:635px"/>    
          </div>
          </form>
          <div class="table-padding font10 ">
            <p><span class="style4">已建立的分類名稱</span></p>
            
            <%
		  	Statement classified=con.createStatement();
			String classified_sql="select * from user_track_classify where user_id='"+user_id+"'";
			ResultSet classified_data;
 			classified_data=classified.executeQuery(classified_sql);
			while(classified_data.next()){
			  int classify_id=classified_data.getInt("classify_id");
		%>
     <!--以下是分類名稱-->    
     <form action="member_manage_update_classified.jsp?user=<%=user_id%>&user_classify=<%=classify_id%>" method="post" name="update_classified">
      <div style="margin:10px 0px;" class="style4"> 
           <table width="661">
            <tr>
              <td width="332">
<input name="update_classify" type="text" class="input-style" id="update_classify" value="<%=classified_data.getString("classify_name")%>" />            
(限<span class="style9">12</span>個中文字以內)              </td>
              <td width="317">
              <input type="submit" class="revise-block style4" value="修改"  onclick="return revise_classified()"/>
              <input type="button" class="delete-block style4" value="刪除" onclick="return delete_classified('<%=user_id%>',<%=classify_id%>)"/>
                  </td>
             </tr>
           </table>
      </div>
      </form>
      <%
	   }
	   classified_data.close();
	   classified.close();
	  %>
      </div>

        <!--end of 基本資料標籤-->
      </div>
      <!--帳戶資料標籤內容-->
      <div class="TabbedPanelsContent">
        <!--包起來的padding-->
        
        
        
        <!--包起來的padding-->
      </div>
      <!--音樂偏好標籤-->
      <div id="TabbedPanelsContent">
        <div class="space">
          <div class="font10-2" style="margin-bottom:10px">請選擇喜好的音樂類型:</div>
          <div class="table-padding">
            <table width="515" border="0">
              <tr class="Tabletype2">
                <td width="157" ><div align="left">
                  <input name="Rock" type="checkbox" id="Rock" />
                  Rock</div></td>
                <td width="168" ><div align="left">
                  <input name="Pop" type="checkbox" id="Pop" />
                  Pop</div></td>
                <td width="176" ><div align="left">
                  <input name="Electro" type="checkbox" id="Eletro"/>
                  Electronic </div></td>
              </tr>
              <tr class="Tabletype2">
                <td><div align="left">
                  <input name="Metal" type="checkbox" id="Metal" />
                  Metal</div></td>
                <td><div align="left">
                  <input name="HipHop" type="checkbox" id="HipHop" />
                  Hip Hop</div></td>
                <td><div align="left">
                  <input name="Jazz" type="checkbox" id="Jazz" />
                  Jazz</div></td>
              </tr>
              <tr class="Tabletype2">
                <td><div align="left">
                  <input name="Conutry" type="checkbox" id="Country" />
                  Country</div></td>
                <td><div align="left">
                  <input name="Jazz2" type="checkbox" id="Jazz2" />
                  Folk</div></td>
                <td><div align="left">
                  <input name="Jazz3" type="checkbox" id="Jazz3" />
                  Classical</div></td>
              </tr>
              <tr class="Tabletype2">
                <td><div align="left">
                  <input name="Jazz4" type="checkbox" id="Jazz4" />
                  Dance</div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr class="Tabletype2">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr class="Tabletype2">
                <td>&nbsp;</td>
                <td><input name="SUBMIT4" type="submit" value="儲存設定" /></td>
                <td>&nbsp;</td>
              </tr>
            </table>
            <!--end of 表格padding--></div>       
          <!--end of 音樂偏好標籤--></div>        
        <!--end of 標籤面板-->    </div>
    </div>
  </div>
  <!---------end of bigright --------->
</div>

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
