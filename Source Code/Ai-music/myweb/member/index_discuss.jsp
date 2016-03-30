<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="../web_url.jsp"%><!--抓母頁面網址-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>討論區</title>

<%
   String user_id= (String)session.getAttribute("user_id");
%>

<!--這裡用的CSS-->
<link href="../../CSSfile/discuss-content.css" rel="stylesheet" type="text/css" />
    
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="../js/Login.js"></script>
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
	int year, month;
	String count_sql;
	try {
		year = Integer.parseInt(request.getParameter("year"));
	}
	catch(Exception e){
		year=0;
	}
	try {
		month = Integer.parseInt(request.getParameter("month"));
	}
	catch(Exception e){
		month=0;
	}
	
	
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
<div id="container">
 
<%
   
  Statement stmt=con.createStatement();
  ResultSet user;
  Statement sttmt=con.createStatement();
  ResultSet rs2;
  int num, post_id;
  String subject_subject, user_nkname;
  
  int subject_id,admin_id,i=1;
  
  sql="select * from subject where subject_type=1 order by subject_time asc";
  rs=smt.executeQuery(sql);  
  
%> 
   <div id="mainContent" class="font10">   
   <p>&nbsp;</p>
     <div style="margin-bottom:30px;width:150px;margin-top:50px;margin-left:50px" class="roundedCorners title1" align="center" >
     音樂類型
     </div>
   <div style="margin-bottom:70px" class=" style4" align="center">
     <table width="800" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">

        <tr  align="center">
          <td width="40" align="center" height="40" >編號</td>
          <td width="150" align="left" >討論群組</td>
          <td width="40" align="center">主題</td>
          <td width="40" align="center" >回覆</td>
          <td width="400" >最新發表</td>
        </tr>
<%
        while(rs.next())
        {
			subject_id=rs.getInt("subject_id");
        	subject_subject=rs.getString("subject_subject");
        	if(i%2==0)//偶數排 灰色
			{
%>
				<tr >
        		<td height="45" align="center"><%=i%></td>
				<td align="left"><a href="index_discuss_topic.jsp?subject_id=<%=rs.getInt("subject_id")%>"><%=rs.getString("subject_subject")%></a></td>
<%
				sql = "SELECT COUNT(*) as t_num FROM title WHERE subject_id = " +subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("t_num")%></td>
				<%
				}//主題篇數欄位
				sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.subject_id = "+subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("r_num")%></td>
				<%
				}//回覆篇數欄位
				sql = "SELECT *, LEFT(title_time,17) AS c_title_time FROM title, users WHERE title.id = users.id AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><span style="font-size:9px"><%=user.getString("c_title_time")%> </span>by <a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>"><%=user.getString("users.user_nkname")%></a><br><a href="index_discuss_topic_content.jsp?title_id=<%=user.getInt("title.title_id")%>"><%=user.getString("title.title_subject")%></a></td>
				<%
				}//最新發表欄位
				%>
                </tr>
                <%
			}//if
			else{//奇數排 白色
%>
				<tr bgcolor="#DCDCDC">
        		<td height="45" align="center"><%=i%></td>
				<td align="left"><a href="index_discuss_topic.jsp?subject_id=<%=rs.getInt("subject_id")%>"><%=rs.getString("subject_subject")%></a></td>
<%
				sql = "SELECT COUNT(*) as t_num FROM title WHERE subject_id = " +subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("t_num")%></td>
				<%
				}//主題篇數欄位
				sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.subject_id = "+subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("r_num")%></td>
				<%
				}//回覆篇數欄位
				sql = "SELECT *, LEFT(title_time,17) AS c_title_time FROM title, users WHERE title.id = users.id AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><span style="font-size:9px"><%=user.getString("c_title_time")%></span> by <a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>"><%=user.getString("users.user_nkname")%></a><br><a href="index_discuss_topic_content.jsp?title_id=<%=user.getInt("title.title_id")%>"><%=user.getString("title.title_subject")%></a></td>
				<%
				}//最新發表欄位
				%>
                </tr>
             	<%
			}
			i++;
		}//while
        %>
    </table>
  </div>
  
  <!--地區分類-->
    <div style="margin-bottom:30px;width:150px;margin-left:50px" class="title2 roundedCorners" align="center">
  地區分類
  </div>
  
  <div class=" style4" align="center">
    <table width="800" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">
	
      <tr  align="center">
          <td width="40" height="40" >編號</td>
          <td width="150" align="left" >討論群組</td>
          <td width="40" align="center">主題</td>
          <td width="40" align="center" >回覆</td>
          <td width="400" >最新發表</td>
        </tr>
		
      <%
	    sql="select * from subject where subject_type=2 order by subject_time asc";
        rs2=sttmt.executeQuery(sql);  
		int n=1;
        
		while(rs2.next())
        {
		subject_id=rs2.getInt("subject_id");
        subject_subject=rs2.getString("subject_subject");
        if(n%2==0)//偶數排 灰色
			{
%>
				<tr >
        		<td height="45" align="center"><%=n%></td>
				<td align="left"><a href=index_discuss_topic.jsp?subject_id=<%=rs2.getInt("subject_id")%>><%=rs2.getString("subject_subject")%></a></td>
<%
				sql = "SELECT COUNT(*) as t_num FROM title WHERE subject_id = " +subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("t_num")%></td>
				<%
				}//主題篇數欄位
				sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.subject_id = "+subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("r_num")%></td>
				<%
				}//回覆篇數欄位
				sql = "SELECT *, LEFT(title_time,17) AS c_title_time FROM title, users WHERE title.id = users.id AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><span style="font-size:9px"><%=user.getString("c_title_time")%></span> by <a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>"><%=user.getString("users.user_nkname")%></a><br><a href="index_discuss_topic_content.jsp?title_id=<%=user.getInt("title.title_id")%>"><%=user.getString("title.title_subject")%></a></td>
				<%
				}//最新發表欄位
				%>
                </tr>
                <%
        		//out.print("<input type = \"hidden\" name = \"subject_id\" value="+subject_id+">");
			}//if
			else{//奇數排 白色
%>
				<tr bgcolor="#DCDCDC">
        		<td height="45" align="center"><%=n%></td>
				<td align="left"><a href=index_discuss_topic.jsp?subject_id=<%=rs2.getInt("subject_id")%>><%=rs2.getString("subject_subject")%></a></td>
<%
				sql = "SELECT COUNT(*) as t_num FROM title WHERE subject_id = " +subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("t_num")%></td>
				<%
				}//主題篇數欄位
				sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.subject_id = "+subject_id;
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><%=user.getInt("r_num")%></td>
				<%
				}//回覆篇數欄位
				sql = "SELECT *, LEFT(title_time,17) AS c_title_time FROM title, users WHERE title.id = users.id AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
				user = stmt.executeQuery(sql);
				while(user.next()){
				%>
					<td align="center"><span style="font-size:9px"><%=user.getString("c_title_time")%></span> by <a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>"><%=user.getString("users.user_nkname")%></a><br><a href="index_discuss_topic_content.jsp?title_id=<%=user.getInt("title.title_id")%>"><%=user.getString("title.title_subject")%></a></td>
				<%
				}//最新發表欄位
				%>
                </tr>
             	<%
			}
		n++;
		}
        %>
    </table>
  </div>
  <div></div>
  <!-- end #mainContent --></div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--feedback-->
<script type="text/javascript">
function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "../feedback/feedback.jsp?user=<%=user_id%>&web_url=<%=web_url%>"})
			}
</script>

</body>
</html>
