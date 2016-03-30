<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html >
<head>

<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>
<script type="text/javascript">

function datacheck(){
	
	//如果ID為空白 處理同姓名
	if(member.user_id.value==""){
		window.alert("ID不得為空白!");
		//focusto(4);
		return false;
		}
	
//submit表單資料至WEBsever
	member.submit();
}


</script>
<body>
<form action="Login_check_admin.jsp" method="post" name="member">
<p>
會員帳號:
      <input name="user_id" id="user_id" size="20" value="" />    
    </br>
  </p>
  <p>密碼:
    <input type="password" name="user_password" id="user_password" size="20"  />
  </p>
  <!-- 按下登錄資料鈕時將執行datacheck()> -->
    
  <input type="button" value="登入" onClick="datacheck()"/>
  &nbsp;
  <input type="button" value="註冊" onClick="location.href('welcomRegister.jsp')">
  </form>
</body>
</html>
