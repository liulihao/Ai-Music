<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@include file="opendata.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>音樂上傳</title>

<!--這裡用的css-->

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
<link href="../CSSfile/member_manage_manage-music_upload.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style14 {font-size: 24pt}
-->
</style>
</head>
<% request.setCharacterEncoding("big5");%>
<% //會員資料
	String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
	Statement user=con.createStatement();
	String user_sql="select * from users where user_id='"+login_user+"'";
	ResultSet user_data;
	user_data=user.executeQuery(user_sql);

    String saveDirectory = request.getRealPath("/")+"myweb/user/"+login_user+"/music";  //設定路徑   宣告限制上傳之檔案大小為 10 MB
    int    maxPostSize = 10* 1024 * 1024 ;
     // 宣告上傳檔案名稱
    String FileName = null;
    String enCoding = "big5";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//遇到重複檔名 在字尾自動累加
    // 產一個新的MultipartRequest 的物件，multi
try {//try
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize,enCoding,policy); 
   
 
    //  取得所有上傳之檔案名稱
    Enumeration filesname = multi.getFileNames();
    while (filesname.hasMoreElements())
    {
        String name = (String)filesname.nextElement();//抓上傳的檔名
       
        FileName = multi.getFilesystemName(name);   //存到FILE裡面
      }
	  
	 // sql="insert into track set track_file='"+FileName+"'";//塞到資料庫裡面
	 // stmt.executeUpdate(sql);
	  
	// 樓下是給字串用的
	 
     File outFile = new File(request.getRealPath("/")+"myweb/user/"+login_user+"/audiolist.xml");
	
	String song   = multi.getParameter("song");
	String singer = multi.getParameter("singer");
	if(song.equals("")){
		out.print("<script language='javascript'>alert('請填入歌曲名稱');");
		out.print("location.href='member_manage_manage-music_upload.jsp';</script>");
	}
	
	else if(singer.equals("")){
		out.print("<script language='javascript'>alert('請填入演唱人');");
		out.print("location.href='member_manage_manage-music_upload.jsp';</script>");
	}
	else{//else
	String track_pic="noimage.jpg";
	int sing_type = Integer.parseInt(multi.getParameter("sing_type"));

	sql = "insert into track SET track_singer=?,track_name=?,track_file=?,user_id=?,sing_type=?,track_language_other=?,track_pic=?"; 
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,singer);
	pstmt.setString(2,song);
	pstmt.setString(3,FileName);
	pstmt.setString(4,login_user);
	pstmt.setInt(5,sing_type);
	pstmt.setString(6,"0");
	pstmt.setString(7,track_pic);
	
	pstmt.executeUpdate();

    PrintWriter pw = new PrintWriter(outFile); //不複寫的話不能用這個

	pw.write("<?xml version=\""+"1.0\""+" "+"encoding=\""+"UTF-8\"?>"+"\r\n" );
	pw.write("<songs>"+"\r\n");
    pw.write("    "+"<song"+"  "+"path=\""+"music/"+FileName+"\"  "+"bild=\""+"  \"  "+"artist=\""+singer+"\" title=\""+song+"\" "+ "/>"+"\r\n");  //  \r\n <--- 換行語法
    pw.write("</songs>"+"\r\n");
	
	pw.flush();
    pw.close();
	response.setHeader("Refresh","3; URL=member_manage_manage-music.jsp");

   stmt.close();
   pstmt.close();
   con.close();
   }//else end
}//try end
catch(Exception e){
	
		out.print("<script language='javascript'>alert('上傳的音樂檔不得超過10MB');");
		out.print("location.href='member_manage_manage-music_upload.jsp';</script>");
	
}
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
<div id="showid" class="font10 style4" align="left"><a href="member_page.jsp">首頁</a>
  <!-- end of 會員標頭--><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">音樂作品管理</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music_upload.jsp">音樂上傳</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners style10 title" >我的管理中心</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">個人資料管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">音樂收藏管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">好友管理</a></div>
  </div>
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners style10 title" >音樂管理</div>
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
      <li class="TabbedPanelsTab " tabindex="0">音樂作品管理</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <!--基本資料標籤內容-->
      <div class="TabbedPanelsContent">
        <!--form 頭-->
        <form id="form1" method="post" action="test_done_rewrite.jsp" enctype="multipart/form-data">
          <div class="table-padding">
          <p>&nbsp;</p>
          <p>&nbsp;</p>
            <p><span class="style13">‧上傳注意事項</span><br />
                <br />
              (1)本站僅接受<span class="style9">MP3</span>格式音樂檔案。</p>
            <p>(2)本站僅接受英文為檔案名稱。<br />
            </p>
            <div class=" style8 style14 font10" style="margin-top:35px"> 上傳成功，３秒後回到音樂管理頁面。</div>
            <div style="margin:35px 0px">
              <p class="style9">提醒您，請勿上傳非您自己所創作的作品，或侵犯它人著作權的的檔案，以免犯觸法律。
                一經發現，一概刪除之。若因此而衍生法律責任，一律由上傳者自行承擔。 </p>
            </div>
            <div >
              <div style="clear:both"></div>
            </div>
            <!--end of 包起來的padding-->
          </div>
          <!--end of 上傳音樂-->
        </form>
      </div>
    </div>
  </div>
  <!---------end of bigright --------->
</div>

  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

<script language='javascript'>
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>

</body>
</html>
