<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<head>
<title>�H���|�q��</title>


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

.input-style-reset{
   border:1px dotted #DADADA; 
   background-color:#FFFFFF;
   color:#5F5F5F;
}

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#ff091a;
   color:#FFF;
   cursor:pointer;
}

.input-style-reset:hover{
   border:1px dotted #DADADA; 
   background:#0600ff;/*#3E6082;*//*#408080;*/
   -moz-opacity: 0.7;
   opacity: 0.7;
   color:#FFF;
   cursor:pointer;
}

</style>

</head>
<% request.setCharacterEncoding("big5");%> 
<%
	int f_id=Integer.parseInt(request.getParameter("f_id"));
	sql="select * from feedback,users where feedback.user_id=users.user_id AND feedback.id="+f_id;
	rs=stmt.executeQuery(sql);
	while(rs.next()){
		String user_email=rs.getString("users.user_email");
		String f_title=rs.getString("f_title");
		String f_text=rs.getString("f_text");
		String f_url=rs.getString("f_url");
%>
<body >
<div class="roundedCorners" style="background-color:#FDFDFD;padding-bottom:8px; margin-top:10px";align="left">
<form name="SendEmail" Method="post" action="feedback_mail_send.jsp" >
	<table width="428" class="style4 font10" >
<tr>
        	<td align="right">���H�H</td>
            <td align="left"><%=user_email%><input type="hidden" name="To" size="30"  value="<%=user_email%>"></td>
        </tr>
        <tr>
        	<td align="right">�D�D</td>
            <td align="left">�z�bAi-music����,�H<%=f_title%>���z�ѳQ���|�F<input type="hidden" name="Subject" size="30" value="�z�bAi-music����,�H<%=f_title%>���z�ѳQ���|�F"></td>
        </tr>
        <tr>
          <td align="right">���e</td>
          <td rowspan="4" align="left"><textarea name="Content" cols=40 rows=8><pre>�˷R���|���z�n,
�o�̬OAi-music�L�֤��@���ֺ�
�z�b<%=rs.getDate("f_time")%> <%=rs.getTime("f_time")%>�ɳQ���|
�z�Q���|����]���u<%=f_title%>�v
�Q���|���z�ѬO�u<%=f_text%>�v
�Q���|�������b�u<a href="http://140.136.155.133:8080<%=f_url%>">�Ӻ����s��</a>�v
�п�u�����W�w�A�_�h�N�H���v�B��
</pre>
          </textarea></td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
        </tr>
        <tr>
        	<td align="right">&nbsp;</td>
        </tr>
		<tr>
        	<td colspan="2" align="center"><input type="submit" value="�o�e" class="input-style">
				<input type="reset" value="����" class="input-style-reset"></td>
        </tr>
        </table>
</form>
<%
	}//rs
	rs.close();
	stmt.close();
%>
</div>
</body>
</html>