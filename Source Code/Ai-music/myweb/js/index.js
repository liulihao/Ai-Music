function check_search(){//�T�{�j�M�r�꦳�L
	if($("search_text").value==""){
		alert("�п�J�j�M�r��");
		$("search_text").focus();
		return false;
	}
	return true;
}