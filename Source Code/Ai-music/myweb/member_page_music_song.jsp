<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="counter_member.jsp"%>
<%@include file="counter_track.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%response.setHeader("Cache-Control", "no-cache");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���֭���</title>
<!--�o�̥Ϊ�css-->

<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="js/opinion.js" type="text/javascript"></script>
<script src="js/member_page.js"></script>
<script src="js/Login.js"></script>
<script type="text/javascript" src="swfobject.js"></script>
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
    <link href="../CSSfile/member_page_music_song.css" rel="stylesheet" type="text/css" />
</head>
<%
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	String music_id=request.getParameter("music_id");//�q�����s�� ���񾹥�
	Statement track=con.createStatement();//��q�����
	String track_sql="SELECT * FROM track WHERE track_id='"+music_id+"'";
	ResultSet track_data;
	track_data=track.executeQuery(track_sql);
	while(track_data.next()){
		String music=track_data.getString("track_file");
		String user_id=track_data.getString("user_id");
		//�����Q��track��ƪ�̪�user_id�h��users��ƪ�̪����
		Statement user=con.createStatement();
		String user_sql="SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users WHERE user_id ='"+user_id+"'";
		//�I�s��Ʈw���q���Ҧ��H�����
		ResultSet user_data;
		user_data=user.executeQuery(user_sql);
%>
		<body class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left">
    <div style="width:320px" class="info_index"><a href="index.jsp"><img src="../music3.jpg" width="320" />  </a> <span class="font10">�^����</span> </div>
  
      <%
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
    </table></div>
    <%
	}
	else
	{
%>
      <div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >�ڭn���|</span> </div>
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
<div id="container" align="left">
<div class="font 10" id="mainContent" align="right" >
		
				<!--�|�����Y-->
				<div id="showid" class="font10 style4" align="left"> <a href="member_page.jsp?user=<%=user_id%>">���� </a><span class="style12">&gt;&nbsp;</span><a href="member_page.jsp?user=<%=user_id%>"><%=user_id%></a>
					<!--�o�̻ݭn��id�۰ʲ��ͱb���W��-->
				</div>
				<div id="bigleft" class="font10 style4">
                  <!--About me title-->
                  <div class="title style17 style7" align="left" style="position:relative"><strong>�����</strong>
                      <div class="roundedCorners style4 style14 bar_left1"></div>
                    <!--About me title end-->
                  </div>
				  <%while(user_data.next()){ //��Ʈw���|����ƪ����G%>
              
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
                  <div align="left" style="margin:7px 0  10px 0 ">�Q������:</div>
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
%>
				  <div id="div" align="left"  >
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
			      </div>
				  <!--<div id="div" align="left"  >����-->
                  <%	
	  	}//while(friend_add_data)
		
		while(friend_agree_data.next()){//friend_agree_data
		   //�p�G�ӷ|���Ŷ����b���P�B�ͪ�椤��user_id�۲ŦXif�d���ʦV
%>
				  <div id="div" align="left"  >
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
			      </div>
				  <!--<div id="div" align="left"  >����-->
                  <%	
	  	}//while(friend_agree_data)
		
		while(track_opinion_data.next()){//friend_agree_data
		   //�p�G�ӷ|���Ŷ����b���P�B�ͪ�椤��user_id�۲ŦXif�d���ʦV
%>
				  <div id="div" align="left"  >
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
			      </div>
				  <!--<div id="div" align="left"  >����-->
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
  <div id="bigright" class="font10 style4" align="left">

		<!--�q��title-->
		<div id="title" align="center" class=" style4 roundedCorners" ><%=track_data.getString("track_name")%>
		<!--�q��title end--></div>
		
		<!--player div-->
		<div align="left" class="font10  style4" id="change" style="margin-bottom:10px;z-index:1;visibility:visible;" >
		  <div  style="margin-bottom:20px;z-index:1;visibility:visible;"><img src="user/<%=user_id%>/music/<%=track_data.getString("track_pic")%>" alt="" width="100" height="100"/></div>
		  <script type="text/javascript">
<%out.print("AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','192','height','67','src','playerSinglePackage/playerSingle?soundPath=user/"+user_id+"/music/"+music+"&autoPlay=yes','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','playerSinglePackage/playerSingle?soundPath=user/"+user_id+"/music/"+music+"&autoPlay=yes' );"); //end AC code%>
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="192" height="67">
        <param name="movie" value="playerSinglePackage/playerSingle.swf">
        <param name="quality" value="high">
      <%  out.print("<embed src='playerSinglePackage/playerSingle.swf?soundPath=user/"+login_user+"/music/"+music+"&autoPlay=yes' quality='high' pluginspage='http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='192' height='67'></embed>");%>
      </object></noscript>
		</div>
		<!--end of player div-->
		
        <div align="left" style="margin-bottom:20px;" ><table width="0">
  <tr>
  	<td width="130">�t������:<span style="font-weight:bold"><%
		if(track_data.getInt("sing_type")==1){
			out.print("�Ч@");
		}else{
			out.print("½��");
		}
	%></span>
	</td>
    <td>�I�\��:<span style="font-weight:bold;font-size:15px"><strong><%=track_data.getString("track_count")%></strong></span></td>
  </tr>
</table>
</div>
        
		<!----------�q����ƪ��----------->
		<div class="style4" style=" margin-bottom:20px; " align="left">
		<table width="652" border="0"  >
		<tr>
		<td width="274" class="song-infoblock1 font10">�t�ۤH: <%=track_data.getString("track_singer")%></td>
		<td width="348" class="song-infoblock1 font10">�y��:
		<%
			if(!track_data.getString("track_language_other").equals("0"))
			{
				out.print(track_data.getString("track_language_other"));
			}
			else
			{
				Statement language_type=con.createStatement();//��q������ NATURAL JOIN�d��
				String language_type_sql="SELECT language_type.language_variety FROM language_type,track where track.track_language_id=language_type.language_id and track.track_id='"+music_id+"'";
				ResultSet language_type_data;
				language_type_data=language_type.executeQuery(language_type_sql);
				while(language_type_data.next())
				{
					out.print(language_type_data.getString("language_type.language_variety"));
				}
				language_type.close();
				language_type_data.close();
			}
		%>		</td>
        </tr>
		<tr>
		<td class="song-infoblock1 font10">�@���H: <%=track_data.getString("track_lyricist")%></td>
		<td class="song-infoblock1 font10">�@���H: <%=track_data.getString("track_composer")%></td>
		</tr>
		<tr>
		<td class="song-infoblock1 font10">�s���H: <%=track_data.getString("track_arranger")%></td>
		<td class="song-infoblock1 font10">�����M��: <%=track_data.getString("track_album")%></td>
		</tr>
		<tr>
		<td class="song-infoblock1 font10">���v�Ҧ�: <%=track_data.getString("track_right")%></td>
		<td class="song-infoblock1 font10">����:<span class="song-infoblock2">
		<%
			Statement track_type=con.createStatement();//��q������ NATURAL JOIN�d��
			String track_type_sql="SELECT music_type.music_genre, track_type.music_id FROM music_type NATURAL JOIN track_type where track_type.track_id='"+music_id+"'";
			ResultSet track_type_data;
			track_type_data=track_type.executeQuery(track_type_sql);
			if(!track_type_data.next()){
				out.print("���w�q");
			}else{
				track_type_data.previous();
				while(track_type_data.next())
				{
					out.print(track_type_data.getString("music_type.music_genre"));
					out.print(" ");
				}
			}
		%>
		</span></td>
		</tr>
		<tr>
		<td class="song-infoblock1 font10"><%if(user_id.equals(login_user)){//���x �ק�Ӻq����T%>
        <!--�ק�Ӻq����T--><!--end of �ק�Ӻq����T--><span class="style4" style=" margin-bottom:20px;"><span class="style4" style=" margin-bottom:20px;">
       <!-- <input type="button" class="revise-block style4" value="�קﭵ�ָ��" onclick="location.href='member_manage_manage-music_revise.jsp?music_id=<%=music_id%>'" />-->
        </span></span>
        <%}%></td>
		<td class="song-infoblock1 font10">&nbsp;</td>
		</tr>
		<tr>
		<td class="song-infoblock1 font10 " colspan="2"><span class="style13">�W�Ǯɶ�: <%=track_data.getDate("track_time")%>&nbsp;<%=track_data.getTime("track_time")%></span></td>
		<td width="16" class="song-infoblock1 "><input type="hidden" name="track_id" value="<%=track_data.getString("track_id")%>"></td>
		</tr>
		<%if(track_data.getDate("revise_date")!=null){
		%>
        <tr>
		<td class="song-infoblock1 font10 " colspan="2"><span class="style13">�̫�ק�ɶ�: <%=track_data.getString("revise_date")%>&nbsp;<%=track_data.getString("revise_time")%></span></td>
		</tr>
        <%
        }
		%>
		</table>
		
        
	  </div><!--�q����ƪ��end-->
        
<%
		int track_id=track_data.getInt("track_id");//��q���s�� �q�����
%>

		<!--���í���-->
		<div>
       <%
	boolean Exist=false;
	Statement collect_music=con.createStatement();//�즬�í��ָ��
	String collect_music_sql="SELECT * FROM music_collection WHERE track_id="+track_id+" and login_id='"+login_user+"'";//�o�ɭԭn��music_id�A�OString���A�A�b��34�榳�ŧi�ç��(getParameter)
	ResultSet collect_music_data;
	collect_music_data=collect_music.executeQuery(collect_music_sql);
	while(collect_music_data.next()){
			Exist=true;
	}
	if (login_user == null) //�p�G�S���n�J�A�h�L�k���í���
	{
		out.print("<div class='style4 detail-block' align='left'></div>");
	}
	else if(user_id.equals(login_user)){//�p�G�n�J�b���P�|���Ŷ��b���ۦP�A�h����ܦ��í��֫��s
		out.print("<div class='style4 detail-block' align='left'></div>");
    }
	else if(Exist){//�p�G�w�g�����áA�h����ܦ��í��֫��s�A��ܤw���ðT��
		out.print("<div class='style4 detail-block' align='left'><font color='red'>�A�w�g���óo�����֤F</font></div>");
	}
	else if(!Exist && user_id != login_user)
	{
	    out.print("<div class='outlove'>");
		out.print("<div align='left'><input type='button' class='inlove ' value='���óo������' onClick=\"musicCollect("+track_id+",'"+user_id+"','"+login_user+"')\" class='style4 detail-block'/></div>"); //�o��{���X�]�O�eString���A��music_id�A�ҥH�n�[""
        out.print("</div >");
	}
	else{
		out.print("<div class='style4 detail-block' align='left'><font color='red'>�S���p</font></div>");
    }
	collect_music.close();
	collect_music_data.close();
%>
		<FORM action="" method=POST id="frmCollect" name="frmCollect">
		<input type="hidden" name="collect_track_id" id="collect_track_id" value=""> <!--�o�檺track_id�w�g�g�LAjax�禡(��271)�A��value�s�b�A����A�e��save_songCollect.jsp�ɮ׸̡A�ç���INSERT���u�@-->
		<input type="hidden" name="user_id" id="user_id" value="">
		<input type="hidden" name="login_id" id="login_id" value="">
		</FORM>
		<!--���í���end-->
		<!--�q������-->
        
        <%
        Statement song=con.createStatement();//�p������H��
		
		
		String song_sql="SELECT COUNT(*) as num FROM evaluation WHERE track_id="+track_id;
		ResultSet song_value=song.executeQuery(song_sql);
		int evaluation_num = 0;
		while(song_value.next()){
			evaluation_num = song_value.getInt("num");
		}
		
		String star_value_sql="SELECT * FROM evaluation WHERE track_id="+track_id;
		ResultSet star_value=song.executeQuery(star_value_sql);
		double total_star =0;
		while(star_value.next()){
			int star = star_value.getInt("star");
			total_star += star;
		}
		double avg_star = total_star/evaluation_num;
		%>
        
		<div align="right">
		  ���������G
		    <%
			int full_star = (int)Math.floor(avg_star);
			int empty_star = 5 - (int)Math.ceil(avg_star);
			int half_star = 0;
			if(((avg_star+empty_star)>=4.5)&&((avg_star+empty_star)!=5)){
				half_star = 1;
			}
			int s = 0,t = 0;
			for(s=1; s<full_star+1; s++){
			%>
				<img src="images/star.png"/>
	          <%
            }
			if(half_star==1){
			%>
				<img src="images/star_half.png"/>
	          <%
			}
			for(t=full_star+half_star+1; t<=5; t++){
			%>
				<img src="images/star_empty.png"/>
            <%
			}
		%>
        
            <%
		boolean evaluate_Exist=false;
		int evaluated_star = 0;
		Statement evaluate=con.createStatement();//��������
		String evaluate_sql="SELECT * FROM evaluation WHERE post_id='"+login_user+"' AND track_id="+track_id;
		ResultSet evaluate_data;
		evaluate_data=evaluate.executeQuery(evaluate_sql);
	
		while(evaluate_data.next()){
			evaluate_Exist=true;
			evaluated_star = evaluate_data.getInt("star");
		}
		if(login_user == null){
			out.print("<font color='red'><br><strong>�����n�J��~���o���q����</strong></font>");
		}
		else if(login_user.equals(user_id)){
			out.print("<font color='red'><br><strong>�z�����ۤv���q������</strong></font>");
		}
		else if(evaluate_Exist){ //evaluate_Exist=true�~�|����o�ӧP�_���̭����禡
			out.print("<br>�ڪ������G");
			int emptystar = 5-evaluated_star;
			for(int show_full_star = 0;show_full_star<evaluated_star;show_full_star++)
			{
			%>
				<img src="images/star_u.png"/>
	          <%
			}
			for(int show_empty_star = 0;show_empty_star<emptystar;show_empty_star++)
			{
			%>
				<img src="images/star_empty.png"/>
<%
			}
		}
		else{
%>		
            <br>
            <span style="color:#ff091a"><strong>��q������</strong></span>�G
            <img src="images/star_empty.png" name="star1" id="star1" border="0"  onMouseOver="StarPoint(1)" onMouseOut="StarMoveOut()" onClick="SongPoint(<%=track_id%>, '<%=user_id%>', 1,'<%=login_user%>')" style="cursor:pointer;">
        
            <img src="images/star_empty.png" name="star2" id="star2" border="0"  onMouseOver="StarPoint(2)" onMouseOut="StarMoveOut()" onClick="SongPoint(<%=track_id%>, '<%=user_id%>', 2,'<%=login_user%>')" style="cursor:pointer;">
        
            <img src="images/star_empty.png" name="star3" id="star3" border="0"  onMouseOver="StarPoint(3)" onMouseOut="StarMoveOut()" onClick="SongPoint(<%=track_id%>, '<%=user_id%>', 3,'<%=login_user%>')" style="cursor:pointer;">
        
            <img src="images/star_empty.png" name="star4" id="star4" border="0"  onMouseOver="StarPoint(4)" onMouseOut="StarMoveOut()" onClick="SongPoint(<%=track_id%>, '<%=user_id%>', 4,'<%=login_user%>')" style="cursor:pointer;">
        
            <img src="images/star_empty.png" name="star5" id="star5" border="0"  onMouseOver="StarPoint(5)" onMouseOut="StarMoveOut()" onClick="SongPoint(<%=track_id%>, '<%=user_id%>', 5,'<%=login_user%>')" style="cursor:pointer;">
  
            <%
		}
%>
	              </p>
		  <FORM action="" method=POST id="frmSong" name="frmSong">
		<input type="hidden" name="track_id" id="track_id" value="">
		<input type="hidden" name="user_id" id="user_id" value="">
		<input type="hidden" name="star" id="star" value="">
		<input type="hidden" name="post_id" id="post_id" value="">
		</FORM>
		</div>
		<!--�q������end-->
		
        <div  class="style13" align="right" style="padding-right:9px;margin-top:10px">�����H��:<%out.print(evaluation_num);%>
��������:<%
							DecimalFormat nf = new DecimalFormat("###,##0.00");
							out.print(nf.format(avg_star));
						%>
		  </div>
        
        
		<!--�q���ԲӸ��-->
		<div id="title" align="center" class=" style4 roundedCorners" > �q���ԲӸ��
		<!--�q���ԲӸ��end--></div>
		
		<!--�q��²��div-->
		<div align="left">
		<p>�q��²��:</p>
		<p><%=track_data.getString("track_intro")%></p>
		</div>
		<!--�q��²��div end-->
		
		<!--���j��u-->
		<div class="font10  style4 tablebtmgray" >
		</div>
		<!--���j��uend-->

		<!--�q��div-->
		<div align="left">
		<p>�q��:</p>
		<p><%=track_data.getString("track_lyrics")%></p>
		</div>
		<!--�q��div end-->
		
		<!--�N���������{���X�_�l-->
<%
		int PageSize=5;//�]�w�C�i������ܪ�����
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
		sql="select COUNT(*) from opinion where track_id='"+track_id+"'";
		rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
		rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
		RowCount=rs.getInt(1); //���o�O������    
		rs.close();
		PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
		if(ShowPage>PageCount){
			ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
		}
		sql="select * from opinion,users where users.user_id = opinion.post_id AND track_id='"+track_id+"'  ORDER BY time DESC";
		rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
		int i,j;//�]�w�@����ܪ���������
		i=(ShowPage-1)*PageSize;     
		for(j=0;j<i;j++)
			rs.next();
%>
		<!--���ͦ^�� title-->
		<div id="title" align="center" class="style4 roundedCorners"  > ���ͷN��
		<!---���ͦ^��title end--></div>
	
        <%
		if(!user_id.equals(login_user) && login_user != null){//�p�G�n�J�̻P�Ŷ��|�����P �~��ܷs�W�N��
			out.print("<div class='new_message'>");
			out.print("<div align='center' class='new-message new'>");
			out.print("<a href='#' onClick='change_post();'>�s�W�N��</a>");
			out.print("</div>");
			out.print("</div>");
		}
		else if (login_user == null){ //�S���n�J
			out.print("<div style='margin-bottom:10px' align='left'>");
			out.print("<font color='#FF0000'><strong>�z�|���n�J�A�L�k�s�W�N��</strong></font>");
			out.print("</div>");
		}
%>
    
    
		<!-- ���X-->
		<div id="pagenum" align="center">
		<form action="member_page_music_song.jsp?music_id=<%=music_id%>" method="POST">
		
		<table border="0" width="651">
		<tr>
		<td width="127">�ثe����:<font color=red><%=ShowPage%></font>/<font color=blue><%=PageCount%></font></td>
        <td width="67"><a href=member_page_music_song.jsp?music_id=<%=music_id%>&amp;ToPage=1>[�Ĥ@��]</a></td>
		<td width="70"><a href=member_page_music_song.jsp?music_id=<%=music_id%>&amp;ToPage=<%=ShowPage-1%>>[�W�@��]</a></td>
		<td width="68"><a href=member_page_music_song.jsp?music_id=<%=music_id%>&amp;ToPage=<%=ShowPage+1%>>[�U�@��]</a></td>
		
		<td width="84"><a href=member_page_music_song.jsp?music_id=<%=music_id%>&amp;ToPage=<%=PageCount%>>[�̫�@��]</a></td>
		<td width="123">��J����: 
		  <input type="text" size=3 id="page_text" name="ToPage" class="input-style"></td>
		<td width="82"><input type="submit" onclick="return check_page()" name="SEND" value="�e�X" class="input-style style4"></td>
		</tr>
		</table>
		</form>
		<!-- ���Xend--></div>
	
		<!-- �s�W�^�� --><!--�s�W�^��end-->
		<script type="text/javascript">
			function opinion_post(){
				Dialog.confirm("1",{className: "alphacube", width:370 ,height:282,closable:false, url: "opinion/opinion_post.jsp?music_id=<%=music_id%>&web_url=<%=web_url%>"})
			}
			function change_post(){
				$('change').style.visibility="hidden";
				opinion_post();
			}
		</script>
		<!--���ͦ^���ε��� -->
<%
		//��ܸ��
		i=0;
		while(i<PageSize&&rs.next()) //rs�����o�N�������� ResultSet rs
		{
%>
			<div id="reply-outside"><!--�~��-->
			<div id="reply-inside1" align="left"> <!--����1-->
			  <table width="639" border="0">
                <tr>
                  <td width="62" rowspan="4"><a href="member_page.jsp?user=<%=rs.getString("users.user_id")%>"><img src='user/<%=rs.getString("post_id")%>/<%=rs.getString("users.user_pic")%>' width='60' height='60' /></a></td>
                  <td>�o��H:<a href="member_page.jsp?user=<%=rs.getString("users.user_id")%>"><%=rs.getString("users.user_nkname")%></a></td>
                  <td width="67" align="right"><%
			int opinion_id=rs.getInt("id");
			if(user_id.equals(login_user)){	//�p�G�n�J�b���P�|���Ŷ��b���ۦP �h��ܦ^��/�R���N�� if1
				out.print("<a href='#' onClick='change_reply("+opinion_id+");'>[�^��]</a> ");
			}//if1
%></td>
                  <td width="54"><%
            
			if(user_id.equals(login_user)){	//�p�G�n�J�b���P�|���Ŷ��b���ۦP �h��ܦ^��/�R���N�� if
				out.print("<a href='opinion/opinion_delete.jsp?id="+opinion_id+"' onClick='return delete_opinion()'>[�R��]</a>");
			}//if1
%></td>
                </tr>
                <tr>
                  <td width="409"></td>
                </tr>
                <tr>
                  <td>�o��ɶ�:<%=rs.getDate("time")%> <%=rs.getTime("time")%></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
			</div> 
			<!--����1end-->
		
			<div id="reply-inside2" style="padding-bottom:5px"align="left"><!--����2-->
			<%=rs.getString("opinion")%></div><!--����2end-->
			
			<!--���ؤT-->
<%
			//�^�зN�� �Y���^�Ъ��N���~��ܥX��
			String reply=rs.getString("reply");
			if(reply!=null){
//if2
%>
				<div id='reply-inside3' align='left'>
				  <table width="500" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><strong>�^�зN��:</strong></td>
                    </tr>
                    <tr>
                      <td><table width="0">
                        <tr>
                          <td width="15">&nbsp;</td>
                          <td><%=reply%></td>
                        </tr>
                      </table>
                      </td>
                    </tr>
                  </table>
			  </div>
                <%
			}//if2
%>
			<!--end of���ؤT-->
			</div><!--�~��end-->
		<script type="text/javascript">
			function opinion_reply(id){
				var id=id;
				Dialog.confirm("3",{className: "alphacube", width:370 ,height:262,closable:false, url: "opinion/opinion_reply.jsp?music_id=<%=music_id%>&web_url=<%=web_url%>&id="+id})
			}
			function change_reply(id){
				var id=id;
				$('change').style.visibility="hidden";
				opinion_reply(id);
			}
	</script>

<%
		i++;
		}//rs
		user.close();
		user_data.close();
		stmt.close();
		rs.close();
%>
    <script type="text/javascript">
			function feedback(){
				Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "feedback/feedback.jsp?user=<%=user_id%>&music_id=<%=music_id%>&web_url=<%=web_url%>"})
			}
			function change_feedback(){
				$('change').style.visibility="hidden";
				feedback();
			}
</script>
<%
	}//track_data
	track_data.close();
	track.close();
%> 
	<!-- ���ͦ^���ε���end -->  
<!--end of �k��div--></div>
 
<!--maincontent end--> </div>
  
  </div>
  
   <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
  <!-- end #container --></div>
	
	</body>
	
</html>
