<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%@ include file="opendata.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�ӤH��ƺ޲z</title>
<!--�o�̥Ϊ�css-->

<!--���ҭ��O-->


<script src="js/member_manage.js" type="text/javascript"></script>
<script src="js/check_password.js" type="text/javascript"></script>
<script src="js/prototype.js" type="text/javascript"></script>
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
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/common.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/CalendarPopup.js"></script>
<SCRIPT LANGUAGE="JavaScript" ID="jsB"> 
	var cal = new CalendarPopup("cal_div"); 
	cal.offsetX = -420;
	cal.offsetY = -430;
	cal.setTodayText("");
	cal.showNavigationDropdowns();
	cal.setCssPrefix("TEST");
</SCRIPT>

<link href="../CSSfile/member_manage_manage-music_upload.css" rel="stylesheet" type="text/css">
<link href="../CSSfile/calendar.css" rel="stylesheet" type="text/css">
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>
<% request.setCharacterEncoding("big5");%> 
<%
  /*String user_id = request.getParameter("user");//��|���Ŷ����|�����
  */
  /*if(user_id==null){//�p�G�줣��|���Ŷ����}��?user=xxx���� ��ܬO���H�n�J �h�n�J��id=�|��id
   user_id=login_user;
  }*/ 
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
   sql="SELECT *, REPLACE(user_intro, '<br>', '') AS change_user_intro FROM users WHERE user_id ='"+login_user+"'";
   rs = stmt.executeQuery(sql);
   
   //Ū�����w����������
   PreparedStatement music_type=con.prepareStatement("SELECT * FROM user_music WHERE user_id=?");
	music_type.setString(1, login_user);
	ResultSet music;
	
	//Ū����ܦ~�ֻP�~��a���
	PreparedStatement visible_type=con.prepareStatement("SELECT * FROM visible WHERE user_id=?");
	visible_type.setString(1, login_user);
	ResultSet visible;
	
%>
<body class="oneColFixCtrHdr">
<div id="header">
<div style="padding-left:30px" align="left"><a href="index.jsp"><div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" />
<span class="font10">�^����</span>
</div></a>
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

<!--<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a>
    
    <span >�ڭn���|</span>
    </div>-->
	<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> 
    
    <span>�ڪ��Ŷ�</span>
    </div>
	<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
	<div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a>
    <span>�ڪ��޲z����</span>
    </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>�n�X</span>
    </div>
    <%
	}
%>
<form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
<div   style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;" class="info_search">
   <span class="font10 style4">�п�J�j�M�r��</span>  
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class=" search-style"></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style">
          <option value="song_name" selected>�q�W</option>
          <option value="member_name">�|��</option>
          </select></td>        
        <td width="82"><input type="submit" value="�j�M" class="search-style"/></td>
      </tr>
    </table></div>
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
  <div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">���֧@�~�޲z</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music_upload.jsp">���֤W��</a></div>
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
  <!---------------------bigright--------------------->
  <div  id="bigright" class="font10" align="left">
    <!--���ҭ��O-->
    <div id="TabbedPanels1" class="TabbedPanels">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab " tabindex="0">���֤W��</li>
      </ul>
      <div class="TabbedPanelsContentGroup">
        <!--�򥻸�Ƽ��Ҥ��e-->
        <div class="TabbedPanelsContent">
          <!--form �Y-->
          <form id="form1" method="post" action="member_manage_manage-music_success.jsp" enctype="multipart/form-data" >
            <div class="table-padding">
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p><span class="style13">�E�W�Ǫ`�N�ƶ�</span><br />
                  <br />
                (1) �ȱ���<span style="color:#ff091a"> <b>MP3</b></span> �榡�������ɮסC</p>
              <p>(2) �ɮצW�٥����� <span style="color:#ff091a"><b>�^���ɦW</b></span> �C<br />
              </p>
              <p>(3) �W���ɮת��j�p���o�W�L <span style="color:#ff091a"><b>10MB</b></span>�C</p>
              <div style="margin-top:15px">
                <table width="617" border="0">
                  <tr>
                    <td width="73">�q���W��: </td>
                    <td width="534"><input name="song" id="song" type="text" class="input-style"/>                    </td>
                  </tr>
                  <tr>
                    <td><div style="margin-top:3px">�t�ۤH:</div></td>
                    <td><div style="margin-top:3px">
                      <input name="singer" id="singer" type="text" class="input-style"/>
                    </div></td>
                  </tr>
                  <tr>
                    <td><div style="margin-top:3px">�t������:</div></td>
                    <td><div style="margin-top:3px">
                      <select name="sing_type" class="font10 input-style">
                        <option value="1">�Ч@</option>
                        <option value="2">½��</option>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td><div style="margin-top:3px">�����ɮ�:</div></td>
                    <td><div style="margin-top:3px">
                      <input name="music" type="file" />
                    </div></td>
                  </tr>
                </table>
              </div>
              <div style="margin:20px 0px">
                <p class="style9"><b>�����z�A�ФŤW�ǫD�z�ۤv�ҳЧ@���@�~�A�ΫI�ǥ��H�ۧ@�v�����ɮסA�H�K��Ĳ�k�ߡC</b></p>
                <p class="style9"><b>�Y�Q�����޲z�̵o�{�A�@���R���C�Y�]���ӭl�ͪk�߳d���A�@���ѤW�Ǫ̦ۦ�Ӿ�C </b></p>
              </div>
              <div >
                <input type="submit" class="small-grayblock-agree style4 " value="�ڦP�N�W�z���ڨö}�l�W��"s="s"/>
                <input type="button" class="small-grayblock-back style4" value="�^�W�@��" onclick="location.href='member_manage_manage-music.jsp'" />
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
  <!-- end #container -->
</div>
<script type="text/javascript">
<!--
//-->
function openConfirm() {
    Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp"})
}
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>
