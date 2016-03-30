<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("big5");%> 
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
%>
<% request.setCharacterEncoding("big5");%> 
<%
	String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
	String saveDirectory = request.getRealPath("/")+"myweb/user/"+login_user+"/music";
	//�]�w���|   �ŧi����W�Ǥ��ɮפj�p�� 1MB
	int maxPostSize = 1024 * 1024 ;
	//�ŧi�W���ɮצW��
	String track_pic = null;
	String pic_name=null;
	String enCoding = "big5";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//�J�쭫���ɦW �b�r���۰ʲ֥[
	// ���@�ӷs��MultipartRequest ������Amulti
try {//try
	MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize,enCoding,policy); 
	
	//���o�Ҧ��W�Ǥ��ɮצW��
	Enumeration filesname = multi.getFileNames();
	while (filesname.hasMoreElements())
    {
		String name = (String)filesname.nextElement();//��W���ɦW
		track_pic = multi.getFilesystemName(name);   //�s��FILE�̭�
	}
	
	int track_id=Integer.parseInt(multi.getParameter("track_id"));//���ֽs��
	String track_name=multi.getParameter("track_name");//���֦W��
	String track_singer=multi.getParameter("track_singer");//�t�ۤH
	String track_lyricist=multi.getParameter("track_lyricist");//�@���H
	String track_composer=multi.getParameter("track_composer");//�@���H
	String track_arranger=multi.getParameter("track_arranger");//�s���H
	String track_album=multi.getParameter("track_album");//�����M��
	String track_right=multi.getParameter("track_right");//���v�Ҧ�
	
	String track_intro=multi.getParameter("track_intro");//�q��²��
	StringBuffer buf_i = new StringBuffer(track_intro.length()+6);
	char ch_i = ' ';
	for(int p = 0;p < track_intro.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch_i = track_intro.charAt(p);
		if(ch_i == '\n')
			buf_i.append("<br>");
		else
			buf_i.append(ch_i);
	}
 	track_intro = buf_i.toString();
	
	String track_lyrics=multi.getParameter("track_lyrics");//�q��
	StringBuffer buf_l = new StringBuffer(track_lyrics.length()+6);
	char ch_l = ' ';
	for(int p = 0;p < track_lyrics.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch_l = track_lyrics.charAt(p);
		if(ch_l == '\n')
			buf_l.append("<br>");
		else
			buf_l.append(ch_l);
	}
 	track_lyrics = buf_l.toString();
	
	int classify_id=Integer.parseInt(multi.getParameter("classified"));//��w����
	int sing_type = Integer.parseInt(multi.getParameter("sing_type"));//�t�����O
	java.sql.Date now_date=new java.sql.Date(System.currentTimeMillis());//��{�b���
	java.sql.Time now_time=new java.sql.Time(System.currentTimeMillis());//��{�b�ɶ�
	
  
	//��s�򥻺q�����
	if(track_name==""){
 		out.print("<script language='javascript'>alert('�q���W�٤��o���ť�')</script>");
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);
	}
	if(classify_id==0){
		sql = "update track set track_name=?,track_singer=?,track_lyricist=?,track_composer=?,track_arranger=?,track_album=?,track_right=?,track_intro=?,track_lyrics=?,sing_type=?,classify_id=?, revise_date=?, revise_time=? where track_id=?"; 
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,track_name);
		pstmt.setString(2,track_singer);
		pstmt.setString(3,track_lyricist);
		pstmt.setString(4,track_composer);
		pstmt.setString(5,track_arranger);
		pstmt.setString(6,track_album);
		pstmt.setString(7,track_right);
		pstmt.setString(8,track_intro);
		pstmt.setString(9,track_lyrics);
		pstmt.setInt(10,sing_type);
		pstmt.setInt(11,0);
		pstmt.setDate(12,now_date);
		pstmt.setTime(13,now_time);
		pstmt.setInt(14,track_id);
		pstmt.executeUpdate();
		pstmt.close();
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);	}
	else{
		sql = "update track set track_name=?,track_singer=?,track_lyricist=?,track_composer=?,track_arranger=?,track_album=?,track_right=?,track_intro=?,track_lyrics=?,sing_type=?,classify_id=?, revise_date=?, revise_time=? where track_id=?"; 
		PreparedStatement pstmt = con.prepareStatement(sql);
	
		pstmt.setString(1,track_name);
		pstmt.setString(2,track_singer);
		pstmt.setString(3,track_lyricist);
		pstmt.setString(4,track_composer);
		pstmt.setString(5,track_arranger);
		pstmt.setString(6,track_album);
		pstmt.setString(7,track_right);
		pstmt.setString(8,track_intro);
		pstmt.setString(9,track_lyrics);
		pstmt.setInt(10,sing_type);
		pstmt.setInt(11,classify_id);
		pstmt.setDate(12,now_date);
		pstmt.setTime(13,now_time);
		pstmt.setInt(14,track_id);
		pstmt.executeUpdate();
		pstmt.close();
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);	
		}
	//��s�򥻺q����� end
   
	//��s�y��
	String language_id=multi.getParameter("language");//���ֽs��
	if(language_id==null){
		sql="UPDATE track SET track_language_id=?,track_language_other=? WHERE track_id=?";
		PreparedStatement language = con.prepareStatement(sql);
		language.setInt(1,8);
		language.setString(2,"0");
		language.setInt(3,track_id);
		language.executeUpdate();
		language.close();
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);
	}
	else if(language_id.equals("7")){
		String others_text=multi.getParameter("others_text");
		sql="UPDATE track SET track_language_id=?,track_language_other=? WHERE track_id=?";
		PreparedStatement language = con.prepareStatement(sql);
		language.setInt(1,Integer.parseInt(language_id));
		language.setString(2,others_text);
		language.setInt(3,track_id);
		language.executeUpdate();
		language.close();
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);
	}
	else{
		sql="UPDATE track SET track_language_id=?,track_language_other=? WHERE track_id=?";
		PreparedStatement language = con.prepareStatement(sql);
		language.setInt(1,Integer.parseInt(language_id));
		language.setString(2,"0");
		language.setInt(3,track_id);
		language.executeUpdate();
		language.close();
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id); 
	}
	//��s�y�� end
	
	//��s����
	String Rock = multi.getParameter("Rock");
	String Pop = multi.getParameter("Pop");
	String Electronic = multi.getParameter("Electronic");
	String Metal = multi.getParameter("Metal");
	String HipHop = multi.getParameter("HipHop");
	String Jazz = multi.getParameter("Jazz");
	String Conutry = multi.getParameter("Conutry");
	String Folk = multi.getParameter("Folk");
	String Classical = multi.getParameter("Classical");
	String Dance = multi.getParameter("Dance");
	String RnB = multi.getParameter("RnB");
	String undefined = multi.getParameter("undefined");
	String type[]={Rock,Pop,Electronic,Metal,HipHop,Jazz,Conutry,Folk,Classical,Dance,RnB,undefined};
	int count=0;
	for(int i=0;i<12;i++){
		if(type[i]!=null){
			count++;
		}
	}
	if(count<=3){
 		String d_music="DELETE FROM track_type WHERE track_id='"+track_id+"'";
		//���¦���ƧR�� �קKPK���ư��D
		stmt.executeUpdate(d_music);
		for(int j=0;j<12;j++){
			if(type[j]!=null){
				String user_type = "INSERT INTO track_type(track_id,music_id) VALUES (?,?)";
				PreparedStatement prest = con.prepareStatement(user_type);
				prest.setInt(1,track_id);
				prest.setString(2,type[j]);
				prest.executeUpdate();
				prest.close();
				response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id); 
			}
		}//for j end
	}
	else{
		out.print("<script language='javascript'>alert('�q�����椣�i�W�L�T��')</script>");
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);
	}//��s���� end
	sql="SELECT * FROM track WHERE track_id ='"+track_id+"'";
 	rs = stmt.executeQuery(sql);
	//���ֹϤ�
	String track_pic_sql = "UPDATE track SET track_pic=? WHERE track_id=?"; 
	PreparedStatement track_pic1 = con.prepareStatement(track_pic_sql);
	if(track_pic==null)
	{  //�p�Gtrack_pic�èS���ǤJ�ȡA�N��Ϥ�����s�A�h�ϥέ�Ӫ����|
		while(rs.next()){
			String pic=rs.getString("track_pic");
			track_pic1.setString(1,pic);	
		}
	}
	else{  //track_pic���ǤJ�ȡA�N�s�����|�ǤJ��Ʈw
		while(rs.next()){
     	String pic1=rs.getString("track_pic");
			if(!pic1.equals("noimage.jpg")){
				String del_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/music/"+pic1;
				delFile(del_pathfile);//�R���Ϥ��ɮ�
			}
		}
		track_pic1.setString(1,track_pic);
	}
	track_pic1.setInt(2,track_id);
	track_pic1.executeUpdate();//��strack�򥻸��
	//���ֹϤ� end
	
	response.sendRedirect("member_manage_manage-music_revise.jsp?music_id="+track_id); 

}catch(Exception e){
	
		out.print("<script language='javascript'>alert('�W�Ǫ��Ϥ��ɤ��o�W�L1MB');");
		out.print("history.back();");
		out.print("</script>");
	
} 
%>