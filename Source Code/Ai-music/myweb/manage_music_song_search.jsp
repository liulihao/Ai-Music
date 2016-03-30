<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<link href="../CSSfile/member_manage_manage-music.css" rel="stylesheet" type="text/css" />


<%
	String song_text=request.getParameter("song_search_text");
	String user_text=(String)session.getAttribute("user_id");
	sql="select *  FROM track WHERE user_id='"+user_text+"' AND track_name LIKE '%"+song_text+"%'";
	  rs=stmt.executeQuery(sql);
	  if(!rs.next()){
     out.print("<script language='javascript'>");
     out.print("window.alert('無相符的歌曲名稱');");
	 out.print("location.href='member_manage_manage-music.jsp';");
     out.print("</script>");
   }else{

	int RowCount=0;//ResultSet記錄筆數
	
	 sql="select COUNT(*)  FROM track WHERE user_id='"+user_text+"' AND track_name LIKE '%"+song_text+"%'";
    rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	
	  sql="select *  FROM track WHERE user_id='"+user_text+"' AND track_name LIKE '%"+song_text+"%' ORDER BY track_time DESC";
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第一筆記錄上
	   
	  rs.next();
%>
    <p> <b style="float:right; margin:5px 0 5px 0;"><a href="member_manage_manage-music.jsp">回音樂作品管理</a></b></p>
	<p>&nbsp;</p>
   <!--頁次-->
   
   
    <div class="style4" align="center">
    
    <p>共有<font color="#0066FF"><b><%=RowCount%></b></font>筆搜尋結果</p>
    
    </div>
    <!--End of 頁次-->
    <div class="font10 music-title  roundedCorners" style="margin-bottom:10px">
            <table width="651" border="0">
              <tr>
              	<td width="43" align="center">#</td>
                <td width="410" class="title-name1">歌曲名稱</td>
                <td width="184" class="title-style1">&lt;上傳時間&gt;</td>
              </tr>
            </table>
          </div>
<%
		   rs.previous();
		   int num=0;
   			 while(rs.next()){   
			  num++;
	 		  String track_id=rs.getString("track_id");
			  String track_name=rs.getString("track_name");


%>
    	
          <div class="table-padding">
          
            <div>           
              <table width="661" border="0">
                <tr>
                <td width="34" align="center"><%=num%></td>
                  <td width="397" class="title-name1"><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%=track_name%></a></td>
                  <td width="216" class="title-style1"><span class="style9"><%=rs.getDate("track_time")%> <%=rs.getTime("track_time")%></span></td>
                </tr>
              <tr>
              <td></td>
            <td colspan="2">
            <input type="button" class="save-block style4" value="修改" onclick="location.href='member_manage_manage-music_revise.jsp?music_id=<%=track_id%>'"/>
            <input type="button" class="delete-block style4" value="刪除" onclick="delete_music(<%=track_id%>)"/>
            </td>
            </tr>
         </table>
            </div>
            <div class="song-line" >
              <hr size="1" color="#E5E5E5";/>
            </div>
          </div>
          
<%	
		}//rs
		rs.close();
		
	}//else
%><p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>