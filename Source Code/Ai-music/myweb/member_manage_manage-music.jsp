<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���֧@�~�޲z</title>
<!--�o�̥Ϊ�css-->

<!--���ҭ��O-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="js/prototype.js"></script>
<script src="js/member_manage.js" type="text/javascript"></script>
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

<link href="../CSSfile/member_manage_manage-music.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
</head>
<% //�|�����
 //String user_id = request.getParameter("user");//��|���Ŷ����|�����
 String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
 Statement user=con.createStatement();
 String user_sql="select * from users where user_id='"+login_user+"'";
 ResultSet user_data;
 user_data=user.executeQuery(user_sql);

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
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">���֧@�~�޲z</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >�ڪ��޲z����</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ӤH��ƺ޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">���֦��ú޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">�n�ͺ޲z</a></div>
  </div>
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners  title" >���ֺ޲z</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">���֧@�~�޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">�޲z�۩w����</a></div>
  </div>
  <!--end of bigleft-->
</div>
<div  id="bigright" class="font10" align="left">
  <!--���ҭ��O-->
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab " tabindex="0">���֧@�~�޲z</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <!--�򥻸�Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">
      <input type="button" id="song_upload" class="upload-block style13 font10" value="�W�Ǻq��"onclick="location.href='member_manage_manage-music_upload.jsp'" />
        
        <div align="right" style="margin:5px; padding-right:33px;" ><!--�q���j�M-->
  <form id="song_search1" name="song_search1" method="post" >
  <input name="song_search_text" type="text" class="input-style" id="song_search_text" size="15" maxlength="40"/>
  <input type="button" value="�q���j�M" onclick="return song_search()" class="input-style-type style4"/>
  </form>
  </div>
  <div id="search_song"></div>
        <div class="space" id="song_space">
         <%
    int PageSize=10;//�]�w�C�i������ܪ�����
	int ShowPage=1;//�]�w����ܪ�����
	int RowCount=0;//ResultSet�O������
	int PageCount=0;//ResultSet�����᪺�`����
	
	String ToPage=request.getParameter("ToPage");
	if(ToPage!=null){//�P�_�O�_�i���T���oToPage�Ѽ� �i���o�h���JSP��������ܯS�w�����������ԭz
	  ShowPage=Integer.parseInt(ToPage);//���o���w��ܪ���������
	  	  if(ShowPage<=0){
	    ShowPage=1;//�Y���w���Ƥp��0 �h�]�w��ܲĤ@��������
	  }
	 }
	 sql="select COUNT(*) from track where user_id='"+login_user+"'";
    rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  sql="select * from track where user_id='"+login_user+"' ORDER BY track_time DESC";
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>   <!--����-->
    <div class="style4" align="center">
    <form action="member_manage_manage-music.jsp" method="POST">
    <p>�A�@��<font color="#0066FF"><b><%=RowCount%></b></font>���q��</p>
      <table width="651" border=0>
        <tr>
          <td width="138"><div align="center">�ثe����:<font color=red><%=ShowPage%></font>/<font color=blue><%=PageCount%></font> </div></td>
          <td width="70" ><div align="center"><a href=member_manage_manage-music.jsp?ToPage=1>[�Ĥ@��]</a></div></td>
          <td width="70" ><div align="center"><a href=member_manage_manage-music.jsp?ToPage=<%=ShowPage-1%>>[�W�@��]</a> </div></td>
          <td width="70"><div align="center"><a href=member_manage_manage-music.jsp?ToPage=<%=ShowPage+1%>>[�U�@��]</a> </div></td>
          <td width="91"><div align="center"><a href=member_manage_manage-music.jsp?ToPage=<%=PageCount%>>[�̫�@��]</a> </div></td>
          <td ><div align="center">��J����:
            <input type="text" id="page_text" size=3 name="ToPage"  class="font10 style4 input-style" />
                <input type="submit" name="SEND" value="�e�X" class="font10 style4 input-style-type"  onclick="return check_page()">
          </div></td>
        </tr>
      </table>
    </form>
    </div>
    <!--End of ����-->
          <div class="font10 music-title  roundedCorners" style="margin-bottom:10px">
            <table width="651" border="0">
              <tr>
              	<td width="43" align="center">#</td>
                <td width="410" class="title-name1">�q���W��</td>
                <td width="184" class="title-style1">&lt;�W�Ǯɶ�&gt;</td>
              </tr>
            </table>
          </div>
         
          <%
		   i=0;
		   int num=(ShowPage-1)*10;
   			 while(i<PageSize&&rs.next()){   
			  num++;
			  String track_id=rs.getString("track_id");
			  String track_name=rs.getString("track_name");		  
			 
		  %>
          <div class="table-padding">
          
            <div>           
              <table width="661" border="0">
                <tr>
                <td width="34" align="center"><%=num%></td>
                  <td width="397" class="title-name1"><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%=track_name%></a></td>
                  <td width="216" class="title-style1"><span class="style9"><%=rs.getDate("track_time")%> <%=rs.getTime("track_time")%></span></td>
                </tr>
              <tr>
              <td></td>
            <td colspan="2">
            <input type="button" class="save-block style4" value="�ק�" onclick="location.href='member_manage_manage-music_revise.jsp?music_id=<%=track_id%>'"/>
            <input type="button" class="delete-block style4" value="�R��" onclick="delete_music(<%=track_id%>)"/>
            </td>
            </tr>
         </table>
            </div>
            <div class="song-line" >
              <hr size="1" color="#E5E5E5";/>
            </div>
          </div>
          <% 
		  	i++;
		   }
		   rs.close();
		   stmt.close();
		  
		   %>
          <!--end of �]�_�Ӫ�padding-->
        </div>
        <!--end of �򥻸�Ƽ���-->
      </div>
      <!--�b���Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">
        <!--�]�_�Ӫ�padding-->
        <!--�]�_�Ӫ�padding-->
      </div>
     
    </div>
  </div>
  <!---------end of bigright --------->
</div>
<!---------------------bigright--------------------->
<!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
function openConfirm() {
    Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp"})
}
</script>
</body>
</html>
