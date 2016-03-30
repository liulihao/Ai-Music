<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>回覆留言</title>


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

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#EDEDED;
   cursor:pointer;
}

-->
</style>

<script language="javascript" src="js/prototype.js"></script>
<script src="../SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="../SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script language="javascript">
function check(){//檢查欄位
	if($("reply").value==""){
	  window.alert("留言主題未填");
	   $("reply").focus();
	  return false;
	}
	
	return true;
}
</script>
<link href="../SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link href="../SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
</head>
<%
	String parent_url=request.getParameter("web_url");//取得母頁面網址
   String user_id=request.getParameter("user");
   String id=request.getParameter("id");
  
   %>
<body>
<div class="roundedCorners" style="background-color:#FDFDFD;padding:15px 0px 8px 0px" >
<form id='form1' method='post' action='member_message_reply_success.jsp?user=<%=user_id%>&id=<%=id%>' >
<table width="300" class="font10" >
  <tr>
    <td align="left"><span class='style4' >&nbsp;&nbsp;回覆內容 (剩<span id="countsprytextarea1">&nbsp;</span>字)&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
  <div style='margin-top:5px;padding-left:10px'>
   <span id="sprytextarea1">
    <textarea name='reply' id='reply' cols='25' rows='7' class="font10 style4"></textarea>
     <span class="textareaMaxCharsMsg">已超出字元數目的最大值。</span> </span> </div>
  <div style="margin:10px 0px 0px 100px">
  	<input type='submit' name='SEND' value='送出' class="input-style" onClick="return check()">
    <input type="button" value='取消' onClick="parent.location.href='<%=parent_url%>';" class='input-style' >
  </div>  	</td>
  </tr>
</table>
</form></div>
<script type="text/javascript">
<!--
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {minChars:0, maxChars:200, validateOn:["blur"], counterId:"countsprytextarea1", counterType:"chars_remaining"});
//-->
</script>
</body>

</html>