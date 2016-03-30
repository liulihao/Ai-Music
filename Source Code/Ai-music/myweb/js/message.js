function check_message(){//留言輸入檢查
	
	    if($("subject").value=="") 
		{
		   window.alert("主題不得為空白!");
		    $("subject").focus();
		    return false;
		}
		if($("memo").value=="") 
		{
		  window.alert("留言內容不得為空白!");
		   $("memo").focus();
		  return false;
		}
		
	 return true;
	
}
function delete_message(){//刪除留言時的警示窗
       if(confirm("確定要刪除該筆留言嗎?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}