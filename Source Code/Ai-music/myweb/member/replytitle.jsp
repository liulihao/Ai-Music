<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<html>
<title>�^�ХD�D</title>


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
-->

.input-style{
   border:1px dotted #DADADA; 
   background-color:#FFFFFF;
}

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#DADADA;
}

.style4 {color:#5F5F5F} /*�Ǧ�*/

</style>

<body class="font10 style4">

<%

  String login_user= (String)session.getAttribute("user_id");
  sql="select * from users where user_id='"+login_user+"'";
  rs=smt.executeQuery(sql);
  
  int title_id = 0;
  if(request.getParameter("title_id") == null)
  {
  }
  else
  {
	title_id = Integer.parseInt(request.getParameter("title_id"));
  }
%>
<div class="roundedCorners" style="background-color:#FDFDFD;padding:30px 0px 8px 10px">
<form action='savecontent.jsp?title_id=<%=title_id%>&login_user=<%=login_user%>'  method='post' enctype='multipart/form-data'>
<table border="0" class="font10">
 
  
  
   <tr>
     <td style="padding-bottom:10px">�^�Ф��e</td>
	 <td rowspan="6"><textarea name="reply_content" rows=10 cols=40></textarea></td>
  </tr>
  
   <tr>
     <td>&nbsp;</td>
     </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
   	<td>&nbsp;</td>
    <td><div style="padding-left:10px">�^�����e &nbsp;<span class='style4'>(����J�@�d�r)</span></div></td>
   </tr>
   <tr>
     <td><div style="margin-top:10px">�W�ǹϤ�</div></td>
      <td><div style="margin-top:10px"><input name="reply_pic" type="file" id="reply_pic"></div></td>
  </tr>
  
  <tr>
     <td align=center colspan=2><div style="margin-top:10px;padding-left:65px" align="left">
       <input type=submit name="send" value="�e�X�峹" class="input-style style4">
       &nbsp;
       <input name="reset" type="reset" value="�M�����g" class="input-style style4"></div></td>
  </tr>
</table>
</form>
</div>
</body>
</html>