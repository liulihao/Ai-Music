function check(){

	//�ˬd�m�W
	var mem_name=$("user_name").value;
	if(mem_name=="") 
		{
		  window.alert("�m�W���o���ť�!");
		  $("user_name").focus();
		  return false;
		}
	if(mem_name.length<2)
	{
		alert("�m�W���|�֩��Ӧr");
		return false;
	}
	var name=/^[a-zA-Z\u0391-\uFFE5]+$/;
	check_name=name.test(mem_name);
	if(!check_name){
		alert("�|���m�W�榡���~");
		$("user_name").focus();
			return false;
	}
	
	//�ˬd�|���ʺ�
	var mem_nkname=$("user_nkname").value;
	if(mem_nkname=="") 
		{
		  window.alert("�|���ʺ٤��o���ť�!");
		  $("user_nkname").focus();
		  return false;
		}
	var nkname=/^[a-zA-Z\u0391-\uFFE5]+$/;
	check_nkname=nkname.test(mem_nkname);
	if(!check_nkname){
		alert("�|���ʺٮ榡���~");
		$("user_nkname").focus();
			return false;
	}
	//�ˬd�|���b��
	var account=$("user_id").value;
	if(account=="") 
		{
		  window.alert("�|���b�����o���ť�!");
		  $("user_id").focus();
		  return false;
		}
	if(account.length<5) 
		{
		  window.alert("�|���b�����i�H�֩󤭭Ӧr!");
		  $("user_id").focus();
		  return false;
		}
	var id=/^[a-zA-Z]/;
	check_id=id.test(account);
	if(!check_id){
			alert("�b���榡���~");
			$("user_id").focus();
			return false;
	}
	//�ˬd�|���K�X
	var password=$("user_password").value;
	if(password=="") 
		{
		  window.alert("�|���K�X���o���ť�!");
		  $("user_password").focus();
		  return false;
		}
	if(password.length<5) 
		{
		  window.alert("�|���K�X���i�H�֩󤭭Ӧr!");
		  $("user_password").focus();
		  return false;
		}
	var pwd=/^[A-Za-z0-9]+$/;
	check_password=pwd.test(password);	
	if(!check_password){
		alert("�K�X�榡���~");	
		$("user_password").focus();
		return false;
	}
	//�ˬd�T�{�K�X
	if($("user_checkpswd").value=="") 
		{
		  window.alert("�T�{�K�X���o���ť�!");
		  $("user_checkpswd").focus();
		  return false;
		  
	}else if($("user_checkpswd").value!=$("user_password").value) 
		{
		  window.alert("�T�{�K�X���@�P!");
		   $("user_checkpswd").focus();
		  return false;
		}
	//�ˬd�l��a�}
	var email=$("user_email").value;
	if(email==""){
		alert("�ж�JEmail!");
		$("user_email").focus();
		return false;
	}
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	flag = pattern.test(email);
	if(!flag){
			alert("Email�榡���~");
			$("user_email").focus();
	return false;
	}
	
	//�ˬd�ͤ�
	if($("user_birth").value=="") 
		{
		  window.alert("�ж�J�ͤ�!");
		  $("user_birth").focus();
		  return false;
		}
	 //�ˬd�~����	
	 var mem_city=$("user_city").value;
	 if(mem_city=="")
		{
		  window.alert("�ж�J�~����!");
		  $("user_city").focus();
		  return false;
		}
	 var city=/^[a-zA-Z\u0391-\uFFE5]+$/;
     check_city=city.test(mem_city);
	 if(!check_city){
		alert("�~�����榡���~");
		$("user_city").focus();
			return false;
	}
	 //�ˬdAJAX���Ʊb�����
	 if($("divAccount").equals("�b���w���H�ϥ�")){
		  window.alert("�b���w���H�ϥΡA�д��O���b��");	
		  $("user_id").focus();
		  return false;
	 }
	
	
//submit����Ʀ�WEBsever
		return true;
}
/*Ajax�ˬd�b���O�_����*/
function chkAccount(){
	var check_id=$("user_id").value;
	var check_id_length=$("user_id").value.length;
	var URL = "id_check.jsp";
	var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:{"user_id":check_id,"id_length":check_id_length}, 
				onSuccess: showMsg
				}
		);  
}
function showMsg(xmlhttp){
   var strMsg=xmlhttp.responseText;
   $("divAccount").update(strMsg);
}
