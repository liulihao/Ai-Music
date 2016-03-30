//歌曲評價
function StarPoint(point){//移入顯示的星星數
for(i = 1; i <= point; i++){
	 document.images["star"+i].src = "images/star_u.png";
}
}
 
function StarMoveOut(){//移出顯示的星星數
for(i = 1 ; i <= 5 ; i++){
	 document.images["star"+i].src = "images/star_empty.png";
}
}
  
function SongPoint(track, user, star,login){ //將歌曲編號 該會員空間編號 評價 登入者編號 傳送到song_evaulate.jsp
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
//歌曲評價end

//加入好友
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
//加入好友end
//音樂收藏
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
//音樂收藏end
function check_page(){//分頁搜尋第幾頁時 確認有無填入文字在欄位中
	if($("page_text").value==""){
		alert("請輸入搜尋頁次");
		return false;
	}
	return true;
}

function check_search(){//確認搜尋字串有無
	if($("search_text").value==""){
		alert("請輸入搜尋字串");
		$("search_text").focus();
		return false;
	}
	return true;
}