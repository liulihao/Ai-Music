<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
</head>
<%!/** 
   * �R����� 
   * @param filePathAndName String �����|�ΦW�� �pc:/fqf.txt 
   * @param fileContent String 
   * @return boolean 
   */ 
  public void delFile(String filePathAndName) { 
    try { 
      String filePath = filePathAndName; 
      filePath = filePath.toString(); 
      java.io.File myDelFile = new java.io.File(filePath); 
      myDelFile.delete(); 

    } 
    catch (Exception e) { 
      System.out.println("�R�����ާ@�X��"); 
      e.printStackTrace(); 

    }

  }
  
//���W��ܦ� �ˬd���榡�O�_���T
	String check(String reg,String check_text) throws Exception{
	try{
		String result;
		if(check_text.matches(reg)) 
            result="�榡���T"; 
        else 
            result="�榡���~";
			return result;
		}catch(Exception ex){
			throw ex;
		}
	}
%>
<body>
<% request.setCharacterEncoding("big5");%> 
<%
   //String user_id = request.getParameter("user");//��|���Ŷ����|�����
   String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
   /*if(user_id==null){//�p�G�줣��|���Ŷ����}��?user=xxx���� ��ܬO���H�n�J �h�n�J��id=�|��id
    user_id=login_user;
   }*/
   String user="SELECT * FROM users WHERE user_id ='"+login_user+"'";
   rs = stmt.executeQuery(user);//�d��users �H�K���age_visible city_visible�����
   
    String saveDirectory = request.getRealPath("/") + "myweb\\user\\"+login_user;//�W�Ǹ��|
    int    maxPostSize = 1024 * 1024 ; //�ɮפj�p����1MB
	String user_pic = null;  //�ɮצW��
	String enCoding = "big5"; //�s�X
try {//try
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, enCoding);
  
    //  ���o�Ҧ��W�Ǥ��ɮ׿�J���A�W�٤αԭz
   Enumeration filesname = multi.getFileNames();
   while (filesname.hasMoreElements())
   {
       String name = (String)filesname.nextElement();
        user_pic = multi.getFilesystemName(name);   //���o�W���ɮת��W��
   }
   
  String user_name = multi.getParameter("user_name");
  String user_nkname = multi.getParameter("user_nkname");
  String user_gen =multi.getParameter("user_gen");
  String user_birth = multi.getParameter("user_birth");
  String user_city = multi.getParameter("user_city");
  String user_intro = multi.getParameter("user_intro");
  
  //����ˬd
  
  String user_name_check=check("^[a-zA-Z\u0391-\uFFE5]*$",user_name);
  String user_nkname_check = check("^[a-zA-Z\u0391-\uFFE5]*$",user_nkname);
  String user_city_check = check("^[a-zA-Z\u0391-\uFFE5]*$",user_city);
  if(user_name.equals("")){//�ˬd�m�W
		out.print("<script language='javascript'>alert('�m�W���o���ť�!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(user_name.length()<2){
		out.print("<script language='javascript'>alert('�m�W���|�֩��Ӧr!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(!user_name_check.equals("�榡���T")){
		out.print("<script language='javascript'>alert('�|���m�W�榡���~!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(user_nkname_check.equals("")){//�ˬd�|���ʺ�
		out.print("<script language='javascript'>alert('�|���ʺ٤��o���ť�');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(!user_nkname_check.equals("�榡���T")){
		out.print("<script language='javascript'>alert('�|���ʺٮ榡���~');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(user_city_check.equals("")){//�ˬd�~����
		out.print("<script language='javascript'>alert('�ж�J�~����!');");
		out.print("location.href='member_manage.jsp';</script>");
  }else if(!user_city_check.equals("�榡���T")){
		out.print("<script language='javascript'>alert('�~�����榡���~');");
		out.print("location.href='member_manage.jsp';</script>");
	//END OF ����ˬd
  }else{
  
	StringBuffer buf = new StringBuffer(user_intro.length()+6);
	char ch = ' ';
	for(int p = 0;p < user_intro.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch = user_intro.charAt(p);
		if(ch == '\n')
			buf.append("<br>");	
									
		else 
			buf.append(ch);
	}
 	user_intro = buf.toString();
	//��susers�����
	sql = "UPDATE users SET user_name=?,user_nkname=?,user_gen=?,user_birth=?,user_city=?,user_pic=?, user_intro=? where user_id=?"; 

	PreparedStatement prest = con.prepareStatement(sql);

	prest.setString(1,user_name);
	prest.setString(2,user_nkname);
	prest.setString(3,user_gen);
	prest.setString(4,user_birth);
	prest.setString(5,user_city);
	//�P�_�O�_���s���Ϥ��ǤJ
	if(user_pic==null){  //�p�Guser_pic�èS���ǤJ�� �N��Ϥ�����s �h�ϥέ�Ӫ����|
	while(rs.next()){
   	  String pic=rs.getString("user_pic");
  	      prest.setString(6,pic);
			}

	}
	else{  //�_�h�N�N�s�����|�ǤJ��Ʈw
		while(rs.next()){
     		String pic1=rs.getString("user_pic");
			String del_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/"+pic1;
			delFile(del_pathfile);//�R���Ϥ��ɮ�
			}
	prest.setString(6,user_pic);

	}
	prest.setString(7,user_intro);
	prest.setString(8,login_user);
	prest.executeUpdate();//��susers�򥻸��
 
 //���Ӫ�age_visible.city_visible����ƧR��
 /*Statement visible_update=con.createStatement();
 String d_visible="DELETE FROM visible WHERE user_id='"+login_user+"'";//
 visible_update.executeUpdate(d_visible);
 
 //��sage_visible�Mcity_visible�����
  String visible_type = "INSERT INTO visible(user_id,age_visible,city_visible) VALUES (?,?,?)";
  PreparedStatement visible = con.prepareStatement(visible_type);
  visible.setString(1,login_user);
  visible.setString(2,age_visible);
  visible.setString(3,city_visible);
  visible.executeUpdate();*/
	rs.close();
	stmt.close();
	con.close();

	response.sendRedirect("member_manage.jsp");
	}
}catch(Exception e){
	
		out.print("<script language='javascript'>alert('�W�Ǫ��Ϥ��ɤ��o�W�L1MB');");
		out.print("history.back();");
		out.print("</script>");
	
}
%>
</body>
</html>

