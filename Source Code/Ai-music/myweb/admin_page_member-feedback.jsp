<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�|�����|</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/admin_page_member-feedback.css" rel="stylesheet" type="text/css" />
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

function openMail(id){<!--���}�H�l�l����-->
	window.open("feedback_mail.jsp?f_id="+id,"�o�e�H��","modal=yes,left=480, top=480,toolbar=no,location=0,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=450,height=350")
}
</script>


</head>
<% //��x�޲z�̸��
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	Statement admin=con.createStatement();
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
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_discuss-manage.jsp">�|���޲z
            <!-- end of �|�����Y-->
          <span class="style12">&gt;</span> �|�����</a> </td>
      <td width="545" align="right">�z�n�A<span class="style13"><%=admin_data.getString("user_nkname")%></span>�A�n�J�ɶ��G<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
<%
	
%>
</div>
<!---------------------bigleft--------------------->

<!--�|���޲z-->
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

<div  id="bigright" class="font10 block-bigright roundedCorners" align="left">

 <!--�˹��Ϊ��ť�-->
 <div style="position:absolute; background:#FFFFFF; left: 668px; top: 20px; width:8px; height:20px"></div>
 <div style="position:absolute; background:#FFFFFF; left: 651px; top: 20px; width:8px; height:20px"></div>
<!--end of �˹��Ϊ��ť�-->

<div class="space">
  
  <div id="activity-title">
    <div  class="font10 style2 roundedCorners" style="padding-left:10px">�|�����|</div>
  </div>
    <%//���|�C���X
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
	 sql="select COUNT(*) from feedback";
    rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  sql="select * from feedback order by f_time DESC";
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>      
<!-- ���X-->
    <div id="new-message" align="center" class="style4">


    <form action="admin_page_member-feedback.jsp" method="POST">
     <table border=0>
   <tr>
       <td>�ثe����:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=1>[�Ĥ@��]</a>		</td>
		
		<td> <a href=admin_page_member-feedback.jsp?ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
		<td>��J����: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">		<input type="submit" name="SEND" value="�e�X" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
	</tr>
	</table>
 </form> 
    
<!-- ���Xend--></div>
<%
	i=0;
	int num=PageSize*(PageCount-1)+1;
	while(i<PageSize&&rs.next()){ 
		String f_user_id=rs.getString("post_id");
		
		Statement user=con.createStatement();
		String user_sql = "SELECT * FROM users WHERE user_id = '"+f_user_id+"'";
		ResultSet user_data = user.executeQuery(user_sql);
		
%>
      <div class="table-padding style4" align="left">
      <table width="642" >
        <tr><%while(user_data.next()){
			
			String user_nkname=user_data.getString("user_nkname");//��|���ʺ�
			String user_email=user_data.getString("user_email");
			String f_title=rs.getString("f_title");//���|����]
			
			int f_id=rs.getInt("id");
			String f_text=rs.getString("f_text");//���|���z��
			String f_url=rs.getString("f_url");//�Q���|�����}
			%>
          <td width="135" class="col-padding table-left" align="right">�|��</td>
          <td class="table1 col-padding1"><%=user_nkname%></td>
        </tr>
        <tr>
          <td class="col-padding table-left" align="right">�Q���|�b��</td>
          <td class="table1 col-padding1"><%=rs.getString("user_id")%></td>
        </tr>
        <tr>
          <td height="21" class="col-padding table-left" align="right"><p>�Q���|��]</p></td>
          <td class="table1 col-padding1" ><%=f_title%></td>
        </tr>
        <tr>
          <td class="col-padding table-left" align="right">�Q���|���}</td>
          <td class="table1 col-padding1"><a href="<%=rs.getString("f_url")%>"  class="f_url" target="_blank">�����|���}</a></td>
        </tr>
        <tr>
          <td height="200" width="135" align="right" class="col-padding table-left">���|���e</td>
          <td class="table1" ><div class=" col-padding1" >
            <%=f_text%>
          </div></td>
        </tr>
        <tr>
          <td height="126" width="135"  class="col-padding table-left" align="right"   >�`�N�ƶ�</td>
          <td class="table1"><div class="col-padding1"><p>�p�H��ĳ�ѩ�Ai-Music�P�_���誧���A�бz�ۦ�`�q�k�~�|�ѨM</p>
            <p>���誧ĳ�A�p�z���Q�ΤW�}�޹D�ݦ����|�A�N�|�Q�����b���ϥ��v </p>
            <p>&nbsp;</p>
            <ul style="padding-left:15px">
              <li>�D��ĵ����} http://www.net110.gov.tw</li>
              <li>�q���Ǹo�p�ճ��׹q�ܡG(02)27697403</li>
              <li>�����Ǹo���|�q�l�H�c�G Cybercop@cib.gov.tw</li>
              </ul>            </div></td>
        </tr>
        <tr>
          <td class="table1-left" align="right">���|�s��:<%=num%></td>
          <td class="table"><div style="height:25px; margin:5px 5px 0 5px;"><input type="button" class="send-block style4" onclick="openMail(<%=f_id%>)" value="�H�e���|�q��"/></div></td><%}%>
        </tr>
      </table>
    </div>
    <%
		num++;
		i++;
		}//rs
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

<!---------end of bigright ---------></div>
<!--end of mainContent--></div>
  
  
  
  
  
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


</body>
</html>
