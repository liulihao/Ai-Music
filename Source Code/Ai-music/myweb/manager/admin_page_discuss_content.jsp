<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=Big5"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>管理討論區</title>
<!--這裡用的css-->

<SCRIPT LANGUAGE = "JavaScript">
function delete_check(){//刪除意見時的警示窗
       if(confirm("確定要刪除該筆意見嗎?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}
 
function delete_topic_check(){//刪除討論主題時的警示窗
       if(confirm("確定要刪除該筆討論主題嗎?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}
</script> 

<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

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
<script src="../js/prototype.js"></script>
<script src="../js/admin_manage.js"></script>

<style type="text/css">
<!--
.style13 {color: #FF0000}
-->
</style>

<link href="../../CSSfile/admin_page_discuss-manage.css" rel="stylesheet" type="text/css" />

</head>
<% //後台管理者資料
 
 String login_user=(String)session.getAttribute("user_id");
 Statement admin = con.createStatement();
 String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
 ResultSet admin_data = admin.executeQuery(admin_sql);

 %>
<body class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><img src="../../music3.jpg" width="320" />
      <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>管理者您好</div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="../logout.jsp"><img src="../../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
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
  <!-- end #header -->
</div>

<div id="container"  align="left">
  <div class="font 10" id="mainContent" align="right">

 <%
 int title_id=0,reply_id=0,count=1;
  if(request.getParameter("title_id") == null)
  {
  }
  else
  {
	title_id = Integer.parseInt(request.getParameter("title_id"));
	
  }
  
   String discuss_subject=request.getParameter("discuss_subject");
   //out.print("discuss_subject="+discuss_subject);
  
  Statement stmt_title=con.createStatement();
  ResultSet rs_title;
  int subject_id=0;
  
  sql="select * from title where title_id="+title_id;
  rs_title=stmt_title.executeQuery(sql);
   while(rs_title.next())
  {  
    subject_id=rs_title.getInt("subject_id");
	}
	
	
  Statement stmt_subject=con.createStatement();
  ResultSet rs_subject;
  String subject_name;
  sql="select * from subject where subject_id="+subject_id;
  rs_subject=stmt_subject.executeQuery(sql);
	while(rs_subject.next())
  {  
    subject_name=rs_subject.getString("subject_subject");
	//out.print("subject_name="+subject_name);  
	
  %>
  <%
	while(admin_data.next()){
		int authority=admin_data.getInt("user_authority");
		if(authority==0){//if
			out.print("<script language='javascript'>");
			out.print("window.alert('你沒有權限進入後台');");
			out.print("location.href = 'index.jsp';");
			out.print("</script>");
			
		}
		else{//else
	%> 
  

<!--會員標頭-->
<div id="showid" class="style4 font10" align="left">
  <table width="940" border="0">
    <tr>
      <td width="520"><a href="../admin_page_member_manage.jsp">後台管理首頁</a>
        <span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=12">討論區管理-音樂類型</a> <span class="style12">&gt;</span><a href="admin_page_discuss.jsp?discuss_subject=<%=subject_id%>"><%=subject_name%></a><span class="style12"> &gt;</span> 討論主題</td>
      <td width="410" align="right">您好，<span class="style13"><%=admin_data.getString("user_nkname")%></span>，登入時間：<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
</div>
<%	}//else
	}//admin_data
	admin_data.close();
	admin.close();
%>



<!---------------------bigleft--------------------->

<!--會員管理-->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >會員管理</div>
        <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="../admin_page_member_manage.jsp">會員資料</a></div>
        <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="../admin_page_member-feedback.jsp">會員檢舉</a></div>
      </div>
      <!--活動管理-->
      <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
        <div class="style2 roundedTopCorners  title" >活動管理</div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="../admin_page_activity_post.jsp">活動發表</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="../admin_page_manage_activity.jsp">活動管理</a></div>
      </div>
   <!--討論區.地區分類-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners title" >討論區管理</div>
    <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">地區分類</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=12">華語音樂</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=13">東洋音樂</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=14">西洋音樂</a></a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=15">其他音樂</a></div>
    <!--討論區管理.音樂類型-->
        <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">音樂類型</div>
	<div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=1">搖滾(Rock)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=2">流行(Pop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=3">電子(Electronic)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=4">金屬(Metal)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=5">嘻哈(HipHop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=6">爵士(Jazz)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=7">鄉村(Country)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=8">民謠(Folk)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=9">古典(Classical)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=10">舞曲(Dance)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=11">節奏藍調(R&amp;B)</a></div>
        </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->
<div  id="bigright" class="font10 block-bigright roundedCorners" align="left">

 <!--裝飾用的空白-->
 <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
 <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
<!--end of 裝飾用的空白-->

<div class="space">
  <div id="activity-title">
    <div  class="font10 style2 roundedCorners" style="padding-left:10px">音樂分類-<%=subject_name%></div>
  </div>
  <%
  }
  Statement stmt=con.createStatement();
  ResultSet user;
  Statement sttmt=con.createStatement();
  ResultSet rs2;
  
  
   String title_subject,title_content,title_time,user_pic;
   String reply_content,reply_time;
   String user_nkname,user_city;;
   int id,user_age;
  
   sql="select * from title,users where users.id = title.id AND title_id="+title_id;
   rs=smt.executeQuery(sql);
   
    while(rs.next())
   {  
   	 	title_id=rs.getInt("title_id");
		title_subject=rs.getString("title_subject");
		title_content=rs.getString("title_content");
		title_time=rs.getString("title_time");
		id=rs.getInt("id");
		user_pic=rs.getString("users.user_pic");
		String title_pic=rs.getString("title_pic");

	 	sql="SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where id='"+id+"'";
     	user=stmt.executeQuery(sql);
	 		while(user.next()){
	 			user_nkname=user.getString("user_nkname");
			    user_age=user.getInt("user_age");
			    user_city=user.getString("user_city");
			    user_pic=rs.getString("user_pic");
		        String user_id=user.getString("user_id"); 
	 %>
     <div align='left' style="margin-left:10px"><strong>討論主題:</strong><%=title_subject%></div>
     <div class="style4" align="right" style="margin-right:10px"> <a href="admin_page_discuss.jsp?discuss_subject=<%=subject_id%>">回上一頁</a></div>
     <div class="table-padding style4" align="left" style="margin:20px 0px;">
     <form action="admin_delete_all.jsp" method="post" onsubmit="return delete_topic_check()">
      <table width="642" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="border:1px dashed #5F5F5F">
  	   <tr  align="center" >
	       <td style="border-bottom:1px dashed #5F5F5F">發表人</td>
     	   <td width="417" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F">內容</td>
      	   <td width="44" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F;"><input type="submit" name="send" class='delete-block style4' style="margin:2px" value="刪除" ></td>
       </tr>
       <tr>
     		<td align="center"><div style="margin:10px 0px"><img src='../user/<%=user_id%>/<%=user_pic%>' alt="" width="90" height="90" /></div></td>
      		<td colspan="2" rowspan="3" style="border-left:1px dashed #5C5C5C;  padding-left:10px;" ><%=title_content%></br><img src='../user/<%=user_id%>/discuss/<%=title_pic%>' alt="" width="200" height="200" /></td>
       </tr>
       <tr>
      		<td  align="center"><%=user_nkname%></td>
            </tr>
       <tr>
      		<td ></td>
      		</tr>
      </table>
      <input type = "hidden" name = "discuss_subject" value="<%=subject_id%>">
	  <input type = "hidden" name = "title_id" value="<%=title_id%>">
	  </form>
	   </div>
       <!--回覆的人和內容-->
    <div align="center" class="style4"><h1>回覆內容</h1></div>
      <%
	  	}//user.next()
	  }//rs.next()

    //討論區列表頁碼
    Statement stmt_page=con.createStatement();

    int PageSize=5;//設定每張網頁顯示的筆數
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
	sql="select COUNT(*) from reply where title_id='"+title_id+"'";//!!!計算資料
    rs=stmt_page.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  sql="select * from reply,users where users.id = reply.id AND title_id='"+title_id+"' ORDER BY reply_time ASC";//!!!叫資料出來
	  rs=stmt_page.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
  
	 i=0;
	 int num=1;
   while(i<PageSize&&rs.next()){ 
   
	 num=4*(ShowPage-1)+count;
	  out.print("<div class=\"table-padding style4\" align=\"left\" style=\"margin:20px 0px;\">");
      out.print("<table width=\"642\" cellpadding=\"4\" cellspacing=\"1\" bgcolor=\"#FFFFFF\" style=\"border:1px dashed #5F5F5F\" >");
      out.print("<tbody >");
      out.print("<tr  align=\"center\" >");
	  
      reply_id=rs.getInt("reply_id");
	  reply_content=rs.getString("reply_content");
	  reply_time=rs.getString("reply_time");
	  String reply_pic=rs.getString("reply_pic");
	  id=rs.getInt("id");
	  user_pic=rs.getString("users.user_pic");
	  sql="SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where id='"+id+"'";
      user=stmt.executeQuery(sql);
	  while(user.next()){
	 	 user_nkname=user.getString("user_nkname");
     	 String user_id=user.getString("user_id");  
     	 user_age=user.getInt("user_age");
     	 user_city=user.getString("user_city");
	 	 out.print("<form action=\"admin_delete_reply.jsp\" method=\"post\" onsubmit=\"return delete_check()\">"); 
	 	 out.print(" <td colspan=\"2\" style=\"border-bottom:1px dashed #5F5F5F\">發表人</td>");
     	 out.print("<td width=\"417\" style=\"border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F\">內容</td>");
    	  out.print("<td width=\"44\" style=\"border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F;\"><input type=\"submit\" name=\"send\" class='delete-block style4' style=\"margin:2px\" value=\"刪除\" ></td>");
     	 out.print("</tr>");
     	 out.print("<tr>");
     	 out.print("<td colspan=\"2\" align=\"center\"><div style=\"margin:10px 0px\"><img src='../user/"+user_id+"/"+user_pic+"' alt=\"\" width=\"90\" height=\"90\" /></div></td>");
     	 out.print("<td colspan=\"2\" rowspan=\"3\" style=\"border-left:1px dashed #5C5C5C; padding-left:10px;\" >"+reply_content+"<img src='../user/"+user_id+"/discuss/"+reply_pic+"' alt=\"\" width=\"200\" height=\"200\" /></td>");
     	 out.print("</tr>");
     	 out.print("<tr>");
      	//out.print("<td width=\"71\"  align=\"right\">Name:</td>");
     	 out.print("<td width=\"71\" align=\"left\">"+user_nkname+"</td>");
     	 out.print("</tr>");
    	  out.print("<tr>");
     	 out.print("<td width=\"45\">#"+num+"</td>");
     	 out.print("</tr>");
     	 out.print("</tbody>");
     	 out.print("</table>");
     	 out.print("</div>");
	  
	 	 out.print("<input type = \"hidden\" name = \"title_id\" value="+title_id+">");
	  	 out.print("<input type = \"hidden\" name = \"reply_id\" value="+reply_id+">");
	  	 out.print("</form>");

	  count++;
	  	i++;
	  }//user.next()
	  }//rs.next()
	  
  %>
        <!-- 頁碼-->
    <div id="new-message" align="center" class="style4">

	<form action="admin_page_discuss_content.jsp?title_id=<%=title_id%>" method="POST">
     <table border=0>
   <tr>
       <td>目前頁次:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=admin_page_discuss_content.jsp?title_id=<%=title_id%>&ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
		<td> <a href=admin_page_discuss_content.jsp?title_id=<%=title_id%>&ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
		<td> <a href=admin_page_discuss_content.jsp?title_id=<%=title_id%>&ToPage=1>[第一頁]</a>		</td>
		
		<td> <a href=admin_page_discuss_content.jsp?title_id=<%=title_id%>&ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
		<td>輸入頁次:  <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">		<input type="submit" name="SEND" value="送出" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
	</tr>
	</table>
 </form> 
    
<!-- 頁碼end--></div>

    <!--end of space--></div>

<!---------end of bigright ---------></div>
<!--end of mainContent--></div>
  
  
  
  
  
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


</body>
</html>
