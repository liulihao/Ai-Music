<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�קﬡ�ʦ��\</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/admin_page_post-activity.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--

.style13 {color: #FF0000}
.style11 {
	font-size: 20pt;
	font-family: "�L�n������";
}
-->
</style>
<script src="js/admin_manage.js" type="text/javascript"></script>
</head>

<body class="oneColFixCtrHdr" >
<% request.setCharacterEncoding("big5");%>
<%!/** 
   * �R����� 
   * @param filePathAndName String �����|�ΦW�� �pc:/fqf.txt 
   * @param fileContent String 
   * @return boolean 
   */ 
  public void delFile(String filePathAndName) { 
    try { 
      String filePath = filePathAndName; 
      filePath = filePath.toString(); 
      java.io.File myDelFile = new java.io.File(filePath); 
      myDelFile.delete(); 

    } 
    catch (Exception e) { 
      System.out.println("�R�����ާ@�X��"); 
      e.printStackTrace(); 

    }

  }
%>
<%
	//��x�޲z�̸��
	String login_user=(String)session.getAttribute("user_id");
	Statement admin = con.createStatement();
	String admin_sql = "SELECT * FROM users WHERE user_id = '"+login_user+"'";
	ResultSet admin_data = admin.executeQuery(admin_sql);
 
	int id = Integer.parseInt(request.getParameter("id")); //�����W�@���ǨӪ��ܼ�(id) (id�� = activity_code��)
	rs = stmt.executeQuery("SELECT * FROM activity_info WHERE activity_code = '"+id+"'");
	
/*	while(rs.next()){
		String file_activity_pic = rs.getString("activity_pic");
		String del_pic_pathfile = request.getRealPath("/") + "myweb/images/activity_pic/"+file_activity_pic;
	 	delFile(del_pic_pathfile);//�R���Ϥ�
	}*/
	
	
	//[WHERE activity_code = '"+id+"']���n!!! �n�O�o�[!
	
	
	/*---------------�U�����קﬡ�ʡA��s��Ʈw���{���X------------------*/
	
	//�ɮפW�ǳ���
	String activity_pic = null;  //�ŧi�ɮצW��
	String saveDirectory = request.getRealPath("/") + "myweb/images/activity_pic/"; //�]�w�W�Ǹ��|
	int maxPostSize = 3 * 1024 * 1024 ; //�ɮפj�p����3MB
	String enCoding = "big5"; //�s�X
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, enCoding);
	Enumeration filesname = multi.getFileNames();
	while (filesname.hasMoreElements())
	{
		String name = (String)filesname.nextElement();  //���ɮת��W��
        activity_pic = multi.getFilesystemName(name);   //�N�ɮצW�٫��w��activity_pic	
	}
	//��e�@�����̪���
	String activity_title = multi.getParameter("activity_title");
	String activity_date_s = multi.getParameter("activity_date_s");
	String activity_date_f = multi.getParameter("activity_date_f");
	String activity_time_s = multi.getParameter("select_H_s") + ":" + multi.getParameter("select_M_s");
	String activity_time_f = multi.getParameter("select_H_f") + ":" + multi.getParameter("select_M_f");
	String activity_location = multi.getParameter("activity_location");
	String activity_target = multi.getParameter("activity_target");
	String activity_content = multi.getParameter("activity_content");
	
	//�Nactivity_content�̭��ݭn���檺�a���ন<br>
	StringBuffer buf = new StringBuffer(activity_content.length()+6);
	char ch = ' ';
	for(int p = 0;p < activity_content.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch = activity_content.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	activity_content = buf.toString();
	
	//��PreparedStatement�A�N�ק����UPDATE�ܸ�Ʈw
	sql = "UPDATE activity_info SET activity_title=?,activity_date_s=?,activity_date_f=?,activity_time_s=?,activity_time_f=?,activity_location=?,activity_target=?,activity_content=?,activity_pic=?,activity_update=NOW() WHERE activity_code=?"; //[WHERE activity_code=?] ���n!!! �O�o�n�[!
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,activity_title);
	pstmt.setString(2,activity_date_s);
	pstmt.setString(3,activity_date_f);
	pstmt.setString(4,activity_time_s);
	pstmt.setString(5,activity_time_f);
	pstmt.setString(6,activity_location);
	pstmt.setString(7,activity_target);
	pstmt.setString(8,activity_content);
	//pstmt.setString(10,NOW());  //�����bSQL�y�����A�Nactivity_update�]�w�n�A�ҥH�o�y�i�H���ѱ�
	
	//�P�_�O�_���s���Ϥ��ǤJ
	if(activity_pic == null){ //�p�Gactivity_pic�èS���ǤJ�� �N��Ϥ�����s �h�ϥέ�Ӫ��Ϥ��ɮצW��
		while(rs.next()){
			activity_pic = rs.getString("activity_pic"); //���o��Ӫ��ɮצW��
        	pstmt.setString(9,activity_pic);
		}
	}
	else{ //�_�h�N�N�s�����|�ǤJ��Ʈw
		rs = stmt.executeQuery("SELECT * FROM activity_info WHERE activity_code = '"+id+"'");
	
		while(rs.next()){
			String file_activity_pic = rs.getString("activity_pic");
			String del_pic_pathfile = request.getRealPath("/") + "myweb/images/activity_pic/"+file_activity_pic;
	 		delFile(del_pic_pathfile);//�R���Ϥ�
		}
		pstmt.setString(9,activity_pic);
	}
	pstmt.setInt(10,id); //�Nid���w��activity_code
	pstmt.executeUpdate(); //�����ܼƳ����ǰe���\(set)�~�����o��

	pstmt.close();
	stmt.close();
	response.setHeader("Refresh","3; URL=admin_page_manage_activity.jsp");
%>
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
          <span class="style12">&gt;&nbsp;</span><a href="admin_page_manage_activity.jsp">���ʺ޲z</a>
            <!-- end of �|�����Y-->
          <span class="style12">&gt;</span>���ʭק�</td>
      <td width="545" align="right">�z�n�A<span class="style13"><%=admin_data.getString("user_nkname")%></span>�A�n�J�ɶ��G<span class="style13"><%=admin_data.getDate("login_time")%> <%=admin_data.getTime("login_time")%></span></td>
    </tr>
  </table>
<%
	
%>
</div>
  <!-- end of �|�����Y-->
  




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
<div  id="bigright" class="font10 style4 right roundedCorners" align="left">
  <!--�˹��Ϊ��ť�-->
  <div style="position:absolute; background:#FFFFFF; left: 648px; top: 20px; width:8px; height:20px; z-index:1000"></div>
  <div style="position:absolute; background:#FFFFFF; left: 631px; top: 20px; width:8px; height:20px; z-index:1000"></div>
  <!--end of �˹��Ϊ��ť�-->
  <div class="space">
    <div id="activity-title" >
      <div  class="font10 style2" style="padding-left:10px">���ʭק�</div>
    </div>
    <div class="table-padding">
     <span class="table-padding style11">���ʭק粒��,3��ᬰ�z��^���ʺ޲z�����C</span>
    </div>
    <!--end of �]�_�Ӫ�padding-->
    <%
 	}//else
	 }//admin
     admin.close();
	 admin_data.close();
	 con.close();
	 %>
  </div>
  <!--end of space-->
  <!---------end of bigright --------->
</div>
<!--end of mainContent--></div>

  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>

</body>
</html>