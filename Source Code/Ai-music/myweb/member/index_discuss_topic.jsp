<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="../web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�Q�װ�</title>

<!--�o�̥Ϊ�CSS-->
<link href="../../CSSfile/discuss-content.css" rel="stylesheet" type="text/css" />    
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>
<script src="../js/Login.js"></script>
<script src="../js/discuss.js"></script>
<script type="text/javascript" src="../js/prototype.js"> </script>
<script type="text/javascript" src="../js/index.js"> </script>

<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="imagemenu/imageMenu.js" type="text/javascript"></script>
<script src="_common/js/mootools.js" type="text/javascript"></script>

<!--jump window-->
<script type="text/javascript" src="../box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="../box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="../box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="../box sample1/javascripts/debug.js"> </script>
	<link href="../box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="../box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="../box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
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
  <div style="padding-left:30px" align="left"><a href="../index.jsp"><img src="../../music3.jpg" width="320" /></a>
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
	<div class="font10" style="position:absolute; left: 790px; top: 33px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../../images/mail.png" alt="" width="40" height="40" /></a></div>
      <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="../member_page.jsp"><img src="../../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="../member_manage.jsp"><img src="../../images/House.png" width="40" height="40" /></a> <span>�ڪ��޲z����</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="../logout.jsp"><img src="../../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <div id="user_status" class="font10 style4 info_door" align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
    <%
	}
%>
      <form action="../search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
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
        <td width="196" align="center" ><a href="../index.jsp">����</a></td>
        <td width="196" align="center" ><a href="../member/index_discuss.jsp">�Q�װ�</a></td>
        <td width="196" align="center" ><a href="../index_activity.jsp">��������</a></td>
        <td width="196" align="center" ><a href="../index_music-list.jsp">�����˯�</a></td>
        <td width="196" align="center" ><a href="../index_ranking.jsp">�Ʀ�]</a></td>
      </tr>
    </table>
  </div>
</div>
<div id="container" style="padding-top:5px">

<%
	 int subject_id=0,title_id=0;
    
	      subject_id = Integer.parseInt(request.getParameter("subject_id"));
 
      Statement stmt=con.createStatement();
      ResultSet user;

	  Statement sttmt=con.createStatement();
      ResultSet rs2;
      
      String title_subject,title_time,user_nkname;
      int id,count=1; 
	  
	  sql="select * from title where subject_id="+subject_id;
      rs=smt.executeQuery(sql);
	  sql="select * from subject where subject_id="+subject_id;
      rs2=sttmt.executeQuery(sql);
	  while(rs2.next())
      {
        String subject_subject=rs2.getString("subject_subject");
	    int subject_type=rs2.getInt("subject_type");
  
  
  out.print("<div id=\"mainContent2\" class=\"font10 style4\">");
  out.print("<div style=\"margin-bottom:0px\">");
  if(subject_type==1){ 
  out.print("<div style=\"margin-bottom:30px\">");
  out.print("<a href=\"index_discuss.jsp\">��������</a><span class=\"style12\"> &gt; </span><a href=index_discuss_topic.jsp?subject_id="+subject_id+">"+subject_subject+"</a>");
  }
  else{
  out.print("<div style=\"margin-bottom:30px\">");
  out.print("<a href=\"index_discuss.jsp\">�a�Ϥ���</a><span class=\"style12\"> &gt; </span><a href=index_discuss_topic.jsp?subject_id="+subject_id+">"+subject_subject+"</a>");
  }
 }
%>
<%
  
  if(login_user==null){//if
  	out.print("<font color='red'>�n�J��~��o��D�D</font>");
	}//if
	else{
%>  
	<div class="outfriend">
      <div class="infriend link" align="center"><a href='#' onClick='discuss_post();'>�s�W�D�D</a></div>
      </div>
<%
}
%>
 
 <%
 
    //�Q�װϦC���X
    Statement stmt_page=con.createStatement();
   
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
	sql="select COUNT(*) from title where subject_id='"+subject_id+"'";//!!!�p����
    rs=stmt_page.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  sql="SELECT * FROM title WHERE subject_id='"+subject_id+"' ORDER BY title_time DESC";//!!!�s��ƥX��
	  rs=stmt_page.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
      
