//�q������
function StarPoint(point){//���J��ܪ��P�P��
for(i = 1; i <= point; i++){
	 document.images["star"+i].src = "images/star_u.png";
}
}
 
function StarMoveOut(){//���X��ܪ��P�P��
for(i = 1 ; i <= 5 ; i++){
	 document.images["star"+i].src = "images/star_empty.png";
}
}
  
function SongPoint(track, user, star,login){ //�N�q���s�� �ӷ|���Ŷ��s�� ���� �n�J�̽s�� �ǰe��song_evaulate.jsp
document.frmSong.track_id.value = track;
document.frmSong.user_id.value = user;
document.frmSong.star.value = star;
document.frmSong.post_id.value = login;
var URL = "evaluate/song_evaulate.jsp?cc="+ Math.floor(Math.random()*10);
var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:Form.serialize('frmSong'), 
				onSuccess: showMsg
				}
		);  
	}
function showMsg(xmlhttp){
   var strMsg=xmlhttp.responseText;
   alert(strMsg);
   location.reload();
}
//�q������end

//�[�J�n��
function AddFrd(user,friend){
document.frmFriend.user_id.value = user;
document.frmFriend.friend_id.value =friend ;

var URL = "friend/save_friend.jsp?sid1="+Math.random();
var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:Form.serialize('frmFriend'), 
				onSuccess: showMsg
				}
		);  
	}
function showMsg(xmlhttp){
   var strMsg=xmlhttp.responseText;
   alert(strMsg);
   location.reload();
}
//�[�J�n��end
//���֦���
function musicCollect(track,user,login){
	document.frmCollect.collect_track_id.value=track;
	document.frmCollect.user_id.value=user;
	document.frmCollect.login_id.value=login;
	var URL = "save_songCollect.jsp?sid1="+Math.random();
    var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:Form.serialize('frmCollect'), 
				onSuccess: showMsg
				}
		);  
	}

function showMsg(xmlhttp){
   var strMsg=xmlhttp.responseText;
   alert(strMsg);
   location.reload();
}
//���֦���end
function check_page(){//�����j�M�ĴX���� �T�{���L��J��r�b��줤
	if($("page_text").value==""){
		alert("�п�J�j�M����");
		return false;
	}
	return true;
}

function check_search(){//�T�{�j�M�r�꦳�L
	if($("search_text").value==""){
		alert("�п�J�j�M�r��");
		$("search_text").focus();
		return false;
	}
	return true;
}