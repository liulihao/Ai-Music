<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%
    String login_user= (String)session.getAttribute("user_id");
	String saveDirectory = request.getRealPath("/") + "myweb/user/" +login_user+ "/discuss/";//�W�Ǹ��|
    int    maxPostSize = 3 * 1024 * 1024 ; //�ɮפj�p����3MB
	String reply_pic = null;  //�ɮצW��
	String enCoding = "big5"; //�s�X
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//�J�쭫���ɦW �b�r���۰ʲ֥[
    MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, enCoding,policy);
  
    //  ���o�Ҧ��W�Ǥ��ɮ׿�J���A�W�٤αԭz
   Enumeration filesname = multi.getFileNames();
   while (filesname.hasMoreElements())
   {
       String name = (String)filesname.nextElement();
       reply_pic = multi.getFilesystemName(name);   //���o�W���ɮת��W��
   }
  int title_id=0,reply_id=1;
  title_id = Integer.parseInt(multi.getParameter("title_id"));
  
  ResultSet user;
   String reply_content=multi.getParameter("reply_content");
 

   StringBuffer buf = new StringBuffer(reply_content.length()+6);
	char ch = ' ';
	for(int p = 0;p < reply_content.length();p++)//�Y�J�촫��N�ର<br>
	{
		ch = reply_content.charAt(p);
		if(ch == '\n')
			buf.append("<br>");
		else
			buf.append(ch);
	}
 	reply_content = buf.toString();
   
  if(reply_content.length()==0)
    {
	  out.print("<script language='javascript'>alert('�^�Ф��e���i���ť�!!');");
	  out.print("parent.location.href='index_discuss_topic_content.jsp?title_id="+title_id+"';");
	  out.print("</script>");
	}
  else
    {
	  int year,month,day,hour,minute,second;
	  String reply_time;
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
	  reply_time=year+"/"+temp_month+"/"+temp_day+"  "+temp_hour+":"+temp_minute+":"+temp_second;
	 
	 
	 sql="select * from users where  user_id='"+login_user+"'";
     rs=smt.executeQuery(sql);
	  
	  while(rs.next())
      {
	       int id=rs.getInt("id");
		   out.print("id="+id);
	 
	  /*reply_content=convert(reply_content);	
      reply_content=Replace(reply_content);	*/
	 sql = "insert into reply set id=?,reply_pic=?,reply_content=?,reply_time=?,title_id=?";
	 PreparedStatement pstmt = con.prepareStatement(sql);
	 pstmt.setInt(1,id);
	  pstmt.setString(2,reply_pic);
	  pstmt.setString(3,reply_content);
	  pstmt.setString(4,reply_time);
	  pstmt.setInt(5,title_id);
	  pstmt.executeUpdate();
	  /*sql="insert into reply set id='"+id+"',reply_pic='"+reply_pic+"',reply_content='"+reply_content+"',reply_time='"+reply_time+"',title_id='"+title_id+"'";
      
	  stmt.executeUpdate(sql);*/
	  //response.sendRedirect("index_discuss_topic_content.jsp?title_id="+title_id);
	 }

	 }
	out.print("<script type='text/javascript'>parent.location.href = 'index_discuss_topic_content.jsp?title_id="+title_id+"';</script>");
%>


<title>���~�T��</title>
</html>