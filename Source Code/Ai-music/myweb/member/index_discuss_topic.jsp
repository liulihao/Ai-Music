<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="../web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>討論區</title>

<!--這裡用的CSS-->
<link href="../../CSSfile/discuss-content.css" rel="stylesheet" type="text/css" />    
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="../js/Login.js"></script>
<script src="../js/discuss.js"></script>
<script type="text/javascript" src="../js/prototype.js"> </script>
<script type="text/javascript" src="../js/index.js"> </script>

<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>

<!--jump window-->
<script type="text/javascript" src="../box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="../box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="../box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="../box sample1/javascripts/debug.js"> </script>
	<link href="../box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="../box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="../box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
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
  <div style="padding-left:30px" align="left"><a href="../index.jsp"><img src="../../music3.jpg" width="320" /></a>
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
	<div class="font10" style="position:absolute; left: 790px; top: 33px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../../images/mail.png" alt="" width="40" height="40" /></a></div>
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="../member_page.jsp"><img src="../../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="../member_manage.jsp"><img src="../../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="../logout.jsp"><img src="../../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
    <%
	}
%>
      <form action="../search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
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
        <td width="196" align="center" ><a href="../index.jsp">首頁</a></td>
        <td width="196" align="center" ><a href="../member/index_discuss.jsp">討論區</a></td>
        <td width="196" align="center" ><a href="../index_activity.jsp">網站活動</a></td>
        <td width="196" align="center" ><a href="../index_music-list.jsp">音樂檢索</a></td>
        <td width="196" align="center" ><a href="../index_ranking.jsp">排行榜</a></td>
      </tr>
    </table>
  </div>
</div>
<div id="container" style="padding-top:5px">

<%
	 int subject_id=0,title_id=0;
    
	      subject_id = Integer.parseInt(request.getParameter("subject_id"));
 
      Statement stmt=con.createStatement();
      ResultSet user;

	  Statement sttmt=con.createStatement();
      ResultSet rs2;
      
      String title_subject,title_time,user_nkname;
      int id,count=1; 
	  
	  sql="select * from title where subject_id="+subject_id;
      rs=smt.executeQuery(sql);
	  sql="select * from subject where subject_id="+subject_id;
      rs2=sttmt.executeQuery(sql);
	  while(rs2.next())
      {
        String subject_subject=rs2.getString("subject_subject");
	    int subject_type=rs2.getInt("subject_type");
  
  
  out.print("<div id=\"mainContent2\" class=\"font10 style4\">");
  out.print("<div style=\"margin-bottom:0px\">");
  if(subject_type==1){ 
  out.print("<div style=\"margin-bottom:30px\">");
  out.print("<a href=\"index_discuss.jsp\">音樂類型</a><span class=\"style12\"> &gt; </span><a href=index_discuss_topic.jsp?subject_id="+subject_id+">"+subject_subject+"</a>");
  }
  else{
  out.print("<div style=\"margin-bottom:30px\">");
  out.print("<a href=\"index_discuss.jsp\">地區分類</a><span class=\"style12\"> &gt; </span><a href=index_discuss_topic.jsp?subject_id="+subject_id+">"+subject_subject+"</a>");
  }
 }
%>
<%
  
  if(login_user==null){//if
  	out.print("<font color='red'>登入後才能發表主題</font>");
	}//if
	else{
%>  
	<div class="outfriend">
      <div class="infriend link" align="center"><a href='#' onClick='discuss_post();'>新增主題</a></div>
      </div>
<%
}
%>
 
 <%
 
    //討論區列表頁碼
    Statement stmt_page=con.createStatement();
   
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
	sql="select COUNT(*) from title where subject_id='"+subject_id+"'";//!!!計算資料
    rs=stmt_page.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  sql="SELECT * FROM title WHERE subject_id='"+subject_id+"' ORDER BY title_time DESC";//!!!叫資料出來
	  rs=stmt_page.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
      
<!-- 頁碼-->
    <div id="new-message" align="left" class="font10" style="margin-top:10px">

	<form action="index_discuss_topic.jsp?subject_id=<%=subject_id%>" method="POST">
     <table border="0" class="style4">
   <tr>
       <td>目前頁次:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=1>[第一頁]</a>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
		<td>輸入頁次: <input type="text" id="page_text" size=3 name="ToPage" class="input-style-type">		</td>
		<td><input type="submit" name="SEND" value="送出" class="input-style style4" onclick="return check_page()">		</td>
	</tr>
	</table>
 </form> 

<!-- 頁碼end--></div>
<%
		     
            //放要叫出來的東西們和程式碼
			
%>
  
<table width="880" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="margin-top:30px">
 
	
    <tbody >
      <tr  align="center" bgcolor="#DCDCDC">
        <td width="40" height="45" >編號</td>
        <td width="380"  align="left" >主題</td>
        <td width="40">回覆</td>
        <td width="200">作者</td>
        <td width="200" >最新回覆</td>
      </tr>

   
 <% 
      	i=0;
      while(i<PageSize&&rs.next()){
           title_id=rs.getInt("title_id");
	       title_subject=rs.getString("title_subject");
	       title_time=rs.getString("title_time");
	       id=rs.getInt("id");
		if(count%2==0)//偶數排 灰色
		{
%>
    	  	<tr bgcolor="#DCDCDC">
    		<td height="45" align="center"><%=count%></td>
			<td align="left"><a href="index_discuss_topic_content.jsp?title_id=<%=title_id%>"><%=title_subject%></a></td>
            <%
	 		sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.title_id = '" +title_id+ "'AND title.subject_id = "+subject_id;
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><%=user.getInt("r_num")%></td>
			<%
			}//回覆篇數欄位
			sql = "SELECT * FROM title, users WHERE title.id = users.id AND title.title_id = "+title_id+" AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("title.title_time")%></span></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//最後發表欄位
			sql = "SELECT * FROM reply, users, title WHERE reply.title_id = "+title_id+" AND title.subject_id = "+subject_id+" AND reply.id = users.id ORDER BY reply.reply_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("reply.reply_time")%></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//最新回覆欄位
		}//if
		else{//奇數排 白色
			%>
	  		<tr>
      		<td height="45" align="center"><%=count%></td>
			<td align="left"><a href="index_discuss_topic_content.jsp?title_id=<%=title_id%>"><%=title_subject%></a></td>
            <%
	 		sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.title_id = '" +title_id+ "'AND title.subject_id = "+subject_id;
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><%=user.getInt("r_num")%></td>
			<%
			}//回覆篇數欄位
			sql = "SELECT * FROM title, users WHERE title.id = users.id AND title.title_id = "+title_id+" AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("title.title_time")%></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//最後發表欄位
			sql = "SELECT * FROM reply, users, title WHERE reply.title_id = "+title_id+" AND title.subject_id = "+subject_id+" AND reply.id = users.id ORDER BY reply.reply_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("reply.reply_time")%></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//最新回覆欄位
		}
		count++;
		i++;
	}//rs_page
	rs.close();
		stmt_page.close();
%>
  </table></div>
  


</div>

  <p>
    <!-- end #mainContent -->
    </div>
  </p>
  <p>&nbsp;</p>
<!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--回覆主題的彈跳視窗-->
<script type="text/javascript">

function discuss_post() {
    Dialog.confirm("1",{className: "alphacube", width:500 ,height:400,closable:true,url: "replysubject.jsp?subject_id=<%=subject_id%>"})
  }

function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "../feedback/feedback.jsp?user=<%=login_user%>&web_url=<%=web_url%>"})
			}
</script>

</body>
</html>
