<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="../web_url.jsp"%><!--����������}-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�Q�װ�</title>
 <SCRIPT LANGUAGE = "JavaScript">

 function delete_check(){//�R���N���ɪ�ĵ�ܵ�
       if(confirm("�T�w�n�R���ӵ��^�ж�?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}
</script> 
 <link href="../../CSSfile/discuss-content.css" rel="stylesheet" type="text/css" />
<!--�o�̥Ϊ�CSS-->
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
<div id="container">
<p>&nbsp;</p>

<%

  Statement subject=con.createStatement();

  int title_id=0,reply_id=0;
  if(request.getParameter("title_id") == null)
  {
  }
  else
  {
	title_id = Integer.parseInt(request.getParameter("title_id"));
	//out.print("title_id="+title_id);
  }
   String title_subject,title_content,title_time,user_pic;
   String reply_content,reply_time;
   String user_nkname,user_email;;
   int id,n=1;
   
   sql="select *, LEFT(title_time,17) AS c_title_time from title,users where title.id = users.id AND title_id="+title_id ;
   ResultSet title_data=smt.executeQuery(sql);//rs smt
   while(title_data.next())
  {  
    title_id=title_data.getInt("title_id");
	title_subject=title_data.getString("title_subject");
	title_content=title_data.getString("title_content");
	title_time=title_data.getString("c_title_time");
	String title_pic=title_data.getString("title_pic");
	id=title_data.getInt("id");
	user_pic=title_data.getString("users.user_pic");
	int subject_id=title_data.getInt("subject_id");
	String find_user_id = title_data.getString("user_id");
 %>
  
  <div id="mainContent" class="font10 style4">
  <div style="margin-bottom:10px"><!--div1-->
  <table width="880"><!--table1-->
  	<tr>
    	<td height="29"  style="width:500px">
<%
      sql="select * from subject where subject_id="+subject_id;
	  ResultSet rs2;
      rs2=subject.executeQuery(sql);//rs2 subject
	  while(rs2.next())//while rs2
      {
        String subject_subject=rs2.getString("subject_subject");
		int subject_type=rs2.getInt("subject_type");
		if(subject_type==1){ //rs2 if
%>
        <a href="index_discuss.jsp">��������</a><span class="style12"> &gt; </span><a href="index_discuss_topic.jsp?subject_id=<%=subject_id%>"><%=subject_subject%></a><span class="style12"> &gt; </span>
<%
		}//rs2 if end
		else{//rs2 else
%>
		<a href="index_discuss.jsp">�a�Ϥ���</a><span class="style12"> &gt; </span><a href="index_discuss_topic.jsp?subject_id=<%=subject_id%>"><%=subject_subject%></a><span class="style12"> &gt; </span>
<%       
       }//rs2 else end
%>
		<span class="style13"><strong>�Q�ץD�D</strong>:<%=title_subject%></span>
		</td>

		<td width="240" align="right">
 			<span class="small-block style4 pointer" align="center"><a href="index_discuss_topic.jsp?subject_id=<%=subject_id%>">�^�W�@��</a></span>		</td>
	</tr>
<%  
  		if(login_user==null){//if login_user==null
  			out.print("<font color='red'>�n�J��~��s�W�^��</font>");
		}//if login_user==null end
		else{//else login_user==null
%>  
	<tr>
  		<td width="628" ><div style="margin-top:15px" class="outfriend"><div class="infriend link" align="center"><a href='#' onClick='discuss_reply();'>�s�W�^��</a></div></div>
        </td>
	</tr>  
<%
		}//else login_user==null end
 	}//rs2 end
%>
  </table><!--table1 end-->

  </div><!--end of div1-->

  <div class="style4" align="left" style="margin-bottom:20px;"><!--div2-->
    <table width="880" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="border:1px dashed #5F5F5F" ><!--table2-->
     <tr  align="center" >
       <td colspan="2" style="border-bottom:1px dashed #5F5F5F">�o��H</td>
       <td width="640" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F ">���e</td>
<%	   if(find_user_id.equals(login_user)){//if find_user_id%>
		<form action="member_delete_all.jsp" method="post" onsubmit="return delete_check()">
		<td width="60" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F;">
            <input type="submit" name="send" value="�R��" style="border:1px solid #FFFFFF; background:#FFFFFF; color:#5F5F5F " class="pointer" >			  		</td>
			<input type = "hidden" name = "title_id" value="<%=title_id%>">
			<input type = "hidden" name = "subject_id" value="<%=subject_id%>" />
		</form>
	 </tr>
<%		}else{//if find_user_id end  else%>
		
		<td width="60" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F;"></td>
     </tr>
<%		}//else find_user_id  else
		
  		Statement stmt=con.createStatement(); 
		ResultSet user;
        
        sql="SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where id='"+id+"'";
        user=stmt.executeQuery(sql);
	      while(user.next()){//while user
	      	user_nkname=user.getString("user_nkname");
	      	user_email=user.getString("user_email");
	      	String user_id=user.getString("user_id");
		 	 int user_age=user.getInt("user_age");
		 	 String user_city=user.getString("user_city");
%>
       <tr>
          <td colspan="2" rowspan="2" valign="top">
          <div style="margin:10px 0px" align="center">
            <a href="../member_page.jsp?user=<%=user_id%>"><div style="border:1px solid #E5E5E5;width:90px"><img src='../user/<%=user_id%>/<%=user_pic%>' alt="" width="90" height="90" /></div></a>
            <table width="100%" border="0">
  <tr>
    <td align="center"><a href="../member_page.jsp?user=<%=user_id%>"><%=user_nkname%></a></td>
    </tr>
</table>
</div>          </td>

          <td colspan="2" style="border-left:1px dashed #5C5C5C; border-bottom:1px dashed #5C5C5C; padding-left:10px;" >
		  	<%=title_content%><br>
            <img src='../user/<%=user_id%>/discuss/<%=title_pic%>' alt="" width="70%" height="70%" />          </td>
       </tr>
		  
       
       <tr>
         <td height="10" style="border-left:1px dashed #5C5C5C;"><%=title_time%></td>
       </tr>
		  
<%		  
		  }//while user end
	  }//while rs2 end
%>
    </table>
    <!--table2 end-->
    </div><!--end of div2-->
 
    <div align="center"><h1>�^�Ф��e</h1></div>
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
	sql="select COUNT(*) from reply where title_id='"+title_id+"'";//!!!�p����
    rs=stmt_page.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  sql="select *, LEFT(reply_time,17) AS c_reply_time from reply,users where reply.id = users.id AND title_id='"+title_id+"' ORDER BY reply_time ASC";//!!!�s��ƥX��
	  rs=stmt_page.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
 
    i=0;
	int num=1;
    while(i<PageSize&&rs.next())
	{ 
	    num=PageSize*(ShowPage-1)+n;
    	reply_id=rs.getInt("reply_id");
		reply_content=rs.getString("reply_content");
		reply_time=rs.getString("c_reply_time");
		String reply_pic=rs.getString("reply_pic");
		id=rs.getInt("id");
		user_pic=rs.getString("users.user_pic");
%>
	<div class="style4" align="left" style="margin-bottom:15px;">
		<table width="880" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="border:1px dashed #5F5F5F" >  
		 <tr  align="center" >
			<td colspan="2" style="border-bottom:1px dashed #5F5F5F">�o��H</td>
			<td width="640" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F ">���e</td>
<%    
	Statement user_data_reply=con.createStatement(); 
	String find_user_sql_reply="SELECT * FROM users,reply WHERE reply.id = users.id AND reply_id = '" + reply_id +"'";
	ResultSet find_user_data_reply = user_data_reply.executeQuery(find_user_sql_reply);  
	while(find_user_data_reply.next()) {  //while find_user_data_reply 
		String find_user_id_reply=find_user_data_reply.getString("user_id");
		
		if(find_user_id_reply.equals(login_user)){//if find_user_id_reply%>
			<form action="member_delete_reply.jsp" method="post" onsubmit="return delete_check()"> 
			<td width="60" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F;">
            <input type="submit" name="send" value="�R��" style="border:1px solid #FFFFFF; background:#FFFFFF; color:#5F5F5F " class="pointer"></td>
			<input type = "hidden" name = "title_id" value=<%=title_id%>>
			<input type = "hidden" name = "reply_id" value=<%=reply_id%>>
			</form>
   		 </tr>
		<%}else{//if find_user_id_reply end else find_user_id_reply%>
		
		    <td width="60" style="border-bottom:1px dashed #5F5F5F; border-left:1px dashed #5F5F5F;"></td>
<%	 	  }//else find_user_id_reply end
		
		}//while find_user_data_reply end
	Statement reply_user=con.createStatement(); 
    sql="SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where id='"+id+"'";
    ResultSet reply_user_data=reply_user.executeQuery(sql);
	while(reply_user_data.next())//while reply_user_data
	{
		user_nkname=reply_user_data.getString("user_nkname");
		user_email=reply_user_data.getString("user_email");
    	String user_id=reply_user_data.getString("user_id");  
    	int user_age=reply_user_data.getInt("user_age");
    	String user_city=reply_user_data.getString("user_city");
%>
		 <tr>
			 <td colspan="2" rowspan="2" valign="top">
             <div style="margin:10px 0px" align="center">
            <a href="../member_page.jsp?user=<%=user_id%>"><div style="border:1px solid #E5E5E5;width:90px"><img src='../user/<%=user_id%>/<%=user_pic%>' alt="" width="90" height="90" /></div></a></p>
            <table width="100%" border="0">
  <tr>
    <td align="center"><a href="../member_page.jsp?user=<%=user_id%>"><%=user_nkname%></a></td>
    </tr>
</table>
</div>            </td>
		  
       	   <td colspan="2" style="border-left:1px dashed #5C5C5C; border-bottom:1px dashed #5C5C5C; padding-left:10px;" >
			<%=reply_content%><br>
			<img src='../user/<%=user_id%>/discuss/<%=reply_pic%>' alt="" width="70%" height="70%" /></td>
         </tr>
        

         <tr>
       	   <td height="10" style="border-left:1px dashed #5C5C5C;"><%=reply_time%></td>
   	       <td width="40" height="10" style="border-left:1px dashed #5C5C5C;">&nbsp;&nbsp;#<%=num%></td>
   		 </tr>
    </table>
  </div>
 
<%	}//while reply_user_data end
	n++;
	i++;
	}//rs
%>
 <!-- ���X-->
    <div id="new-message" align="center" style="margin-bottom:10px">


	<form action="index_discuss_topic_content.jsp?title_id=<%=title_id%>" method="POST">
     <table border=0>
   <tr>
       <td>�ثe����:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=index_discuss_topic_content.jsp?title_id=<%=title_id%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
		<td> <a href=index_discuss_topic_content.jsp?title_id=<%=title_id%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
		<td> <a href=index_discuss_topic_content.jsp?title_id=<%=title_id%>&ToPage=1>[�Ĥ@��]</a>		</td>
		
		<td> <a href=index_discuss_topic_content.jsp?title_id=<%=title_id%>&ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
		<td>��J����: <input type="text" id="page_text" size=3 name="ToPage" class="input-style-type"></td>
		
		<td><input type="submit" name="SEND" value="�e�X" class="input-style" onclick="return check_page()"></td>
	</tr>
	</table>
 </form> 
    
<!-- ���Xend--></div>
<%
	rs.close();
	//stmt_page.close();
			
%>

	 
    

    
  <!-- end #mainContent --></div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<!--�^�Ф峹���u������-->
<script type="text/javascript">

  function discuss_reply() {
    Dialog.confirm("1",{className: "alphacube", width:500 ,height:370,closable:true,url: "replytitle.jsp?title_id=<%=title_id%>"})
  }

function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "../feedback/feedback.jsp?user=<%=login_user%>&web_url=<%=web_url%>"})
			}
</script>

</body>
</html>
