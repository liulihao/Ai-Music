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
<title>���֤W��</title>

<!--�o�̥Ϊ�css-->

<!--���ҭ��O-->
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
<% //�|�����
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	Statement user=con.createStatement();
	String user_sql="select * from users where user_id='"+login_user+"'";
	ResultSet user_data;
	user_data=user.executeQuery(user_sql);

    String saveDirectory = request.getRealPath("/")+"myweb/user/"+login_user+"/music";  //�]�w���|   �ŧi����W�Ǥ��ɮפj�p�� 10 MB
    int    maxPostSize = 10* 1024 * 1024 ;
     // �ŧi�W���ɮצW��
    String FileName = null;
    String enCoding = "big5";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//�J�쭫���ɦW �b�r���۰ʲ֥[
    // ���@�ӷs��MultipartRequest ������Amulti
try {//try
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize,enCoding,policy); 
   
 
    //  ���o�Ҧ��W�Ǥ��ɮצW��
    Enumeration filesname = multi.getFileNames();
    while (filesname.hasMoreElements())
    {
        String name = (String)filesname.nextElement();//��W�Ǫ��ɦW
       
        FileName = multi.getFilesystemName(name);   //�s��FILE�̭�
      }
	  
	 // sql="insert into track set track_file='"+FileName+"'";//����Ʈw�̭�
	 // stmt.executeUpdate(sql);
	  
	// �ӤU�O���r��Ϊ�
	 
     File outFile = new File(request.getRealPath("/")+"myweb/user/"+login_user+"/audiolist.xml");
	
	String song   = multi.getParameter("song");
	String singer = multi.getParameter("singer");
	if(song.equals("")){
		out.print("<script language='javascript'>alert('�ж�J�q���W��');");
		out.print("location.href='member_manage_manage-music_upload.jsp';</script>");
	}
	
	else if(singer.equals("")){
		out.print("<script language='javascript'>alert('�ж�J�t�ۤH');");
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

    PrintWriter pw = new PrintWriter(outFile); //���Ƽg���ܤ���γo��

	pw.write("<?xml version=\""+"1.0\""+" "+"encoding=\""+"UTF-8\"?>"+"\r\n" );
	pw.write("<songs>"+"\r\n");
    pw.write("    "+"<song"+"  "+"path=\""+"music/"+FileName+"\"  "+"bild=\""+"  \"  "+"artist=\""+singer+"\" title=\""+song+"\" "+ "/>"+"\r\n");  //  \r\n <--- ����y�k
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
	
		out.print("<script language='javascript'>alert('�W�Ǫ������ɤ��o�W�L10MB');");
		out.print("location.href='member_manage_manage-music_upload.jsp';</script>");
	
}
%>
<body vlink="#5F5F5F" class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><a href="index.jsp">
    <div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" /> <span class="font10">�^����</span> </div>
    </a>
      <%
	if (login_user == null)
	{
%>
      <div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm()">�n�J</a></div>
    <%
	}
	else
	{
%>
      <!--<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >�ڭn���|</span> </div>-->
    <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
    <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>�ڪ��޲z����</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div   style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;" class="info_search"> <span class="font10 style4">�п�J�j�M�r��</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class=" search-style" /></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style">
                    <option value="song_name" selected="selected">�q�W</option>
                    <option value="member_name">�|��</option>
                </select></td>
                <td width="82"><input type="submit" value="�j�M" class="search-style"/></td>
              </tr>
            </table>
        </div>
      </form>
  </div>
  <!-- end #header -->
  <div class="font10 style4 manubar link" >
    <table width="972">
      <tr>
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=login_user%>">�ӤH�Ŷ�</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=login_user%>">�̷s�T��</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=login_user%>">���֧@�~</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=login_user%>"> ���֦��� </a></td>
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=login_user%>">�ڪ��B��</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=login_user%>">�d����</a> </td>
      </tr>
    </table>
  </div>
</div>
<div id="container"  align="left">
 


<!--�|�����Y-->
<div id="showid" class="font10 style4" align="left"><a href="member_page.jsp">����</a>
  <!-- end of �|�����Y--><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">���֧@�~�޲z</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music_upload.jsp">���֤W��</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners style10 title" >�ڪ��޲z����</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ӤH��ƺ޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">���֦��ú޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">�n�ͺ޲z</a></div>
  </div>
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners style10 title" >���ֺ޲z</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">���֧@�~�޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">�޲z�۩w����</a></div>
  </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->
<div  id="bigright" class="font10" align="left">
  <!--���ҭ��O-->
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab " tabindex="0">���֧@�~�޲z</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <!--�򥻸�Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">
        <!--form �Y-->
        <form id="form1" method="post" action="test_done_rewrite.jsp" enctype="multipart/form-data">
          <div class="table-padding">
          <p>&nbsp;</p>
          <p>&nbsp;</p>
            <p><span class="style13">�E�W�Ǫ`�N�ƶ�</span><br />
                <br />
              (1)�����ȱ���<span class="style9">MP3</span>�榡�����ɮסC</p>
            <p>(2)�����ȱ����^�嬰�ɮצW�١C<br />
            </p>
            <div class=" style8 style14 font10" style="margin-top:35px"> �W�Ǧ��\�A�����^�쭵�ֺ޲z�����C</div>
            <div style="margin:35px 0px">
              <p class="style9">�����z�A�ФŤW�ǫD�z�ۤv�ҳЧ@���@�~�A�ΫI�ǥ��H�ۧ@�v�����ɮסA�H�K��Ĳ�k�ߡC
                �@�g�o�{�A�@���R�����C�Y�]���ӭl�ͪk�߳d���A�@�ߥѤW�Ǫ̦ۦ�Ӿ�C </p>
            </div>
            <div >
              <div style="clear:both"></div>
            </div>
            <!--end of �]�_�Ӫ�padding-->
          </div>
          <!--end of �W�ǭ���-->
        </form>
      </div>
    </div>
  </div>
  <!---------end of bigright --------->
</div>

  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

<script language='javascript'>
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>

</body>
</html>