<!-- ���X-->
    <div id="new-message" align="left" class="font10" style="margin-top:10px">

	<form action="index_discuss_topic.jsp?subject_id=<%=subject_id%>" method="POST">
     <table border="0" class="style4">
   <tr>
       <td>�ثe����:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=1>[�Ĥ@��]</a>		</td>
		
		<td> <a href=index_discuss_topic.jsp?subject_id=<%=subject_id%>&ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
		<td>��J����: <input type="text" id="page_text" size=3 name="ToPage" class="input-style-type">		</td>
		<td><input type="submit" name="SEND" value="�e�X" class="input-style style4" onclick="return check_page()">		</td>
	</tr>
	</table>
 </form> 

<!-- ���Xend--></div>
<%
		     
            //��n�s�X�Ӫ��F��̩M�{���X
			
%>
  
<table width="880" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="margin-top:30px">
 
	
    <tbody >
      <tr  align="center" bgcolor="#DCDCDC">
        <td width="40" height="45" >�s��</td>
        <td width="380"  align="left" >�D�D</td>
        <td width="40">�^��</td>
        <td width="200">�@��</td>
        <td width="200" >�̷s�^��</td>
      </tr>

   
 <% 
      	i=0;
      while(i<PageSize&&rs.next()){
           title_id=rs.getInt("title_id");
	       title_subject=rs.getString("title_subject");
	       title_time=rs.getString("title_time");
	       id=rs.getInt("id");
		if(count%2==0)//���Ʊ� �Ǧ�
		{
%>
    	  	<tr bgcolor="#DCDCDC">
    		<td height="45" align="center"><%=count%></td>
			<td align="left"><a href="index_discuss_topic_content.jsp?title_id=<%=title_id%>"><%=title_subject%></a></td>
            <%
	 		sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.title_id = '" +title_id+ "'AND title.subject_id = "+subject_id;
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><%=user.getInt("r_num")%></td>
			<%
			}//�^�нg�����
			sql = "SELECT * FROM title, users WHERE title.id = users.id AND title.title_id = "+title_id+" AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("title.title_time")%></span></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//�̫�o�����
			sql = "SELECT * FROM reply, users, title WHERE reply.title_id = "+title_id+" AND title.subject_id = "+subject_id+" AND reply.id = users.id ORDER BY reply.reply_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("reply.reply_time")%></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//�̷s�^�����
		}//if
		else{//�_�Ʊ� �զ�
			%>
	  		<tr>
      		<td height="45" align="center"><%=count%></td>
			<td align="left"><a href="index_discuss_topic_content.jsp?title_id=<%=title_id%>"><%=title_subject%></a></td>
            <%
	 		sql = "SELECT COUNT(*) as r_num FROM reply, title WHERE title.title_id = reply.title_id AND title.title_id = '" +title_id+ "'AND title.subject_id = "+subject_id;
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><%=user.getInt("r_num")%></td>
			<%
			}//�^�нg�����
			sql = "SELECT * FROM title, users WHERE title.id = users.id AND title.title_id = "+title_id+" AND title.subject_id = "+subject_id+" ORDER BY title.title_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("title.title_time")%></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//�̫�o�����
			sql = "SELECT * FROM reply, users, title WHERE reply.title_id = "+title_id+" AND title.subject_id = "+subject_id+" AND reply.id = users.id ORDER BY reply.reply_time DESC LIMIT 1";
			user = stmt.executeQuery(sql);
			while(user.next()){
			%>
				<td align="center"><span style="font-size:9px"><%=user.getString("reply.reply_time")%></span><br><a href="../member_page.jsp?user=<%=user.getString("users.user_id")%>">by <%=user.getString("users.user_nkname")%></a></td>
			<%
			}//�̷s�^�����
		}
		count++;
		i++;
	}//rs_page
	rs.close();
		stmt_page.close();
%>
  </table></div>
  


</div>

  <p>
    <!-- end #mainContent -->
    </div>
  </p>
  <p>&nbsp;</p>
<!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--�^�ХD�D���u������-->
<script type="text/javascript">

function discuss_post() {
    Dialog.confirm("1",{className: "alphacube", width:500 ,height:400,closable:true,url: "replysubject.jsp?subject_id=<%=subject_id%>"})
  }

function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "../feedback/feedback.jsp?user=<%=login_user%>&web_url=<%=web_url%>"})
			}
</script>

</body>
</html>
