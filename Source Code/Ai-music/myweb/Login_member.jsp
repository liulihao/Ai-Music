<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<style type="text/css">
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
   
   
.input-style{
   color:#5F5F5F;
   border:1px dotted #DADADA; 
   background-color:#FFFFFF;
}

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#DADADA;  
}   

/*連結樣式*/
a{text-decoration:none;}
a:link{color:#5F5F5F;}/*顏色*/
a:visited{color:#5F5F5F;}/*點選過後的顏色*/
a:focus{coloor:#5F5F5F;}
a:hover{color:#5F5F5F;}/*晃過的顏色*/ 
a:active{color:#5F5F5F;}

   
/*純顏色區塊*/   
.style4 {color:#5F5F5F} /*灰色*/
.style5 {font-size: x-small}
</style>
</head>
<script type="text/javascript">
function datacheck(){
	//如果ID為空白 處理同姓名
	if(member.user_id.value == ""){
		window.alert("ID不得為空白!");
		//focusto(4);
		return false;
	}
	
	//submit表單資料至WEBsever
	member.submit();
}

function openmail(){<!--打開寄郵子視窗-->
	window.open("feedback_mail.jsp?user_email="+email+"&f_title="+title+"&f_text="+text+"&f_time="+time,"發送信件","left=980, top=980,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=no,width=450,height=450")
}
</script>

<%
	String web_url=request.getParameter("web_url");
	if(web_url.equals("/Ai-music/myweb/new_register.jsp")){
			web_url="new_register";
		}
%>
<body >
<div class=" roundedCorners" style="width:520px ; background:#FFFFFF; ">
  <table width="520" height="240" border="0">
    <tr>
      <td>
      <div align="center" class="hello roundedTopCorners bar-color">HELLO</div>
      <div align="center" class="mynameis bar-color" style="margin-bottom:20px">Welcome to Ai-music</div>
      <form action="Login_check_member.jsp" method="post" name="member">
         <div  class="font10 style4" style="margin-bottom:20px;padding-left:135px">帳號:
             <input name="user_id" id="user_id" size="20" value="" />    
        </div>
        
        <div class="font10 style4"  style="margin-bottom:20px;padding-left:135px">密碼:
          <input type="password" name="user_password" id="user_password" size="20"  />
        </span><span class="style5" onClick="openmail"> <a href="forget_password.jsp">(忘記密碼)</a> </span></div>
 		<input type="hidden" name="web_url" id="web_url" value="<%=web_url%>" size="20"  />
  
        <div align="center">
          <!-- 按下登錄資料鈕時將執行datacheck()> -->
          
          <input type="button" value="登入" onClick="datacheck()" class="input-style"/>
          <!--    <input type="button" value="註冊" class="input-style" onClick="parent.location.href='index_welcome.jsp'">     -->
        </div>
      </form>   
      <div class="roundedBottomCorners bar-color" style="padding:10px"></div>   </td>
    </tr>
  </table>
</div> 
</body>
</html>
