<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
<%
	int track_id = 0;
	String id=request.getParameter("id");
	
	Statement find_track = con.createStatement();
	String find_track_sql = "SELECT track_id FROM opinion WHERE id = '"+ id +"'";//查詢頁面者的資料
	ResultSet find_track_id = find_track.executeQuery(find_track_sql);
	while(find_track_id.next()){
		track_id = find_track_id.getInt("track_id");
	}
	
	String del_sql="DELETE FROM opinion WHERE id ="+id;
	stmt.executeUpdate(del_sql);
	
	out.print("<script language='javascript'>");
	out.print("parent.location.href = '../member_page_music_song.jsp?music_id=" + track_id + "';");
	out.print("</script>");
	
	find_track.close();
	find_track_id.close();
	stmt.close();
%>

