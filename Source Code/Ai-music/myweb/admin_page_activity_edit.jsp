<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�קﬡ��</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/admin_page_post-activity.css" rel="stylesheet" type="text/css" />
<link href="../CSSfile/calendar.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="js/activity.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/common.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="calendar_js/CalendarPopup.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript"> 
	var cal = new CalendarPopup("cal_div");
	cal.offsetX = -330;
	cal.offsetY = -420;
	cal.setCssPrefix("TEST");
	
</SCRIPT>
<script src="js/admin_manage.js" type="text/javascript"></script>
</head>
<%
	//��x�޲z�̸��
 
 String login_user=(String)session.getAttribute("user_id");
 Statement admin = con.createStatement();
 String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
 ResultSet admin_data = admin.executeQuery(admin_sql);
 %>
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
<div id="container" align="left">
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
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp"> ���ʺ޲z</a>
            <!-- end of �|�����Y-->
          <span class="style12">&gt;</span><a href="admin_page_activity_edit.jsp">���ʭק�</a></td>
      <td width="545" align="right">�z�n�A<span class="style13"><%=admin_data.getString("user_nkname")%></span>�A�n�J�ɶ��G<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>

</div>
  <!-- end of �|�����Y-->



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
 <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px ;z-index:1000"></div>
 <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
<!--end of �˹��Ϊ��ť�-->

  <div class="space">
   <div id="activity-title" >
     <div  class="font10 style2" style="padding-left:10px">���ʭק�</div>
   </div>
    <div class="table-padding">
    
