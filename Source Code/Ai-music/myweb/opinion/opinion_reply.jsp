<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title></title>
<link href="../../CSSfile/jump-out.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
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
   color:#5F5F5F;
}

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#EDEDED;
   cursor:pointer;
}

-->
</style>
<script language="javascript" src="../js/prototype.js"></script>
<script language="javascript">
function check_reply(){//�ˬd���
	if($("reply_text").value==""){
	  window.alert("�^�Ф��e����");
	  $("reply_text").focus();
	  return false;
	}
	return true;
}
</script>
</head>
<body>
<div class="roundedCorners" style="background-color:#FDFDFD;padding:15px 0px 8px 0px" >
<form action="opinion_savereply.jsp" name="opinion" method="post">
      <table width="300" class="font10 style4" >
  <tr><td>
<%
	String parent_url=request.getParameter("web_url");//���o���������}
	int track_id = Integer.parseInt(request.getParameter("music_id"));
	int id = Integer.parseInt(request.getParameter("id"));
	//������W�@���ǹL�Ӫ�music_id�ȡA�~��b�e���ɱNmusic_id�H�������e�X�h
%>
<!--�n�J�̼ʺ�-->
		<input name="track_id" type="hidden" value="<%=track_id%>"/>
        <input name="id" type="hidden" value="<%=id%>"/>
		<div style="padding-left:10px">�^�����e &nbsp;<span class='style4'>(����J�T�ʦr)</span></div>

  <div style='margin-top:5px;padding-left:10px'>
    <textarea name="reply_text" id="reply_text" cols='32' rows='8' class="font10 style4"></textarea>
  </div>
    
      <tr>
        <td align="center">
        <input type="submit" value='�e�X' onClick="return check_reply()" class='input-style' >
        <input type="button" value='����' onClick="parent.location.href='<%=parent_url%>';" class='input-style' >
    
  </td></tr>
  </table>
</form>
</div>
</body>
</html>
