<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���ʺ޲z</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/member_manage_interactive.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
<!--���ҭ��O-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

<script src="js/prototype.js" type="text/javascript"></script>
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
</head>
<% //�|�����

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
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">���ʺ޲z</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners title" >�ڪ��޲z����</div>
    <div class="bigleft-content style4  pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ӤH��ƺ޲z</a></div>
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
<!---------------------bigright--------------------->
<div  id="bigright" class="font10" align="left">
  <!--���ҭ��O-->
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab " tabindex="0">���֦���</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <!--�򥻸�Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">
        <div class="table-padding">
          <!-- ���X-->
          <%//���֦��æC���X
    int PageSize=8;//�]�w�C�i������ܪ�����
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
	 sql="select COUNT(*) from music_collection where login_id='"+login_user+"'";
    rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  sql="select * from music_collection,track,users where music_collection.track_id = track.track_id AND track.user_id=users.user_id AND login_id='"+login_user+"'  ORDER BY collect_date DESC";
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
          <!-- ���X-->
          <div id="new-message" align="center" class="style4">
            <form action="member_manage_interactive.jsp" method="POST">
              <p>�A�@��<font color="#0066FF"><b><%=RowCount%></b></font>�����֦��úq��</p>
              <table border=0>
                <tr>
                  <td>�ثe����:<font color=red><%=ShowPage%></font>/ <font color=blue><%=PageCount%></font> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=ShowPage-1%>>[�W�@��]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=ShowPage+1%>>[�U�@��]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=1>[�Ĥ@��]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=PageCount%>>[�̫�@��]</a> </td>
                  <td>��J����:
                    <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style"/>
                  </td>
                  <td><input type="submit" name="SEND" value="�e�X" onclick="return check_page()" class="font10 style4 input-style-type"/>
                  </td>
                </tr>
              </table>
            </form>
            <!-- ���Xend-->
          </div>
          <!--�n�Ͱj��бq�o�̥]-->
          <%
		   	i=0;
    		while(i<PageSize&&rs.next()){ 
				int track_id=rs.getInt("track.track_id");
			 	String user_id1=rs.getString("track.user_id");
				 String collect_date=rs.getString("music_collection.collect_date");
				 String track_pic=rs.getString("track.track_pic");
	  	 		
				 String track_name=rs.getString("track.track_name");//�즱�W
				 String user_nkname1=rs.getString("users.user_nkname");
		%>
          <!--���֦��ðj��бq�o�̥]-->
          <div class="song-block" align="left" style="float:left">
            <input type="button" class="delete-block style4" value="�R��" onclick="return delete_collect_music(<%=track_id%>,'<%=login_user%>')" />
            <div style=" border:1px solid #E5E5E5;float:left;width:250px;">
              <div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><div style="border:1px solid #E5E5E5"><img src="user/<%=user_id1%>/music/<%=track_pic%>" alt="" width="60" height="60"/></div></a></div>
              <div  align="left" class="style4 detail-block">�|���G<a href="member_page.jsp?user=<%=user_id1%>"><%=user_nkname1%></a></div>
              <div  align="left" class="style4 detail-block">�q�W�G<a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%=track_name%></a></div>
              <div  align="left" class="style10 style12  detail-block"><span class="style4">���ä���G<%=collect_date%></span></div>
              <!--���֦��� end-->
            </div>
            
          </div>
          <%
	  i++;   
	   	}  //rs
	 	 
	  rs.close();
	  stmt.close();
	  
	  %>
          <!--�H�W-->
          <!--�M���B��-->
          <div style="clear:both"></div>
        </div>
        <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
        <!--end of �򥻸�Ƽ���-->
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
