function check_message(){//�d����J�ˬd
	
	    if($("subject").value=="") 
		{
		   window.alert("�D�D���o���ť�!");
		    $("subject").focus();
		    return false;
		}
		if($("memo").value=="") 
		{
		  window.alert("�d�����e���o���ť�!");
		   $("memo").focus();
		  return false;
		}
		
	 return true;
	
}
function delete_message(){//�R���d���ɪ�ĵ�ܵ�
       if(confirm("�T�w�n�R���ӵ��d����?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}