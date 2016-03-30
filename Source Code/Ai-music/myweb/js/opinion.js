function check_opinion(){//意見輸入檢查
	
	    if($("opinion_text").value=="") 
		{
		   window.alert("意見不得為空白!");
		   $("opinion_text").focus();
		  return false;
		}
		
		
	 return true;
	
}
function delete_opinion(){//刪除意見時的警示窗
       if(confirm("確定要刪除該筆意見嗎?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}