<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*" %>
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
<%
   String track_id=request.getParameter("music_id");//������ǨӪ����ֽs��
   String login_user=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
   sql="select * from track where track_id="+track_id;
   rs=stmt.executeQuery(sql);
   while(rs.next()){
     String file_name=rs.getString("track_file");
	 String file_track_pic=rs.getString("track_pic");
     String del_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/music/"+file_name;
	 String del_pic_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/music/"+file_track_pic;
	 String del_count_pathfile = request.getRealPath("/") + "myweb/counter/track/"+track_id+".cnt";
	 //�쭵�ָ��|
	 delFile(del_pathfile);//�R�������ɮ�
	 delFile(del_pic_pathfile);//�R�����ֹϤ�
     delFile(del_count_pathfile);//�R�����֭p����
	 }
   sql="delete from evaluation where track_id ="+track_id;//�R���q��������track_id
   stmt.executeUpdate(sql);
   
   sql="delete from music_collection where track_id ="+track_id;//�R�����í��֪�track_id
   stmt.executeUpdate(sql);
   
   sql="delete from opinion where track_id ="+track_id;//�R���N����track_id
   stmt.executeUpdate(sql);
   
   sql="delete from track_type where track_id ="+track_id;//�R���q�����檺track_id
   stmt.executeUpdate(sql);
   
   sql="delete from track where track_id ="+track_id;//�R��track�����ָ��
   stmt.executeUpdate(sql);
	
	out.print("<script language='javascript'>alert('�R���q�����\');");
	out.print("location.href='member_manage_manage-music.jsp'</script>");
   
%>