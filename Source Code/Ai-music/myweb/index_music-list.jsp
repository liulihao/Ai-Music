<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�����˯�</title>

<!--�o�̥Ϊ�CSS-->
<link href="../CSSfile/index_music-list.css" rel="stylesheet" type="text/css" />

<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="js/Login.js"></script>
<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
<!--
.style13 {font-size: 9pt}
-->
    </style>
</head>

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
 

  <div class="font 10" id="mainContent" align="right">
      <!--�|�����Y-->
      <div id="bigleft"  align="left">
        <!--���ʺ޲z-->
        <!--�Q�װ�.�a�Ϥ���-->
<div class="font10 grayblock roundedTopCorners">
          <div class="style2 roundedTopCorners  title" >�����˯�</div>
          <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">�a�Ϥ���</div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=12">�ػy�a��</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=13">�F�v�a��</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=14">��v�a��</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=15">��L�a��</a></div>
          <!--�Q�װϺ޲z.��������-->
          <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">��������</div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=1">�n�u(Rock)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=2">�y��(Pop)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=3">�q�l(Electronic)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=4">����(Metal)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=5">�H��(HipHop)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=6">��h(Jazz)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=7">�m��(Country)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=8">����(Folk)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=9">�j��(Classical)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=10">�R��(Dance)</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="index_music-list.jsp?retrieve=11">�`���Ž�(R&amp;B)</a></div>
        </div>
        <!--end of bigleft-->
      </div>
      <%
		int retrieve=0;
		try {
			retrieve = Integer.parseInt(request.getParameter("retrieve"));//�q�����}?retrieve=X ���
		}
		catch(Exception e){
			retrieve = 12;
		}
	   Statement retrieve1=con.createStatement();
	   ResultSet retrieve_data;
	   sql="select * from music_type where music_id='"+retrieve+"'";//�qmusic_type�Hmusic_id�ȧ�����O����
	   retrieve_data=retrieve1.executeQuery(sql);
	   while(retrieve_data.next()){
	     String retrieve_genre=retrieve_data.getString("music_genre");
		 %>
      <!--------------------------�k�䪺div-------------------------->
      <div  id="bigright" class="font10 " >
      <div  id="title" align="left" class="style4 roundedCorners"  ><span class="style12">&gt;&nbsp;</span>�����˯�-<%=retrieve_genre%></div>
      <!--����-->
      <%
	   
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
	 //�O�a���٬O��������
	 if(retrieve==12){
	 	sql="select COUNT(*) from track where track_language_id=1 OR track_language_id=2 OR track_language_id=3 ";
	 }else if(retrieve==13){
	 	sql="select COUNT(*) from track where track_language_id=6 ";
	 }else if(retrieve==14){
	 	sql="select COUNT(*) from track where track_language_id=5";
	 }else if(retrieve==15){
	 	sql="select COUNT(*) from track where track_language_id=7 OR track_language_id=8 ";
	 }else{
	 	sql="select COUNT(*) from track_type where music_id='"+retrieve+"'";
	 }
    rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    //rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  //�O�a���٬O��������
	 if(retrieve==12){
	 	sql="select * from track where track_language_id=1 OR track_language_id=2 OR track_language_id=3 ";
	 }else if(retrieve==13){
	 	sql="select * from track where track_language_id=6";
	 }else if(retrieve==14){
	 	sql="select * from track where track_language_id=5";
	 }else if(retrieve==15){
	 	sql="select * from track where track_language_id=7 OR track_language_id=8";
	 }
	 else{
	  	sql="select * from track_type where music_id='"+retrieve+"'";
	 }
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%> 
 <!-- ���X-->
    <div id="new-message" class="style4" align="center">

    <form action="index_music-list.jsp?retrieve=<%=retrieve%>" method="POST">
     <p>�@��<font color="#0066FF"><b><%=RowCount%></b></font>���˯����</p>
     <table border=0>
   <tr>
       <td>�ثe����:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=1>[�Ĥ@��]</a>		</td>
		
		<td> <a href=index_music-list.jsp?retrieve=<%=retrieve%>&ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
		<td>��J����: <input type="text" size=3 name="ToPage" id="page_text" class="input-style-type">		</td>
		
		<td><input type="submit" name="SEND" value="�e�X" onclick="return check_page()" class="input-style style4">		</td>
	</tr>
	</table>
 </form> 
  <div id="bigright-inner" >  
<!-- ���Xend--></div> 
       <%
		i=0;
    while(i<PageSize&&rs.next()){   
		
		 int track_id=rs.getInt("track_id");//�쭵�ֽs��
		 		
		 Statement track_type=con.createStatement();
		 ResultSet track_data;
		 if(retrieve==12||retrieve==13||retrieve==14||retrieve==15){//�p�G�O�a�Ϥ���
			sql="SELECT * FROM track,users,language_type WHERE track.track_language_id=language_type.language_id AND track.user_id=users.user_id AND track.track_id="+track_id;
			track_data=track_type.executeQuery(sql);
			 while(track_data.next()){//track_data �a�Ϥ���
		 	   String user_id1=track_data.getString("track.user_id");
			   String user_nkname1=track_data.getString("users.user_nkname");
			   String track_name=track_data.getString("track.track_name");
		   	   String track_pic=track_data.getString("track.track_pic");
			   String language=track_data.getString("language_type.language_variety");
			   %>
               <!--�����˯�-->
      		<div class="song-block" align="left" style="float:left">
      		<div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><img src="user/<%=user_id1%>/music/<%=track_pic%>" alt="" width="75" height="75"/></a></div>
        	<div  align="left" class="style4 detail-block" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>">����:<%=track_name%></a></div>
            <div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=user_id1%>">�|��:<%=user_nkname1%></a></div>
      		<%
			if(retrieve==15){//if �˯���L�a�� 
				int track_language_id=track_data.getInt("track.track_language_id");
				if(track_language_id==7){//if(track_language_id==7) �p�G�O��L�y�� ��ܻy����r
					String other_text=track_data.getString("track.track_language_other");
			%>
					<div  align="left" class="style4 detail-block" >��L�y��:<font color="#FF0000"><strong><%=other_text%></strong></font></div>
			<%	}else{//�_�h��ܥ��w�q%>
				<div  align="left" class="style4 detail-block" >�q���y��:<font color="#FF0000"><strong><%=language%></strong></font></div>					
			<%	}//�_�h��ܥ��w�q end
			}//if �˯���L�a��  end
		    else{//�˯�retrieve==12 13 14 
		    %>
        	<div  align="left" class="style4 detail-block" >�q���y��:<font color="#FF0000"><strong><%=language%></strong></font></div>
            <%	}//�˯�retrieve==12 13 14  end%>
		  	<div  align="right" class="style4 detail-block" ><span class="style12 style9">&gt;&nbsp;</span><strong><a href="member_page_music_song.jsp?music_id=<%=track_id%>" class="style13">�I������</a></strong></div>
   		</div><!--�����˯� end-->
        <%}//track_data �a�Ϥ��� end
		  }else{//�p�G�O�a�Ϥ��� end ������������else
		 sql="select * from track,users where track.user_id=users.user_id AND track.track_id='"+track_id+"' order by track_time DESC";//�q���ֽs����|���b���M���֦W��
		 track_data=track_type.executeQuery(sql);
		 	while(track_data.next()){
		 	   String user_id1=track_data.getString("track.user_id");
			   String user_nkname1=track_data.getString("users.user_nkname");
			   String track_name=track_data.getString("track.track_name");
		   	   String track_pic=track_data.getString("track.track_pic");
		 %>
           <!--�����˯�-->
      		<div class="song-block" align="left" style="float:left">
       		<div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><img src="user/<%=user_id1%>/music/<%=track_pic%>" alt="" width="75" height="75"/></a></div>
        	<div  align="left" class="style4 detail-block" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>">����:<%=track_name%></a></div>
            <div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=user_id1%>">�|��:<%=user_nkname1%></a></div>
        	<div  align="left" class="style4 detail-block" >��������:<font color="#FF0000"><strong><%=retrieve_genre%></strong></font></div>
      		<div  align="right" class="style4 detail-block" ><span class="style12 style9">&gt;&nbsp;</span><strong><a href="member_page_music_song.jsp?music_id=<%=track_id%>" class="style13">�I������</a></strong></div>
      
   		</div><!--�����˯� end-->
      

      <%
	  	  }// track_data else end
	    }//������������ end
		track_data.close();
		track_type.close();
		i++;
		}//rs
		rs.close();
		}//retrieve
		retrieve_data.close();
		retrieve1.close();
		stmt.close();
		con.close();
	  %>
      </div>  
        
      <!--------------------------�n��end---------------------------------->
      </div><!-------------------------�k��inner div end--------------------------------->
  </div>
  <!-------------------------�k��div end--------------------------------->
    

  
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
</script>

</body>
</html>