<%
	int id = Integer.parseInt(request.getParameter("id")); 
	rs=stmt.executeQuery("SELECT *, REPLACE(activity_content, '<br>', '') AS change_text, LEFT(activity_time_s,2) AS ST_H, RIGHT(activity_time_s,2) AS ST_M, LEFT(activity_time_f,2) AS FT_H, RIGHT(activity_time_f,2) AS FT_M FROM activity_info WHERE activity_code = " +id);
	while(rs.next())
	{
%>
       <!---------------------��� �w�]������--------------------->
	<div ID="cal_div" STYLE="position:absolute; visibility:visible; background-color:white; layer-background-color:white;"></div>
      <form id="form1" method="post" action="admin_page_activity_edit_success.jsp?id=<%=id%>" enctype="multipart/form-data">
        <table width="620" border="0">
          <tr>
            <td width="131" align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʽs���G</div></td>
            <td width="463" ><div  class="col-padding"  style="margin-bottom:10px"><%=rs.getInt("activity_code")%></div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʦW�١G</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_title" value="<%= rs.getString("activity_title")%>" class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">
              <p>���ʤ���G</p>
            </div></td>
            <td><div style="margin-bottom:10px">�}�l
              <input name="activity_date_s" type="text" id="activity_date_s" value="<%= rs.getString("activity_date_s")%>" size=10 maxlength="0"  class="font10 input-style">
              <A HREF="" onClick="cal.select(document.forms[1].activity_date_s,'anchor1','yyyy-MM-dd'); return false;" TITLE="��ܤ��" NAME="anchor1" ID="anchor1"> ��ܤ��</A><br>
                ����
              <input name="activity_date_f" type="text" id="activity_date_f" value="<%= rs.getString("activity_date_f")%>" size=10 maxlength="0"  class="font10 input-style">
              <A HREF="" onClick="cal.select(document.forms[1].activity_date_f,'anchor2','yyyy-MM-dd'); return false;" TITLE="��ܤ��" NAME="anchor2" ID="anchor2"> ��ܤ��</A></div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">���ʮɶ��G</div></td>
            <td ><div style="margin-bottom:10px">�}�l
                <select name="select_H_s" id="select_H_s">
                  <option value="00" <%
					if(rs.getString("ST_H").equals("00")){
						out.print("selected=\"selected\"");
					}
				%>>00</option>
                  <option value="01" <%
					if(rs.getString("ST_H").equals("01")){
						out.print("selected=\"selected\"");
					}
				%>>01</option>
                  <option value="02" <%
					if(rs.getString("ST_H").equals("02")){
						out.print("selected=\"selected\"");
					}
				%>>02</option>
                  <option value="03" <%
					if(rs.getString("ST_H").equals("03")){
						out.print("selected=\"selected\"");
					}
				%>>03</option>
                  <option value="04" <%
					if(rs.getString("ST_H").equals("04")){
						out.print("selected=\"selected\"");
					}
				%>>04</option>
                  <option value="05" <%
					if(rs.getString("ST_H").equals("05")){
						out.print("selected=\"selected\"");
					}
				%>>05</option>
                  <option value="06" <%
					if(rs.getString("ST_H").equals("06")){
						out.print("selected=\"selected\"");
					}
				%>>06</option>
                  <option value="07" <%
					if(rs.getString("ST_H").equals("07")){
						out.print("selected=\"selected\"");
					}
				%>>07</option>
                  <option value="08" <%
					if(rs.getString("ST_H").equals("08")){
						out.print("selected=\"selected\"");
					}
				%>>08</option>
                  <option value="09" <%
					if(rs.getString("ST_H").equals("09")){
						out.print("selected=\"selected\"");
					}
				%>>09</option>
                  <option value="10" <%
					if(rs.getString("ST_H").equals("10")){
						out.print("selected=\"selected\"");
					}
				%>>10</option>
                  <option value="11" <%
					if(rs.getString("ST_H").equals("11")){
						out.print("selected=\"selected\"");
					}
				%>>11</option>
                  <option value="12" <%
					if(rs.getString("ST_H").equals("12")){
						out.print("selected=\"selected\"");
					}
				%>>12</option>
                  <option value="13" <%
					if(rs.getString("ST_H").equals("13")){
						out.print("selected=\"selected\"");
					}
				%>>13</option>
                  <option value="14" <%
					if(rs.getString("ST_H").equals("14")){
						out.print("selected=\"selected\"");
					}
				%>>14</option>
                  <option value="15" <%
					if(rs.getString("ST_H").equals("15")){
						out.print("selected=\"selected\"");
					}
				%>>15</option>
                  <option value="16" <%
					if(rs.getString("ST_H").equals("16")){
						out.print("selected=\"selected\"");
					}
				%>>16</option>
                  <option value="17" <%
					if(rs.getString("ST_H").equals("17")){
						out.print("selected=\"selected\"");
					}
				%>>17</option>
                  <option value="18" <%
					if(rs.getString("ST_H").equals("18")){
						out.print("selected=\"selected\"");
					}
				%>>18</option>
                  <option value="19" <%
					if(rs.getString("ST_H").equals("19")){
						out.print("selected=\"selected\"");
					}
				%>>19</option>
                  <option value="20" <%
					if(rs.getString("ST_H").equals("20")){
						out.print("selected=\"selected\"");
					}
				%>>20</option>
                  <option value="21" <%
					if(rs.getString("ST_H").equals("21")){
						out.print("selected=\"selected\"");
					}
				%>>21</option>
                  <option value="22" <%
					if(rs.getString("ST_H").equals("22")){
						out.print("selected=\"selected\"");
					}
				%>>22</option>
                  <option value="23" <%
					if(rs.getString("ST_H").equals("23")){
						out.print("selected=\"selected\"");
					}
				%>>23</option>
                </select>��
              <select name="select_M_s" id="select_M_s">
                <option value="00" <%
					if(rs.getString("ST_M").equals("00")){
						out.print("selected=\"selected\"");
					}
				%>>00</option>
                <option value="15" <%
					if(rs.getString("ST_M").equals("15")){
						out.print("selected=\"selected\"");
					}
				%>>15</option>
                <option value="30" <%
					if(rs.getString("ST_M").equals("30")){
						out.print("selected=\"selected\"");
					}
				%>>30</option>
                <option value="45" <%
					if(rs.getString("ST_M").equals("45")){
						out.print("selected=\"selected\"");
					}
				%>>45</option>
              </select>��<br>
              ����
              <select name="select_H_f" id="select_H_f">
                  <option value="00" <%
					if(rs.getString("FT_H").equals("00")){
						out.print("selected=\"selected\"");
					}
				%>>00</option>
                  <option value="01" <%
					if(rs.getString("FT_H").equals("01")){
						out.print("selected=\"selected\"");
					}
				%>>01</option>
                  <option value="02" <%
					if(rs.getString("FT_H").equals("02")){
						out.print("selected=\"selected\"");
					}
				%>>02</option>
                  <option value="03" <%
					if(rs.getString("FT_H").equals("03")){
						out.print("selected=\"selected\"");
					}
				%>>03</option>
                  <option value="04" <%
					if(rs.getString("FT_H").equals("04")){
						out.print("selected=\"selected\"");
					}
				%>>04</option>
                  <option value="05" <%
					if(rs.getString("FT_H").equals("05")){
						out.print("selected=\"selected\"");
					}
				%>>05</option>
                  <option value="06" <%
					if(rs.getString("FT_H").equals("06")){
						out.print("selected=\"selected\"");
					}
				%>>06</option>
                  <option value="07" <%
					if(rs.getString("FT_H").equals("07")){
						out.print("selected=\"selected\"");
					}
				%>>07</option>
                  <option value="08" <%
					if(rs.getString("FT_H").equals("08")){
						out.print("selected=\"selected\"");
					}
				%>>08</option>
                  <option value="09" <%
					if(rs.getString("FT_H").equals("09")){
						out.print("selected=\"selected\"");
					}
				%>>09</option>
                  <option value="10" <%
					if(rs.getString("FT_H").equals("10")){
						out.print("selected=\"selected\"");
					}
				%>>10</option>
                  <option value="11" <%
					if(rs.getString("FT_H").equals("11")){
						out.print("selected=\"selected\"");
					}
				%>>11</option>
                  <option value="12" <%
					if(rs.getString("FT_H").equals("12")){
						out.print("selected=\"selected\"");
					}
				%>>12</option>
                  <option value="13" <%
					if(rs.getString("FT_H").equals("13")){
						out.print("selected=\"selected\"");
					}
				%>>13</option>
                  <option value="14" <%
					if(rs.getString("FT_H").equals("14")){
						out.print("selected=\"selected\"");
					}
				%>>14</option>
                  <option value="15" <%
					if(rs.getString("FT_H").equals("15")){
						out.print("selected=\"selected\"");
					}
				%>>15</option>
                  <option value="16" <%
					if(rs.getString("FT_H").equals("16")){
						out.print("selected=\"selected\"");
					}
				%>>16</option>
                  <option value="17" <%
					if(rs.getString("FT_H").equals("17")){
						out.print("selected=\"selected\"");
					}
				%>>17</option>
                  <option value="18" <%
					if(rs.getString("FT_H").equals("18")){
						out.print("selected=\"selected\"");
					}
				%>>18</option>
                  <option value="19" <%
					if(rs.getString("FT_H").equals("19")){
						out.print("selected=\"selected\"");
					}
				%>>19</option>
                  <option value="20" <%
					if(rs.getString("FT_H").equals("20")){
						out.print("selected=\"selected\"");
					}
				%>>20</option>
                  <option value="21" <%
					if(rs.getString("FT_H").equals("21")){
						out.print("selected=\"selected\"");
					}
				%>>21</option>
                  <option value="22" <%
					if(rs.getString("FT_H").equals("22")){
						out.print("selected=\"selected\"");
					}
				%>>22</option>
                  <option value="23" <%
					if(rs.getString("FT_H").equals("23")){
						out.print("selected=\"selected\"");
					}
				%>>23</option>
                </select>��
              <select name="select_M_f" id="select_M_f">
                <option value="00" <%
					if(rs.getString("FT_M").equals("00")){
						out.print("selected=\"selected\"");
					}
				%>>00</option>
                <option value="15" <%
					if(rs.getString("FT_M").equals("15")){
						out.print("selected=\"selected\"");
					}
				%>>15</option>
                <option value="30" <%
					if(rs.getString("FT_M").equals("30")){
						out.print("selected=\"selected\"");
					}
				%>>30</option>
                <option value="45" <%
					if(rs.getString("FT_M").equals("45")){
						out.print("selected=\"selected\"");
					}
				%>>45</option>
              </select>��</div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">���ʦa�I�G</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_location" value="<%= rs.getString("activity_location")%>"  class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right" ><div  class="col-padding"  style="margin-bottom:10px">���ʹ�H�G</div></td>
            <td ><div  style="margin-bottom:10px">
              <input type="text" size=30 name="activity_target" value="<%= rs.getString("activity_target")%>"  class="font10 input-style">
            </div></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʤ��СG</div></td>
            <td rowspan="9"><div  style="margin-bottom:10px"></div>
              <span style="margin-bottom:10px">
              <textarea name="activity_content" cols="50" rows="10"  class="font10 input-style"><%=rs.getString("change_text")%></textarea>
              </span></td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:0px"></div></td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td align="right"><div  class="col-padding"  style="margin-bottom:10px">���ʹϤ��G</div></td>
            <td><div  style="margin:15px 0px">
              <img src="images/activity_pic/<%= rs.getString("activity_pic")%>" width="50%" height="50%"><br>
              �ثe�ɦW�G<%=rs.getString("activity_pic")%><br>
              <input type="file" name="activity_pic" value="<%= rs.getString("activity_pic")%>" />
              </p>
            </div></td>
          </tr>
          <tr>
            <td colspan="2" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><input type="submit" value="�ק粒��" onClick="return check()" class="agree style4"/>
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
	}
	rs.close();
	stmt.close();

 	}//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
	 
%>
          </form>
    </div> <!--end of �]�_�Ӫ�padding-->
   </div><!--end of space-->
  
  <!---------end of bigright ---------></div>
<!--end of mainContent--></div>
  
  
  
  
  
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


</body>
</html>
