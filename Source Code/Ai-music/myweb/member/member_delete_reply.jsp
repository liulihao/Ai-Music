<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
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
	Statement stmt=con.createStatement();

	int title_id,reply_id;

	title_id = Integer.parseInt(request.getParameter("title_id"));
	reply_id = Integer.parseInt(request.getParameter("reply_id"));
	
	sql="SELECT * FROM reply,users WHERE reply.id=users.id AND reply.reply_id ="+reply_id;
	rs=smt.executeQuery(sql);//�R���Ϥ�
	
		while(rs.next()){
			String user_id=rs.getString("users.user_id");
			String discuss_pic=rs.getString("reply.reply_pic");
			String del_pathfile = request.getRealPath("/") + "myweb/user/"+user_id+"/discuss/"+discuss_pic;
		delFile(del_pathfile);//�R���Ϥ��ɮ�	
		}
	sql="delete from reply where reply_id ="+reply_id;
	
	
       stmt.executeUpdate(sql);

	response.sendRedirect("index_discuss_topic_content.jsp?title_id="+title_id+"");
%>
