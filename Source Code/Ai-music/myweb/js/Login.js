function openConfirm(url) {<!--登入的彈跳視窗 傳路徑到登入頁面 並把web_url塞入參數做-->
	var web_url=url;
	var dir="discuss";//如果是在member資料夾下的網頁 進行比對 若有執行if 無執行else
	if(web_url.match(dir)!=null){  
		Dialog.confirm("登入", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "../Login_member.jsp?web_url="+url})
		
	}else{
    Dialog.confirm("登入", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp?web_url="+url})
	}
}
function check_page(){//分頁搜尋第幾頁時 確認有無填入文字在欄位中
	if($("page_text").value==""){
		alert("請輸入搜尋頁次");
		return false;
	}
	return true;
}

function openConfirm_search(url,type) {<!--搜尋專用登入的彈跳視窗 傳路徑到登入頁面 並把web_url塞入參數做-->
	
	    Dialog.confirm("登入", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp?web_url="+url+type})
	
}