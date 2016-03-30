<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>好友管理</title>
<!--這裡用的css-->
<link href="../CSSfile/member_manage_friends.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
    <script type="text/javascript" src="../javascripts/window_effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
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
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">好友管理</a></div>




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
      <li class="TabbedPanelsTab " tabindex="0">好友訊息</li>
      <li class="TabbedPanelsTab " tabindex="0">好友管理</li>
      </ul>
    <div class="TabbedPanelsContentGroup">
   	 <div class="TabbedPanelsContent"><!--別人希望加妳為好友的訊息-->
      	
            
<%	 
	Statement friend_added = con.createStatement();
	String friend_added_sql="select * from friend,users where friend.friend_id='"+login_user+"' AND friend.user_id=users.user_id AND friend.friend_check = 0 ORDER BY friend_time DESC"; //user_id 一定會等於 login_user，friend.user_id=users.user_id 這句話是為了找到對方的頭像跟暱稱
	ResultSet friend_added_data = friend_added.executeQuery(friend_added_sql);
	
	if(!friend_added_data.next()){//if無好友申請
		%>
    <div class="font10" style="margin:10px 0 0 10px"><font color="#FF0000">目前沒有會員申請你為好友</font></div>
			<div class="table-padding"><!--padding2-->
            
    <%}else{//if無好友申請end else%>
    <div class="font10"  style="margin:10px 0 0 10px"><font color="#FF0000">若要接受對方的好友申請，請按確定</font></div>
			<div class="table-padding"><!--padding2-->
	<%
		friend_added_data.previous();
     while(friend_added_data.next()){
		
		String friend_added_user_id = friend_added_data.getString("friend.user_id"); //加我的人的帳號名稱
		String friend_added_friend_id = friend_added_data.getString("friend.friend_id"); 
		String friend_added_user_pic = friend_added_data.getString("users.user_pic");//從users抓friend user_id的pic
		String friend_added_user_nkname = friend_added_data.getString("users.user_nkname");		 	 				
		    //從users抓friend user_id的nkname
%>
          <div class="friend-block" align="center">
            <input type="button" class="new-block style4" value="接受" onclick="location.href='member_manage_friends_accept.jsp?user_id=<%=login_user%>&friend_id=<%=friend_added_user_id%>'"/>
            <input type="button" class="delete-block style4" value="拒絕" onclick="location.href='member_manage_friends_delete.jsp?user_id=<%=friend_added_user_id%>&friend_id=<%=friend_added_friend_id%>'"/>
            
            <div style="clear:both"></div>
            
            <a href="member_page.jsp?user=<%=friend_added_user_id%>"><div style="border:1px solid #E5E5E5"><img src="user/<%=friend_added_user_id%>/<%=friend_added_user_pic%>" width="90" height="90" /></div></a><br />
            <a href="member_page.jsp?user=<%=friend_added_user_id%>"><%=friend_added_user_nkname%></a>
          </div>
		  <%}//無好友申請else
		 	}//beFriend_data
			friend_added_data.close();
			friend_added.close();
		  %>
      			
                 
          	<div style="clear:both"></div><!--清除浮動-->
			</div><!--end of padding2-->
           
<p>&nbsp;</p>
<%	 
	Statement friend_add = con.createStatement();
	String friend_add_sql="select * from friend,users where friend.user_id='"+login_user+"' AND friend.friend_id = users.user_id AND friend.friend_check = 0 ORDER BY friend_time DESC"; //user_id 一定會等於 login_user，friend.user_id=users.user_id 這句話是為了找到對方的頭像跟暱稱
	ResultSet friend_add_data = friend_add.executeQuery(friend_add_sql);
	if(!friend_add_data.next()){
%>
	<div class="font10"  style="margin:10px 0 0 10px"><font color="#FF0000">你的好友申請都被同意了</font></div>
            <div class="table-padding"><!--padding3-->
<%
	}else{
	%>
    <div class="font10" style="margin-left:10px"><font color="#FF0000">還在等待對方同意你的好友申請</font></div>
            <div class="table-padding"><!--padding3-->
    <%
	 friend_add_data.previous();
     while(friend_add_data.next()){
		
		String friend_add_user_id = friend_add_data.getString("friend.friend_id"); //我想加的人的帳號名稱				
		String friend_add_user_pic = friend_add_data.getString("users.user_pic"); //我想加的人的頭像
		String friend_add_user_nkname = friend_add_data.getString("users.user_nkname");//我想加的人的暱稱
%>
          <div class="friend-block" align="center">
            <font color=blue>等待同意中</font>
            <a href="member_page.jsp?user=<%=friend_add_user_id%>"><img src="user/<%=friend_add_user_id%>/<%=friend_add_user_pic%>" width="90" height="90" /></a><br />
            <a href="member_page.jsp?user=<%=friend_add_user_id%>"><%=friend_add_user_nkname%></a>
          </div>
		  <%
		  	}
		 	}//beFriend_data
			friend_add_data.close();
			friend_add.close();
		  %>
          	<div style="clear:both"></div><!--清除浮動-->
			</div><!--end of padding3-->
            
