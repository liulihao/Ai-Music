<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html >
<head>

<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
</head>
<script type="text/javascript">

function datacheck(){
	
	//�p�GID���ť� �B�z�P�m�W
	if(member.user_id.value==""){
		window.alert("ID���o���ť�!");
		//focusto(4);
		return false;
		}
	
//submit����Ʀ�WEBsever
	member.submit();
}


</script>
<body>
<form action="Login_check_admin.jsp" method="post" name="member">
<p>
�|���b��:
      <input name="user_id" id="user_id" size="20" value="" />    
    </br>
  </p>
  <p>�K�X:
    <input type="password" name="user_password" id="user_password" size="20"  />
  </p>
  <!-- ���U�n����ƶs�ɱN����datacheck()> -->
    
  <input type="button" value="�n�J" onClick="datacheck()"/>
  &nbsp;
  <input type="button" value="���U" onClick="location.href('welcomRegister.jsp')">
  </form>
</body>
</html>
