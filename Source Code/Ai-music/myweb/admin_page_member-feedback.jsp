<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>會員檢舉</title>
<!--這裡用的css-->
<link href="../CSSfile/admin_page_member-feedback.css" rel="stylesheet" type="text/css" />
<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

<script src="js/prototype.js"></script>
<script src="js/admin_manage.js"></script>

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

function openMail(id){<!--打開寄郵子視窗-->
	window.open("feedback_mail.jsp?f_id="+id,"發送信件","modal=yes,left=480, top=480,toolbar=no,location=0,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=450,height=350")
}
</script>


</head>
<% //後台管理者資料
	String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
	Statement admin=con.createStatement();
	String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
	ResultSet admin_data = admin.executeQuery(admin_sql);
%>
<body class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><img src="../music3.jpg" width="320" />
      <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>管理者您好</div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
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
  <!-- end #header -->
</div>
<div id="container"  align="left">
<p>&nbsp;</p>
<div class="font 10" id="mainContent" align="right">
<div id="showid" class="font10 style4" align="left">
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
	
  <table width="940" border="0">
    <tr>
      <td width="385"><a href="admin_page_member_manage.jsp">後台管理首頁</a>
          <!-- end of 會員標頭-->
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss-manage.jsp">會員管理
            <!-- end of 會員標頭-->
          <span class="style12">&gt;</span> 會員資料</a> </td>
      <td width="545" align="right">您好，<span class="style13"><%=admin_data.getString("user_nkname")%></span>，登入時間：<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
<%
	
%>
</div>
<!---------------------bigleft--------------------->

<!--會員管理-->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >會員管理</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="admin_page_member_manage.jsp">會員資料</a></div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="admin_page_member-feedback.jsp">會員檢舉</a></div>
  </div>
  <!--活動管理-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners  title" >活動管理</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_activity_post.jsp">活動發表</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp">活動管理</a></div>
  </div>
  <!--討論區.地區分類-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners title" >討論區管理</div>
    <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">地區分類</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=12">華語音樂</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=13">東洋音樂</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=14">西洋音樂</a></a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=15">其他音樂</a></div>
    <!--討論區管理.音樂類型-->
        <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">音樂類型</div>
	<div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=1">搖滾(Rock)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=2">流行(Pop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=3">電子(Electronic)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=4">金屬(Metal)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=5">嘻哈(HipHop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=6">爵士(Jazz)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=7">鄉村(Country)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=8">民謠(Folk)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=9">古典(Classical)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=10">舞曲(Dance)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=11">節奏藍調(R&amp;B)</a></div>
        </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->

<div  id="bigright" class="font10 block-bigright roundedCorners" align="left">

 <!--裝飾用的空白-->
 <div style="position:absolute; background:#FFFFFF; left: 668px; top: 20px; width:8px; height:20px"></div>
 <div style="position:absolute; background:#FFFFFF; left: 651px; top: 20px; width:8px; height:20px"></div>
<!--end of 裝飾用的空白-->

<div class="space">
  
  <div id="activity-title">
    <div  class="font10 style2 roundedCorners" style="padding-left:10px">會員檢舉</div>
  </div>
    <%//檢舉列表頁碼
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
	 sql="select COUNT(*) from feedback";
    rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//計算顯示的頁數
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//判斷指定頁面是否大於總頁數 是則設定顯示最後一頁
	  }
	  sql="select * from feedback order by f_time DESC";
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	  int i,j;//設定一頁顯示的紀錄筆數
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>      
<!-- 頁碼-->
    <div id="new-message" align="center" class="style4">


    <form action="admin_page_member-feedback.jsp" method="POST">
     <table border=0>
   <tr>
       <td>目前頁次:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=<%=ShowPage-1%>>[上一頁]</a>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=<%=ShowPage+1%>>[下一頁]</a>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=1>[第一頁]</a>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=<%=PageCount%>>[最後一頁]</a>		</td>
		
		<td>輸入頁次: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">		<input type="submit" name="SEND" value="送出" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
	</tr>
	</table>
 </form> 
    
<!-- 頁碼end--></div>
<%
	i=0;
	int num=PageSize*(PageCount-1)+1;
	while(i<PageSize&&rs.next()){ 
		String f_user_id=rs.getString("post_id");
		
		Statement user=con.createStatement();
		String user_sql = "SELECT * FROM users WHERE user_id = '"+f_user_id+"'";
		ResultSet user_data = user.executeQuery(user_sql);
		
%>
      <div class="table-padding style4" align="left">
      <table width="642" >
        <tr><%while(user_data.next()){
			
			String user_nkname=user_data.getString("user_nkname");//抓會員暱稱
			String user_email=user_data.getString("user_email");
			String f_title=rs.getString("f_title");//檢舉的原因
			
			int f_id=rs.getInt("id");
			String f_text=rs.getString("f_text");//檢舉的理由
			String f_url=rs.getString("f_url");//被檢舉的網址
			%>
          <td width="135" class="col-padding table-left" align="right">會員</td>
          <td class="table1 col-padding1"><%=user_nkname%></td>
        </tr>
        <tr>
          <td class="col-padding table-left" align="right">被檢舉帳號</td>
          <td class="table1 col-padding1"><%=rs.getString("user_id")%></td>
        </tr>
        <tr>
          <td height="21" class="col-padding table-left" align="right"><p>被檢舉原因</p></td>
          <td class="table1 col-padding1" ><%=f_title%></td>
        </tr>
        <tr>
          <td class="col-padding table-left" align="right">被檢舉網址</td>
          <td class="table1 col-padding1"><a href="<%=rs.getString("f_url")%>"  class="f_url" target="_blank">該檢舉網址</a></td>
        </tr>
        <tr>
          <td height="200" width="135" align="right" class="col-padding table-left">檢舉內容</td>
          <td class="table1" ><div class=" col-padding1" >
            <%=f_text%>
          </div></td>
        </tr>
        <tr>
          <td height="126" width="135"  class="col-padding table-left" align="right"   >注意事項</td>
          <td class="table1"><div class="col-padding1"><p>私人爭議由於Ai-Music判斷雙方爭執，請您自行循司法途徑解決</p>
            <p>雙方爭議，如您仍利用上開管道濫行檢舉，將會被取消帳號使用權 </p>
            <p>&nbsp;</p>
            <ul style="padding-left:15px">
              <li>刑事警察局網址 http://www.net110.gov.tw</li>
              <li>電腦犯罪小組報案電話：(02)27697403</li>
              <li>網路犯罪檢舉電子信箱： Cybercop@cib.gov.tw</li>
              </ul>            </div></td>
        </tr>
        <tr>
          <td class="table1-left" align="right">檢舉編號:<%=num%></td>
          <td class="table"><div style="height:25px; margin:5px 5px 0 5px;"><input type="button" class="send-block style4" onclick="openMail(<%=f_id%>)" value="寄送檢舉通知"/></div></td><%}%>
        </tr>
      </table>
    </div>
    <%
		num++;
		i++;
		}//rs
		rs.close();
		stmt.close();
		}//else
		}//admin
        admin.close();
	    admin_data.close();
		con.close();
	%>
    
    <!--end of 包起來的padding-->
    
  
    
        
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
