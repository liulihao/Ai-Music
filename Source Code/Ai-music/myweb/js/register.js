function check(){

	//檢查姓名
	var mem_name=$("user_name").value;
	if(mem_name=="") 
		{
		  window.alert("姓名不得為空白!");
		  $("user_name").focus();
		  return false;
		}
	if(mem_name.length<2)
	{
		alert("姓名不會少於兩個字");
		return false;
	}
	var name=/^[a-zA-Z\u0391-\uFFE5]+$/;
	check_name=name.test(mem_name);
	if(!check_name){
		alert("會員姓名格式錯誤");
		$("user_name").focus();
			return false;
	}
	
	//檢查會員暱稱
	var mem_nkname=$("user_nkname").value;
	if(mem_nkname=="") 
		{
		  window.alert("會員暱稱不得為空白!");
		  $("user_nkname").focus();
		  return false;
		}
	var nkname=/^[a-zA-Z\u0391-\uFFE5]+$/;
	check_nkname=nkname.test(mem_nkname);
	if(!check_nkname){
		alert("會員暱稱格式錯誤");
		$("user_nkname").focus();
			return false;
	}
	//檢查會員帳號
	var account=$("user_id").value;
	if(account=="") 
		{
		  window.alert("會員帳號不得為空白!");
		  $("user_id").focus();
		  return false;
		}
	if(account.length<5) 
		{
		  window.alert("會員帳號不可以少於五個字!");
		  $("user_id").focus();
		  return false;
		}
	var id=/^[a-zA-Z]/;
	check_id=id.test(account);
	if(!check_id){
			alert("帳號格式錯誤");
			$("user_id").focus();
			return false;
	}
	//檢查會員密碼
	var password=$("user_password").value;
	if(password=="") 
		{
		  window.alert("會員密碼不得為空白!");
		  $("user_password").focus();
		  return false;
		}
	if(password.length<5) 
		{
		  window.alert("會員密碼不可以少於五個字!");
		  $("user_password").focus();
		  return false;
		}
	var pwd=/^[A-Za-z0-9]+$/;
	check_password=pwd.test(password);	
	if(!check_password){
		alert("密碼格式錯誤");	
		$("user_password").focus();
		return false;
	}
	//檢查確認密碼
	if($("user_checkpswd").value=="") 
		{
		  window.alert("確認密碼不得為空白!");
		  $("user_checkpswd").focus();
		  return false;
		  
	}else if($("user_checkpswd").value!=$("user_password").value) 
		{
		  window.alert("確認密碼不一致!");
		   $("user_checkpswd").focus();
		  return false;
		}
	//檢查郵件地址
	var email=$("user_email").value;
	if(email==""){
		alert("請填入Email!");
		$("user_email").focus();
		return false;
	}
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	flag = pattern.test(email);
	if(!flag){
			alert("Email格式錯誤");
			$("user_email").focus();
	return false;
	}
	
	//檢查生日
	if($("user_birth").value=="") 
		{
		  window.alert("請填入生日!");
		  $("user_birth").focus();
		  return false;
		}
	 //檢查居住城市	
	 var mem_city=$("user_city").value;
	 if(mem_city=="")
		{
		  window.alert("請填入居住城市!");
		  $("user_city").focus();
		  return false;
		}
	 var city=/^[a-zA-Z\u0391-\uFFE5]+$/;
     check_city=city.test(mem_city);
	 if(!check_city){
		alert("居住城市格式錯誤");
		$("user_city").focus();
			return false;
	}
	 //檢查AJAX重複帳號欄位
	 if($("divAccount").equals("帳號已有人使用")){
		  window.alert("帳號已有人使用，請換別的帳號");	
		  $("user_id").focus();
		  return false;
	 }
	
	
//submit表單資料至WEBsever
		return true;
}
/*Ajax檢查帳號是否重複*/
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
