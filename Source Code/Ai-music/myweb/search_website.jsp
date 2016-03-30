<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />


<!--這裡用的CSS-->

<link href="../CSSfile/index_search.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>
<script src="js/Login.js"></script
><!--jump window-->
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
<div id="header">
<div style="padding-left:30px" align="left"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
<%
	String login_user=(String)session.getAttribute("user_id");
	String search_text;
	String search_type;
	try{
		search_text = new String(request.getParameter("search_text").getBytes("ISO8859_1"));
		search_type = new String(request.getParameter("search_type").getBytes("ISO8859_1"));
	}
	catch(Exception e){
		search_text="";
		search_type="song_name";
	}
	
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
   <div id="search" class="info_search" style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"> 
   
    <span class="font10 style4">請輸入搜尋字串</span>
    
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style">
          <option value="song_name" selected>歌名</option>
          <option value="member_name">會員</option>
          </select></td>        
        <td width="82"><input type="submit" value="搜尋" class="font10 search-style"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
  <div class="font10  manubar  link" >
    <!-- end #header  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 386px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 777px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 582px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px;; background:#E5E5E5; left: 189px; top: 13px;"></div>-->
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
<%
	
	String st = "";
	if(search_type.equals("song_name")){
		st = "歌曲";
	}
	else
		st = "會員";
%>  
<title><%=st%>搜尋</title>
  <div id="mainContent" class="font10">
<div class="center-title roundedCorners  style2"  align="center"><%=st%>搜尋</div>


<!--分頁放這裡-->
<!--end of 分頁-->

<%	
	//搜歌曲
	if(search_type.equals("song_name")){//if
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
		 sql="select COUNT(*) FROM track,users WHERE track.track_name LIKE '%"+search_text+"%' AND track.user_id=users.user_id";//!!!計算資料
 		 rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
		 rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
		  RowCount=rs.getInt(1); //取得記錄筆數    
   		 rs.close();
		PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
		 if(ShowPage>PageCount){
		    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
		  }
	  sql="SELECT * FROM track,users WHERE track.track_name LIKE '%"+search_text+"%' AND track.user_id=users.user_id";//!!!叫資料出來
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;
      for(j=0;j<i;j++)   
	  rs.next();
%>
	<!-- 頁碼-->
  	  <div id="new-message" align="center" class="style4">

 	   
  	  <form action="search_website.jsp" method="POST">
 	    <p>共有<font color="#0066FF"><b><%=RowCount%></b></font>筆搜尋結果</p>
     <table border=0>
  			 <tr>
   			   <td>目前頁次:<font color=red><%=ShowPage%></font>/
         		  <font color=blue><%=PageCount%></font>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=1>[第一頁]</a>		</td>
		
					<td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
					
				</tr>
			</table>
		 </form> 
    
<!-- 頁碼end--></div>
<div align="center" style="padding:0 25px"><!--包song_padding-->
<%			i=0;
    		while(i<PageSize&&rs.next()){
			%>
            
	<div class="song-block" align="left" style="float:left"><!--song-block-->
        <div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=rs.getString("track.track_id")%>"><img src="user/<%=rs.getString("users.user_id")%>/music/<%=rs.getString("track.track_pic")%>" width="80" height="80" /></a></div><!--pic-block-->
        <div  align="left" class="style4 detail-block"><a href="member_page_music_song.jsp?music_id=<%=rs.getString("track.track_id")%>">曲目：<b><font color="#FF0000"><%=rs.getString("track.track_name")%></font></b></a></div>
        <div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=rs.getString("users.user_id")%>">會員：<%=rs.getString("users.user_nkname")%></a></div>
        <div  align="left" class="style4 detail-block">上傳時間：<%=rs.getDate("track.track_time")%></div>
    </div><!--song-block-->
    
<%		i++;
		}//rs1
		%>
</div><!--end of 包song_padding-->
<%	}//if
	
	//搜會員
	else{//else
	Statement song=con.createStatement();//抓會員空間的會員資料
	ResultSet song_data;
	
	
		int PageSize=15;//設定每張網頁顯示的筆數
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
		 sql="select COUNT(*) from users where user_nkname like'%"+search_text+"%' or user_id like '%"+search_text+"%' AND user_authority = 0";//!!!計算資料
 		 song_data=song.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
		 song_data.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
		  RowCount=song_data.getInt(1); //取得記錄筆數    
   		 song_data.close();
		PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
		 if(ShowPage>PageCount){
		    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
		  }
	  sql="select * from users where user_nkname like'%"+search_text+"%' or user_id like '%"+search_text+"%' AND user_authority = 0";//!!!叫資料出來
	  song_data=song.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int x,y;//設定一頁顯示的紀錄筆數
	  x=(ShowPage-1)*PageSize;
      for(y=0;y<x;y++)   
	  song_data.next();
%>
	<!-- 頁碼-->
  	  <div id="new-message" align="center" class="style4">

 	   
  	  <form action="search_website.jsp" method="POST">
 	    <p>共有<font color="#0066FF"><b><%=RowCount%></b></font>筆搜尋結果</p>
 	    <table border=0>
  			 <tr>
     			  <td>目前頁次:<font color=red><%=ShowPage%></font>/
         		  <font color=blue><%=PageCount%></font>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=1>[第一頁]</a>		</td>
		
					<td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
					
		  </tr>
		</table>
	    </form> 
    
<!-- 頁碼end--></div>
<%
			x=0;
    		while(x<PageSize&&song_data.next()){//song_data
			%>
	<div class="member-block" align="left" style="float:left"><!--song-block-->
			<div class="pic-block" align="center" ><a href="member_page.jsp?user=<%=song_data.getString("users.user_id")%>"><img src="user/<%=song_data.getString("users.user_id")%>/<%=song_data.getString("users.user_pic")%>" width="60" height="60" /></a></div><!--pic-block-->
      		<div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=song_data.getString("users.user_id")%>">暱稱:<%=song_data.getString("users.user_nkname")%></a></div>
       		<div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=song_data.getString("users.user_id")%>">帳號:<%=song_data.getString("users.user_id")%></a></div>
    <div  align="left" class="style4 detail-block"><span class="style12 style9">&nbsp;</strong></span></div><!--pic-block-->
     	</div><!--song-block-->
<% 		x++;
		}//song_data
	}//else
	
%>
	      <div style="clear:both"></div>
    
    <!-- end #mainContent -->
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--登入的彈跳視窗-->


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