<p>&nbsp;</p>
<p>&nbsp;</p>

       </div><!--end of 別人希望加妳為好友的訊息-->
      <!--基本資料標籤內容-->
      <div class="TabbedPanelsContent">

          <div class="table-padding">
<%//好友列表頁碼
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
	 sql="select COUNT(*) from friend where user_id='"+user_id+"' AND friend.friend_check=1";
    rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  //if(login_user.equals(user_id)){
	  sql="select * from friend,users where friend.user_id='"+user_id+"' AND friend.friend_id=users.user_id AND friend.friend_check=1 ORDER BY friend_time DESC";

	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>      
<!-- 頁碼-->
    <div id="new-message" align="center" class="style4">

    <form action="member_manage_friends.jsp?user=<%=user_id%>" method="POST">
     <p>你共有<font color="#0066FF"><b><%=RowCount%></b></font>個好友</p>
     <table border=0>
   <tr>
       <td>目前頁次:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=1>[第一頁]</a>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
		<td>輸入頁次: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">
        <input type="submit" name="SEND" value="送出" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
	</tr>
	</table>
 </form> 
    
<!-- 頁碼end--></div>
          <!--好友迴圈請從這裡包-->
          <%
		   	i=0;
    		while(i<PageSize&&rs.next()){   
			  String friend_id=rs.getString("friend.friend_id");//從friend抓friend_id
			  String friend_user_id=rs.getString("friend.user_id");//從friend抓friend_id
			  int friend_check=rs.getInt("friend.friend_check");//從friend抓friend_check 確認是否為好友
			  
			  String friend_pic=rs.getString("users.user_pic");//從users抓friend的pic
			  String friend_nkname=rs.getString("users.user_nkname");//從users抓friend的nkname
			  if(friend_check==1){//刪除以為好友的人
		  %>
          
          <div class="friend-block" align="center">
            <input type="button" class="delete-block2 style4" value="刪除" onclick="return delete_manage_friend('<%=user_id%>','<%=friend_id%>')"/>
            <a href="member_page.jsp?user=<%=friend_id%>"><img src="user/<%=friend_id%>/<%=friend_pic%>" width="90" height="90" /></a><br />
            <a href="member_page.jsp?user=<%=friend_id%>"><%=friend_nkname%></a>
          </div>
          		  <%
		  		} //if end
		   	i++;
		  	}//rs
			rs.close();
			stmt.close();
		  %>
          
          <!--以上-->   
          
           <!--清除浮動-->
           <div style="clear:both"></div>
			
          </div><!--end of padding-->
          </div><!--end of 基本資料標籤-->
          
      
     
           
    </div><!--end of TabbedPnelsGroup-->
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

function openConfirm2() {
    Dialog.confirm("Do you like this effect?",{className:"alphacube", width: 400, height:30, })
  }       
  
function openConfirm2() {
    var win = new Window({className:"alphacube",closable:true,minimizable:false,maximizable:false,draggable:false,width: 400, height:200,})
    win.getContent().update("<div style='color:#000; background-color:#FDFDFD;-moz-opacity:1;opacity:1 ;width:400px; height:200px;z-index:1000'><h1>Hello</h1>Word</div>");     
    win.showCenter();
  }           

</script>
</body>
</html>
