// JavaScript Document

var xmlHttp; 
  
// ���禡�b�إ� XMLHttpRequest ���� 
function createXMLHttpRequest() { 
  if (window.ActiveXObject) { // IE 
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
  } 
  else if (window.XMLHttpRequest) { // Other browser 
    xmlHttp = new XMLHttpRequest();                
  } 
} 

// �{���Ѧ����� (<input> tag �̳]�w onkeyup="chkAccount()") 
function chkPassword() { 
    // �إ�XMLHttpRequest���� 
  createXMLHttpRequest(); 
  var user_id = document.getElementById("user_id").value; 
  var user_password = document.getElementById("user_password").value; 
  var url ="password_check.jsp?user_id=" + user_id+"&user_password="+user_password;

  // �N��J���b���Ǧܫ�ݧ@���� 
  xmlHttp.onreadystatechange = callback;  
  xmlHttp.open("GET", url, true); 
  xmlHttp.send(null); 
} 
  
/* XMLHttpRequest ���� open ��k���Ѽƻ����G  
   xmlHttp.open(a,b,c) 
   �Ĥ@�ӰѼ� a �O HTTP request ����k�GGET�BPOST�BHEAD ����@�Өϥ�(���j�g) 
   �ĤG�ӰѼ� b �O�n�I�s�� url, ���L�u��I�s�P�������P�@�Ӻ��줺������ 
   �ĤT�ӰѼ� c �M�w�� request �O�_�īD�P�B�i�� 
     �p�G�]�w�� true �h�Y�ϫ�ݩ|���Ǧ^��Ƥ]�|�~�򩹤U����᭱���{�� 
     �p�G�]�w�� false �h��������ݶǦ^��ƫ�A�~�|�~�����᭱���{�� 
 */      

// ��Ʀ^�Ǥ���A�ϥ� callback �o�Ө�ƳB�z����ʧ@    
function callback() { 
  if ((xmlHttp.readyState == 4) && (xmlHttp.status == 200)) { 
    // ������ݵ{���Ǧ^�Ӫ�����(�ѪR�� DOM �榡) 
    var xmldoc = xmlHttp.responseXML; 
    // ���X Tag �� <message> �Ӥ������� 
    var mes = xmldoc.getElementsByTagName("message")[0].firstChild.data; 
    // ���X Tag �� <passed> �Ӥ������� 
    var val = xmldoc.getElementsByTagName("passed")[0].firstChild.data; 
    setMessage(mes, val); 
  } 
} 

/* xmlHttp.readyState �Ҧ��i�઺�ȡG 
     0 (�٨S�}�l), 
     1 (Ū����), 
     2 (�wŪ��), 
     3 (��T�洫��), 
     4 (�@������) 

   xmlHttp.status �`�����ȡG 
     200 (�@�����`), 
     404 (�d�L����), 
     500 (�������~)    
*/      
  
function setMessage(message, isValid) {            
  var messageArea = document.getElementById("divPassword"); 
  var fontColor = "green"; 

  if (isValid == "true" || isValid == "True") { 
    fontColor = "red";                
  } 

  // ���óB�z�����Ϥ� 
  
  // ��ܬO�_�����ƪ��b�� 
  messageArea.innerHTML = "<font color=" + fontColor + ">" + message + " </font>"; 
}
