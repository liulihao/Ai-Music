<%@ page contentType="text/html; charset=big5" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>

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


<%
	InternetAddress[] address = null;
	request.setCharacterEncoding("big5");
	String mailserver = "smtp.gmail.com"; //��Jmail server
	String From = "musicyourlife@gmail.com";
	String account = request.getParameter("account");
	String mail_account = request.getParameter("mail_account");
	String Subject = "�z���K�X�^��";
	//String type = request.getParameter("Type");
	//String messageText = request.getParameter("Message");
	String mailhost = "smtp.gmail.com";
	boolean sessionDebug = false;
	
	Statement forget_pw_stmt = con.createStatement();
	String forget_pw_sql = "SELECT * FROM users WHERE user_id = '"+account+"'";
	ResultSet forget_pw_data = forget_pw_stmt.executeQuery(forget_pw_sql);
	
		if(!forget_pw_data.next()){
			out.print("<script language='javascript'>alert('�L���b��');");//�o�e����
			out.print("parent.location.href='index.jsp';</script>");
		}else if(!forget_pw_data.getString("user_email").equals(mail_account)){
			out.print("<script language='javascript'>alert('�q�l�H�c���~');");//�o�e����
			out.print("parent.location.href='index.jsp';</script>");
		
		}else{//else
			String password = forget_pw_data.getString("user_password");
			String content = " �z���b���G "+account+"\n �z���K�X�G"+password+" "; //���Υ[ ' 
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
				{
					return new PasswordAuthentication("musicyourlife","lovemusic");
				}
			});

			//Multipart mPart = new MimeMultipart();
			//BodyPart messageBodyPart = new MimeBodyPart();
			//messageBodyPart.setContent(messageText, "text/plain");
			//mPart.addBodyPart(messageBodyPart);
			MimeMessage message = new MimeMessage(mail_session);
			message.setFrom(new InternetAddress(From,"�L�֤��@���ֺ�")); // �]�w�o�l�󪺤H
			address = InternetAddress.parse(mail_account,false); // �]�w���H�H���H�c
			message.setRecipients(Message.RecipientType.TO, address);
			message.setSubject(Subject); // �]�w�H�����D�D
			message.setContent(content, "text/plain;charset=BIG5");
			message.setSentDate(new Date()); // �]�w�e�H���ɶ�
			Transport.send(message);
		
			out.print("<script language='javascript'>alert('�K�X�w�H�e�ܱz���q�l�H�c!!');");
			out.print("parent.location.href='index.jsp';</script>");
			}
			catch (Exception mex){
				mex.printStackTrace();
				out.print("<script language='javascript'>alert('�l��o�e����');");//�o�e����
				out.print("parent.location.href='index.jsp';</script>");
			}
		}//else end
	
%>

