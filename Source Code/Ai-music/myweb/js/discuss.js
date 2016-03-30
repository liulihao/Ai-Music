function check_page(){//分頁搜尋第幾頁時 確認有無填入文字在欄位中
	if($("page_text").value==""){
		alert("請輸入搜尋頁次");
		return false;
		$("page_text").focus();
	}
	return true;
}