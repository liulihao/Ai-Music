function check_page(){//�����j�M�ĴX���� �T�{���L��J��r�b��줤
	if($("page_text").value==""){
		alert("�п�J�j�M����");
		return false;
		$("page_text").focus();
	}
	return true;
}