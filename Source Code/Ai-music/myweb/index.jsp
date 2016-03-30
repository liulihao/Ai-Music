<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無樂不作音樂網</title>

<!--這裡用的CSS-->
<link href="../CSSfile/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>
<script src="js/Login.js"></script>
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript">
			window.addEvent('domready', function(){
				var myMenu = new ImageMenu($$('#imageMenu a'),{openWidth:310, border:2, onOpen:function(e,i){alert(e);}});
			});

var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));

var pageTracker = _gat._getTracker("UA-3333085-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>

</head>
<body class="thrColAbsHdr">

<div id="header" >
<div style="padding-left:30px" align="left"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
<%
	String login_user=(String)session.getAttribute("user_id");
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

	<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> 
    
    <span>我的空間</span>
    </div>
	
	<div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a>
    <span>我的管理頁面</span>
    </div>
     
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>登出</span>
    </div>
    
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
<%
	}
%>
    <form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
   <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search">  
   
   <span class="font10 style4">請輸入搜尋字串</span>
   
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style" >
          <option value="song_name" selected>歌名</option>
          <option value="member_name">會員</option>
          </select></td>        
        <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
      </tr>
    </table></div>
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
    <!--灰色大框-->
 
  <div id="sidebar1" class="font10">
  <div class="roundedTopCorners  grayblock"> 
  <div class="title roundedTopCorners style2" align="center" style="">音樂檢索</div>
  <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">地區分類</div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=12">華語地區</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=13">東洋地區</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=14">西洋地區</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=15">其他地區</a></div>
          <!--討論區管理.音樂類型-->
          <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">音樂類型</div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=1">搖滾(Rock)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=2">流行(Pop)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=3">電子(Electronic)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=4">金屬(Metal)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=5">嘻哈(HipHop)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=6">爵士(Jazz)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=7">鄉村(Country)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=8">民謠(Folk)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=9">古典(Classical)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=10">舞曲(Dance)</a></div>
        <div class="bigleft-content2 style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=11">節奏藍調(R&amp;B)</a></div>
</div>        
        
    <!--灰色大框-->
<div class="roundedTopCorners  grayblock">
  <div class="title roundedTopCorners style2" align="center" style="margin-top:80px">翻唱歌曲排行榜</div>
<!--1欄-->
<%
		int counter_s = 1, track_id_s;
		String track_name_s, user_nkname_s, user_id_s, track_pic_s;
		int track_count_s;
		sql="SELECT *, CHAR_LENGTH(track_name) AS track_num, LEFT(track_name,7) AS c_track_name FROM track,users WHERE sing_type = 2 AND users.user_id = track.user_id ORDER BY track_count DESC LIMIT 10";
		rs=stmt.executeQuery(sql);
			
		while(rs.next())
		{
			user_id_s = rs.getString("track.user_id");
			track_id_s = rs.getInt("track_id");
			track_name_s = rs.getString("track_name");
			user_nkname_s = rs.getString("user_nkname");
			user_id_s = rs.getString("user_id");
			track_count_s = rs.getInt("track_count");
			track_pic_s = rs.getString("track.track_pic");
			if(counter_s == 1){
			%>
				<div class='block style4' align='left' style='float:left'>
				<div align='center' class='block-num'><%=counter_s%></div>
				<div align='left' style='float:left'><p class='standingname Tabletype'><a href = "member_page_music_song.jsp?music_id=<%=track_id_s%>"><div style="border:1px solid #E5E5E5;width:50px"><img src='user/<%=user_id_s%>/music/<%=track_pic_s%>' width='50' height='50'/></div></a>
				<p class='standingname Tabletype'><strong><a href = "member_page_music_song.jsp?music_id=<%=track_id_s%>">&nbsp;<%if(rs.getInt("track_num") > 9){%><%=rs.getString("c_track_name")%>...<%}else{%><%=rs.getString("track_name")%><%}%></a></strong><br/><a href = "member_page.jsp?user=<%=user_id_s%>">&nbsp;<%=user_nkname_s%></a></p>			
				</div>
				<div style='clear:both'></div>
				</div>
			<%
				counter_s++;
			}
			else{
			%>
				<div class='block style4' align='left' style='float:left'>
				<div align='center' class='block-num'><%=counter_s%></div>
				<div align='left' style='float:left'><span class='standingname Tabletype'><strong><a href = "member_page_music_song.jsp?music_id=<%=track_id_s%>">&nbsp;<%if(rs.getInt("track_num") > 9){%><%=rs.getString("c_track_name")%>...<%}else{%><%=rs.getString("track_name")%><%}%></a></strong><br/><a href = "member_page.jsp?user=<%=user_id_s%>">&nbsp;<%=user_nkname_s%></a></span></div>
				<div style='clear:both'></div>
				</div>
			<%
				counter_s++;
			
			}
		}
%>
<div align="right" class="style4" style="width:180px"><a href="index_ranking.jsp">more</a></div>
<!--end of 灰色大框--></div>
  <!-- end #sidebar1 -->
  
  
  
  
  
  
  </div>


