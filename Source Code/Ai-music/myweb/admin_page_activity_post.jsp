<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�o����</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/admin_page_post-activity.css" rel="stylesheet" type="text/css" />
<link href="../CSSfile/calendar.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/common.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/CalendarPopup.js"></script>
<script src="js/admin_manage.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript"> 
	var cal = new CalendarPopup("cal_div");
	cal.offsetX = -330;
	cal.offsetY = -420;
	cal.setCssPrefix("TEST");
	function check(){
	if(document.getElementById("activity_title").value=="") //�o�ؼg�kFirefox�~����
	{
		window.alert("���ʦW�٤��o���ť�!");
		return false;
	}
	if(document.getElementById("activity_time_s").value=="") 
	{
		window.alert("���ʶ}�l������o���ť�!");
		return false;
	}
	if(document.getElementById("activity_time_f").value=="") 
	{
		window.alert("���ʵ���������o���ť�!");
		return false;
	}
	if(document.getElementById("activity_target").value=="") 
	{
		window.alert("���ʹ�H���o���ť�!");
		return false;
	}
	if(document.getElementById("activity_content").value=="") 
	{
		window.alert("���ʤ��e���o���ť�!");
		return false;  
	}
	if(document.getElementById("activity_pic").value=="") 
	{
		window.alert("�S����ܬ��ʹϤ�!");
		return false;
	}
	if(document.getElementById("activity_time_s").value > document.getElementById("activity_time_f").value)
	{
		window.alert("���ʶ}�l�ɶ��ߩ󵲧��ɶ�! �Э��s��J!");
		return false;
	}
	return true;
}
</script>
<% //��x�޲z�̸�� 
	String login_user=(String)session.getAttribute("user_id");
	Statement admin = con.createStatement();
	String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
	ResultSet admin_data = admin.executeQuery(admin_sql);
%>
</head>
<body class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><img src="../music3.jpg" width="320" />
      <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�޲z�̱z�n</div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search"> <span class="font10 style4">�п�J�j�M�r��</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style" >
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
</div>
<div id="container"  align="left">
<p>&nbsp;</p>
<div class="font 10" id="mainContent" align="right">

<!--�|�����Y-->
<div id="showid" class="font10 style4" align="left">
<%
	while(admin_data.next()){
		int authority=admin_data.getInt("user_authority");
		if(authority==0){//if
			out.print("<script language='javascript'>");
			out.print("window.alert('�A�S���v���i�J��x');");
			out.print("location.href = 'index.jsp';");
			out.print("</script>");
		}
		else{//else
	%>
    <table width="940" border="0">
    <tr>
      <td width="385"><a href="admin_page_member_manage.jsp">��x�޲z����</a>
          <!-- end of �|�����Y-->
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp">���ʺ޲z</a>
            <!-- end of �|�����Y-->
          <span class="style12">&gt;</span><a href="admin_page_activity_post.jsp"> ���ʵo��</a> </td>
      <td width="545" align="right">�z�n�A<span class="style13"><%=admin_data.getString("user_nkname")%></span>�A�n�J�ɶ��G<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
<%
	
%>
</div>
<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >�|���޲z</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="admin_page_member_manage.jsp">�|�����</a></div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="admin_page_member-feedback.jsp">�|�����|</a></div>
  </div>
  <!--���ʺ޲z-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners  title" >���ʺ޲z</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_activity_post.jsp">���ʵo��</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp">���ʺ޲z</a></div>
  </div>
   <!--�Q�װ�.�a�Ϥ���-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners title" >�Q�װϺ޲z</div>
    <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">�a�Ϥ���</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=12">�ػy����</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=13">�F�v����</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=14">��v����</a></a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=15">��L����</a></div>
    <!--�Q�װϺ޲z.��������-->
        <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">��������</div>
	<div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=1">�n�u(Rock)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=2">�y��(Pop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=3">�q�l(Electronic)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=4">����(Metal)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=5">�H��(HipHop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=6">��h(Jazz)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=7">�m��(Country)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=8">����(Folk)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=9">�j��(Classical)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=10">�R��(Dance)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="manager/admin_page_discuss.jsp?discuss_subject=11">�`���Ž�(R&amp;B)</a></div>
        </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->
<div  id="bigright" class="font10 style4 right roundedCorners" align="left">
  <!--�˹��Ϊ��ť�-->
  <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
  <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
  <!--end of �˹��Ϊ��ť�-->
  <div class="space">
   <div id="activity-title" >
     <div  class="font10 style2" style="padding-left:10px">���ʵo��</div>
   </div>
    <div class="table-padding">
       <!---------------------��� �w�]������--------------------->
	<div ID="cal_div" STYLE="position:absolute; visibility:visible; background-color:white; layer-background-color:white;"></div>
      <form id="form1" method="post" action="admin_page_activity_post_success.jsp" enctype="multipart/form-data">
        <table width="620" border="0">
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʦW�١G</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_title" class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">
              <p>���ʤ���G</p>
            </div></td>
            <td><div style="margin-bottom:10px">�}�l
              <input name="activity_date_s" type="text" id="activity_date_s" size=10 maxlength="0"  class="font10 input-style">
              <A HREF="" onClick="cal.select(document.forms[1].activity_date_s,'anchor1','yyyy-MM-dd'); return false;" TITLE="��ܤ��" NAME="anchor1" ID="anchor1"> ��ܤ��</A><br>
                ����
              <input name="activity_date_f" type="text" id="activity_date_f" size=10 maxlength="0"  class="font10 input-style">
              <A HREF="" onClick="cal.select(document.forms[1].activity_date_f,'anchor2','yyyy-MM-dd'); return false;" TITLE="��ܤ��" NAME="anchor2" ID="anchor2"> ��ܤ��</A></div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">���ʮɶ��G</div></td>
            <td ><div style="margin-bottom:10px">�}�l
                <select name="select_H_s" id="select_H_s">
                  <option value="00">00</option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                </select>
              ��
              <select name="select_M_s" id="select_M_s">
                <option value="00">00</option>
                <option value="15">15</option>
                <option value="30">30</option>
                <option value="45">45</option>
              </select>
              ��<br>
              ����
              <select name="select_H_f" id="select_H_f">
                <option value="00">00</option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
              </select>
              ��
              <select name="select_M_f" id="select_M_f">
                <option value="00">00</option>
                <option value="15">15</option>
                <option value="30">30</option>
                <option value="45">45</option>
              </select>
              ��</div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">���ʦa�I�G</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_location"  class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">���ʹ�H�G</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_target"  class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʤ��СG</div></td>
            <td rowspan="2"><div  style="margin-bottom:10px"></div>
              <span style="margin-bottom:10px">
              <textarea name="activity_content" cols="50" rows="10"  class="font10 input-style"></textarea>
              </span></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
          </tr>
          
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʹϤ�</div></td>
            <td><div  style="margin-bottom:10px">
              <input name="activity_pic" type="file" id="activity_pic" />
            </div></td>
          </tr>
          <tr>
            <td colspan="2" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><input type="submit" value="�o����" onClick="return check()" class="agree style4"/>
              <input type="button" value="�^�W�@��" onclick="window.history.back()" class="agree style4"/></td>
            <td width="9">&nbsp;</td>
            <div style="clear:both"></div>                <td width="-1"></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <% 
 	}//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
	 
%>
          </form>
    </div> <!--end of �]�_�Ӫ�padding-->
   </div>
  <!---------end of bigright --------->
</div>
<!--end of mainContent-->
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


</body>
</html>
