function check_opinion(){//�N����J�ˬd
	
	    if($("opinion_text").value=="") 
		{
		   window.alert("�N�����o���ť�!");
		   $("opinion_text").focus();
		  return false;
		}
		
		
	 return true;
	
}
function delete_opinion(){//�R���N���ɪ�ĵ�ܵ�
       if(confirm("�T�w�n�R���ӵ��N����?")){
		  return true;
	   }
	   else{
		  return false;
	   }
}