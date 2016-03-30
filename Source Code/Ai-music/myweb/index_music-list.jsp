<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>音樂檢索</title>

<!--這裡用的CSS-->
<link href="../CSSfile/index_music-list.css" rel="stylesheet" type="text/css" />

<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="js/Login.js"></script>
<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
<!--
.style13 {font-size: 9pt}
-->
    </style>
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
        </table>
      </div>
    <%
	}
	else
	{
%>
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search"> <span class="font10 style4">請輸入搜尋字串</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style" >
                    <option value="song_name" selected="selected">歌名</option>
                    <option value="member_name">會員</option>
                </select></td>
                <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
              </tr>
            </table>
        </div>
      </form>
  </div>
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
 

  <div class="font 10" id="mainContent" align="right">
      <!--會員標頭-->
      <div id="bigleft"  align="left">
        <!--活動管理-->
        <!--討論區.地區分類-->
<div class="font10 grayblock roundedTopCorners">
          <div class="style2 roundedTopCorners  title" >音樂檢索</div>
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
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=11">節奏藍調(R&amp;B)</a></div>
        </div>
        <!--end of bigleft-->
      </div>
      <%
		int retrieve=0;
		try {
			retrieve = Integer.parseInt(request.getParameter("retrieve"));//從網頁址?retrieve=X 抓值
		}
		catch(Exception e){
			retrieve = 12;
		}
	   Statement retrieve1=con.createStatement();
	   ResultSet retrieve_data;
	   sql="select * from music_type where music_id='"+retrieve+"'";//從music_type以music_id值找到類別為何
	   retrieve_data=retrieve1.executeQuery(sql);
	   while(retrieve_data.next()){
	     String retrieve_genre=retrieve_data.getString("music_genre");
		 %>
      <!--------------------------右邊的div-------------------------->
      <div  id="bigright" class="font10 " >
      <div  id="title" align="left" class="style4 roundedCorners"  ><span class="style12">&gt;&nbsp;</span>音樂檢索-<%=retrieve_genre%></div>
      <!--分頁-->
      <%
	   
    int PageSize=8;//設定每張網頁顯示的筆數
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
	 //是地區還是音樂類型
	 if(retrieve==12){
	 	sql="select COUNT(*) from track where track_language_id=1 OR track_language_id=2 OR track_language_id=3 ";
	 }else if(retrieve==13){
	 	sql="select COUNT(*) from track where track_language_id=6 ";
	 }else if(retrieve==14){
	 	sql="select COUNT(*) from track where track_language_id=5";
	 }else if(retrieve==15){
	 	sql="select COUNT(*) from track where track_language_id=7 OR track_language_id=8 ";
	 }else{
	 	sql="select COUNT(*) from track_type where music_id='"+retrieve+"'";
	 }
    rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    //rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  //是地區還是音樂類型
	 if(retrieve==12){
	 	sql="select * from track where track_language_id=1 OR track_language_id=2 OR track_language_id=3 ";
	 }else if(retrieve==13){
	 	sql="select * from track where track_language_id=6";
	 }else if(retrieve==14){
	 	sql="select * from track where track_language_id=5";
	 }else if(retrieve==15){
	 	sql="select * from track where track_language_id=7 OR track_language_id=8";
	 }
	 else{
	  	sql="select * from track_type where music_id='"+retrieve+"'";
	 }
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%> 
 <!-- 頁碼-->
    <div id="new-message" class="style4" align="center">

    <form action="index_music-list.jsp?retrieve=<%=retrieve%>" method="POST">
     <p>共有<font color="#0066FF"><b><%=RowCount%></b></font>筆檢索資料</p>
     <table border=0>
   <tr>
       <td>目前頁次:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=1>[第一頁]</a>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
		<td>輸入頁次: <input type="text" size=3 name="ToPage" id="page_text" class="input-style-type">		</td>
		
		<td><input type="submit" name="SEND" value="送出" onclick="return check_page()" class="input-style style4">		</td>
	</tr>
	</table>
 </form> 
  <div id="bigright-inner" >  
<!-- 頁碼end--></div> 
       <%
		i=0;
    while(i<PageSize&&rs.next()){   
		
		 int track_id=rs.getInt("track_id");//抓音樂編號
		 		
		 Statement track_type=con.createStatement();
		 ResultSet track_data;
		 if(retrieve==12||retrieve==13||retrieve==14||retrieve==15){//如果是地區分類
			sql="SELECT * FROM track,users,language_type WHERE track.track_language_id=language_type.language_id AND track.user_id=users.user_id AND track.track_id="+track_id;
			track_data=track_type.executeQuery(sql);
			 while(track_data.next()){//track_data 地區分類
		 	   String user_id1=track_data.getString("track.user_id");
			   String user_nkname1=track_data.getString("users.user_nkname");
			   String track_name=track_data.getString("track.track_name");
		   	   String track_pic=track_data.getString("track.track_pic");
			   String language=track_data.getString("language_type.language_variety");
			   %>
               <!--音樂檢索-->
      		<div class="song-block" align="left" style="float:left">
      		<div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><img src="user/<%=user_id1%>/music/<%=track_pic%>" alt="" width="75" height="75"/></a></div>
        	<div  align="left" class="style4 detail-block" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>">曲目:<%=track_name%></a></div>
            <div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=user_id1%>">會員:<%=user_nkname1%></a></div>
      		<%
			if(retrieve==15){//if 檢索其他地區 
				int track_language_id=track_data.getInt("track.track_language_id");
				if(track_language_id==7){//if(track_language_id==7) 如果是其他語言 顯示語言文字
					String other_text=track_data.getString("track.track_language_other");
			%>
					<div  align="left" class="style4 detail-block" >其他語言:<font color="#FF0000"><strong><%=other_text%></strong></font></div>
			<%	}else{//否則顯示未定義%>
				<div  align="left" class="style4 detail-block" >歌曲語言:<font color="#FF0000"><strong><%=language%></strong></font></div>					
			<%	}//否則顯示未定義 end
			}//if 檢索其他地區  end
		    else{//檢索retrieve==12 13 14 
		    %>
        	<div  align="left" class="style4 detail-block" >歌曲語言:<font color="#FF0000"><strong><%=language%></strong></font></div>
            <%	}//檢索retrieve==12 13 14  end%>
		  	<div  align="right" class="style4 detail-block" ><span class="style12 style9">&gt;&nbsp;</span><strong><a href="member_page_music_song.jsp?music_id=<%=track_id%>" class="style13">點此播放</a></strong></div>
   		</div><!--音樂檢索 end-->
        <%}//track_data 地區分類 end
		  }else{//如果是地區分類 end 音樂類型分類else
		 sql="select * from track,users where track.user_id=users.user_id AND track.track_id='"+track_id+"' order by track_time DESC";//從音樂編號抓會員帳號和音樂名稱
		 track_data=track_type.executeQuery(sql);
		 	while(track_data.next()){
		 	   String user_id1=track_data.getString("track.user_id");
			   String user_nkname1=track_data.getString("users.user_nkname");
			   String track_name=track_data.getString("track.track_name");
		   	   String track_pic=track_data.getString("track.track_pic");
		 %>
           <!--音樂檢索-->
      		<div class="song-block" align="left" style="float:left">
       		<div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><img src="user/<%=user_id1%>/music/<%=track_pic%>" alt="" width="75" height="75"/></a></div>
        	<div  align="left" class="style4 detail-block" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>">曲目:<%=track_name%></a></div>
            <div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=user_id1%>">會員:<%=user_nkname1%></a></div>
        	<div  align="left" class="style4 detail-block" >音樂類型:<font color="#FF0000"><strong><%=retrieve_genre%></strong></font></div>
      		<div  align="right" class="style4 detail-block" ><span class="style12 style9">&gt;&nbsp;</span><strong><a href="member_page_music_song.jsp?music_id=<%=track_id%>" class="style13">點此播放</a></strong></div>
      
   		</div><!--音樂檢索 end-->
      

      <%
	  	  }// track_data else end
	    }//音樂類型分類 end
		track_data.close();
		track_type.close();
		i++;
		}//rs
		rs.close();
		}//retrieve
		retrieve_data.close();
		retrieve1.close();
		stmt.close();
		con.close();
	  %>
      </div>  
        
      <!--------------------------好友end---------------------------------->
      </div><!-------------------------右邊inner div end--------------------------------->
  </div>
  <!-------------------------右邊div end--------------------------------->
    

  
  <!-- footer -->
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
