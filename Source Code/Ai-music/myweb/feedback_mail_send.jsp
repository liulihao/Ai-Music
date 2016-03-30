<%@ page import="java.security.Security" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html;charset=big5" %>

<html>
<head>
<title>郵件發送成功</title>
</head>
<body>


<%
	InternetAddress[] address = null;
	request.setCharacterEncoding("big5");
	String mailserver = "smtp.gmail.com";//請填入您的mail server, 通常是自己的網址
	//String From = request.getParameter("From");
	String to = request.getParameter("To");
	String Subject = request.getParameter("Subject");
	String type = request.getParameter("Type");
	String messageText = request.getParameter("Content");
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
		//Multipart mPart = new MimeMultipart();
		//BodyPart messageBodyPart = new MimeBodyPart();
		//messageBodyPart.setContent(messageText, "text/plain");
		//mPart.addBodyPart(messageBodyPart);
		MimeMessage message = new MimeMessage(mail_session);
		//message.setFrom(new InternetAddress(From)); // 設定發郵件的人
		address = InternetAddress.parse(to,false); // 設定收信人的信箱
		message.setRecipients(Message.RecipientType.TO, address);
		message.setSubject(Subject); // 設定信中的主題
		message.setContent(messageText, "text/html;charset=BIG5");
		message.setSentDate(new Date()); // 設定送信的時間
		Transport.send(message);
		
		out.print("<script language='javascript'>alert('郵件已順利發送');");//發送成功
		out.print("window.close();");//關閉子視窗
		out.println("</script>");
}
catch (Exception mex){
		mex.printStackTrace();
		out.print("<script language='javascript'>alert('郵件發送失敗');");//發送失敗
		out.print("window.close();");//關閉子視窗
		out.println("</script>");
}
%>
</body>
</html>
