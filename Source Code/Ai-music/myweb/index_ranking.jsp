<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.text.DecimalFormat" %><!--���������ƪ��p���I�һݭn���禡�w--> 
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�Ʀ�]</title>

<!--�o�̥Ϊ�CSS-->
<link href="../CSSfile/index_ranking.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>
<!--���ҭ��O-->
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="js/Login.js"></script>

<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />

<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
    
    <link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
    
    <link href="../SpryAssets/SpryTabbedPanels_list.css" rel="stylesheet" type="text/css" /></head>

<body class="thrColAbsHdr">

<script type="text/javascript">
			window.addEvent('domready', function(){
				var myMenu = new ImageMenu($$('#imageMenu a'),{openWidth:310, border:2, onOpen:function(e,i){alert(e);}});
			});
</script>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3333085-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>
<div id="header" >
  <div style="padding-left:30px" align="left"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
      <%
	String login_user=(String)session.getAttribute("user_id");
	if (login_user == null)
	{
%>
      <div class="font10 style4" style="position:absolute; left: 879px; top:9px; width: 89px; height: 14px;">
        <table>
          <tr>
            <td><a href="#" onclick="openConfirm('<%=web_url%>')">�n�J</a></td>
            <td><div style="margin-right:2px">|</div></td>
            <td><a href="index_welcome.jsp">���U</a></td>
          </tr>
        </table>
      </div>
    <%
	}
	else
	{
%>
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>�ڪ��޲z����</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
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
  <div class="font10  manubar  link" >
    <!-- end #header  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 386px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 777px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px; background:#E5E5E5; left: 582px; top: 13px;"></div>
  <div style="position:absolute; width:2px; height:15px;; background:#E5E5E5; left: 189px; top: 13px;"></div>-->
    <table width="980" class="font10" >
      <tr>
        <td width="196" align="center" ><a href="index.jsp">����</a></td>
        <td width="196" align="center" ><a href="member/index_discuss.jsp">�Q�װ�</a></td>
        <td width="196" align="center" ><a href="index_activity.jsp">��������</a></td>
        <td width="196" align="center" ><a href="index_music-list.jsp">�����˯�</a></td>
        <td width="196" align="center" ><a href="index_ranking.jsp">�Ʀ�]</a></td>
      </tr>
    </table>
  </div>
</div>
<div id="container">

<p>&nbsp;</p>

