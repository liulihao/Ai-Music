<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�|����ƺ޲z</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/admin_page_member-manage.css" rel="stylesheet" type="text/css" />
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


<style type="text/css">
<!--
.style13 {color: #FF0000}
-->
</style>
</head>
<% //��x�޲z�̸��
 
 String login_user=(String)session.getAttribute("user_id");
 Statement admin = con.createStatement();
 String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
 ResultSet admin_data = admin.executeQuery(admin_sql);

 %>
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

<body class="oneColFixCtrHdr" >

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
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_member_manage.jsp">�|���޲z</a>
            <!-- end of �|�����Y-->
          <span class="style12">&gt;</span> �|�����</a> </td>
      <td width="545" align="right">�z�n�A<span class="style13"><%=admin_data.getString("user_nkname")%></span>�A�n�J�ɶ��G<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>

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
<div  id="bigright" class="font10 block-bigright roundedCorners" align="left">

 <!--�˹��Ϊ��ť�-->
 <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px;z-index:1000"></div>
 <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px;z-index:1000"></div>
<!--end of �˹��Ϊ��ť�-->

<div class="space">
  
  <div id="activity-title">
    <div  class="font10 style2 roundedCorners" style=" padding-left:10px">�|����ƺ޲z</div>
  </div>
  <div class="table-padding style4" align="left" style="margin-bottom:30px">
  <form id="member_search1" name="member_search1" method="post" >
  <input name="member_search_text" type="text" class="font10 input-style" id="member_search_text" size="15" maxlength="15"/>
  <input type="button" value="�j�M" onclick="member_search()" class="font10 input-style-type style4"/>
  </form>
  </div>
  
  
  <div class="table-padding style4">
    <form action="admin_page_member_query.jsp" METHOD="POST" name="member_query_list" id="member_query_list">
     <div style="margin-bottom:10px" id="order_select"> 
    
     <span class="genmed">��ܱƦC�覡:<select name="mode" id="mode" class="font10 input-style style4">
           <option value="reg_time">���U�ɶ�</option>
           <option value="user_id">�|���b��</option>
           <option value="login_time">�W���n�J�ɶ�</option>
         </select>
&nbsp;&nbsp;����:<select name="order" id="order" class="font10 input-style style4">
  					<option value="ASC" selected="selected"> �̧ǻ��W</option>
  					<option value="DESC">�̧ǻ���</option>
				</select>
&nbsp;&nbsp;
			<input type="submit" name="submit" value="�ƦC" class="font10 input-style-type style4"/>
     </span>     </div>
    </form>
   <div id="search_member"></div>
 <%      
    int PageSize=10;//�]�w�C�i������ܪ�����
	int ShowPage=1;//�]�w����ܪ�����
	int RowCount=0;//ResultSet�O������
	int PageCount=0;//ResultSet�����᪺�`����
	String query=request.getParameter("query");//��qmember_query�^�Ǫ�query�覡
	String ToPage=request.getParameter("ToPage");
	if(ToPage!=null){//�P�_�O�_�i���T���oToPage�Ѽ� �i���o�h���JSP��������ܯS�w�����������ԭz
	  ShowPage=Integer.parseInt(ToPage);//���o���w��ܪ���������
	  	  if(ShowPage<=0){
	    ShowPage=1;//�Y���w���Ƥp��0 �h�]�w��ܲĤ@��������
	  }
	 }
	 sql="select COUNT(*) from users where user_authority = 0 or user_authority = 1";
	 rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  if(query!=null){
	  sql="select * from users where user_authority = 0 or user_authority = 1 order by "+query;
	  }
	  else{
	    sql="select * from users where user_authority = 0 or user_authority = 1 order by reg_time ASC";
	  }
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��ĵ��O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
   
   %>
   <!--����-->
   <div id="member"><!--member-->
   <div style="margin:15px 0 20px 0;" align="center">
   <form action="admin_page_member_manage.jsp" method="POST">
    <p>�@��<font color="#0066FF"><b><%=RowCount%></b></font>���j�M���G</p>
     <table border=0>
   <tr>
       <td>�ثe����:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=admin_page_member_manage.jsp?ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
		<td> <a href=admin_page_member_manage.jsp?ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
		<td> <a href=admin_page_member_manage.jsp?ToPage=1>[�Ĥ@��]</a>		</td>
		
		<td> <a href=admin_page_member_manage.jsp?ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
		<td>��J����: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">		<input type="submit" name="SEND" value="�e�X" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
	</tr>
	</table>
 </form> 
 </div>
 <!--End of ����-->
 <table width="658" border="0" align="center">
   <tr >
     <td width="50" align="center" class="tablebtm col-width1"><div class="col-width1">#</div></td>
     <td width="147" align="center" class="tablebtm col-width2"><div class="col-width2">�|���b��</div></td>
     <td width="132" align="center" class="tablebtm">���U�ɶ�</td>
     <td width="130" align="center" class="tablebtm">�W���n�J�ɶ�</td>
     <td width="129" align="center" class="tablebtm">���A</td>
   </tr>
   <%
	int num=(ShowPage-1)*10;
	i=0;
    while(i<PageSize&&rs.next()){
	/*while(rs.next()){*/
	 num++;
	  String user_id=rs.getString("user_id");
	
	  int user_authority=rs.getInt("user_authority");
	  int id=rs.getInt("Id");
	  
%>
   <tr>
     <td align="center" class="tablebtm"><div class="col-width1"><%=num%></div></td>
     <td align="center" class="tablebtm"><div class="col-width2"><%=user_id%></div></td>
     <td align="center" class="tablebtm"><%=rs.getDate("reg_time")%> <%=rs.getTime("reg_time")%></td>
     <td align="center" class="tablebtm"><span class="gensmall"><%=rs.getDate("login_time")%> <%=rs.getTime("login_time")%></span></td>
     <%		if(user_authority==0){//if1%>
     <td align="center" class="tablebtm"><input type="button" value="���v" onclick="location.href='member_stop.jsp?id=<%=id%>'" class="stop-block style4"/></td>
     <%		}//if1
    	else{//else1
%>
     <td width="44" align="center" class="tablebtm"><input type="button" value="���v��" onclick="return authority_return(<%=id%>)" class="stoped-block style4"/></td>
     <%	
	}//else1
%>
   </tr>
   <%i++; 
     }%>
 </table>
<%

	 rs.close();
	 stmt.close();
	 }//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
 %>
 </div><!--member end-->
    </div>
    <!--end of �]�_�Ӫ�padding-->
    
    
    <!--���X-->
    <div style="margin-top:10px" align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      
     
    </table>
    </div>
    
    
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
