<%@ page import="java.io.*" %>
<%!
	String t_errMsg = "";
	private int t_webCounter(String t_fullPath) {
		String t_hitRate = "1", t_tempNo = "";
		try {
			FileReader t_fr = new FileReader(t_fullPath); //開啟記數檔
			BufferedReader t_br = new BufferedReader (t_fr);
			t_tempNo = t_br.readLine();
			while (t_tempNo != null){
				t_hitRate = t_tempNo; //記數值存入hitRate變數
				t_tempNo = t_br.readLine();
			}
			t_br.close();
			t_fr.close();
		} catch (IOException ioe) {
			t_errMsg = "Error : " + ioe.toString();
		}
		return Integer.parseInt(t_hitRate);
	}
%>
<%
	String counter_track_id = request.getParameter("music_id");
	String t_fullPath, t_fName = "/myweb/counter/track/"+counter_track_id+".cnt"; 
	//斜線(/)代表Web應用程式的根目錄
	t_fullPath = application.getRealPath(t_fName);
	int t_counter = t_webCounter(t_fullPath);
	String t_hitRate = String.valueOf(t_counter);
	session.setMaxInactiveInterval(60*30);
	Object t_obj = session.getAttribute(counter_track_id);
	//如果該名網友尚未登錄這份網頁，或者已超出預設時間(30分鐘)
	if (t_obj == null) {
		++t_counter;
		t_hitRate = String.valueOf(t_counter);
		session.setAttribute(counter_track_id, "true");
		try {
			//準備將結果寫入計數檔
			FileWriter t_fw = new FileWriter(t_fullPath);
			t_fw.write(t_hitRate);
			t_fw.close();
		} catch (IOException ioe) {
			out.println("Error : " +ioe.toString());
		}
	}
%>
<%
	char t_chrName;
	for (int i = 0; i < t_hitRate.length(); i++) {
		t_chrName = t_hitRate.charAt(i);
	}
	String track_count_sql = "UPDATE track SET track_count = '" + t_counter + "' WHERE track_id = '" + counter_track_id + "'";
	stmt.executeUpdate(track_count_sql);
%>