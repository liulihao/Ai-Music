<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="counter_member.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/member_page.css"rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
<style type="text/css">
<!--
.style18 {font-size: 9pt}
-->
</style>
</head>
<script src="js/prototype.js"></script>
<script src="js/member_page.js"></script>
<script src="js/Login.js"></script>
<% //�|�����
	String user_id = request.getParameter("user");//��|���Ŷ����|���b��
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	if(user_id==null){//�p�G�줣��|���Ŷ����}��?user=xxx���� ��ܬO���H�n�J �h�n�J��id=�|��id
		user_id=login_user;
	}
	Statement user=con.createStatement();//��|���Ŷ����|�����
	String user_sql = "SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where user_id ='"+user_id+"'";
	ResultSet user_data;
	user_data=user.executeQuery(user_sql);
	
%>

<body class="oneColFixCtrHdr" >
<div id="header">
<div style="padding-left:30px" align="left"><div style="width:320px" class="info_index"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
<span class="font10">�^����</span>
</div>
<%
	if (login_user == null)
	{
%>
<div class="font10 style4" style="position:absolute; left: 879px; top:9px; width: 89px; height: 14px;">   
    <table >
     <tr>
         <td><a href="#" onclick="openConfirm('<%=web_url%>')">�n�J</a></td>        
         <td><div style="margin-right:2px">|</div></td>  
         <td><a href="index_welcome.jsp">���U</a></td>
     </tr>
    </table></div>
	
<%
	}
	else
	{
%>
	<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a>
    
    <span >�ڭn���|</span>
    </div>
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
<form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()" >
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
<div id="container" align="left">
<div class="font 10" id="mainContent" align="right">
  <!--�|�����Y-->
  <div id="showid" class="font10 style4" align="left"> <a href="member_page.jsp?user=<%=user_id%>">���� </a><span class="style12">&gt;&nbsp;</span><a href="member_page.jsp?user=<%=user_id%>"><%=user_id%></a>
      <!--�o�̻ݭn��id�۰ʲ��ͱb���W��--></div>
  <!---------------------bigleft--------------------->
  <div id="bigleft" class="font10 style4">
    <!--About me title-->
    <div class="title style17 style7" align="left" style="position:relative"><strong>�����</strong>
        <div class="roundedCorners style4 style14 bar_left1"></div>
      <!--About me title end-->
    </div>
    <%while(user_data.next()){ //��Ʈw���|����ƪ����G%>
    <title><%=user_data.getString("user_nkname")%>���ӤH�Ŷ�</title>
    <!--aboutme-block-->
    <div id="aboutme-block" align="left">
      <div id="aboutme-block-pic" align="center" > <img src="user/<%=user_id%>/<%=user_data.getString("user_pic")%>" alt="" width="100" height="100"/> </div>
      <div align="left" class="style4 detail-block">�ʺ�:<%=user_data.getString("user_nkname")%></div>
      <div align="left" class="style4 detail-block">�~��:<%=user_data.getInt("user_age")%></div>
      <div align="left" class="style4 detail-block">�Ҧb����:<%=user_data.getString("user_city")%></div>
      <div align="left" class="style4 detail-block">�I�\��:<strong><%=user_data.getInt("user_count")%></strong></div>
      <%
	boolean Exist=false;
	boolean Check=false;
	Statement add_friend=con.createStatement();//��n�͸��
	String add_friend_sql="SELECT * FROM friend WHERE friend_id='"+user_id+"' AND user_id='"+login_user+"'";
	ResultSet add_friend_data;
	add_friend_data=add_friend.executeQuery(add_friend_sql);
	
	while(add_friend_data.next()){
			Exist=true;
			int friend_check=add_friend_data.getInt("friend_check");
				if(friend_check==0){
					Check=false;
				}else{
					Check=true;
				}
	}
	if (login_user == null)
	{
		out.print("<div class='style4 detail-block' align='left'></div>");
	}
	else if(user_id.equals(login_user)){//�p�G�n�J�b���P�|���Ŷ��b���ۦP  �h����ܥ[�J�n�ͫ��s
		out.print("<div class='style4 detail-block' align='left'></div>");
    }
	else if(Exist){//�p�G�w�g�O�ε��ݪB��  �h����ܥ[�J�n�ͫ��s
		if(Check){
			out.print("<div class='style4 detail-block' align='left'><font color='red'>�A�̤w�g���n��</font></div>");
		}else{
			out.print("<div class='style4 detail-block' align='left'><font color='red'>���ݹ��P�N�n��</font></div>");
		}
	}
	else if(!Exist && user_id != login_user)
	{   
	    out.print("<div align='right' style='padding-right:65px'>");
	    out.print("<div class='outfriend'>");
		out.print("<input type='button' value='�[�J�n��' onClick=\"AddFrd('"+login_user+"','"+user_id+"')\" class='infriend'/>");
		out.print("</div>");
		out.print("</div>");
    }
	else{
		out.print("<div class='style4 detail-block' align='left'><font color='red'>�S���p</font></div>");
    }
	add_friend.close();
	add_friend_data.close();
%>
      <!--�[�J�n��form-->
      <form action="" method="post" id="frmFriend" name="frmFriend">
        <input type="hidden" name="user_id" id="user_id" value="" />
        <input type="hidden" name="friend_id" id="friend_id" value="" />
      </form>
      <!--�[�J�n��end-->
      <!--about me end-->
    </div>
    <!--²��-->
    <div align="left" style="margin:30px 0  10px 0 ">�Q������:</div>
    <div id="intro-block" align="left" > <%=user_data.getString("user_intro")%>
        <!--end of ²��-->
    </div>
    <%
	 %>
    <!--�n�ͰʦV-->
    <%
		if(user_id.equals(login_user)){
	%>
    <div class=" title style17 style8" align="left"  style="margin-bottom:10px;position:relative" ><strong>�q�� </strong>
        <div class="roundedCorners style4 style14 bar_left2" ></div>
    </div>
    <!--end of -->
    

<%
		Statement friend_add = con.createStatement();//�[�J�n�ͥӽаT��
		sql="select * from friend,users where friend.friend_id='"+user_id+"' AND friend.user_id=users.user_id AND friend.friend_check = 0";
		ResultSet friend_add_data = friend_add.executeQuery(sql);
		
		String logout_time = user_data.getString("logout_time");
		Statement friend_agree = con.createStatement();//�P�N�A���n�ͥӽаT��
		sql="select * from friend,users where friend.friend_id='"+user_id+"' AND friend.user_id = users.user_id AND friend.friend_time > '" +logout_time+ "' AND friend.friend_check = 1";
		ResultSet friend_agree_data = friend_agree.executeQuery(sql);
		
		Statement track_opinion = con.createStatement();//�P�N�A���n�ͥӽаT��
		sql="select * from users,opinion,track where opinion.user_id ='"+user_id+"' AND opinion.post_id = users.user_id AND track.track_id = opinion.track_id AND opinion.time > '" +logout_time+ "'";
		ResultSet track_opinion_data = track_opinion.executeQuery(sql);
		
		if(!friend_add_data.next() && !friend_agree_data.next() && !track_opinion_data.next()){
			out.print("<font color='#FF0000'><p align = 'left'>�z�S������q��<p></font>");
		}
		else{
			friend_agree_data.previous();
			friend_add_data.previous();
			track_opinion_data.previous();
			while(friend_add_data.next()){//friend_add_data
		   //�p�G�ӷ|���Ŷ����b���P�B�ͪ�椤��user_id�۲ŦXif�d���ʦV
%><div id="div" align="left"  >
      <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
        <table width="236">
          <tr>
            <td class="style12"><%=friend_add_data.getDate("friend.friend_time")%> <%=friend_add_data.getTime("friend.friend_time")%></td>
          </tr>
          <tr>
            <td><a href="member_page.jsp?user=<%=friend_add_data.getString("users.user_id")%>"><span class="style14"><%=friend_add_data.getString("users.user_nkname")%></span></a> <span class="style13">�ӽЦ����z���n��</span></td>
          </tr>
          <tr>
            <td><a href="member_manage_friends.jsp"> <span class="color1">����</span></a> </td>
          </tr>
        </table>
      </div>
      </div> <!--<div id="div" align="left"  >����-->
      <%	
	  	}//while(friend_add_data)
		
		while(friend_agree_data.next()){//friend_agree_data
		   //�p�G�ӷ|���Ŷ����b���P�B�ͪ�椤��user_id�۲ŦXif�d���ʦV
%><div id="div" align="left"  >
      <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
        <table width="236">
          <tr>
            <td class="style12"><%=friend_agree_data.getDate("friend.friend_time")%> <%=friend_agree_data.getTime("friend.friend_time")%></td>
          </tr>
          <tr>
            <td><a href="member_page.jsp?user=<%=friend_agree_data.getString("users.user_id")%>"><span class="color1"><%=friend_agree_data.getString("users.user_nkname")%></span></a> <span class="style13">�w�P�N�z���n�ͥӽ�</span></td>
          </tr>
        </table>
      </div>
      </div> <!--<div id="div" align="left"  >����-->
      <%	
	  	}//while(friend_agree_data)
		
		while(track_opinion_data.next()){//friend_agree_data
		   //�p�G�ӷ|���Ŷ����b���P�B�ͪ�椤��user_id�۲ŦXif�d���ʦV
%><div id="div" align="left"  >
      <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
        <table width="236">
          <tr>
            <td><span class="style13"><%=track_opinion_data.getDate("opinion.time")%>&nbsp;<%=track_opinion_data.getTime("opinion.time")%></span></td>
          </tr>
          <tr>
            <td><a href="member_page.jsp?user=<%=track_opinion_data.getString("users.user_id")%>"><span class="color1"><%=track_opinion_data.getString("users.user_nkname")%></span></a><span class="style13">��A���q��</span><a href="member_page_music_song.jsp?music_id=<%=track_opinion_data.getInt("track.track_id")%>"><span class="color1"><%=track_opinion_data.getString("track.track_name")%></span></a><span class="style13">�o��F�N��</span></td>
          </tr>
        </table>
      </div>
      </div> <!--<div id="div" align="left"  >����-->
      <%	
	  	}//while(track_opinion_data)
		
		}//else
	  }//if login
	  }//user
     user.close();
	 user_data.close();
     //End of ��Ʈw���|����ƪ����G
		%>
    
    <!--�n�ͰʦVEND-->
    <!--end of bigleft-->
  </div>
  <!--------------------------�k�䪺div-------------------------->
  <div  id="bigright" class="font10" >
    
    
    <div  align="left" class="redline-title" >
     <span class="style17" style="color:#444444">�̷s�q��</span>
     <div class="roundedCorners " style="position:absolute; z-index:1000; background-color:#444444; width: 186px; height: 59px; left: -1px; top: 19px; width:662px; height:8px; -moz-opacity: 0.3; opacity: 0.3;" ></div>
     <!--�̷s�q��end--></div>

<!--�������jdiv-->
    <div class="space1"> 
  
<!--�̷s�q��title-->
      <!----------����title---------->
      <%
   sql="select * from track where user_id='"+user_id+"'  ORDER BY track_time DESC limit 15";
   ResultSet song;
   song=stmt.executeQuery(sql);
   while(song.next()){
     String track_name=song.getString("track_name");
	 String track_id=song.getString("track_id");//�q�����s��
	 
%>  
     <div  align="left" class="style4 song" > 
       <table width="658" border="0">
        <tr><!--�Ǻq���s��-->
             <td width="538" class="title-name"><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%=track_name%></a></td>
            <td width="108"  class="title-style" align="right">&lt;
            
			
			<%
		    Statement track_type=con.createStatement();//��q������ NATURAL JOIN�d��
		    String track_type_sql="SELECT music_type.music_genre FROM music_type,track_type where music_type.music_id=track_type.music_id and track_type.track_id='"+track_id+"'";
			
			ResultSet track_type_data;
            track_type_data=track_type.executeQuery(track_type_sql);
			if(!track_type_data.next()){
				out.print("���w�q");
			}else{
				track_type_data.previous();
				while(track_type_data.next()){
			 		out.print(track_type_data.getString("music_type.music_genre"));
			 		out.print(" ");
			 	}
			 }
			 track_type.close();
			 track_type_data.close();
		  %> &gt;</td>
          </tr>
        </table>            
     </div>  
     
     <%
	 }
	 song.close();
	 %>
     <div  align="right" class="font10 style4 " >
       &gt;<a href="member_page_music.jsp?user=<%=user_id%>">more</a></div>
     
 <!--�������jdiv  end--></div> 
 
 <!--�̷s�n��title-->
<div  align="left" class="redline-title"   > <span class="style17" style="color:#444444">�̷s�B��</span>
     <div class="roundedCorners" style="position:absolute; z-index:1000; background-color:#444444; width: 186px; height: 59px; left: 1px; top: 20px; width:662px; height:8px; -moz-opacity: 0.3; opacity: 0.3;" ></div>
    <!--�̷s�q��end-->
</div>


<!--�������jdiv-->
    <div class="space" > 


<%//��n�ͪ��Ϥ�.�ʺ�.id�X��
  sql="select * from friend where user_id='"+user_id+"' AND friend.friend_check = 1 ORDER BY friend_time DESC limit 5";//��|���Ŷ����n��
   rs=stmt.executeQuery(sql);
   
  while(rs.next()){
     String friend_id=rs.getString("friend_id");
	 
	  Statement friend=con.createStatement();//��friend�����
      String friend_sql="select * from users where user_id='"+friend_id+"'";
      ResultSet friend_data;
      friend_data=friend.executeQuery(friend_sql);
	  
    while(friend_data.next()){
	  String friend_nkname=friend_data.getString("user_nkname");
      String friend_pic=friend_data.getString("user_pic");
%> 
         <div class="friend-block" align="center"> 
   <a href="member_page.jsp?user=<%=friend_id%>"><img src="user/<%=friend_id%>/<%=friend_pic%>" width="90" height="90" /></a><br /><a href="member_page.jsp?user=<%=friend_id%>"><%=friend_nkname%></a></div>  
      
<%
   }//friend
   friend_data.close();
   friend.close();
   }
   //rs
   rs.close();
%>
   <!--�̷s�n��end-->      
                <!--��h����-->
                <div style="clear:both"></div>
<div  align="right" class="font10 style4 " >&gt;<a href="member_page_friend.jsp?user=<%=user_id%>">more</a></div>   
<!--��h����-->   
<!--�������jdiv  end--> </div> 



<!--�������jdiv-->
<div  align="left" class="redline-title"   > <span class="style17" style="color:#444444">�̷s����</span>
    <div class="roundedCorners" style="position:absolute; z-index:1000; background-color:#444444; width: 186px; height: 59px; left: 1px; top: 20px; width:662px; height:8px; -moz-opacity: 0.3; opacity: 0.3;" ></div>
  <!--�̷s�q��end-->
</div>
<div class="space">
<!--�̷s�q��title--> 

    
<%
   sql="select *, CHAR_LENGTH(track.track_name) AS track_name_num, LEFT(track_name,9) AS c_track_name from music_collection,track,users where track.user_id=users.user_id AND music_collection.track_id = track.track_id AND login_id='"+user_id+"' order by music_collection.collect_date DESC LIMIT 4";
   rs=stmt.executeQuery(sql);
   while(rs.next()){
     int track_id=rs.getInt("track.track_id");
	 String user_id1=rs.getString("track.user_id");
	 String user_nkname1=rs.getString("users.user_nkname");
	 String collect_date=rs.getString("music_collection.collect_date");
	 String track_pic1=rs.getString("track.track_pic");
	
	   String track_name=rs.getString("track_name");//�즱�W
%>          
<!-- ���֦���-->
<div class="song-block" align="left" style="float:left">
    
    <div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><img src="user/<%=user_id1%>/music/<%=track_pic1%>" alt="" width="60" height="60"/></a></div>    
    <div  align="left" class="style4 detail-block">�ʺ١G<a href="member_page.jsp?user=<%=user_id1%>"><%=user_nkname1%></a></div>
    <div  align="left" class="style4 detail-block">�q�W�G<a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%if(rs.getInt("track_name_num") > 8){%><%=rs.getString("c_track_name")%>...<%}else{%><%=rs.getString("track.track_name")%><%}%></a></div>
    <div  align="left" class="style4 detail-block"><span class="style12 ">���ä���G<%=collect_date%></span></div>
    <div  align="right" class="style4 detail-block" ><span class="style12">&gt;&nbsp;</span><a href="member_page_music_song.jsp?music_id=<%=track_id%>" class="style18">�I������</a></div>
    <!--���֦��� end-->
</div>
<%
	
	  }
	  stmt.close();
	  con.close();
	
	%> 
  <div style="clear:both"></div>
  <div  align="right" class="font10 style4 " >&gt;<a href="member_page_song-loved.jsp?user=<%=user_id%>">more</a></div>
    </div>  
<!--��h����-->

<!--��h����-->   

  </div>
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>
<script type="text/javascript">

function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "feedback/feedback.jsp?user=<%=user_id%>&web_url=<%=web_url%>"})
			}
</script>
</body>
</html>
