<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@include file="opendata.jsp"%><!--開啟資料庫-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
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
.style2{color:#FFF}
.style4 {color:#5F5F5F} /*灰色*/
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

a,a:link,a:visited,a:focus,a:hover,a:active{
    text-decoration:none;
	color:#5F5F5F;
}

</style>
</head>
<script src="../js/prototype.js"></script>
<script language="javascript">
function check(){//檢查欄位
  
	if(($("f_title").value=="其他")&&($("other").value=="")){
	  window.alert("檢舉標題未填");
	  //document.feedback.elements(1).focus();
	  return false;
	  }
  if($("f_text").value==""){
    window.alert("檢舉內容未填");
	//document.feedback.elements(2).focus();
	return false;
	}
	return true;
}
 function doAction(){
 if($("f_title").value=="其他")
    $("other").style.display="block";
	}

</script>
<%!    //設定日期型式
 static final String pattern =
            "yyyy/MM/dd KK:mm:ss";
			%>
<%

	String login_user=(String)session.getAttribute("user_id");//登入的帳號
	String user_id=request.getParameter("user");//會員空間的帳號
	String parent_url=request.getParameter("web_url");//取得母頁面網址
%>
<body >
<div class="roundedCorners font10" style="background-color:#FDFDFD;height:380px" >
<form name="feedback" action="feedback_save.jsp" method="post">
<table width="302" >
    <tr>
    <td width="105" rowspan="2" bgcolor="#8280FF" align="right"><div align="right" class="style2" >檢舉標題:</div></td>
    <td width="185" >
    <select name="f_title" id="f_title" size="1" onChange="doAction()">
       <option selected value="上傳非法音樂">上傳非法音樂</option>
       <option value="個人空間有侵權行為">個人空間有侵權行為</option>
       <option value="人身攻擊">人身攻擊</option>
       <option value="其他" >其他</option>
    </select></td>
  </tr>
 <tr><td><input style="display:none" name="other" id="other" type="text"  /></td></tr>
 <tr>
    <td bgcolor="#8280FF"><div align="right"><span class="style2">檢舉會員:</span></div></td>
    <td ><%=login_user%><input type="hidden" name="login_user" value="<%=login_user%>"></td>
  </tr>
  <tr>
    <td bgcolor="#8280FF"><div align="right"><span class="style2">被檢舉會員:</span></div></td>
    <td ><input type="text" name="user_id">
    </td>
  </tr>
  <tr>
    <td bgcolor="#8280FF"><div align="right"><span class="style2">被檢舉網址:</span></div></td>
    <td ><a href="<%=parent_url%>" target="_blank">該檢舉網址</a><input type="hidden" name="f_url" value="<%=parent_url%>">
      </td>
  </tr>
 <tr>
    <td bgcolor="#8280FF"><div align="right"><span class="style2">時間:</span></div></td>
    <td ><span style="font-size:9px"><%= (new java.text.SimpleDateFormat(pattern)).format(new java.util.Date())%></span></td>
  </tr>
  <tr>
    <td bgcolor="#8280FF"><div align="right"><span class="style2">檢舉內容:</span></div></td>
    <td ><textarea name="f_text" id="f_text" cols="20" rows="10"></textarea></td>
  </tr>
  
  
  <tr>
     <td>&nbsp;</td>
    <td><div ><input name="submit" type="submit" value="送出" class="input-style" onClick="return check()"/> &nbsp;<input name="canel" type="reset" value="取消" class="input-style" onClick="parent.location.href='<%=parent_url%>';"/></div></td>
    </tr>
</table>

</form>
</div>
</body>
</html>
