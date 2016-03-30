<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
<%!/** 
   * 刪除文件 
   * @param filePathAndName String 文件路徑及名稱 如c:/fqf.txt 
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
      System.out.println("刪除文件操作出錯"); 
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
	rs=smt.executeQuery(sql);//刪除圖片
	
		while(rs.next()){
			String user_id=rs.getString("users.user_id");
			String discuss_pic=rs.getString("reply.reply_pic");
			String del_pathfile = request.getRealPath("/") + "myweb/user/"+user_id+"/discuss/"+discuss_pic;
		delFile(del_pathfile);//刪除圖片檔案	
		}
	sql="delete from reply where reply_id ="+reply_id;
	
	
       stmt.executeUpdate(sql);

	response.sendRedirect("index_discuss_topic_content.jsp?title_id="+title_id+"");
%>
