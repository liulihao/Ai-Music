<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=Big5"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�޲z�Q�װ�</title>
<SCRIPT LANGUAGE = "JavaScript">
 
 function delete_check(){//�R���Q�ץD�D�ɪ�ĵ�ܵ�
       if(confirm("�T�w�n�R���ӵ��Q�ץD�D��?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}
</script> 

<!--�o�̥Ϊ�css-->
<script src="../js/prototype.js"></script>
<script src="../js/admin_manage.js"></script>
<!--���ҭ��O-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
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

<link href="../../CSSfile/admin_page_discuss-manage.css" rel="stylesheet" type="text/css" />

</head>
<% //��x�޲z�̸��
 
 String login_user=(String)session.getAttribute("user_id");
 Statement admin = con.createStatement();
 String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
 ResultSet admin_data = admin.executeQuery(admin_sql);

 %>
<body class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><img src="../../music3.jpg" width="320" />
      <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�޲z�̱z�n</div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="../logout.jsp"><img src="../../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
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
  <!-- end #header -->
</div>
<body class="oneColFixCtrHdr" >
<div id="container"  align="left">
  <div class="font 10" id="mainContent" align="right">
    <%
 
       String discuss_subject=request.getParameter("discuss_subject");//�q�����}?discuss_subject=X ��� 
       Statement subject1=con.createStatement();
	   ResultSet subject_data;
	   sql="select * from subject where subject_id='"+discuss_subject+"'";//�qsubject�Hsubject_id�ȧ��Q�װ����O����
	   subject_data=subject1.executeQuery(sql);
	   while(subject_data.next()){
	     String subject_text=subject_data.getString("subject_subject");
		 int type_id=subject_data.getInt("subject_id");
		 
%>
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
    <div id="showid" class="font10 style4" align="left">
      <table width="940" border="0">
        <tr>
          <td width="481"><a href="../admin_page_member_manage.jsp">��x�޲z����</a>
              <!-- end of �|�����Y-->
              <span class="style12">&gt;</span>
          <%
            if(type_id<12)
               out.print("<a href=\"admin_page_discuss.jsp?discuss_subject=12\">�Q�װϺ޲z-���֤���</a> <span class=\"style12\">&gt;</span>"+subject_text+"</td>");
		    else
               out.print("<a href=\"admin_page_discuss.jsp?discuss_subject=12\">�Q�װϺ޲z-�a�Ϥ���</a> <span class=\"style12\">&gt;</span>"+subject_text+"</td>");			
		%>          </td>
          <td width="449" align="right">�z�n�A<span class="style13"><%=admin_data.getString("user_nkname")%></span>�A�n�J�ɶ��G<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
        </tr>
      </table>
    </div>
    <%	}//else
	}//admin_data
	admin_data.close();
	admin.close();
%>
    <!---------------------bigleft--------------------->
    <!--�|���޲z-->
    <div id="bigleft"  align="left">
      <div class="font10 grayblock roundedTopCorners">
        <div class="style2 roundedTopCorners  title" >�|���޲z</div>
        <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="../admin_page_member_manage.jsp">�|�����</a></div>
        <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="../admin_page_member-feedback.jsp">�|�����|</a></div>
      </div>
      <!--���ʺ޲z-->
      <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
        <div class="style2 roundedTopCorners  title" >���ʺ޲z</div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="../admin_page_activity_post.jsp">���ʵo��</a></div>
        <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="../admin_page_manage_activity.jsp">���ʺ޲z</a></div>
      </div>
      <!--�Q�װ�.�a�Ϥ���-->
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners title" >�Q�װϺ޲z</div>
    <div class="bigleft-content2 style4 pointer" style="margin:20px 0px 6px 0px">�a�Ϥ���</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=12">�ػy����</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=13">�F�v����</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=14">��v����</a></a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=15">��L����</a></div>
    <!--�Q�װϺ޲z.��������-->
        <div class="bigleft-content2 style4 pointer" style="margin:35px 0px 6px 0px">��������</div>
	<div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=1">�n�u(Rock)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=2">�y��(Pop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=3">�q�l(Electronic)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=4">����(Metal)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=5">�H��(HipHop)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=6">��h(Jazz)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=7">�m��(Country)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=8">����(Folk)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=9">�j��(Classical)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=10">�R��(Dance)</a></div>
          <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss.jsp?discuss_subject=11">�`���Ž�(R&amp;B)</a></div>
        </div>
  <!--end of bigleft-->
    </div>
    <!---------------------bigright--------------------->
	<div  id="bigright" class="font10 block-bigright roundedCorners" align="left">

 	 <!--�˹��Ϊ��ť�-->
 <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
 <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
<!--end of �˹��Ϊ��ť�-->
      <div class="space">
        <div id="activity-title">
          <%
  if(type_id<12)
  {
    out.print("<div  class=\"font10 style2 roundedCorners\" style=\"padding-left:10px\">��������-"+subject_text+"</div>");
  }
  else
  {   
   out.print("<div  class=\"font10 style2 roundedCorners\" style=\"padding-left:10px\">�a�Ϥ���-"+subject_text+"</div>");
  }
  %>
        </div>
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
	sql="select COUNT(*) from title where subject_id='"+discuss_subject+"'";//!!!�p����
    rs=stmt_page.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  sql="select * from title where subject_id='"+discuss_subject+"' ORDER BY title_time ASC";//!!!�s��ƥX��
	  rs=stmt_page.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>
        <!-- ���X-->
        <div id="new-message" align="center" class="style4" style="margin-bottom:10px">
          <form action="admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>" method="POST">
            <table border=0>
              <tr>
                <td>�ثe����:<font color=red><%=ShowPage%></font>/ <font color=blue><%=PageCount%></font> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=1>[�Ĥ@��]</a> </td>
                <td><a href=admin_page_discuss.jsp?discuss_subject=<%=discuss_subject%>&ToPage=<%=PageCount%>>[�̫�@��]</a> </td>
                <td>��J����: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">		<input type="submit" name="SEND" value="�e�X" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
              </tr>
            </table>
          </form>
          <!-- ���Xend-->
          
        </div>
        <div class="table-padding style4" align="left">
          <table width="642" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">
            <tbody >
              <tr  align="center" style="background-color:#DCDCDC">
                <td width="9%">No</td>
                <td width="41%" align="left" >�Q�ץD�D</td>
                <td width="19%">�o��|��</td>
                <td width="17%">�B��</td>
              </tr>
              <%		
        Statement discuss_title=con.createStatement();
        ResultSet discuss_title_data;
	    
	
	    int count=1;
		i=0;
    	while(i<PageSize&&rs.next()){  
	    
	    String title_subject=rs.getString("title_subject");
		int title_id=rs.getInt("title_id");
        int id=rs.getInt("id");	   


        sql="select * from users where id="+id;
		Statement sttmt=con.createStatement();
        ResultSet user;
        user=sttmt.executeQuery(sql);
	    while(user.next()){
	    String user_nkname=user.getString("user_nkname");
		if(count%2==0)//���Ʊ� �Ǧ�
		{
		out.print("<form action=\"admin_delete_all.jsp\" method=\"post\" onsubmit=\"return delete_check()\">"); 
		out.print("<tr  style='background-color:#DCDCDC'>");
        out.print("<td height=\"45\" align=\"center\">"+count+"</td>");
        out.print("<td align=\"left\"><a href=admin_page_discuss_content.jsp?title_id="+title_id+"&discuss_subject="+discuss_subject+">"+title_subject+"</a></td>");
        out.print("<td align=\"center\"  > "+user_nkname+"</td>");		 
		out.print("<td align=\"center\"  ><input type=\"submit\" class='delete-block style4' name=\"send\" value=\"�R��\" ></td>");
		out.print("</tr>");
		out.print("<input type = \"hidden\" name = \"discuss_subject\" value="+discuss_subject+">");
	    out.print("<input type = \"hidden\" name = \"title_id\" value="+title_id+">");
		out.print("</form>");
		}
		else{//�_�Ʊ� �զ�
		out.print("<form action=\"admin_delete_all.jsp\" method=\"post\" onsubmit=\"return delete_check()\">");  
		out.print("<tr>");
        out.print("<td height=\"45\" align=\"center\">"+count+"</td>");
        out.print("<td align=\"left\"><a href=admin_page_discuss_content.jsp?title_id="+title_id+"&discuss_subject="+discuss_subject+">"+title_subject+"</a></td>");
        out.print("<td align=\"center\"  > "+user_nkname+"</td>");		
		out.print("<td align=\"center\"  ><input type=\"submit\" name=\"send\"  class='delete-block style4'  value=\"�R��\" ></td>");		
        out.print("</tr>");
		out.print("<input type = \"hidden\" name = \"discuss_subject\" value="+discuss_subject+">");
	    out.print("<input type = \"hidden\" name = \"title_id\" value="+title_id+">");
		out.print("</form>");
		}
		count++;
		i++;
	}//rs_page
	
	}//user
	}//title
	
	
	
	%>
            </tbody>
          </table>
        </div>
        <!--end of �]�_�Ӫ�padding-->
        <!--end of space-->
      </div>
      <!---------end of bigright --------->
    </div>
    <!--end of mainContent-->
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
  <!-- end #container -->
</div>

</body>
</html>
