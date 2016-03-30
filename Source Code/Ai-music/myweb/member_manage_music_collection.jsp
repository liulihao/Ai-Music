<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>互動管理</title>
<!--這裡用的css-->
<link href="../CSSfile/member_manage_interactive.css" rel="stylesheet" type="text/css" />

<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

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
</head>
<% //會員資料

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
      <div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm('<%=web_url%>')">登入</a></div>
    <%
	}
	else
	{
%>
     <!-- <div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >我要檢舉</span> </div>-->
    <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()" >
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
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=user_id%>">個人空間</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=user_id%>">最新訊息</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=user_id%>">音樂作品</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=user_id%>"> 音樂收藏 </a></td>
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=user_id%>">我的朋友</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=user_id%>">留言版</a> </td>
      </tr>
    </table>
  </div>
</div>
<div id="container"  align="left">
  
<!--會員標頭-->
<div id="showid" class="font10 style4" align="left"><a href="member_page.jsp?user=<%=login_user%>">首頁</a>
  <!-- end of 會員標頭-->
  <span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">互動管理</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners title" >我的管理中心</div>
    <div class="bigleft-content style4  pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">個人資料管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">互動管理</a></div>
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
      <li class="TabbedPanelsTab " tabindex="0">音樂收藏</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <!--基本資料標籤內容-->
      <div class="TabbedPanelsContent">
        <div class="table-padding">
          <!-- 頁碼-->
          <%//音樂收藏列表頁碼
    int PageSize=6;//設定每張網頁顯示的筆數
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
	 sql="select COUNT(*) from music_collection where login_id='"+login_user+"'";
    rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  sql="select * from music_collection,track where music_collection.track_id = track.track_id AND login_id='"+login_user+"'  ORDER BY collect_date DESC";
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
          <!-- 頁碼-->
          <div id="new-message" align="left">
            <form action="member_manage_interactive.jsp" method="POST">
              <table border=0>
                <tr>
                  <td>目前頁次:<font color=red><%=ShowPage%></font>/ <font color=blue><%=PageCount%></font> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=ShowPage-1%>>[上一頁]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=ShowPage+1%>>[下一頁]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=1>[第一頁]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=PageCount%>>[最後一頁]</a> </td>
                  <td>輸入頁次:
                    <input type="text" size=3 name="ToPage" />
                  </td>
                  <td><input type="submit" name="SEND" value="送出" />
                  </td>
                </tr>
              </table>
            </form>
            <!-- 頁碼end-->
          </div>
          <!--好友迴圈請從這裡包-->
          <%
		   	i=0;
    		while(i<PageSize&&rs.next()){ 
				int track_id=rs.getInt("track_id");
			 	String user_id1=rs.getString("user_id");
				 String collect_date=rs.getString("collect_date");
				 String track_pic=rs.getString("track.track_pic");
	  
				 Statement track=con.createStatement();//抓歌曲資料
			     String track_sql="select * from track where track_id='"+track_id+"'";
			     ResultSet track_data;
			     track_data=track.executeQuery(track_sql);
	 
				 while(track_data.next()){
				   String track_name=track_data.getString("track_name");//抓曲名
		%>
          <!--音樂收藏迴圈請從這裡包-->
          <div class="song-block" align="left" style="float:left">
            <input type="button" class="delete-block style4" value="刪除" onclick="location.href='del_songCollect.jsp?track_id=<%=track_id%>&login_id=<%=login_user%>'" />
            <div style=" border:1px solid #E5E5E5;float:left;width:250px;">
              <div class="pic-block" align="center" ><img src="user/<%=user_id1%>/<%=track_pic%>" alt="" width="90" height="90"/></div>
              <div  align="left" class="style4 detail-block"><%=user_id1%></div>
              <div  align="left" class="style4 detail-block"><%=track_name%></div>
              <div  align="left" class="style10 style11 detail-block"><%=collect_date%><span class="style4">加入</span></div>
              <div  align="left" class="style4 detail-block"><span class="style12 style9">&gt;&nbsp;<strong><a href="member_page_music_song.jsp?music_id=<%=track_id%>">play</a></strong></span></div>
              <!--音樂收藏 end-->
            </div>
          </div>
          <%
	  i++;   
	   	}  //rs
	 	 }//track_data
	  rs.close();
	  stmt.close();
	  
	  %>
          <!--以上-->
          <!--清除浮動-->
          <div style="clear:both"></div>
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
            <!--end of 表格padding-->
          </div>
          <!--end of 音樂偏好標籤-->
        </div>
        <!--end of 標籤面板-->
      </div>
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
</script>
</body>
</html>
