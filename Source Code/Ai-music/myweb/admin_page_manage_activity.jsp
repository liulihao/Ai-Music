<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���ʺ޲z</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/admin_page_manage-activity.css" rel="stylesheet" type="text/css" />
<!--���ҭ��O-->
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
</script>
</head>
<% //��x�޲z�̸��
 
 String login_user=(String)session.getAttribute("user_id");
 Statement admin = con.createStatement();
 String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
 ResultSet admin_data = admin.executeQuery(admin_sql);

 %>
<body class="oneColFixCtrHdr" >
<div id="header">
<div style="padding-left:30px" align="left"><img src="../music3.jpg" width="320" />

<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�޲z�̱z�n</div>
   <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>�n�X</span>
    </div>

    <form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
   <div id="search" style=" position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"  class="info_search">  
   
   <span class="font10 style4">�п�J�j�M�r��</span>
   
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style" >
          <option value="song_name" selected>�q�W</option>
          <option value="member_name">�|��</option>
          </select></td>        
        <td width="82"><input type="submit" value="�j�M" class="search-style"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
</div>



<div id="container"  align="left">
<p>&nbsp;</p>
  <div class="font 10" id="mainContent" align="right">
<div id="showid" class="font10 style4" align="left">
<!--�|�����Y-->
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
<div  id="bigright" class="font10 right roundedCorners" align="left">

 <!--�˹��Ϊ��ť�-->
 <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
 <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
<!--end of �˹��Ϊ��ť�-->

<div class="space">
  
  <div id="activity-title" ><div  class="font10 style2 roundedCorners" style=" padding-left:10px">���ʺ޲z</div></div>

<%
	int id = 0;
	rs=stmt.executeQuery("SELECT *, DAYNAME(activity_date_s) AS DAYNAME_s, DAYNAME(activity_date_f) AS DAYNAME_f FROM activity_info ORDER BY activity_insert DESC");
	while(rs.next())
	{
		id = rs.getInt("activity_code");
		%>
		<div class="table-padding font10 style4">
        <form action="delete.jsp" method="post" onsubmit"">
		<table width="600"  >
  		<tr>
    	<td width="84"><div align="center">���ʽs���G</div></td>
    	<td width="504"><%=rs.getInt("activity_code")%> </td>
 	 	</tr>
  		<tr>
  		  <td ><div align="center">���ʦW�١G</div></td>
  		  <td ><%=rs.getString("activity_title")%></td>
		  </tr>
  		<tr>
  		  <td><div align="center">���ʤ���G</div></td>
  		  <td ><%= rs.getString("activity_date_s")%>&nbsp;(<%= rs.getString("DAYNAME_s")%>) ~ <%= rs.getString("activity_date_f")%>&nbsp;(<%= rs.getString("DAYNAME_f")%>)</td>
		  </tr>
  		<tr>
  		  <td><div align="center">���ʦa�I�G</div></td>
  		  <td ><%=rs.getString("activity_location")%></td>
		  </tr>
  		<tr>
  		  <td><div align="center">���ʹ�H�G</div></td>
    	<td ><%=rs.getString("activity_target")%></td>
		  </tr>
  		<tr>
  		  <td><div align="center">�W�Ǯɶ��G</div></td>
  		  <td ><%=rs.getDate("activity_insert")%>&nbsp;<%=rs.getTime("activity_insert")%></td>
		  </tr>
<%
		if(rs.getString("activity_update") == null){
		}
		else{
%>
  		<tr>
  		  <td><div align="center">�ק�ɶ��G</div></td>
  		  <td ><%=rs.getString("activity_update")%></td>
		  </tr>
<%
		}//else
%>
		</table>
        <td width='85'>
        <div align="center" class="small-grayblock2"><a href='admin_page_activity_edit.jsp?id=<%=id%>'>�ק�</a></div>
      	<div align="center" class="small-grayblock2"><a href='admin_page_activity_del.jsp?id=<%=id%>'>�R��</a></div>
        <div style="clear:both"></div>
        </form>
        <hr size="1" style="margin-bottom:20px;width:635px" color="#E5E5E5" />
		</div><p>
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

<!--end of �]�_�Ӫ�padding-->
<!--end of space--></div>
<!--end of bigright--></div>
<!--end of mainContent--></div>

<!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

</body>
</html>