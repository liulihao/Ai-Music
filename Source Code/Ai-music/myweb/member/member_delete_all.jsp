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
	int title_id,subject_id;

	title_id = Integer.parseInt(request.getParameter("title_id"));
	subject_id= Integer.parseInt(request.getParameter("subject_id"));
	
	//reply刪除圖片
	sql="SELECT * FROM reply,title,users WHERE reply.id=users.id AND reply.title_id=title.title_id AND title.title_id ="+title_id;
	rs=smt.executeQuery(sql);
	
	while(rs.next()){
			String reply_user_id=rs.getString("users.user_id");
			String reply_discuss_pic=rs.getString("reply.reply_pic");
			String reply_del_pathfile = request.getRealPath("/") + "myweb/user/"+reply_user_id+"/discuss/"+reply_discuss_pic;
		delFile(reply_del_pathfile);//刪除圖片檔案	
	}//end of reply刪除圖片
		
	sql="delete from reply where title_id ="+title_id;//先刪除title裡的reply資料
       stmt.executeUpdate(sql);
	   
	//title刪除圖片
	sql="SELECT * FROM title,users WHERE title.id=users.id AND title.title_id ="+title_id;
	rs=smt.executeQuery(sql);
	
	while(rs.next()){
			String title_user_id=rs.getString("users.user_id");
			String title_discuss_pic=rs.getString("title.title_pic");
			String title_del_pathfile = request.getRealPath("/") + "myweb/user/"+title_user_id+"/discuss/"+title_discuss_pic;
		delFile(title_del_pathfile);//刪除圖片檔案	
	}//end of title刪除圖片
	
	sql="delete from title where title_id ="+title_id;//刪除title資料
       smt.executeUpdate(sql);

	response.sendRedirect("index_discuss_topic.jsp?subject_id="+subject_id+"");
%>
