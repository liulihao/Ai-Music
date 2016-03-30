function check_search(){//½T»{·j´M¦r¦ê¦³µL
	if($("search_text").value==""){
		alert("½Ð¿é¤J·j´M¦r¦ê");
		$("search_text").focus();
		return false;
	}
	return true;
}