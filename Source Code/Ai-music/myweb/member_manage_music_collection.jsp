<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���ʺ޲z</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/member_manage_interactive.css" rel="stylesheet" type="text/css" />

<!--���ҭ��O-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

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
      <div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm('<%=web_url%>')">�n�J</a></div>
    <%
	}
	else
	{
%>
     <!-- <div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >�ڭn���|</span> </div>-->
    <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
    <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>�ڪ��޲z����</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()" >
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
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=user_id%>">�ӤH�Ŷ�</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=user_id%>">�̷s�T��</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=user_id%>">���֧@�~</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=user_id%>"> ���֦��� </a></td>
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=user_id%>">�ڪ��B��</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=user_id%>">�d����</a> </td>
      </tr>
    </table>
  </div>
</div>
<div id="container"  align="left">
  
<!--�|�����Y-->
<div id="showid" class="font10 style4" align="left"><a href="member_page.jsp?user=<%=login_user%>">����</a>
  <!-- end of �|�����Y-->
  <span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">���ʺ޲z</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners title" >�ڪ��޲z����</div>
    <div class="bigleft-content style4  pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ӤH��ƺ޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">���ʺ޲z</a></div>
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
    int PageSize=6;//�]�w�C�i������ܪ�����
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
	  sql="select * from music_collection,track where music_collection.track_id = track.track_id AND login_id='"+login_user+"'  ORDER BY collect_date DESC";
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
          <!-- ���X-->
          <div id="new-message" align="left">
            <form action="member_manage_interactive.jsp" method="POST">
              <table border=0>
                <tr>
                  <td>�ثe����:<font color=red><%=ShowPage%></font>/ <font color=blue><%=PageCount%></font> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=ShowPage-1%>>[�W�@��]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=ShowPage+1%>>[�U�@��]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=1>[�Ĥ@��]</a> </td>
                  <td><a href=member_manage_interactive.jsp?ToPage=<%=PageCount%>>[�̫�@��]</a> </td>
                  <td>��J����:
                    <input type="text" size=3 name="ToPage" />
                  </td>
                  <td><input type="submit" name="SEND" value="�e�X" />
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
				int track_id=rs.getInt("track_id");
			 	String user_id1=rs.getString("user_id");
				 String collect_date=rs.getString("collect_date");
				 String track_pic=rs.getString("track.track_pic");
	  
				 Statement track=con.createStatement();//��q�����
			     String track_sql="select * from track where track_id='"+track_id+"'";
			     ResultSet track_data;
			     track_data=track.executeQuery(track_sql);
	 
				 while(track_data.next()){
				   String track_name=track_data.getString("track_name");//�즱�W
		%>
          <!--���֦��ðj��бq�o�̥]-->
          <div class="song-block" align="left" style="float:left">
            <input type="button" class="delete-block style4" value="�R��" onclick="location.href='del_songCollect.jsp?track_id=<%=track_id%>&login_id=<%=login_user%>'" />
            <div style=" border:1px solid #E5E5E5;float:left;width:250px;">
              <div class="pic-block" align="center" ><img src="user/<%=user_id1%>/<%=track_pic%>" alt="" width="90" height="90"/></div>
              <div  align="left" class="style4 detail-block"><%=user_id1%></div>
              <div  align="left" class="style4 detail-block"><%=track_name%></div>
              <div  align="left" class="style10 style11 detail-block"><%=collect_date%><span class="style4">�[�J</span></div>
              <div  align="left" class="style4 detail-block"><span class="style12 style9">&gt;&nbsp;<strong><a href="member_page_music_song.jsp?music_id=<%=track_id%>">play</a></strong></span></div>
              <!--���֦��� end-->
            </div>
          </div>
          <%
	  i++;   
	   	}  //rs
	 	 }//track_data
	  rs.close();
	  stmt.close();
	  
	  %>
          <!--�H�W-->
          <!--�M���B��-->
          <div style="clear:both"></div>
        </div>
        <!--end of �򥻸�Ƽ���-->
      </div>
      <!--�b���Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">
        <!--�]�_�Ӫ�padding-->
        <!--�]�_�Ӫ�padding-->
      </div>
      <!--���ְ��n����-->
      <div id="TabbedPanelsContent">
        <div class="space">
          <div class="font10-2" style="margin-bottom:10px">�п�ܳߦn����������:</div>
          <div class="table-padding">
            <table width="515" border="0">
              <tr class="Tabletype2">
                <td width="157" ><div align="left">
                  <input name="Rock" type="checkbox" id="Rock" />
                  Rock</div></td>
                <td width="168" ><div align="left">
                  <input name="Pop" type="checkbox" id="Pop" />
                  Pop</div></td>
                <td width="176" ><div align="left">
                  <input name="Electro" type="checkbox" id="Eletro"/>
                  Electronic </div></td>
              </tr>
              <tr class="Tabletype2">
                <td><div align="left">
                  <input name="Metal" type="checkbox" id="Metal" />
                  Metal</div></td>
                <td><div align="left">
                  <input name="HipHop" type="checkbox" id="HipHop" />
                  Hip Hop</div></td>
                <td><div align="left">
                  <input name="Jazz" type="checkbox" id="Jazz" />
                  Jazz</div></td>
              </tr>
              <tr class="Tabletype2">
                <td><div align="left">
                  <input name="Conutry" type="checkbox" id="Country" />
                  Country</div></td>
                <td><div align="left">
                  <input name="Jazz2" type="checkbox" id="Jazz2" />
                  Folk</div></td>
                <td><div align="left">
                  <input name="Jazz3" type="checkbox" id="Jazz3" />
                  Classical</div></td>
              </tr>
              <tr class="Tabletype2">
                <td><div align="left">
                  <input name="Jazz4" type="checkbox" id="Jazz4" />
                  Dance</div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr class="Tabletype2">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr class="Tabletype2">
                <td>&nbsp;</td>
                <td><input name="SUBMIT4" type="submit" value="�x�s�]�w" /></td>
                <td>&nbsp;</td>
              </tr>
            </table>
            <!--end of ���padding-->
          </div>
          <!--end of ���ְ��n����-->
        </div>
        <!--end of ���ҭ��O-->
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
</script>
</body>
</html>
