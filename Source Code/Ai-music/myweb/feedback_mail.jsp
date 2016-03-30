<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<head>
<title>寄檢舉通知</title>


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
   
   
/*純顏色區塊*/   
.style4 {color:#5F5F5F} /*灰色*/
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
        	<td align="right">收信人</td>
            <td align="left"><%=user_email%><input type="hidden" name="To" size="30"  value="<%=user_email%>"></td>
        </tr>
        <tr>
        	<td align="right">主題</td>
            <td align="left">您在Ai-music網站,以<%=f_title%>的理由被檢舉了<input type="hidden" name="Subject" size="30" value="您在Ai-music網站,以<%=f_title%>的理由被檢舉了"></td>
        </tr>
        <tr>
          <td align="right">內容</td>
          <td rowspan="4" align="left"><textarea name="Content" cols=40 rows=8><pre>親愛的會員您好,
這裡是Ai-music無樂不作音樂網
您在<%=rs.getDate("f_time")%> <%=rs.getTime("f_time")%>時被檢舉
您被檢舉的原因為「<%=f_title%>」
被檢舉的理由是「<%=f_text%>」
被檢舉的頁面在「<a href="http://140.136.155.133:8080<%=f_url%>">該網頁連結</a>」
請遵守網站規定，否則將以停權處分
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
        	<td colspan="2" align="center"><input type="submit" value="發送" class="input-style">
				<input type="reset" value="重填" class="input-style-reset"></td>
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