/*function member_query(){//�d�߷|����� �æC�X at admin_page_member_manage
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


function delete_member(){//�R���|�����ĵ�i
   if(confirm("�T�w�n�R���ӷ|����?")){
		  return true;
	   }
	   else{
		  return false;
	   }
 }
 
function member_search(){//�j�M�O�_���ӷ|��
	if($("member_search_text").value==""){
		alert("�п�J�j�M�r��");	
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

function authority_return(id){//�^�_���v�b���ɪ�ĵ�ܵ�
	var user_id=id;
       if(confirm("�T�w�n�������v��?")){
		  
		  location.href="member_stop.jsp?id="+user_id;
		  return true;
	   }
	   else{
		  return false;
	   }
}

function check_page(){//�����j�M�ĴX���� �T�{���L��J��r�b��줤
	if($("page_text").value==""){
		alert("�п�J�j�M����");
		$("page_text").focus();
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