<%@ page import="java.io.*" %>
<%!
	String errMsg = "";
	private int webCounter(String fullPath) {
		String hitRate = "1", tempNo = "";
		try {
			FileReader fr = new FileReader(fullPath); //�}�ҰO����
			BufferedReader br = new BufferedReader (fr);
			tempNo = br.readLine();
			while (tempNo != null){
				hitRate = tempNo; //�O�ƭȦs�JhitRate�ܼ�
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
		counter_member_id=(String)session.getAttribute("user_id");//��n�J���ϥΪ̸��
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
	//�׽u(/)�N��Web���ε{�����ڥؿ�
	fullPath = application.getRealPath(fName);
	int counter = webCounter(fullPath);
	String hitRate = String.valueOf(counter);
	session.setMaxInactiveInterval(60*30);
	Object obj = session.getAttribute(counter_member_id);
	//�p�G�ӦW���ͩ|���n���o�������A�Ϊ̤w�W�X�w�]�ɶ�(30����)
	if (obj == null) {
		++counter;
		hitRate = String.valueOf(counter);
		session.setAttribute(counter_member_id, "true");
		try {
			//�ǳƱN���G�g�J�p����
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