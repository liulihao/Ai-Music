function openConfirm(url) {<!--�n�J���u������ �Ǹ��|��n�J���� �ç�web_url��J�Ѽư�-->
	var web_url=url;
	var dir="discuss";//�p�G�O�bmember��Ƨ��U������ �i���� �Y������if �L����else
	if(web_url.match(dir)!=null){  
		Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "../Login_member.jsp?web_url="+url})
		
	}else{
    Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp?web_url="+url})
	}
}
function check_page(){//�����j�M�ĴX���� �T�{���L��J��r�b��줤
	if($("page_text").value==""){
		alert("�п�J�j�M����");
		return false;
	}
	return true;
}

function openConfirm_search(url,type) {<!--�j�M�M�εn�J���u������ �Ǹ��|��n�J���� �ç�web_url��J�Ѽư�-->
	
	    Dialog.confirm("�n�J", 
                   {className: "alphacube", width:520,height:249,closable:true,url: "Login_member.jsp?web_url="+url+type})
	
}