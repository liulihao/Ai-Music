<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.*" %>
<%@include file="opendata.jsp"%>

<% request.setCharacterEncoding("big5");%> 
<%
    String login_user= (String)session.getAttribute("user_id");
	String saveDirectory = request.getRealPath("/") + "myweb/user/" +login_user+ "/discuss";//�W�Ǹ��|
    int    maxPostSize = 3 * 1024 * 1024 ; //�ɮפj�p����3MB
	String title_pic = null;  //�ɮצW��
	String enCoding = "big5"; //�s�X
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//�J�쭫���ɦW �b�r���۰ʲ֥[
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, enCoding,policy);
  
    //  ���o�Ҧ��W�Ǥ��ɮ׿�J���A�W�٤αԭz
   Enumeration filesname = multi.getFileNames();
   while (filesname.hasMoreElements())
   {
       String name = (String)filesname.nextElement();
       title_pic = multi.getFilesystemName(name);   //���o�W���ɮת��W��
   }
  int subject_id=0,title_id=1,back=0;
  subject_id = Integer.parseInt(multi.getParameter("subject_id"));
  
  
  ResultSet user;

  String title_subject=multi.getParameter("title_subject");
  String title_content=multi.getParameter("title_content"); 
  
  StringBuffer buf = new StringBuffer(title_content.length()+6);
	char ch = ' ';
	for(int p = 0;p < title_content.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch = title_content.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	title_content = buf.toString();
  
   if(title_subject.length()==0||title_content.length()==0)
    {
	  //String errmsg="�Q�ץD�D�ΰQ�פ��e���i���ť�!!";
	  out.print("<script language='javascript'>alert('�Q�ץD�D�ΰQ�פ��e���i���ť�');");
	  out.print("parent.location.href='index_discuss_topic.jsp?subject_id="+subject_id+"';");
	  out.print("</script>");
	}
  else
    {
	  int year,month,day,hour,minute,second;
	  String title_time;
	  String temp_month,temp_day,temp_hour,temp_minute,temp_second;
	  GregorianCalendar calendar;
	  calendar=new GregorianCalendar();
	  year=calendar.get(Calendar.YEAR);
	  month=calendar.get(Calendar.MONTH)+1;
	  if(month < 10) 
	     temp_month = "0"+ month;  
	  else 
	     temp_month = ""+month;
	  day=calendar.get(Calendar.DAY_OF_MONTH);
	  if(day < 10) 
	     temp_day = "0"+ day;  
	  else 
	     temp_day = ""+day;
	 
	  hour=calendar.get(Calendar.HOUR_OF_DAY);
	  if(hour < 10) 
	     temp_hour = "0"+ hour;  
	  else 
	     temp_hour = ""+hour;
	  
	  minute=calendar.get(Calendar.MINUTE);
	  if(minute < 10) 
	     temp_minute = "0"+ minute;  
	  else 
	     temp_minute = ""+minute;
		 
	  second=calendar.get(Calendar.SECOND);
	  if(second < 10) 
	     temp_second = "0"+ second;  
	  else 
	     temp_second = ""+second;
	  title_time=year+"/"+temp_month+"/"+temp_day+"  "+temp_hour+":"+temp_minute+":"+temp_second;
	 	 
	  sql="select * from users where user_id='"+login_user+"'";
      rs=smt.executeQuery(sql);
	  
	  while(rs.next())
      {
	  		int id=rs.getInt("id");
			out.print("id="+id); 
		/*title_subject=convert(title_subject);
	  title_content=convert(title_content);	
      title_content=Replace(title_content);	*/
		 sql = "insert into title set id=?,title_pic=?,title_subject=?,title_content=?,title_time=?,subject_id=?";
	 PreparedStatement pstmt = con.prepareStatement(sql);
	  /*sql="insert into title set id='"+id+"',title_pic='"+title_pic+"',title_subject='"+title_subject+"',title_content='"+title_content+"',title_time='"+title_time+"',subject_id='"+subject_id+"'";
	  stmt.executeUpdate(sql);*/
	  pstmt.setInt(1,id);
	  pstmt.setString(2,title_pic);
	  pstmt.setString(3,title_subject);
	  pstmt.setString(4,title_content);
	  pstmt.setString(5,title_time);
	  pstmt.setInt(6,subject_id);
	  pstmt.executeUpdate();
	  pstmt.close();
	 }
	 out.print("<script type='text/javascript'>parent.location.href = 'index_discuss_topic.jsp?subject_id="+subject_id+"';</script>");
	 
	 }
	 
%>

<html>
<title>���~�T��</title>
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style></html>