<div id="sidebar2" class="font10">
<!--灰色大框-->
<div class="roundedTopCorners  grayblock">
<div class="title roundedTopCorners style2" align="center">創作歌曲排行榜</div>

<!--1欄-->
<%
		int counter_c = 1, track_id_c;
		String track_name_c, user_nkname_c, user_id_c, track_pic_c;
		int track_count_c;
		sql="SELECT *, CHAR_LENGTH(track_name) AS track_num, LEFT(track_name,7) AS c_track_name FROM track,users WHERE sing_type = 1 AND users.user_id = track.user_id ORDER BY track_count DESC LIMIT 10";
		rs=stmt.executeQuery(sql);
			
		while(rs.next())
		{
			user_id_c = rs.getString("track.user_id");
			track_id_c = rs.getInt("track_id");
			track_name_c = rs.getString("track_name");
			user_nkname_c = rs.getString("user_nkname");
			user_id_c = rs.getString("user_id");
			track_count_c = rs.getInt("track_count");
			track_pic_c = rs.getString("track.track_pic");
			if(counter_c == 1){
			%>
				<div class='block style4' align='left' style='float:left'>
				<div align='center' class='block-num'><%=counter_c%></div>
				<div align='left' style='float:left'><span class='standingname Tabletype'><a href = "member_page_music_song.jsp?music_id=<%=track_id_c%>"><div style="border:1px solid #E5E5E5;width:50px"><img src='user/<%=user_id_c%>/music/<%=track_pic_c%>' width='50' height='50'/></div></a></span>
				<p class='standingname Tabletype'><strong><a href = "member_page_music_song.jsp?music_id=<%=track_id_c%>">&nbsp;<%if(rs.getInt("track_num") > 9){%><%=rs.getString("c_track_name")%>...<%}else{%><%=rs.getString("track_name")%><%}%></a></strong><br/><a href = "member_page.jsp?user=<%=user_id_c%>">&nbsp;<%=user_nkname_c%></a></p>			
				</div>
				<div style='clear:both'></div>
				</div>
			<%	
                counter_c++;
			}
			else{
			%>
				<div class='block style4' align='left' style='float:left'>
				<div align='center' class='block-num'><%=counter_c%></div>
				<div align='left' style='float:left'><span class='standingname Tabletype'><strong><a href = "member_page_music_song.jsp?music_id=<%=track_id_c%>">&nbsp;<%if(rs.getInt("track_num") > 9){%><%=rs.getString("c_track_name")%>...<%}else{%><%=rs.getString("track_name")%><%}%></a></strong><br/><a href = "member_page.jsp?user=<%=user_id_c%>">&nbsp;<%=user_nkname_c%></a></span></div>
				<div style='clear:both'></div>
				</div>
			<%	
                counter_c++;
			
			}
		}
%>
<div align="right" class="style4" style="width:180px"><a href="index_ranking.jsp">more</a></div>
<!--end of 灰色大框--></div>



<!--灰色大框-->
<div class="roundedTopCorners  grayblock">
<div class="title roundedTopCorners style2" align="center" style="margin-top:81px">會員排行榜</div>

<!--1欄-->
<%
			int counter_m = 1;
			
			String user_id_m, user_nkname_m, user_pic_m;
			int user_count_m;
			
			sql="SELECT * FROM users ORDER BY user_count DESC LIMIT 10";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				user_id_m = rs.getString("user_id");
				user_nkname_m = rs.getString("user_nkname"); 
				user_count_m = rs.getInt("user_count");
				user_pic_m = rs.getString("user_pic");
				if(counter_m == 1){
				%>
					<div class='block style4' align='left' style='float:left'>
					<div align='center' class='block-num'><%=counter_m%></div>
					<div align='left' style='float:left'><span class='standingname Tabletype'><a href = "member_page.jsp?user=<%=user_id_m%>"><div style="border:1px solid #E5E5E5;width:50px"><img src='user/<%=user_id_m%>/<%=user_pic_m%>' width='50' height='50'/></div></a></span>
					<p class='standingname Tabletype'><strong><a href = "member_page.jsp?user=<%=user_id_m%>">&nbsp;<%=user_nkname_m%></a></strong><br/></p>
					</div>
					<div style='clear:both'></div>
					</div>
				<%
                counter_m++;
				}
				else{
				%>
					<div class='block style4' align='left' style='float:left'>
					<div align='center' class='block-num'><%=counter_m%></div>
					<div align='left' style='float:left'><span class='standingname Tabletype'><strong><br/><a href =" member_page.jsp?user=<%=user_id_m%>">&nbsp;<%=user_nkname_m%></a></strong></span></div>
					<div style='clear:both'></div>
					</div>
				<%
				counter_m++;
			
			}
		}
%>
				
				
				
				
				
				
<div align="right" class="style4" style="width:180px"><a href="index_ranking.jsp">more</a></div>
<!--end of 灰色大框--></div>

