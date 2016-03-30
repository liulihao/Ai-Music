<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="opendata.jsp"%>
<%@page contentType="text/html;charset=Big5"%>
<%
String id=request.getParameter("id");
sql="select * from users where id='"+id+"'";
rs=stmt.executeQuery(sql);
int i= 1;
while(rs.next()){
  int authority=rs.getInt("user_authority");
  if(authority==0){
    
    sql = "UPDATE users SET user_authority=? where id=?"; 
    PreparedStatement prest = con.prepareStatement(sql);
   
    prest.setInt(1,i);
    prest.setString(2,id);
    prest.executeUpdate();
  }else{
    sql = "UPDATE users SET user_authority=? where id=?"; 
    PreparedStatement prest = con.prepareStatement(sql);
    i=0;
    prest.setInt(1,i);
    prest.setString(2,id);
    prest.executeUpdate();
  }
  }
  stmt.close();
  rs.close();
  con.close();
  response.sendRedirect("admin_page_member_manage.jsp");  

%>

