function member_basic_check(){//�|���򥻸�ƿ�J�ˬd
	if($('user_name').value==""){
		alert("�m�W���o���ť�");
		return false;		
	}
	if($('user_nkname').value==""){
		alert("�ʺ٤��o���ť�");
		return false;		
	}
	if($('user_birth').value==""){
		alert("�ͤ餣�o���ť�");
		return false;		
	}
	if($('user_city').value==""){
		alert("�~��a���o���ť�");
		return false;		
	}
	return true;
}
function check_password(){//�K�X��J�ˬd
	//�ˬd�|���K�X
	var password=$("new_password").value;
	if(password=="") 
		{
		  window.alert("�s�K�X���o���ť�!");
		  $("user_password").focus();
		  return false;
		}
	if(password.length<5) 
		{
		  window.alert("�s�K�X���i�H�֩󤭭Ӧr!");
		  $("user_password").focus();
		  return false;
		}
	var pwd=/^[A-Za-z0-9]+$/;
	check_password=pwd.test(password);	
	if(!check_password){
		alert("�s�K�X�榡���~");	
		$("user_password").focus();
		return false;
	}
		    
		if($('new_password_chk').value=="") 
		{
		  alert("�K�X�T�{���o���ť�!");
		  // document.member_password_update.elements(2).focus();
		  return false;
		}
		if(password!=$('new_password_chk').value){
		  alert("�K�X�T�{���@�P!");
		  // document.member_password_update.elements(3).focus();
		  return false;
		}
	 return true;
	
//submit����Ʀ�WEBsever
	
}
function check_mail(){//email��J�ˬd
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
		if($('user_password').value==""){
			window.alert("�п�J�ثe�K�X");
			return false;
		}
        return true;
}
function add_classified_check(){
	if($('classify').value=="")
	{
	  alert("�п�J�����W��");	
	  return false;
	}
}
function music_revise_check(){//member_manage_manage-music_revise.jsp
	if($('track_name').value==""){
		alert("�п�J�q���W��");
		return false;
		}
		
}
function delete_music(track){//�R���q���ɪ�ĵ�ܵ� member_manage_manage-music.jsp
		var track_id=track;
       if(confirm("�T�w�n�R���ӭ��q����?")){
		 location.href='member_manage_manage-music_delete.jsp?music_id='+track_id;
		  return true;
		   
	   }
	   else{
		  return false;
	   }
}
/*function check_music_upload(){//member_manage_manage-music_upload.jsp
	if($('song').value==""){
		alert("�п�J�q���W��");
		return false;
		}
	if($('singer').value==""){
		alert("�п�J�t�۪̦W��");
		return false;
	}
		
}*/
function check_page(){//�����j�M�ĴX���� �T�{���L��J��r�b��줤
	if($("page_text").value==""){
		alert("�п�J�j�M����");
		return false;
	}
	return true;
}

function song_search(){//�|���޲z���֮ɷj�M�O�_���Ӻq��
	if($("song_search_text").value==""){
		alert("�п�J���j�M�q���W��");
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

function delete_collect_music(track,user){//�R�����úq���ɪ�ĵ�ܵ� member_manage_interactive.jsp
		var track_id=track;
		var login_user=user;
       if(confirm("�T�w�n�R���ӭ����úq����?")){
		 location.href="del_songCollect.jsp?track_id="+track_id+"&login_id="+login_user;
		  return true;
	   }
	   else{
		  return false;
	   }
}

function delete_manage_friend(user,friend){//�R���n�ͮɪ�ĵ�ܵ� member_manage_friends.jsp
		var user_id=user;
		var friend_id=friend;
       if(confirm("�T�w�n�R���Ӧn�Ͷ�?")){
		   location.href="member_manage_friends_delete.jsp?user_id="+user_id+"&friend_id="+friend_id;
		   return true;
	   }
	   else{
		  return false;
	   }
}

function delete_classified(user,classified){//�R�������ɪ�ĵ�ܵ� member_manage_classified.jsp
		var user_id=user;
		var classify_id=classified;
       if(confirm("�T�w�n�R���Ӥ�����?")){
		   location.href="member_manage_delete_classified.jsp?user="+user_id+"&user_classify="+classify_id;
		   return true;
	   }
	   else{
		  return false;
	   }
}

function revise_classified(){//�ק�����ɪ�ĵ�ܵ� member_manage_classified.jsp
		if(confirm("�T�w�n�ק�Ӥ�����?")){
		   return true;
	   }
	   else{
		  return false;
	   }
}

function check_search(){//�T�{�j�M�r�꦳�L
	if($("search_text").value==""){
		alert("�п�J�j�M�r��");
		$("search_text").focus();
		return false;
	}
	return true;
}