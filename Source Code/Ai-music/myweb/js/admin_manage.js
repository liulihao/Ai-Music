/*function member_query(){//查詢會員資料 並列出 at admin_page_member_manage
var URL = "admin_page_member_query.jsp?sid="+Math.random();
var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:Form.serialize('member_query_list'), 
				onComplete: showMember
				}
		);  
	}
function showMember(transport){
  
   $("query1").update(transport.responseText);
}*/


function delete_member(){//刪除會員顯示警告
   if(confirm("確定要刪除該會員嗎?")){
		  return true;
	   }
	   else{
		  return false;
	   }
 }
 
function member_search(){//搜尋是否有該會員
	if($("member_search_text").value==""){
		alert("請輸入搜尋字串");	
		$("member_search_text").focus();
		return false;
	}
	$("member").style.display="none";
	$("order_select").style.display="none";
	var URL = "admin_page_member_search.jsp?sid="+Math.random();
	var myAjax = new Ajax.Request(URL, {   
				method: 'post',
				parameters:Form.serialize('member_search1'), 
				onComplete: showMember
				}
		);  
	}
function showMember(transport){
  
   $("search_member").update(transport.responseText);
}

function authority_return(id){//回復停權帳號時的警示窗
	var user_id=id;
       if(confirm("確定要取消停權嗎?")){
		  
		  location.href="member_stop.jsp?id="+user_id;
		  return true;
	   }
	   else{
		  return false;
	   }
}

function check_page(){//分頁搜尋第幾頁時 確認有無填入文字在欄位中
	if($("page_text").value==""){
		alert("請輸入搜尋頁次");
		$("page_text").focus();
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