<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�n�ͺ޲z</title>
<!--�o�̥Ϊ�css-->
<link href="../CSSfile/member_manage_friends.css" rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
    <script type="text/javascript" src="../javascripts/window_effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
<!--���ҭ��O-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

<script src="js/member_manage.js" type="text/javascript"></script>
<script src="js/prototype.js" type="text/javascript"></script>
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
</head>
<% //�|�����
 String user_id = request.getParameter("user");//��|���Ŷ����|�����
 String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
 if(user_id==null){//�p�G�줣��|���Ŷ����}��?user=xxx���� ��ܬO���H�n�J �h�n�J��id=�|��id
  user_id=login_user;
  }
 Statement user=con.createStatement();
 String user_sql="select * from users where user_id='"+user_id+"'";
 ResultSet user_data;
 user_data=user.executeQuery(user_sql);

 %>
<body vlink="#5F5F5F" class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><a href="index.jsp">
    <div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" /> <span class="font10">�^����</span> </div>
    </a>
      <%
	if (login_user == null)
	{
%>
      <div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm()">�n�J</a></div>
    <%
	}
	else
	{
%>
      <!--<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >�ڭn���|</span> </div>-->
    <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>�ڪ��Ŷ�</span> </div>
    <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>�|���z�n</div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>�ڪ��޲z����</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>�n�X</span> </div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
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
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=login_user%>">�ӤH�Ŷ�</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=login_user%>">�̷s�T��</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=login_user%>">���֧@�~</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=login_user%>"> ���֦��� </a></td>
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=login_user%>">�ڪ��B��</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=login_user%>">�d����</a> </td>
      </tr>
    </table>
  </div>
</div>
<div id="container"  align="left">
  
<!--�|�����Y-->
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">�ڪ��޲z����</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">�n�ͺ޲z</a></div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >�ڪ��޲z����</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">�ӤH��ƺ޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">���֦��ú޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">�n�ͺ޲z</a></div>
  </div>
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners  title" >���ֺ޲z</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">���֧@�~�޲z</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">�޲z�۩w����</a></div>
  </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->
<div  id="bigright" class="font10" align="left">
  <!--���ҭ��O-->
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab " tabindex="0">�n�ͰT��</li>
      <li class="TabbedPanelsTab " tabindex="0">�n�ͺ޲z</li>
      </ul>
    <div class="TabbedPanelsContentGroup">
   	 <div class="TabbedPanelsContent"><!--�O�H�Ʊ�[�p���n�ͪ��T��-->
      	
            
<%	 
	Statement friend_added = con.createStatement();
	String friend_added_sql="select * from friend,users where friend.friend_id='"+login_user+"' AND friend.user_id=users.user_id AND friend.friend_check = 0 ORDER BY friend_time DESC"; //user_id �@�w�|���� login_user�Afriend.user_id=users.user_id �o�y�ܬO���F����誺�Y����ʺ�
	ResultSet friend_added_data = friend_added.executeQuery(friend_added_sql);
	
	if(!friend_added_data.next()){//if�L�n�ͥӽ�
		%>
    <div class="font10" style="margin:10px 0 0 10px"><font color="#FF0000">�ثe�S���|���ӽЧA���n��</font></div>
			<div class="table-padding"><!--padding2-->
            
    <%}else{//if�L�n�ͥӽ�end else%>
    <div class="font10"  style="margin:10px 0 0 10px"><font color="#FF0000">�Y�n������誺�n�ͥӽСA�Ы��T�w</font></div>
			<div class="table-padding"><!--padding2-->
	<%
		friend_added_data.previous();
     while(friend_added_data.next()){
		
		String friend_added_user_id = friend_added_data.getString("friend.user_id"); //�[�ڪ��H���b���W��
		String friend_added_friend_id = friend_added_data.getString("friend.friend_id"); 
		String friend_added_user_pic = friend_added_data.getString("users.user_pic");//�qusers��friend user_id��pic
		String friend_added_user_nkname = friend_added_data.getString("users.user_nkname");		 	 				
		    //�qusers��friend user_id��nkname
%>
          <div class="friend-block" align="center">
            <input type="button" class="new-block style4" value="����" onclick="location.href='member_manage_friends_accept.jsp?user_id=<%=login_user%>&friend_id=<%=friend_added_user_id%>'"/>
            <input type="button" class="delete-block style4" value="�ڵ�" onclick="location.href='member_manage_friends_delete.jsp?user_id=<%=friend_added_user_id%>&friend_id=<%=friend_added_friend_id%>'"/>
            
            <div style="clear:both"></div>
            
            <a href="member_page.jsp?user=<%=friend_added_user_id%>"><div style="border:1px solid #E5E5E5"><img src="user/<%=friend_added_user_id%>/<%=friend_added_user_pic%>" width="90" height="90" /></div></a><br />
            <a href="member_page.jsp?user=<%=friend_added_user_id%>"><%=friend_added_user_nkname%></a>
          </div>
		  <%}//�L�n�ͥӽ�else
		 	}//beFriend_data
			friend_added_data.close();
			friend_added.close();
		  %>
      			
                 
          	<div style="clear:both"></div><!--�M���B��-->
			</div><!--end of padding2-->
           
<p>&nbsp;</p>
<%	 
	Statement friend_add = con.createStatement();
	String friend_add_sql="select * from friend,users where friend.user_id='"+login_user+"' AND friend.friend_id = users.user_id AND friend.friend_check = 0 ORDER BY friend_time DESC"; //user_id �@�w�|���� login_user�Afriend.user_id=users.user_id �o�y�ܬO���F����誺�Y����ʺ�
	ResultSet friend_add_data = friend_add.executeQuery(friend_add_sql);
	if(!friend_add_data.next()){
%>
	<div class="font10"  style="margin:10px 0 0 10px"><font color="#FF0000">�A���n�ͥӽг��Q�P�N�F</font></div>
            <div class="table-padding"><!--padding3-->
<%
	}else{
	%>
    <div class="font10" style="margin-left:10px"><font color="#FF0000">�٦b���ݹ��P�N�A���n�ͥӽ�</font></div>
            <div class="table-padding"><!--padding3-->
    <%
	 friend_add_data.previous();
     while(friend_add_data.next()){
		
		String friend_add_user_id = friend_add_data.getString("friend.friend_id"); //�ڷQ�[���H���b���W��				
		String friend_add_user_pic = friend_add_data.getString("users.user_pic"); //�ڷQ�[���H���Y��
		String friend_add_user_nkname = friend_add_data.getString("users.user_nkname");//�ڷQ�[���H���ʺ�
%>
          <div class="friend-block" align="center">
            <font color=blue>���ݦP�N��</font>
            <a href="member_page.jsp?user=<%=friend_add_user_id%>"><img src="user/<%=friend_add_user_id%>/<%=friend_add_user_pic%>" width="90" height="90" /></a><br />
            <a href="member_page.jsp?user=<%=friend_add_user_id%>"><%=friend_add_user_nkname%></a>
          </div>
		  <%
		  	}
		 	}//beFriend_data
			friend_add_data.close();
			friend_add.close();
		  %>
          	<div style="clear:both"></div><!--�M���B��-->
			</div><!--end of padding3-->
            
<p>&nbsp;</p>
<p>&nbsp;</p>

       </div><!--end of �O�H�Ʊ�[�p���n�ͪ��T��-->
      <!--�򥻸�Ƽ��Ҥ��e-->
      <div class="TabbedPanelsContent">

          <div class="table-padding">
<%//�n�ͦC���X
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
	 sql="select COUNT(*) from friend where user_id='"+user_id+"' AND friend.friend_check=1";
    rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	PageCount=(RowCount+PageSize-1)/PageSize;//�p����ܪ�����
	 if(ShowPage>PageCount){
	    ShowPage=PageCount;//�P�_���w�����O�_�j���`���� �O�h�]�w��̫ܳ�@��
	  }
	  //if(login_user.equals(user_id)){
	  sql="select * from friend,users where friend.user_id='"+user_id+"' AND friend.friend_id=users.user_id AND friend.friend_check=1 ORDER BY friend_time DESC";

	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��Ĥ@���O���W
	  int i,j;//�]�w�@����ܪ���������
	  i=(ShowPage-1)*PageSize;     
      for(j=0;j<i;j++)   
	  rs.next();
%>      
<!-- ���X-->
    <div id="new-message" align="center" class="style4">

    <form action="member_manage_friends.jsp?user=<%=user_id%>" method="POST">
     <p>�A�@��<font color="#0066FF"><b><%=RowCount%></b></font>�Ӧn��</p>
     <table border=0>
   <tr>
       <td>�ثe����:<font color=red><%=ShowPage%></font>/
           <font color=blue><%=PageCount%></font>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=<%=ShowPage-1%>>[�W�@��]</a>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=<%=ShowPage+1%>>[�U�@��]</a>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=1>[�Ĥ@��]</a>		</td>
		
		<td> <a href=member_manage_friends.jsp?user=<%=user_id%>&ToPage=<%=PageCount%>>[�̫�@��]</a>		</td>
		
		<td>��J����: <input type="text" id="page_text" size=3 name="ToPage" class="font10 style4 input-style">
        <input type="submit" name="SEND" value="�e�X" onclick="return check_page()" class="font10 style4 input-style-type">		</td>
	</tr>
	</table>
 </form> 
    
<!-- ���Xend--></div>
          <!--�n�Ͱj��бq�o�̥]-->
          <%
		   	i=0;
    		while(i<PageSize&&rs.next()){   
			  String friend_id=rs.getString("friend.friend_id");//�qfriend��friend_id
			  String friend_user_id=rs.getString("friend.user_id");//�qfriend��friend_id
			  int friend_check=rs.getInt("friend.friend_check");//�qfriend��friend_check �T�{�O�_���n��
			  
			  String friend_pic=rs.getString("users.user_pic");//�qusers��friend��pic
			  String friend_nkname=rs.getString("users.user_nkname");//�qusers��friend��nkname
			  if(friend_check==1){//�R���H���n�ͪ��H
		  %>
          
          <div class="friend-block" align="center">
            <input type="button" class="delete-block2 style4" value="�R��" onclick="return delete_manage_friend('<%=user_id%>','<%=friend_id%>')"/>
            <a href="member_page.jsp?user=<%=friend_id%>"><img src="user/<%=friend_id%>/<%=friend_pic%>" width="90" height="90" /></a><br />
            <a href="member_page.jsp?user=<%=friend_id%>"><%=friend_nkname%></a>
          </div>
          		  <%
		  		} //if end
		   	i++;
		  	}//rs
			rs.close();
			stmt.close();
		  %>
          
          <!--�H�W-->   
          
           <!--�M���B��-->
           <div style="clear:both"></div>
			
          </div><!--end of padding-->
          </div><!--end of �򥻸�Ƽ���-->
          
      
     
           
    </div><!--end of TabbedPnelsGroup-->
  </div>
  <!---------end of bigright --------->
</div>

  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music �W�߭��ֺ� Inc 2009 <a href="mailto:musicyourlife@gmail.com">�p���ڭ�</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
function openConfirm() {
    Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp"})
}

function openConfirm2() {
    Dialog.confirm("Do you like this effect?",{className:"alphacube", width: 400, height:30, })
  }       
  
function openConfirm2() {
    var win = new Window({className:"alphacube",closable:true,minimizable:false,maximizable:false,draggable:false,width: 400, height:200,})
    win.getContent().update("<div style='color:#000; background-color:#FDFDFD;-moz-opacity:1;opacity:1 ;width:400px; height:200px;z-index:1000'><h1>Hello</h1>Word</div>");     
    win.showCenter();
  }           

</script>
</body>
</html>
