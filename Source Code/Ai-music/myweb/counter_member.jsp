<%@ page import="java.io.*" %>
<%!
	String errMsg = "";
	private int webCounter(String fullPath) {
		String hitRate = "1", tempNo = "";
		try {
			FileReader fr = new FileReader(fullPath); //開啟記數檔
			BufferedReader br = new BufferedReader (fr);
			tempNo = br.readLine();
			while (tempNo != null){
				hitRate = tempNo; //記數值存入hitRate變數
				tempNo = br.readLine();	
			}
			br.close();
			fr.close();
		} catch (IOException ioe) {
			errMsg = "Error : " + ioe.toString();
		}
		return Integer.parseInt(hitRate);
	}
%>
<%
	String counter_member_id = request.getParameter("user");
	if(counter_member_id == null){
		counter_member_id=(String)session.getAttribute("user_id");//抓登入的使用者資料
		String track_id=request.getParameter("music_id");
		
		Statement track_user=con.createStatement();
		String track_user_sql="select * from track where track_id='"+track_id+"'";
		ResultSet track_user_data;
		track_user_data=track_user.executeQuery(track_user_sql);
		
		while(track_user_data.next()){
			String track_user_id=track_user_data.getString("user_id");
			counter_member_id=track_user_id;
		}
	}
	String fullPath, fName = "/myweb/counter/member/" +counter_member_id+ ".cnt";
	//斜線(/)代表Web應用程式的根目錄
	fullPath = application.getRealPath(fName);
	int counter = webCounter(fullPath);
	String hitRate = String.valueOf(counter);
	session.setMaxInactiveInterval(60*30);
	Object obj = session.getAttribute(counter_member_id);
	//如果該名網友尚未登錄這份網頁，或者已超出預設時間(30分鐘)
	if (obj == null) {
		++counter;
		hitRate = String.valueOf(counter);
		session.setAttribute(counter_member_id, "true");
		try {
			//準備將結果寫入計數檔
			FileWriter fw = new FileWriter(fullPath);
			fw.write(hitRate);
			fw.close();
		} catch (IOException ioe) {
			out.println("Error : " +ioe.toString());
		}
	}
%>
<%
	char chrName;
	for (int i = 0; i < hitRate.length(); i++) {
		chrName = hitRate.charAt(i);
	}
	String count_sql = "UPDATE users SET user_count = '" + counter + "' WHERE user_id = '" + counter_member_id + "'";
	stmt.executeUpdate(count_sql);
%>