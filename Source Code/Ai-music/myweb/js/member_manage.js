function member_basic_check(){//會員基本資料輸入檢查
	if($('user_name').value==""){
		alert("姓名不得為空白");
		return false;		
	}
	if($('user_nkname').value==""){
		alert("暱稱不得為空白");
		return false;		
	}
	if($('user_birth').value==""){
		alert("生日不得為空白");
		return false;		
	}
	if($('user_city').value==""){
		alert("居住地不得為空白");
		return false;		
	}
	return true;
}
function check_password(){//密碼輸入檢查
	//檢查會員密碼
	var password=$("new_password").value;
	if(password=="") 
		{
		  window.alert("新密碼不得為空白!");
		  $("user_password").focus();
		  return false;
		}
	if(password.length<5) 
		{
		  window.alert("新密碼不可以少於五個字!");
		  $("user_password").focus();
		  return false;
		}
	var pwd=/^[A-Za-z0-9]+$/;
	check_password=pwd.test(password);	
	if(!check_password){
		alert("新密碼格式錯誤");	
		$("user_password").focus();
		return false;
	}
		    
		if($('new_password_chk').value=="") 
		{
		  alert("密碼確認不得為空白!");
		  // document.member_password_update.elements(2).focus();
		  return false;
		}
		if(password!=$('new_password_chk').value){
		  alert("密碼確認不一致!");
		  // document.member_password_update.elements(3).focus();
		  return false;
		}
	 return true;
	
//submit表單資料至WEBsever
	
}
function check_mail(){//email輸入檢查
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
		if($('user_password').value==""){
			window.alert("請輸入目前密碼");
			return false;
		}
        return true;
}
function add_classified_check(){
	if($('classify').value=="")
	{
	  alert("請輸入分類名稱");	
	  return false;
	}
}
function music_revise_check(){//member_manage_manage-music_revise.jsp
	if($('track_name').value==""){
		alert("請輸入歌曲名稱");
		return false;
		}
		
}
function delete_music(track){//刪除歌曲時的警示窗 member_manage_manage-music.jsp
		var track_id=track;
       if(confirm("確定要刪除該首歌曲嗎?")){
		 location.href='member_manage_manage-music_delete.jsp?music_id='+track_id;
		  return true;
		   
	   }
	   else{
		  return false;
	   }
}
/*function check_music_upload(){//member_manage_manage-music_upload.jsp
	if($('song').value==""){
		alert("請輸入歌曲名稱");
		return false;
		}
	if($('singer').value==""){
		alert("請輸入演唱者名稱");
		return false;
	}
		
}*/
function check_page(){//分頁搜尋第幾頁時 確認有無填入文字在欄位中
	if($("page_text").value==""){
		alert("請輸入搜尋頁次");
		return false;
	}
	return true;
}

function song_search(){//會員管理音樂時搜尋是否有該歌曲
	if($("song_search_text").value==""){
		alert("請輸入欲搜尋歌曲名稱");
		return false;
	}
$("song_space").style.display="none";
var URL = "manage_music_song_search.jsp?sid="+Math.random();
var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:Form.serialize('song_search1'), 
				onComplete: showMember
				}
		);  
	}
function showMember(transport){
  
   $("search_song").update(transport.responseText);
}

function delete_collect_music(track,user){//刪除收藏歌曲時的警示窗 member_manage_interactive.jsp
		var track_id=track;
		var login_user=user;
       if(confirm("確定要刪除該首收藏歌曲嗎?")){
		 location.href="del_songCollect.jsp?track_id="+track_id+"&login_id="+login_user;
		  return true;
	   }
	   else{
		  return false;
	   }
}

function delete_manage_friend(user,friend){//刪除好友時的警示窗 member_manage_friends.jsp
		var user_id=user;
		var friend_id=friend;
       if(confirm("確定要刪除該好友嗎?")){
		   location.href="member_manage_friends_delete.jsp?user_id="+user_id+"&friend_id="+friend_id;
		   return true;
	   }
	   else{
		  return false;
	   }
}

function delete_classified(user,classified){//刪除分類時的警示窗 member_manage_classified.jsp
		var user_id=user;
		var classify_id=classified;
       if(confirm("確定要刪除該分類嗎?")){
		   location.href="member_manage_delete_classified.jsp?user="+user_id+"&user_classify="+classify_id;
		   return true;
	   }
	   else{
		  return false;
	   }
}

function revise_classified(){//修改分類時的警示窗 member_manage_classified.jsp
		if(confirm("確定要修改該分類嗎?")){
		   return true;
	   }
	   else{
		  return false;
	   }
}

function check_search(){//確認搜尋字串有無
	if($("search_text").value==""){
		alert("請輸入搜尋字串");
		$("search_text").focus();
		return false;
	}
	return true;
}