<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.security.Security" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Date" %>

<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<%!    //設定日期型式
 static final String pattern =
            "yyyy-MM-dd kk:mm:ss";
%>
<%! //複製資料夾
	public void copyFolder(String oldPath, String newPath) 
	{ 
    	try 
		{ 
      		(new File(newPath)).mkdirs(); //如果文件夾不存在 則建立新文件夾 
      		File a=new File(oldPath); 
      		String[] file=a.list(); 
      		File temp=null; 
      		for (int i = 0; i < file.length; i++) 
			{ 
        		if(oldPath.endsWith(File.separator))
				{ 
          			temp=new File(oldPath+file[i]); 
        		} 
        		else
				{ 
          			temp=new File(oldPath+File.separator+file[i]); 
        		} 

        		if(temp.isFile())
				{ 
          			FileInputStream input = new FileInputStream(temp); 
          			FileOutputStream output = new FileOutputStream(newPath + "/" + 
              		(temp.getName()).toString()); 
          			byte[] b = new byte[1024 * 5]; 
          			int len; 
          			while ( (len = input.read(b)) != -1) { 
            			output.write(b, 0, len); 
          			} 
          			output.flush(); 
          			output.close(); 
          			input.close(); 
        		} 
        		if(temp.isDirectory())
				{//如果是子文件夾 
          			copyFolder(oldPath+"/"+file[i],newPath+"/"+file[i]); 
        		} 
      		} 
    	} 
    	catch (Exception e) 
		{ 
			System.out.println("複製整個文件夾內容操作出錯"); 
			e.printStackTrace(); 
    	}
	}
%>
<% request.setCharacterEncoding("big5");%> 
<%
	String user_id=request.getParameter("user_id");
	boolean Exist=false;
	sql="select user_id from users where user_id='"+user_id+"'";//尋找帳號是否重複
	rs=stmt.executeQuery(sql);
	while(rs.next())
	{
		Exist=true;
	}
	if(Exist)//if1
	{//如果重複
		out.print("<script language='javascript'>");
		out.print("window.alert('帳號已有人使用，請輸入其他帳號');");
		out.print("window.history.go(-1);");
		out.print("</script>");
  	}//if1 end
	else//else1
	{
		String path = request.getRealPath("/") + "myweb/user";
		//取得目前目錄在伺服端的實際位置
		session.setAttribute("user_id",user_id); 
		path = path + "/"+user_id; //建立欲目錄路徑
		
		File d = new File(path);
		//建立代表user_id目錄的File物件, 並由d物件變數引用
		d.mkdir();
		
		String oldPath = request.getRealPath("/") + "myweb/player";
		String newPath=request.getRealPath("/") + "myweb/user/"+user_id;
		copyFolder(oldPath,newPath);//複製資料夾到會員資料夾去
	
		String user_name = request.getParameter("user_name");
		String user_nkname = request.getParameter("user_nkname");
		String user_password =request.getParameter("user_password");
		String user_gen =request.getParameter("user_gen");
		String user_email =request.getParameter("user_email");
		String user_birth = request.getParameter("user_birth");
		String user_city = request.getParameter("user_city");
		String user_pic="noimage.jpg";
	
		sql="insert into users set user_name='"+user_name+"',user_nkname='"+user_nkname+"',user_id='"+user_id+"',user_password='"+user_password+"',user_gen='"+user_gen+"',user_email='"+user_email+"',user_birth='"+user_birth+"',user_pic='"+user_pic+"',user_city='"+user_city+"'";
		stmt.executeUpdate(sql);
	
		String Rock = request.getParameter("Rock");
		String Pop = request.getParameter("Pop");
		String Electronic = request.getParameter("Electronic");
		String Metal = request.getParameter("Metal");
		String HipHop = request.getParameter("HipHop");
		String Jazz = request.getParameter("Jazz");
		String Conutry = request.getParameter("Conutry");
		String Folk = request.getParameter("Folk");
		String Classical = request.getParameter("Classical");
		String Dance = request.getParameter("Dance");
		String RnB = request.getParameter("RnB");
		String type[]={Rock,Pop,Electronic,Metal,HipHop,Jazz,Conutry,Folk,Classical,Dance,RnB};
		for(int i=0;i<11;i++)
		{
    		if(type[i]!=null)
			{
				String user_type = "INSERT INTO user_music(user_id,music_id) VALUES (?,?)";
				PreparedStatement prest = con.prepareStatement(user_type);
 	 			//4.透過Statement物件執行SQL敘述
  				//5.取得執行後的Resqult物件,或是被異動的資料筆數:
				prest.setString(1,user_id);
				prest.setString(2,type[i]);
				prest.executeUpdate();
			}
		}
		
		//發送mail
		InternetAddress[] address = null;
		String mailserver = "smtp.gmail.com";//請填入您的mail server, 通常是自己的網址
		String From = "musicyourlife@gmail.com";
		String to = new String(request.getParameter("user_email").getBytes("ISO8859_1"));
		String Subject = "Ai-music無樂不作樂網註冊成功通知信";
		String post_time= (new java.text.SimpleDateFormat(pattern)).format(new java.util.Date());
		String messageText ="親愛的會員<font color='blue'>"+user_nkname+"</font>您好,這裡是Ai-Music無樂不作音樂網<br>&nbsp;&nbsp;您在<font color='blue'>"+post_time+"</font>時註冊<br>&nbsp;&nbsp;帳號:<font color='blue'>"+user_id+"</font><br>&nbsp;&nbsp;密碼:<font color='blue'>"+user_password+"</font><br>恭喜您成為本網站會員<br><a href='http://140.136.155.133:8080/Ai-music/myweb/'>Ai-Music無樂不作音樂網</a>";
		String mailhost = "smtp.gmail.com";
		boolean sessionDebug = false;

		try {
			Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
			Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", mailhost);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class",
			"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.quitwait", "false");
 
			Session mail_session = Session.getInstance(props,
					new javax.mail.Authenticator() 
			{
				protected PasswordAuthentication getPasswordAuthentication()
			{ return new PasswordAuthentication("musicyourlife","lovemusic");	}
			});
		
			MimeMessage message = new MimeMessage(mail_session);
			message.setFrom(new InternetAddress(From,"無樂不作音樂網")); // 設定發郵件的人
			address = InternetAddress.parse(to,false); // 設定收信人的信箱
			message.setRecipients(Message.RecipientType.TO, address);
			message.setSubject(Subject); // 設定信中的主題
			message.setContent(messageText, "text/html;charset=BIG5");
			message.setSentDate(new Date()); // 設定送信的時間
			Transport.send(message);
			
			session.setAttribute("user_id",user_id); 
			out.print("<script language='javascript'>");
			out.print("alert('註冊成功了唷!! 註冊成功通知郵件發送至您信箱了');");
			out.print("location.href='index.jsp';");
			out.print("</script>");
			
			//response.sendRedirect("");
			stmt.close();
			con.close();
		}
		catch (Exception mex){
			mex.printStackTrace();
			out.print("<script language='javascript'>alert('郵件發送失敗');");//發送失敗
			out.println("</script>");
		}
		//mail end
		
	}//else1 end
%>