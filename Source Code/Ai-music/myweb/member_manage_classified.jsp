<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�޲z�۩w����</title>
<!--�o�̥Ϊ�css-->

<!--���ҭ��O-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

<script src="js/member_manage.js" type="text/javascript"></script>
<script src="js/prototype.js" type="text/javascript"></script>
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
<link href="../CSSfile/member_manage_classified.css" rel="stylesheet" type="text/css" />
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
 String user_id = request.getParameter("user");//��|���Ŷ����|�����
 String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
 if(user_id==null){//�p�G�줣��|���Ŷ����}��?user=xxx���� ��ܬO���H�n�J �h�n�J��id=�|��id
  user_id=login_user;
  }
 Statement user=con.createStatement();
 String user_sql="select * from users where user_id='"+user_id+"'";
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
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">�޲z�۩w����</a><a href="member_manage_manage-music.jsp"></a></div>




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
      <li class="TabbedPanelsTab " tabindex="0">�޲z�۩w����</li>
      </ul>
    <div class="TabbedPanelsContentGroup">
      <!--�򥻸�Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">
      <form action="member_manage_add_classified.jsp?user=<%=user_id%>" method="post" name="add_classified"  onsubmit="return add_classified_check()">
          <div class="table-padding font10">
            <p><span class="style4">�b���۩w����,�H��K�z�����O���޲z�z�����֧@�~�C</span></p>
            <p>&nbsp;</p>
            <span class="style4">�����W��</span>
            <input type="text" name="classify" id="classify" class="input-style" />
             
            <span class="style4">(��<span class="style9">12</span>�Ӥ���r�H��)</span>
            <input type="submit" class="new-block style4" value="�s�W����"/>
            <div  align="center" onclick="add_classified.submit();"></div>
            <hr size="1" color="#dadada" style="width:635px"/>    
          </div>
          </form>
          <div class="table-padding font10 ">
            <p><span class="style4">�w�إߪ������W��</span></p>
            
            <%
		  	Statement classified=con.createStatement();
			String classified_sql="select * from user_track_classify where user_id='"+user_id+"'";
			ResultSet classified_data;
 			classified_data=classified.executeQuery(classified_sql);
			while(classified_data.next()){
			  int classify_id=classified_data.getInt("classify_id");
		%>
     <!--�H�U�O�����W��-->    
     <form action="member_manage_update_classified.jsp?user=<%=user_id%>&user_classify=<%=classify_id%>" method="post" name="update_classified">
      <div style="margin:10px 0px;" class="style4"> 
           <table width="661">
            <tr>
              <td width="332">
<input name="update_classify" type="text" class="input-style" id="update_classify" value="<%=classified_data.getString("classify_name")%>" />            
(��<span class="style9">12</span>�Ӥ���r�H��)              </td>
              <td width="317">
              <input type="submit" class="revise-block style4" value="�ק�"  onclick="return revise_classified()"/>
              <input type="button" class="delete-block style4" value="�R��" onclick="return delete_classified('<%=user_id%>',<%=classify_id%>)"/>
                  </td>
             </tr>
           </table>
      </div>
      </form>
      <%
	   }
	   classified_data.close();
	   classified.close();
	  %>
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
            <!--end of ���padding--></div>       
          <!--end of ���ְ��n����--></div>        
        <!--end of ���ҭ��O-->    </div>
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
