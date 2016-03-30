<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("big5");%> 
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
<% request.setCharacterEncoding("big5");%> 
<%
	String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
	String saveDirectory = request.getRealPath("/")+"myweb/user/"+login_user+"/music";
	//設定路徑   宣告限制上傳之檔案大小為 1MB
	int maxPostSize = 1024 * 1024 ;
	//宣告上傳檔案名稱
	String track_pic = null;
	String pic_name=null;
	String enCoding = "big5";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//遇到重複檔名 在字尾自動累加
	// 產一個新的MultipartRequest 的物件，multi
try {//try
	MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize,enCoding,policy); 
	
	//取得所有上傳之檔案名稱
	Enumeration filesname = multi.getFileNames();
	while (filesname.hasMoreElements())
    {
		String name = (String)filesname.nextElement();//抓上傳檔名
		track_pic = multi.getFilesystemName(name);   //存到FILE裡面
	}
	
	int track_id=Integer.parseInt(multi.getParameter("track_id"));//音樂編號
	String track_name=multi.getParameter("track_name");//音樂名稱
	String track_singer=multi.getParameter("track_singer");//演唱人
	String track_lyricist=multi.getParameter("track_lyricist");//作詞人
	String track_composer=multi.getParameter("track_composer");//作曲人
	String track_arranger=multi.getParameter("track_arranger");//編曲人
	String track_album=multi.getParameter("track_album");//收錄專輯
	String track_right=multi.getParameter("track_right");//版權所有
	
	String track_intro=multi.getParameter("track_intro");//歌曲簡介
	StringBuffer buf_i = new StringBuffer(track_intro.length()+6);
	char ch_i = ' ';
	for(int p = 0;p < track_intro.length();p++)//若遇到換行就轉為<br>
	{
		ch_i = track_intro.charAt(p);
		if(ch_i == '\n')
			buf_i.append("<br>");
		else
			buf_i.append(ch_i);
	}
 	track_intro = buf_i.toString();
	
	String track_lyrics=multi.getParameter("track_lyrics");//歌詞
	StringBuffer buf_l = new StringBuffer(track_lyrics.length()+6);
	char ch_l = ' ';
	for(int p = 0;p < track_lyrics.length();p++)//若遇到換行就轉為<br>
	{
		ch_l = track_lyrics.charAt(p);
		if(ch_l == '\n')
			buf_l.append("<br>");
		else
			buf_l.append(ch_l);
	}
 	track_lyrics = buf_l.toString();
	
	int classify_id=Integer.parseInt(multi.getParameter("classified"));//制定分類
	int sing_type = Integer.parseInt(multi.getParameter("sing_type"));//演唱類別
	java.sql.Date now_date=new java.sql.Date(System.currentTimeMillis());//抓現在日期
	java.sql.Time now_time=new java.sql.Time(System.currentTimeMillis());//抓現在時間
	
  
	//更新基本歌曲資料
	if(track_name==""){
 		out.print("<script language='javascript'>alert('歌曲名稱不得為空白')</script>");
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
	//更新基本歌曲資料 end
   
	//更新語言
	String language_id=multi.getParameter("language");//音樂編號
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
	//更新語言 end
	
	//更新風格
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
		//把舊有資料刪掉 避免PK重複問題
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
		out.print("<script language='javascript'>alert('歌曲風格不可超過三個')</script>");
		response.setHeader("Refresh","0; URL=member_manage_manage-music_revise.jsp?music_id="+track_id);
	}//更新風格 end
	sql="SELECT * FROM track WHERE track_id ='"+track_id+"'";
 	rs = stmt.executeQuery(sql);
	//音樂圖片
	String track_pic_sql = "UPDATE track SET track_pic=? WHERE track_id=?"; 
	PreparedStatement track_pic1 = con.prepareStatement(track_pic_sql);
	if(track_pic==null)
	{  //如果track_pic並沒有傳入值，代表圖片未更新，則使用原來的路徑
		while(rs.next()){
			String pic=rs.getString("track_pic");
			track_pic1.setString(1,pic);	
		}
	}
	else{  //track_pic有傳入值，將新的路徑傳入資料庫
		while(rs.next()){
     	String pic1=rs.getString("track_pic");
			if(!pic1.equals("noimage.jpg")){
				String del_pathfile = request.getRealPath("/") + "myweb/user/"+login_user+"/music/"+pic1;
				delFile(del_pathfile);//刪除圖片檔案
			}
		}
		track_pic1.setString(1,track_pic);
	}
	track_pic1.setInt(2,track_id);
	track_pic1.executeUpdate();//更新track基本資料
	//音樂圖片 end
	
	response.sendRedirect("member_manage_manage-music_revise.jsp?music_id="+track_id); 

}catch(Exception e){
	
		out.print("<script language='javascript'>alert('上傳的圖片檔不得超過1MB');");
		out.print("history.back();");
		out.print("</script>");
	
} 
%>