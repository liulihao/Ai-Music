<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*" %>
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
   String track_id=request.getParameter("music_id");//抓網頁傳來的音樂編號
   String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
   sql="select * from track where track_id="+track_id;
   rs=stmt.executeQuery(sql);
   while(rs.next()){
     String file_name=rs.getString("track_file");
	 String file_track_pic=rs.getString("track_pic");
     String del_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/music/"+file_name;
	 String del_pic_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/music/"+file_track_pic;
	 String del_count_pathfile = request.getRealPath("/") + "myweb/counter/track/"+track_id+".cnt";
	 //抓音樂路徑
	 delFile(del_pathfile);//刪除音樂檔案
	 delFile(del_pic_pathfile);//刪除音樂圖片
     delFile(del_count_pathfile);//刪除音樂計數檔
	 }
   sql="delete from evaluation where track_id ="+track_id;//刪除歌曲評價的track_id
   stmt.executeUpdate(sql);
   
   sql="delete from music_collection where track_id ="+track_id;//刪除收藏音樂的track_id
   stmt.executeUpdate(sql);
   
   sql="delete from opinion where track_id ="+track_id;//刪除意見的track_id
   stmt.executeUpdate(sql);
   
   sql="delete from track_type where track_id ="+track_id;//刪除歌曲風格的track_id
   stmt.executeUpdate(sql);
   
   sql="delete from track where track_id ="+track_id;//刪除track的音樂資料
   stmt.executeUpdate(sql);
	
	out.print("<script language='javascript'>alert('刪除歌曲成功');");
	out.print("location.href='member_manage_manage-music.jsp'</script>");
   
%>