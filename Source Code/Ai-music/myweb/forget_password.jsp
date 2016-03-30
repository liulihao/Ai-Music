<html>
<head>
<title>忘記密碼</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.hello{
	font-family: "微軟正黑體";
	font-size: 48px;
}

.mynameis{
    font-family: sans-serif;
}

.bar-color{ /*紫色的部分*/
background:#ff091a;
color:#FFFFFF;
   -moz-opacity: 0.9;
   opacity: 0.9;

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

	-moz-border-radius-bottomleft: 10px;
	-webkit-border-bottom-left-radius: 10px;
	-moz-border-radius-bottomright: 10px;
	-webkit-border-bottom-right-radius: 10px;
}
.style4 {color:#5F5F5F} /*灰色*/
-->

.input-style{
   border:1px dotted #DADADA; 
   background-color:#FFFFFF;
}

.input-style:hover{
   border:1px dotted #DADADA; 
   background:#CCCCCC;
}



-->

</style>

</head>
<body>


<div class=" roundedCorners " style="width:520px ; background:#FFFFFF; ">
  <table width="520" height="240" border="0">
    <tr>
      <td>
      <div align="center" class="hello roundedTopCorners bar-color  style6">忘記密碼</div>
      <div align="center" class="mynameis bar-color font10" style="margin-bottom:20px">請輸入以下資料取回密碼</div>
     <form name="SendMessage" Method="post" action="password_send.jsp" >
        <div  class="font10 style4" style="margin-bottom:20px;padding-left:145px;position:relative">帳號:
          <input type="text" name="account" maxlength="12" id="account">
        </div>
        <div class="font10 style4"  style="margin-bottom:20px;padding-left:115px;position:relative">電子信箱:
          <input type="text" name="mail_account" maxlength="30" id="mail_account">
        </span></div>
 
  
        <div align="left" style="padding-left:145px">
          <!-- 按下登錄資料鈕時將執行datacheck()> -->
          <input type="submit" value="將密碼寄送至我的信箱" class="input-style style4">
          &nbsp; &nbsp;
          <input type="reset" value="重填" class="input-style style4">
        </div>
      </form>   
      <div class="roundedBottomCorners bar-color" style="padding:10px"></div>   </td>
    </tr>
  </table>
</div>
</body>
</html>