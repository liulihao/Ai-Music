<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title></title>

<style type="text/css">
<!--
.small-grayblock{
     border:1px dashed #5F5F5F;
	 width:50px;
	 cursor:pointer;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.hello{
	font-family: sans-serif;
	font-size: 50px;
}

.mynameis{
    font-family: sans-serif;
}

.bar-color{ /*���⪺����*/
background:#0600ff;
color:#FFFFFF;
   -moz-opacity: 0.7;
   opacity: 0.7;
   }
   
   
.font10 {
	font-size: 10pt;
	line-height: 15pt;
	letter-spacing: 0.2em;
	text-indent: 0.2pt;
}
   
   
/*�ꨤ���*/
.roundedCorners {
	/*border: 1px solid #000;*/
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}

.roundedTopCorners {/*�W��*/
	/*border: 1px solid #000;*/
	-moz-border-radius-topleft: 10px;
	-webkit-border-top-left-radius: 10px;
	-moz-border-radius-topright: 10px;
	-webkit-border-top-right-radius: 10px;
}
 
.roundedBottomCorners {/*�U��*/
	border: 1px solid #000;
	-moz-border-radius-bottomleft: 10px;
	-webkit-border-bottom-left-radius: 10px;
	-moz-border-radius-bottomright: 10px;
	-webkit-border-bottom-right-radius: 10px;
}
   
   
/*���C��϶�*/   
.style4 {color:#5F5F5F} /*�Ǧ�*/
.style5 {font-size: x-small}
-->

.input-style{
   border:1px dotted #DADADA; 
   background-color:#FFFFFF;
}

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#CCCCCC;
}

</style>
<script language="javascript" src="../js/prototype.js"></script>
<script language="javascript">
function check_opinion(){//�ˬd���
	if($("opinion_text").value==""){
	  window.alert("�N�����e����");
	   $("opinion_text").focus();
	  return false;
	}
	return true;
}
</script>
<link href="../../CSSfile/jump-out.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="roundedCorners" style="background-color:#FDFDFD;padding-bottom:8px;padding-left:10px">
<form action="opinion_saveopinion.jsp" name="opinion" method="post">

<table width="300" class="font10 style4" >
  <tr><td><div style='margin:0px 0px 15px 0px'>
<%
	String parent_url=request.getParameter("web_url");//���o���������}
	int track_id = Integer.parseInt(request.getParameter("music_id"));
	//������W�@���ǹL�Ӫ�music_id�ȡA�~��b�e���ɱNmusic_id�H�������e�X�h
	String login_user = (String)session.getAttribute("user_id");//������n�J���ϥΪ̱b���A�~��h��Ʈw���ӵn�J�ϥΪ̪��ʺ�
	sql="select * from users where user_id='"+login_user+"'";
	rs=stmt.executeQuery(sql);
	while(rs.next()){
		String post_nkname = rs.getString("user_nkname");
		//String user_id = rs.getString("user_id");
%>
		�|���W��:<%=post_nkname%>
		<!--�n�J�̼ʺ�-->
		<input name="track_id" type="hidden" value="<%=track_id%>"/>
		</div>
		�^�����e &nbsp;<span class='style4'>(����J�T�ʦr)</span>
<%
	}
	stmt.close();
	rs.close();
	con.close();
%>
  
  <div style='margin-top:5px'>
    <textarea name="opinion_text" id="opinion_text" cols='32' rows='8' class="font10 style4"></textarea>
  </div>

      <tr>
        <td align="center">
        <input type="submit" value='�e�X' class='input-style' onClick="return check_opinion()"  >
        <input type="button" value='����' onClick="parent.location.href='<%=parent_url%>';" class='input-style' >
        </td>
      </tr>
    </table>
    

</form>
</div>
</body>
</html>
