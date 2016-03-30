<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>音樂作品管理</title>
<!--這裡用的css-->

<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="js/prototype.js"></script>
<script src="js/member_manage.js" type="text/javascript"></script>
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

<link href="../CSSfile/member_manage_manage-music.css" rel="stylesheet" type="text/css" />
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
 //String user_id = request.getParameter("user");//抓會員空間的會員資料
 String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
 Statement user=con.createStatement();
 String user_sql="select * from users where user_id='"+login_user+"'";
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
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">音樂作品管理</a></div>




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
<div  id="bigright" class="font10" align="left">
  <!--標籤面板-->
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab " tabindex="0">音樂作品管理</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <!--基本資料標籤內容-->
      <div class="TabbedPanelsContent">
      <input type="button" id="song_upload" class="upload-block style13 font10" value="上傳歌曲"onclick="location.href='member_manage_manage-music_upload.jsp'" />
        
        <div align="right" style="margin:5px; padding-right:33px;" ><!--歌曲搜尋-->
  <form id="song_search1" name="song_search1" method="post" >
  <input name="song_search_text" type="text" class="input-style" id="song_search_text" size="15" maxlength="40"/>
  <input type="button" value="歌曲搜尋" onclick="return song_search()" class="input-style-type style4"/>
  </form>
  </div>
  <div id="search_song"></div>
        <div class="space" id="song_space">
         <%
    int PageSize=10;//設定每張網頁顯示的筆數
	int ShowPage=1;//設定欲顯示的頁數
	int RowCount=0;//ResultSet記錄筆數
	int PageCount=0;//ResultSet分頁後的總頁數
	
	String ToPage=request.getParameter("ToPage");
	if(ToPage!=null){//判斷是否可正確取得ToPage參數 可取得則表示JSP網頁應顯示特定分頁紀錄的敘述
	  ShowPage=Integer.parseInt(ToPage);//取得指定顯示的分頁頁數
	  	  if(ShowPage<=0){
	    ShowPage=1;//若指定頁數小於0 則設定顯示第一頁的紀錄
	  }
	 }
	 sql="select COUNT(*) from track where user_id='"+login_user+"'";
    rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  sql="select * from track where user_id='"+login_user+"' ORDER BY track_time DESC";
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>   <!--頁次-->
    <div class="style4" align="center">
    <form action="member_manage_manage-music.jsp" method="POST">
    <p>你共有<font color="#0066FF"><b><%=RowCount%></b></font>首歌曲</p>
      <table width="651" border=0>
        <tr>
          <td width="138"><div align="center">目前頁次:<font color=red><%=ShowPage%></font>/<font color=blue><%=PageCount%></font> </div></td>
          <td width="70" ><div align="center"><a href=member_manage_manage-music.jsp?ToPage=1>[第一頁]</a></div></td>
          <td width="70" ><div align="center"><a href=member_manage_manage-music.jsp?ToPage=<%=ShowPage-1%>>[上一頁]</a> </div></td>
          <td width="70"><div align="center"><a href=member_manage_manage-music.jsp?ToPage=<%=ShowPage+1%>>[下一頁]</a> </div></td>
          <td width="91"><div align="center"><a href=member_manage_manage-music.jsp?ToPage=<%=PageCount%>>[最後一頁]</a> </div></td>
          <td ><div align="center">輸入頁次:
            <input type="text" id="page_text" size=3 name="ToPage"  class="font10 style4 input-style" />
                <input type="submit" name="SEND" value="送出" class="font10 style4 input-style-type"  onclick="return check_page()">
          </div></td>
        </tr>
      </table>
    </form>
    </div>
    <!--End of 頁次-->
          <div class="font10 music-title  roundedCorners" style="margin-bottom:10px">
            <table width="651" border="0">
              <tr>
              	<td width="43" align="center">#</td>
                <td width="410" class="title-name1">歌曲名稱</td>
                <td width="184" class="title-style1">&lt;上傳時間&gt;</td>
              </tr>
            </table>
          </div>
         
          <%
		   i=0;
		   int num=(ShowPage-1)*10;
   			 while(i<PageSize&&rs.next()){   
			  num++;
			  String track_id=rs.getString("track_id");
			  String track_name=rs.getString("track_name");		  
			 
		  %>
          <div class="table-padding">
          
            <div>           
              <table width="661" border="0">
                <tr>
                <td width="34" align="center"><%=num%></td>
                  <td width="397" class="title-name1"><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%=track_name%></a></td>
                  <td width="216" class="title-style1"><span class="style9"><%=rs.getDate("track_time")%> <%=rs.getTime("track_time")%></span></td>
                </tr>
              <tr>
              <td></td>
            <td colspan="2">
            <input type="button" class="save-block style4" value="修改" onclick="location.href='member_manage_manage-music_revise.jsp?music_id=<%=track_id%>'"/>
            <input type="button" class="delete-block style4" value="刪除" onclick="delete_music(<%=track_id%>)"/>
            </td>
            </tr>
         </table>
            </div>
            <div class="song-line" >
              <hr size="1" color="#E5E5E5";/>
            </div>
          </div>
          <% 
		  	i++;
		   }
		   rs.close();
		   stmt.close();
		  
		   %>
          <!--end of 包起來的padding-->
        </div>
        <!--end of 基本資料標籤-->
      </div>
      <!--帳戶資料標籤內容-->
      <div class="TabbedPanelsContent">
        <!--包起來的padding-->
        <!--包起來的padding-->
      </div>
     
    </div>
  </div>
  <!---------end of bigright --------->
</div>
<!---------------------bigright--------------------->
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
