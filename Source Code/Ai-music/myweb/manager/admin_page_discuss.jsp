<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=Big5"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>管理討論區</title>
<SCRIPT LANGUAGE = "JavaScript">
 
 function delete_check(){//刪除討論主題時的警示窗
       if(confirm("確定要刪除該筆討論主題嗎?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}
</script> 

<!--這裡用的css-->
<script src="../js/prototype.js"></script>
<script src="../js/admin_manage.js"></script>
<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
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
<body class="oneColFixCtrHdr" >
<div id="container"  align="left">
  <div class="font 10" id="mainContent" align="right">
    <%
 
       String discuss_subject=request.getParameter("discuss_subject");//從網頁址?discuss_subject=X 抓值 
       Statement subject1=con.createStatement();
	   ResultSet subject_data;
	   sql="select * from subject where subject_id='"+discuss_subject+"'";//從subject以subject_id值找到討論區類別為何
	   subject_data=subject1.executeQuery(sql);
	   while(subject_data.next()){
	     String subject_text=subject_data.getString("subject_subject");
		 int type_id=subject_data.getInt("subject_id");
		 
%>
    <!--會員標頭-->
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
    <div id="showid" class="font10 style4" align="left">
      <table width="940" border="0">
        <tr>
          <td width="481"><a href="../admin_page_member_manage.jsp">後台管理首頁</a>
              <!-- end of 會員標頭-->
              <span class="style12">&gt;</span>
          <%
            if(type_id<12)
               out.print("<a href=\"admin_page_discuss.jsp?discuss_subject=12\">討論區管理-音樂分類</a> <span class=\"style12\">&gt;</span>"+subject_text+"</td>");
		    else
               out.print("<a href=\"admin_page_discuss.jsp?discuss_subject=12\">討論區管理-地區分類</a> <span class=\"style12\">&gt;</span>"+subject_text+"</td>");			
		%>          </td>
          <td width="449" align="right">您好，<span class="style13"><%=admin_data.getString("user_nkname")%></span>，登入時間：<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
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
          <%
  if(type_id<12)
  {
    out.print("<div  class=\"font10 style2 roundedCorners\" style=\"padding-left:10px\">音樂類型-"+subject_text+"</div>");
  }
  else
  {   
   out.print("<div  class=\"font10 style2 roundedCorners\" style=\"padding-left:10px\">地區分類-"+subject_text+"</div>");
  }
  %>
        </div>
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
	sql="select COUNT(*) from title where subject_id='"+discuss_subject+"'";//!!!計算資料
    rs=stmt_page.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  sql="select * from title where subject_id='"+discuss_subject+"' ORDER BY title_time ASC";//!!!叫資料出來
	  rs=stmt_page.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
        <!-- 頁碼-->
        <div id="new-message" align="center" class="style4" style="margin-bottom:10px">
          <form action="admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>" method="POST">
            <table border=0>
              <tr>
                <td>目前頁次:<font color=red><%=ShowPage%></font>/ <font color=blue><%=PageCount%></font> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=<%=ShowPage-1%>>[上一頁]</a> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=<%=ShowPage+1%>>[下一頁]</a> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=1>[第一頁]</a> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=<%=PageCount%>>[最後一頁]</a> </td>
                <td>輸入頁次: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">		<input type="submit" name="SEND" value="送出" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
              </tr>
            </table>
          </form>
          <!-- 頁碼end-->
          
        </div>
        <div class="table-padding style4" align="left">
          <table width="642" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">
            <tbody >
              <tr  align="center" style="background-color:#DCDCDC">
                <td width="9%">No</td>
                <td width="41%" align="left" >討論主題</td>
                <td width="19%">發表會員</td>
                <td width="17%">處分</td>
              </tr>
              <%		
        Statement discuss_title=con.createStatement();
        ResultSet discuss_title_data;
	    
	
	    int count=1;
		i=0;
    	while(i<PageSize&&rs.next()){  
	    
	    String title_subject=rs.getString("title_subject");
		int title_id=rs.getInt("title_id");
        int id=rs.getInt("id");	   


        sql="select * from users where id="+id;
		Statement sttmt=con.createStatement();
        ResultSet user;
        user=sttmt.executeQuery(sql);
	    while(user.next()){
	    String user_nkname=user.getString("user_nkname");
		if(count%2==0)//偶數排 灰色
		{
		out.print("<form action=\"admin_delete_all.jsp\" method=\"post\" onsubmit=\"return delete_check()\">"); 
		out.print("<tr  style='background-color:#DCDCDC'>");
        out.print("<td height=\"45\" align=\"center\">"+count+"</td>");
        out.print("<td align=\"left\"><a href=admin_page_discuss_content.jsp?title_id="+title_id+"&discuss_subject="+discuss_subject+">"+title_subject+"</a></td>");
        out.print("<td align=\"center\"  > "+user_nkname+"</td>");		 
		out.print("<td align=\"center\"  ><input type=\"submit\" class='delete-block style4' name=\"send\" value=\"刪除\" ></td>");
		out.print("</tr>");
		out.print("<input type = \"hidden\" name = \"discuss_subject\" value="+discuss_subject+">");
	    out.print("<input type = \"hidden\" name = \"title_id\" value="+title_id+">");
		out.print("</form>");
		}
		else{//奇數排 白色
		out.print("<form action=\"admin_delete_all.jsp\" method=\"post\" onsubmit=\"return delete_check()\">");  
		out.print("<tr>");
        out.print("<td height=\"45\" align=\"center\">"+count+"</td>");
        out.print("<td align=\"left\"><a href=admin_page_discuss_content.jsp?title_id="+title_id+"&discuss_subject="+discuss_subject+">"+title_subject+"</a></td>");
        out.print("<td align=\"center\"  > "+user_nkname+"</td>");		
		out.print("<td align=\"center\"  ><input type=\"submit\" name=\"send\"  class='delete-block style4'  value=\"刪除\" ></td>");		
        out.print("</tr>");
		out.print("<input type = \"hidden\" name = \"discuss_subject\" value="+discuss_subject+">");
	    out.print("<input type = \"hidden\" name = \"title_id\" value="+title_id+">");
		out.print("</form>");
		}
		count++;
		i++;
	}//rs_page
	
	}//user
	}//title
	
	
	
	%>
            </tbody>
          </table>
        </div>
        <!--end of 包起來的padding-->
        <!--end of space-->
      </div>
      <!---------end of bigright --------->
    </div>
    <!--end of mainContent-->
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
  <!-- end #container -->
</div>

</body>
</html>