<!-- end #sidebar2 --></div>
  
  
  <div id="mainContent" class="font10">
  <div class="center-title roundedTopCorners style2">最近活動</div>
  <% 
  	sql="SELECT * FROM activity_info WHERE activity_date_f > CURDATE() ORDER BY activity_date_s ASC LIMIT 1";
	Statement activity=con.createStatement();
	ResultSet last_activity=activity.executeQuery(sql);
	while(last_activity.next()){
	%>
  <div class="center-block"  align="center" style="padding-bottom:10px"><a href="index_activity_detail.jsp?id=<%=last_activity.getInt("activity_code")%>"><img src="/Ai-music/myweb/images/activity_pic/<%= last_activity.getString("activity_pic")%>" width="475" height="275" /></a>
  
  <div style="margin-top:5px">
      <table width="508" border="0" class="style4">
        <tr>
          <td class="font10"><div align="center"><a href="index_activity_detail.jsp?id=<%=last_activity.getInt("activity_code")%>"><%=last_activity.getString("activity_title")%></a></div></td>
        </tr>
      </table>
  </div>
  
   </div>
   <%
   		}
		last_activity.close();
		activity.close();
		%>
  
  <%//活動
		String activity_sql = "SELECT *, CHAR_LENGTH(activity_title) AS title_num, LEFT(activity_title,18) AS c_activity_title  FROM activity_info WHERE activity_date_f > CURDATE() ORDER BY activity_date_s ASC LIMIT 3";
		rs = stmt.executeQuery(activity_sql);//查詢SQL 該會員留言版的總筆數
		while(rs.next()){
%>
    <div class="center-block style4" align="center">
    
    
    
      <table width="508" border="0">
        <tr>
          <td width="79" rowspan="5" class="font10"><span style="margin-bottom:10px"><a href="index_activity_detail.jsp?id=<%=rs.getInt("activity_code")%>"><img src="/Ai-music/myweb/images/activity_pic/<%= rs.getString("activity_pic")%>" width="70" height="70" /></a></span></td>
          <td width="79" class="font10"><div align="center">活動名稱:</div></td>
          <td width="336" class="font10"><div align="left"><a href="index_activity_detail.jsp?id=<%=rs.getInt("activity_code")%>"><%if(rs.getInt("title_num") > 19){%><%=rs.getString("c_activity_title")%>...<%}else{%><%=rs.getString("activity_title")%><%}%></a></div></td>
        </tr>
        <tr>
        </tr>
        <tr>
          <td class="font10"><div align="center">日期:</div></td>
          <td class="font10"><div align="left"><%=rs.getDate("activity_date_s")%> ~ <%=rs.getDate("activity_date_f")%></div></td>
        </tr>
        <tr>
          <td class="font10"><div align="center">對象:</div></td>
          <td class="font10"><div align="left"><%=rs.getString("activity_target")%></div></td>
        </tr>
      </table>
    </div>
<%
	}
%>
    <div class="center-title roundedTopCorners style2" style="margin-top:30px" >隨選音樂</div>
    <div class="center-block" style="margin-bottom:30px">
    <%//隨選音樂 8筆
		Statement random=con.createStatement();
	  sql="SELECT *, CHAR_LENGTH(track_name) AS track_num, LEFT(track_name,6) AS c_track_name FROM track ORDER BY RAND() limit 8";
	  ResultSet random_music=random.executeQuery(sql);
	  while(random_music.next()){
	  	int random_track_id=random_music.getInt("track_id");
	    String random_track_pic=random_music.getString("track_pic");
		String random_track_name=random_music.getString("track_name");
		String random_user_id=random_music.getString("user_id");
	%>
    <div class="friend-block" align="center"><a href="member_page_music_song.jsp?music_id=<%=random_track_id%>"><div style="border:1px solid #E5E5E5; width:90px"><img src="user/<%=random_user_id%>/music/<%=random_track_pic%>" width="90" height="90" /></div></a><br />
      <a href="member_page_music_song.jsp?music_id=<%=random_track_id%>"><%if(random_music.getInt("track_num") > 7){%><%=random_music.getString("c_track_name")%>...<%}else{%><%=random_music.getString("track_name")%><%}%>
</a></div>
<%
		  }//random
		  random.close();
		 random_music.close();
		 
		  %>
          <!--清除-->
<div style="clear:both"></div>
    </div>
    <div class="center-title roundedTopCorners style2">最新會員</div>
    <div class="center-block">
    <%//最新會員 8筆
	  sql="SELECT * FROM users WHERE user_authority = 0 ORDER BY reg_time DESC limit 8";
	  rs=stmt.executeQuery(sql);
	  while(rs.next()){
	    String user_pic=rs.getString("user_pic");
		String newest_member=rs.getString("user_id");
		String user_nkname=rs.getString("user_nkname");
	%>
    <div class="friend-block" align="center"><a href="member_page.jsp?user=<%=newest_member%>"><div style="border:1px solid #E5E5E5;width:90px"><img src="user/<%=newest_member%>/<%=user_pic%>" width="90" height="90" /></div></a><br />
      <a href="member_page.jsp?user=<%=newest_member%>"><%=user_nkname%></a></div>
<%
		  }//rs
		  rs.close();
		  stmt.close();
		  con.close();
		  %>
          <!--清除-->
<div style="clear:both"></div>
    </div>
    
    
  <!-- end #mainContent --></div>
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

</body>
</html>
