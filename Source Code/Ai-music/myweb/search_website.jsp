<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />


<!--�o�̥Ϊ�CSS-->

<link href="../CSSfile/index_search.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<link href="imagemenu/imageMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/prototype.js"> </script>
<script type="text/javascript" src="js/index.js"> </script>
<script src="js/Login.js"></script
><!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>

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
<div id="header">
<div style="padding-left:30px" align="left"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
<%
	String login_user=(String)session.getAttribute("user_id");
	String search_text;
	String search_type;
	try{
		search_text = new String(request.getParameter("search_text").getBytes("ISO8859_1"));
		search_type = new String(request.getParameter("search_type").getBytes("ISO8859_1"));
	}
	catch(Exception e){
		search_text="";
		search_type="song_name";
	}
	
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


	<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> 
    
    <span>�ڪ��Ŷ�</span>
    </div>
	
	<div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a>
    <span>�ڪ��޲z����</span>
    </div>
     
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>�n�X</span>
    </div>
    
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
    <%
	}
%>
<form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()">
   <div id="search" class="info_search" style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;"> 
   
    <span class="font10 style4">�п�J�j�M�r��</span>
    
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class="search-style"/></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style">
          <option value="song_name" selected>�q�W</option>
          <option value="member_name">�|��</option>
          </select></td>        
        <td width="82"><input type="submit" value="�j�M" class="font10 search-style"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
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
<%
	
	String st = "";
	if(search_type.equals("song_name")){
		st = "�q��";
	}
	else
		st = "�|��";
%>  
<title><%=st%>�j�M</title>
  <div id="mainContent" class="font10">
<div class="center-title roundedCorners  style2"  align="center"><%=st%>�j�M</div>


<!--������o��-->
<!--end of ����-->

<%	
	//�j�q��
	if(search_type.equals("song_name")){//if
		int PageSize=10;//�]�w�C�i������ܪ�����
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
		 sql="select COUNT(*) FROM track,users WHERE track.track_name LIKE '%"+search_text+"%' AND track.user_id=users.user_id";//!!!�p����
 		 rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
		 rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
		  RowCount=rs.getInt(1); //���o�O������    
   		 rs.close();
		PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
		 if(ShowPage>PageCount){
		    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
		  }
	  sql="SELECT * FROM track,users WHERE track.track_name LIKE '%"+search_text+"%' AND track.user_id=users.user_id";//!!!�s��ƥX��
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;
      for(j=0;j<i;j++)   
	  rs.next();
%>
	<!-- ���X-->
  	  <div id="new-message" align="center" class="style4">

 	   
  	  <form action="search_website.jsp" method="POST">
 	    <p>�@��<font color="#0066FF"><b><%=RowCount%></b></font>���j�M���G</p>
     <table border=0>
  			 <tr>
   			   <td>�ثe����:<font color=red><%=ShowPage%></font>/
         		  <font color=blue><%=PageCount%></font>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=1>[�Ĥ@��]</a>		</td>
		
					<td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
					
				</tr>
			</table>
		 </form> 
    
<!-- ���Xend--></div>
<div align="center" style="padding:0 25px"><!--�]song_padding-->
<%			i=0;
    		while(i<PageSize&&rs.next()){
			%>
            
	<div class="song-block" align="left" style="float:left"><!--song-block-->
        <div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=rs.getString("track.track_id")%>"><img src="user/<%=rs.getString("users.user_id")%>/music/<%=rs.getString("track.track_pic")%>" width="80" height="80" /></a></div><!--pic-block-->
        <div  align="left" class="style4 detail-block"><a href="member_page_music_song.jsp?music_id=<%=rs.getString("track.track_id")%>">���ءG<b><font color="#FF0000"><%=rs.getString("track.track_name")%></font></b></a></div>
        <div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=rs.getString("users.user_id")%>">�|���G<%=rs.getString("users.user_nkname")%></a></div>
        <div  align="left" class="style4 detail-block">�W�Ǯɶ��G<%=rs.getDate("track.track_time")%></div>
    </div><!--song-block-->
    
<%		i++;
		}//rs1
		%>
</div><!--end of �]song_padding-->
<%	}//if
	
	//�j�|��
	else{//else
	Statement song=con.createStatement();//��|���Ŷ����|�����
	ResultSet song_data;
	
	
		int PageSize=15;//�]�w�C�i������ܪ�����
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
		 sql="select COUNT(*) from users where user_nkname like'%"+search_text+"%' or user_id like '%"+search_text+"%' AND user_authority = 0";//!!!�p����
 		 song_data=song.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
		 song_data.next();   //������}�Ү� ���w���Ĥ@���O�����e
		  RowCount=song_data.getInt(1); //���o�O������    
   		 song_data.close();
		PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
		 if(ShowPage>PageCount){
		    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
		  }
	  sql="select * from users where user_nkname like'%"+search_text+"%' or user_id like '%"+search_text+"%' AND user_authority = 0";//!!!�s��ƥX��
	  song_data=song.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int x,y;//�]�w�@����ܪ���������
	  x=(ShowPage-1)*PageSize;
      for(y=0;y<x;y++)   
	  song_data.next();
%>
	<!-- ���X-->
  	  <div id="new-message" align="center" class="style4">

 	   
  	  <form action="search_website.jsp" method="POST">
 	    <p>�@��<font color="#0066FF"><b><%=RowCount%></b></font>���j�M���G</p>
 	    <table border=0>
  			 <tr>
     			  <td>�ثe����:<font color=red><%=ShowPage%></font>/
         		  <font color=blue><%=PageCount%></font>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
				  <td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=1>[�Ĥ@��]</a>		</td>
		
					<td> <a href=search_website.jsp?search_type=<%=search_type%>&search_text=<%=search_text%>&ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
					
		  </tr>
		</table>
	    </form> 
    
<!-- ���Xend--></div>
<%
			x=0;
    		while(x<PageSize&&song_data.next()){//song_data
			%>
	<div class="member-block" align="left" style="float:left"><!--song-block-->
			<div class="pic-block" align="center" ><a href="member_page.jsp?user=<%=song_data.getString("users.user_id")%>"><img src="user/<%=song_data.getString("users.user_id")%>/<%=song_data.getString("users.user_pic")%>" width="60" height="60" /></a></div><!--pic-block-->
      		<div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=song_data.getString("users.user_id")%>">�ʺ�:<%=song_data.getString("users.user_nkname")%></a></div>
       		<div  align="left" class="style4 detail-block"><a href="member_page.jsp?user=<%=song_data.getString("users.user_id")%>">�b��:<%=song_data.getString("users.user_id")%></a></div>
    <div  align="left" class="style4 detail-block"><span class="style12 style9">&nbsp;</strong></span></div><!--pic-block-->
     	</div><!--song-block-->
<% 		x++;
		}//song_data
	}//else
	
%>
	      <div style="clear:both"></div>
    
    <!-- end #mainContent -->
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--�n�J���u������-->


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
 <script type="text/javascript">
var timerRunning = false;
function start(){  		
	setEnable();
}
function setEnable(){
	setTimeout("start()",5000);
	if(timerRunning){
		form1.Submit.disabled=false;
	}
	timerRunning=true;
}

</script>

</body>
</html>
