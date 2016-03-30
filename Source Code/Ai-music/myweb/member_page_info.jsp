<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />

<!--這裡用的css-->
<link href="../CSSfile/member_page_info.css"rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
    
    <script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
    <link href="../SpryAssets/SpryTabbedPanels_info.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
<script src="js/Login.js"></script>
<script src="js/prototype.js"></script>
<script src="js/member_page.js"></script>
<!--css end-->
</head>
<% //會員資料
 String user_id = request.getParameter("user");//抓會員空間的會員資料
 String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
 if(user_id==null){//如果抓不到會員空間網址後?user=xxx的話 表示是本人登入 則登入者id=會員id
  user_id=login_user;
  }
String interactive=request.getParameter("friend");
 Statement user=con.createStatement();
 String user_sql = "SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where user_id ='"+user_id+"'";
 ResultSet user_data;
 user_data=user.executeQuery(user_sql);
 

 %>
<body class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><a href="index.jsp">
    <div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" /> <span class="font10">回首頁</span> </div>
    </a>
      <%
	if (login_user == null)
	{
%>

    <div class="font10 style4" style="position:absolute; left: 879px; top:9px; width: 89px; height: 14px;">
    <table>
     <tr>
         <td><a href="#" onclick="openConfirm('<%=web_url%>')">登入</a></td>        
         <td><div style="margin-right:2px">|</div></td>  
         <td><a href="index_welcome.jsp">註冊</a></td>
     </tr>
    </table></div>
    <%
	}
	else
	{
%>
      <div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >我要檢舉</span> </div>
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
<div id="container" align="left">
  <div class="font 10" id="mainContent" align="right">
 
  <!--會員標頭-->
      <div id="showid" class="font10 style4" align="left">
     <a href="member_page.jsp?user=<%=user_id%>">首頁 </a><span class="style12">&gt;&nbsp;</span><a href="member_page.jsp?user=<%=user_id%>"><%=user_id%></a> <!--這裡需要抓id自動產生帳號名稱-->  
     </div>
  <!--end of 會員標頭-->   
  
<!--Menu-->
<!--end of Menu-->

<!--bigleft-->
<div id="bigleft" class="font10 style4">
  <!--About me title-->
  <div class="title style17 style7" align="left" style="position:relative"><strong>關於我</strong>
      <div class="roundedCorners style4 style14 bar_left1"></div>
    <!--About me title end-->
  </div>
  <%while(user_data.next()){ //資料庫中會員資料的結果%>
  <title><%=user_data.getString("user_nkname")%>的最新訊息</title>
  <!--aboutme-block-->
  <div id="aboutme-block" align="left">
    <div id="aboutme-block-pic" align="center" > <img src="user/<%=user_id%>/<%=user_data.getString("user_pic")%>" alt="" width="100" height="100"/> </div>
    <div align="left" class="style4 detail-block">暱稱:<%=user_data.getString("user_nkname")%></div>
    <div align="left" class="style4 detail-block">年齡:<%=user_data.getInt("user_age")%></div>
    <div align="left" class="style4 detail-block">所在城市:<%=user_data.getString("user_city")%></div>
    <div align="left" class="style4 detail-block">點閱數:<strong><%=user_data.getInt("user_count")%></strong></div>
    <%
	boolean Exist=false;
	boolean Check=false;
	Statement add_friend=con.createStatement();//抓好友資料
	String add_friend_sql="SELECT * FROM friend WHERE friend_id='"+user_id+"' AND user_id='"+login_user+"'";
	ResultSet add_friend_data;
	add_friend_data=add_friend.executeQuery(add_friend_sql);
	
	while(add_friend_data.next()){
			Exist=true;
			int friend_check=add_friend_data.getInt("friend_check");
				if(friend_check==0){
					Check=false;
				}else{
					Check=true;
				}
	}
	if (login_user == null)
	{
		out.print("<div class='style4 detail-block' align='left'></div>");
	}
	else if(user_id.equals(login_user)){//如果登入帳號與會員空間帳號相同  則不顯示加入好友按鈕
		out.print("<div class='style4 detail-block' align='left'></div>");
    }
	else if(Exist){//如果已經是或等待朋友  則不顯示加入好友按鈕
		if(Check){
			out.print("<div class='style4 detail-block' align='left'><font color='red'>你們已經為好友</font></div>");
		}else{
			out.print("<div class='style4 detail-block' align='left'><font color='red'>等待對方同意好友</font></div>");
		}
	}
	else if(!Exist && user_id != login_user)
	{   
	    out.print("<div align='right' style='padding-right:65px'>");
	    out.print("<div class='outfriend'>");
		out.print("<input type='button' value='加入好友' onClick=\"AddFrd('"+login_user+"','"+user_id+"')\" class='infriend'/>");
		out.print("</div>");
		out.print("</div>");
    }
	else{
		out.print("<div class='style4 detail-block' align='left'><font color='red'>特殊狀況</font></div>");
    }
	add_friend.close();
	add_friend_data.close();
%>
    <!--加入好友form-->
    <form action="" method="post" id="frmFriend" name="frmFriend">
      <input type="hidden" name="user_id" id="user_id" value="" />
      <input type="hidden" name="friend_id" id="friend_id" value="" />
    </form>
    <!--加入好友end-->
    <!--about me end-->
  </div>
  <!--簡介-->
  <div align="left" style="margin:7px 0  10px 0 ">想說的話:</div>
  <div id="intro-block" align="left" > <%=user_data.getString("user_intro")%>
      <!--end of 簡介-->
  </div>
  <%
	 %>
  <!--好友動向-->
  <%
		if(user_id.equals(login_user)){
	%>
  <div class=" title style17 style8" align="left"  style="margin-bottom:10px;position:relative" ><strong>通知 </strong>
      <div class="roundedCorners style4 style14 bar_left2" ></div>
  </div>
  <!--end of -->
  <%
		Statement friend_add = con.createStatement();//加入好友申請訊息
		sql="select * from friend,users where friend.friend_id='"+user_id+"' AND friend.user_id=users.user_id AND friend.friend_check = 0";
		ResultSet friend_add_data = friend_add.executeQuery(sql);
		
		String logout_time = user_data.getString("logout_time");
		Statement friend_agree = con.createStatement();//同意你的好友申請訊息
		sql="select * from friend,users where friend.friend_id='"+user_id+"' AND friend.user_id = users.user_id AND friend.friend_time > '" +logout_time+ "' AND friend.friend_check = 1";
		ResultSet friend_agree_data = friend_agree.executeQuery(sql);
		
		Statement track_opinion = con.createStatement();//同意你的好友申請訊息
		sql="select * from users,opinion,track where opinion.user_id ='"+user_id+"' AND opinion.post_id = users.user_id AND track.track_id = opinion.track_id AND opinion.time > '" +logout_time+ "'";
		ResultSet track_opinion_data = track_opinion.executeQuery(sql);
		
		if(!friend_add_data.next() && !friend_agree_data.next() && !track_opinion_data.next()){
			out.print("<font color='#FF0000'><p align = 'left'>您沒有任何通知<p></font>");
		}
		else{
			friend_agree_data.previous();
			friend_add_data.previous();
			track_opinion_data.previous();
			while(friend_add_data.next()){//friend_add_data
		   //如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%>
  <div id="div" align="left"  >
    <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
      <table width="236">
        <tr>
          <td class="style12"><%=friend_add_data.getDate("friend.friend_time")%> <%=friend_add_data.getTime("friend.friend_time")%></td>
        </tr>
        <tr>
          <td><a href="member_page.jsp?user=<%=friend_add_data.getString("users.user_id")%>"><span class="style14"><%=friend_add_data.getString("users.user_nkname")%></span></a> <span class="style13">申請成為您的好友</span></td>
        </tr>
        <tr>
          <td><a href="member_manage_friends.jsp"> <span class="color1">接受</span></a> </td>
        </tr>
      </table>
    </div>
  </div>
  <!--<div id="div" align="left"  >結束-->
  <%	
	  	}//while(friend_add_data)
		
		while(friend_agree_data.next()){//friend_agree_data
		   //如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%>
  <div id="div" align="left"  >
    <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
      <table width="236">
        <tr>
          <td class="style12"><%=friend_agree_data.getDate("friend.friend_time")%> <%=friend_agree_data.getTime("friend.friend_time")%></td>
        </tr>
        <tr>
          <td><a href="member_page.jsp?user=<%=friend_agree_data.getString("users.user_id")%>"><span class="color1"><%=friend_agree_data.getString("users.user_nkname")%></span></a> <span class="style13">已同意您的好友申請</span></td>
        </tr>
      </table>
    </div>
  </div>
  <!--<div id="div" align="left"  >結束-->
  <%	
	  	}//while(friend_agree_data)
		
		while(track_opinion_data.next()){//friend_agree_data
		   //如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%>
  <div id="div" align="left"  >
    <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
      <table width="236">
        <tr>
          <td><span class="style13"><%=track_opinion_data.getDate("opinion.time")%>&nbsp;<%=track_opinion_data.getTime("opinion.time")%></span></td>
        </tr>
        <tr>
          <td><a href="member_page.jsp?user=<%=track_opinion_data.getString("users.user_id")%>"><span class="color1"><%=track_opinion_data.getString("users.user_nkname")%></span></a><span class="style13">對你的歌曲</span><a href="member_page_music_song.jsp?music_id=<%=track_opinion_data.getInt("track.track_id")%>"><span class="color1"><%=track_opinion_data.getString("track.track_name")%></span></a><span class="style13">發表了意見</span></td>
        </tr>
      </table>
    </div>
  </div>
  <!--<div id="div" align="left"  >結束-->
  <%	
	  	}//while(track_opinion_data)
		
		}//else
	  }//if login
	  }//user
     user.close();
	 user_data.close();
     //End of 資料庫中會員資料的結果
		%>
  <!--好友動向END-->
  <!--end of bigleft-->
</div>
<!--bigright-->
  <div  id="bigright" class="font10 style4" >
    <!--收藏音樂的程式碼起始--><!-- title-->
    <div  id="title" align="left" class="style4 roundedCorners style17 " style="position:relative" >最新訊息
       <div class="roundedCorners bar"></div>
      <!---end of title---></div>
   
   <!--內容-->
   <div id="TabbedPanels1" class="TabbedPanels" align="left"><!--TabbedPanels1-->
	<ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">歌曲</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">留言</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">意見</li>
	</ul>
	<div class="TabbedPanelsContentGroup-change"> <!--TabbedPanelsContentGroup-change-->
      
		
<%
		Statement friend_act_track=con.createStatement();//歌曲動向
		sql="SELECT * FROM friend, track, users WHERE friend.friend_id= track.user_id AND friend.friend_id = users.user_id AND friend.user_id = '"+user_id+"' AND friend.friend_check = 1 AND DATE_ADD(track.track_time,INTERVAL 30 DAY) > NOW() ORDER BY track.track_time DESC LIMIT 10";
		ResultSet friend_action_track=friend_act_track.executeQuery(sql);
%>
		<!--歌曲-->
		<div class="TabbedPanelsContent">
		<br>
        <%
		if(!friend_action_track.next()){
		%>
        	<p><font color="#FF091a">這一個月內你朋友沒有上傳任何歌曲</font></p>
		<%	
		}
		else
		{
		%>
        	<p><font color="#FF091a">歌曲訊息會顯示最近<b>一個月內</b>你朋友的歌曲上傳動態，筆數上限為10筆</font></p>
		<%
			friend_action_track.previous(); //要記得將紀錄往前一筆，因為if(!friend_action_track.next())判斷時會將紀錄向後推一筆
			while(friend_action_track.next())
			{//friend_action_track
%>
				<div style="clear:both"></div>
				<div  style="border-bottom:1px dashed #CCCCCC ;margin-top:20px" >
				<table width="500">
				<tr>
				<td  class="style12"><%=friend_action_track.getDate("track.track_time")%> <%=friend_action_track.getTime("track.track_time")%></td>
				</tr>
				<tr>
				<td><span class="style13">你的好友 </span><span class="style14"><a href="member_page.jsp?user=<%=friend_action_track.getString("users.user_id")%>"><%=friend_action_track.getString("users.user_nkname")%> </a></span><span class="style13">新增了歌曲</span></td>
				</tr>
				<tr>
				<td><a href="member_page_music_song.jsp?music_id=<%=friend_action_track.getInt("track.track_id")%>"><span class="color1"><%=friend_action_track.getString("track.track_name")%></span></a></td>
				</tr>
				</table>
				</div>
<%
			}//while
		}//else
%>
		</div><!--歌曲-->
<%
		Statement friend_act_message=con.createStatement();//留言動向
		sql="SELECT * FROM friend,message,users WHERE friend.friend_id = message.user_id AND friend.friend_id = users.user_id AND friend.user_id = '"+user_id+"' AND friend.friend_check = 1 AND DATE_ADD(message.time, INTERVAL 30 DAY) > NOW() ORDER BY message.time DESC LIMIT 10";
		ResultSet friend_action_message=friend_act_message.executeQuery(sql);
%>        
		<!--留言-->
		<div class="TabbedPanelsContent">
        <br>
        <%
		if(!friend_action_message.next()){
		%>
        	<p><font color="#FF091a">這一個月內你朋友的留言版沒有任何新留言</font></p>
		<%	
		}
		else
		{
		%>
        	<p><font color="#FF091a">留言訊息會顯示最近<b>一個月內</b>你朋友的留言版動態，筆數上限為10筆</font></p>
		<%
			friend_action_message.previous(); //要記得將紀錄往前一筆，因為if(!friend_action_messge.next())判斷時會將紀錄向後推一筆
			while(friend_action_message.next()){//friend_action_message
			//如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%>
				<div style="border-bottom:1px dashed #CCCCCC ;margin-top:20px">
				<table width="500">
				<tr>
				<td class="style12"><%=friend_action_message.getDate("message.time")%> <%=friend_action_message.getTime("message.time")%></td>
				</tr>
				<tr>
				<td><span class="style13">你的好友 </span><span class="style14"><a href="member_page.jsp?user=<%=friend_action_message.getString("friend.friend_id")%>"><%=friend_action_message.getString("users.user_nkname")%> </a></span><span class="style13">的留言板有一筆新留言</a></span></td>
				</tr>
				<tr>
				<td><a href="member_page_message.jsp?user=<%=friend_action_message.getString("message.user_id")%>"><span class="color1"><%=friend_action_message.getString("message.subject")%></span></a></td>
				</tr>
				</table>
				</div>
<%
			}//while
		}//else
%>
		</div><!--留言-->
<%
		Statement friend_act_opinion=con.createStatement();//意見動向
		sql="SELECT * FROM friend, opinion, track, users WHERE friend.friend_id = opinion.user_id AND friend.friend_id = users.user_id AND friend.user_id = '"+user_id+"' AND opinion.track_id = track.track_id AND friend.friend_check = 1 AND DATE_ADD(opinion.time, INTERVAL 30 DAY) > NOW() ORDER BY opinion.time DESC LIMIT 10";
		ResultSet friend_action_opinion=friend_act_opinion.executeQuery(sql);
%>        
        <!--意見-->
		<div class="TabbedPanelsContent">
        <br>
        <%
		if(!friend_action_opinion.next()){
		%>   
           
        	<p><font color="#FF091a">這一個月內你朋友的歌曲沒有任何新意見</font></p>
		<%	
		}
		else
		{
		%>   
         
        	<p><font color="#FF091a">意見訊息會顯示最近<b>一個月內</b>你朋友的歌曲意見動態，筆數上限為10筆</font></p>
		<%
			friend_action_opinion.previous(); //要記得將紀錄往前一筆，因為if(!friend_action_opinion.next())判斷時會將紀錄向後推一筆
			while(friend_action_opinion.next()){//friend_action_message
			//如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%>
				<div style="border-bottom:1px dashed #CCCCCC ;margin-top:20px">
				<table width="500">
				<tr>
				<td class="style12"><%=friend_action_opinion.getDate("opinion.time")%> <%=friend_action_opinion.getTime("opinion.time")%></td>
				</tr>
				<tr>
				<td>
                <span class="style13">你的好友 </span><span class="style14"><a href="member_page.jsp?user=<%=friend_action_opinion.getString("friend.friend_id")%>"><%=friend_action_opinion.getString("users.user_nkname")%> </a></span><span class="style13">的歌曲<a href="member_page_music_song.jsp?music_id=<%=friend_action_opinion.getString("track.track_id")%>">  <%=friend_action_opinion.getString("track.track_name")%></a> 有一筆新意見</span>
                </td>
				</tr>
				<tr>
				<td><a href="member_page_music_song.jsp?music_id=<%=friend_action_opinion.getString("track.track_id")%>"><span class="color1"><%=friend_action_opinion.getString("opinion.opinion")%></span></a></td>
				</tr>
				</table>
				</div>
<%
			}//while
		}//else
%>
		</div><!--留言-->
	</div><!--TabbedPanelsContentGroup-change-->
</div><!--TabbedPanels1-->
   <!--end of 內容-->

  </div>
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>
<script type="text/javascript">

function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "feedback/feedback.jsp?user=<%=user_id%>&web_url=<%=web_url%>"})
			}

var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>