<div id="mainContent" class="font10">
  <div id="TabbedPanels1" class="TabbedPanels" align="center">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">�|���Ʀ�]</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">�Ч@�q���Ʀ�]</li>
        <li class="TabbedPanelsTab-change roundedCorners" tabindex="0">½�ۺq���Ʀ�]</li>
      </ul>
      <div class="TabbedPanelsContentGroup-change"> 
      
		<!--�Ʀ�]1-->
		<div class="TabbedPanelsContent">
		<div class="border">
		<table width="694" cellpadding="4" cellspacing="8" bgcolor="#FFFFFF">
		<tr align="center" >
		<td width="70" height="30" >�W��</td>
		<td width="133" >�|���W��</td>
		<td width="109">�I�\��</td>
        <td width="109">�q���`��</td>
		</tr>
		<%
			int counter_m = 1;
			
			String user_id_m, user_nkname_m;
			int user_count_m;
			
			sql="SELECT * FROM users WHERE user_authority = 0 ORDER BY user_count DESC LIMIT 20";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				user_id_m = rs.getString("user_id");
				user_nkname_m = rs.getString("user_nkname"); 
				user_count_m = rs.getInt("user_count");
				
				Statement song_number_con=con.createStatement();//�p��q���`��	
				String song_number_sql="SELECT COUNT(*) as num FROM track WHERE track.user_id = '"+user_id_m+"'";
				ResultSet song_number_data=song_number_con.executeQuery(song_number_sql);
				int song_number = 0;
				while(song_number_data.next()){
					song_number = song_number_data.getInt("num");
				}
				
				if (counter_m % 2 == 0)
					out.print("<tr>");
				else
					out.print("<tr bgcolor=\"#DCDCDC\">");
				out.print("<td height=\"30\" align=\"center\">"+counter_m+"</td>");
				out.print("<td align=\"center\"><a href = member_page.jsp?user="+user_id_m+">"+user_nkname_m+"</a></td>");		
				out.print("<td align=\"center\">"+user_count_m+"</td>");
				out.print("<td align=\"center\">"+song_number+"</td>");
				out.print("</tr>");
				counter_m++;
			}
		%>
		</table>
		</div>
		</div>
        
		<!--�Ʀ�]2-->
		<div class="TabbedPanelsContent">
		<div class="border">
		<table width="750" cellpadding="4" cellspacing="8" bgcolor="#FFFFFF">
		<tr align="center" >
		<td width="50" height="30" >�W��</td>
        <td width="250" align="left">&nbsp;&nbsp;�q���W��</td>
        <td width="140" >�|���W��</td>
		<td width="70">�I�\��</td>
        <td width="100">��������</td>
        <td width="100">�����H��</td>
		</tr>
		<%
			int counter_c = 1, track_id_c;
			String track_name_c, user_nkname_c, user_id_c;
			int track_count_c;
			sql="SELECT * FROM track,users WHERE sing_type = 1 AND users.user_id = track.user_id ORDER BY track_count DESC LIMIT 20";
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				track_id_c = rs.getInt("track_id");
				track_name_c = rs.getString("track_name");
				user_nkname_c = rs.getString("user_nkname");
				user_id_c = rs.getString("user_id");
				track_count_c = rs.getInt("track_count");
				
				//�H�U���p������H�ƥH�Υ������ƪ��{���X
        		Statement song=con.createStatement();//�p������H��	
				String song_sql="SELECT COUNT(*) as num FROM evaluation WHERE track_id="+track_id_c;
				ResultSet song_value=song.executeQuery(song_sql);
				int evaluation_num = 0;
				while(song_value.next()){
					evaluation_num = song_value.getInt("num");
				}
		
				String star_value_sql="SELECT * FROM evaluation WHERE track_id="+track_id_c;
				ResultSet star_value=song.executeQuery(star_value_sql);
				double total_star =0;
				while(star_value.next()){
					int star = star_value.getInt("star");
					total_star += star;
				}
				double avg_star = total_star/evaluation_num;
				DecimalFormat nf = new DecimalFormat("###,##0.00");
				//�H�W���p������H�ƥH�Υ������ƪ��{���X
				
				if (counter_c % 2 == 0)
					out.print("<tr>");
				else
					out.print("<tr bgcolor=\"#DCDCDC\">");
				out.print("<td height=\"30\" align=\"center\">"+counter_c+"</td>");
				out.print("<td align=\"left\">&nbsp;&nbsp;<a href = member_page_music_song.jsp?music_id="+track_id_c+">"+track_name_c+"</a></td>");
				out.print("<td align=\"center\"><a href = member_page.jsp?user="+user_id_c+">"+user_nkname_c+"</a></td>");		
				out.print("<td align=\"center\">"+track_count_c+"</td>");
				out.print("<td align=\"center\">"+nf.format(avg_star)+"</td>");
				out.print("<td align=\"center\">"+evaluation_num+"</td>");
				out.print("</tr>");
				counter_c++;
			}
		%>
		</table>
		</div>
		</div>
        
		<!--�Ʀ�]3-->
		<div class="TabbedPanelsContent">
		<div class="border">
		<table width="750" cellpadding="4" cellspacing="8" bgcolor="#FFFFFF">
		<tr align="center" >
		<td width="50" height="30" >�W��</td>
        <td width="250" align="left">&nbsp;&nbsp;�q���W��</td>
        <td width="140" >�|���W��</td>
		<td width="70">�I�\��</td>
        <td width="100">��������</td>
        <td width="100">�����H��</td>
		</tr>
		<%
			int counter_s = 1, track_id_s;
			String track_name_s, user_nkname_s, user_id_s;
			int track_count_s;
			sql="SELECT * FROM track,users WHERE sing_type = 2 AND users.user_id = track.user_id ORDER BY track_count DESC LIMIT 20";
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				track_id_s = rs.getInt("track_id");
				track_name_s = rs.getString("track_name");
				user_nkname_s = rs.getString("user_nkname");
				user_id_s = rs.getString("user_id");
				track_count_s = rs.getInt("track_count");
				
				//�H�U���p������H�ƥH�Υ������ƪ��{���X
        		Statement song=con.createStatement();//�p������H��	
				String song_sql="SELECT COUNT(*) as num FROM evaluation WHERE track_id="+track_id_s;
				ResultSet song_value=song.executeQuery(song_sql);
				int evaluation_num = 0;
				while(song_value.next()){
					evaluation_num = song_value.getInt("num");
				}
		
				String star_value_sql="SELECT * FROM evaluation WHERE track_id="+track_id_s;
				ResultSet star_value=song.executeQuery(star_value_sql);
				double total_star =0;
				while(star_value.next()){
					int star = star_value.getInt("star");
					total_star += star;
				}
				double avg_star = total_star/evaluation_num;
				DecimalFormat nf = new DecimalFormat("###,##0.00");
				//�H�W���p������H�ƥH�Υ������ƪ��{���X
				
				if (counter_s % 2 == 0)
					out.print("<tr>");
				else
					out.print("<tr bgcolor=\"#DCDCDC\">");
				out.print("<td height=\"30\" align=\"center\">"+counter_s+"</td>");
				out.print("<td align=\"left\">&nbsp;&nbsp;<a href = member_page_music_song.jsp?music_id="+track_id_s+">"+track_name_s+"</a></td>");
				out.print("<td align=\"center\"><a href = member_page.jsp?user="+user_id_s+">"+user_nkname_s+"</a></td>");		
				out.print("<td align=\"center\">"+track_count_s+"</td>");
				out.print("<td align=\"center\">"+nf.format(avg_star)+"</td>");
				out.print("<td align=\"center\">"+evaluation_num+"</td>");
				out.print("</tr>");
				counter_s++;
			}
		%>
		</table>
   <!--end of �ꨤ���--></div>
        </div>
      </div>
    </div>
    <div style="clear:both"></div>
  </div>
  
  
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--datacheck-->
<script type="text/javascript">
function datacheck(){	
	//�p�GID���ť� �B�z�P�m�W
	if(member.user_id.value==""){
		window.alert("ID���o���ť�!");
		//focusto(4);
		return false;
		}
	
//submit����Ʀ�WEBsever
	member.submit();
}
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>

</body>
</html>
