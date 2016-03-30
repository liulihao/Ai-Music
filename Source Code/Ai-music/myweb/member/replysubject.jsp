<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<html>
<title>新增文章</title>


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

.bar-color{ /*紫色的部分*/
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
   
   
/*圓角邊框*/
.roundedCorners {
	/*border: 1px solid #000;*/
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}

.roundedTopCorners {/*上圓*/
	/*border: 1px solid #000;*/
	-moz-border-radius-topleft: 10px;
	-webkit-border-top-left-radius: 10px;
	-moz-border-radius-topright: 10px;
	-webkit-border-top-right-radius: 10px;
}
 
.roundedBottomCorners {/*下圓*/
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

.style4 {color:#5F5F5F} /*灰色*/

</style>
<body>




<% request.setCharacterEncoding("big5");%> 
<%
  String login_user= (String)session.getAttribute("user_id");
  sql="select * from users where user_id='"+login_user+"'";
  rs=smt.executeQuery(sql);
  
  int subject_id = 0;
  if(request.getParameter("subject_id") == null)
  {
  }
  else
  {
	subject_id = Integer.parseInt(request.getParameter("subject_id"));
  }
%>
<div class="roundedCorners" style="background-color:#FDFDFD;padding:30px 0px 8px 10px">
		<form action='savedata.jsp?subject_id=<%=subject_id%>&login_user=<%=login_user%>' method='post' enctype='multipart/form-data'>
		  <table border="0" class="font10 style4" >
   <tr>
     <td>主題</td>
     <td><input type=text size=47 name=title_subject></td>
   </tr>
   <tr>
     <td>內容</td>
     <td rowspan="2"><textarea name=title_content rows=10 cols=40></textarea></td>
   </tr>
   <tr>
     <td>&nbsp;</td>
     </tr>
     <tr>
   	<td>&nbsp;</td>
    <td><div style="padding-left:10px">回應內容 &nbsp;<span class='style4'>(限輸入三千字)</span></div></td>
   </tr>
   <tr>
     <td><div style="margin-top:10px">上傳圖片</div></td>
      <td><div style="margin-top:10px">
        <input name="title_pic" type="file" id="title_pic">
      </div></td>
  </tr>
  
  <tr>
     <td align=center colspan=2><div style="margin-top:10px;padding-left:65px" align="left">
       <input type=submit name="send" value="送出文章" class="input-style style4">
       &nbsp;
       <input name="reset" type="reset" value="清掉重寫" class="input-style style4"></div></td>
  </tr>
</table>

</form>
</div>
</body>
</html>