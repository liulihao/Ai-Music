<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.Date"%>
<%@include file="opendata.jsp"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>
    <link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css">
	<link rel="stylesheet" href="css/ajax-tooltip-demo.css" media="screen" type="text/css">
<title>�L���D���</title>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
</head>

<body>
<% request.setCharacterEncoding("big5");%> 
<%
    rs = stmt.executeQuery("SELECT * FROM feedback");

   int pageno=0;
   
  while(rs.next()){
  int no=rs.getRow();
   String id=rs.getString("Id");
  %>
<CENTER>
<form name="feedback" action="" method="post">
<table width="" >


  <tr>
    <td bgcolor="#0099FF"><div align="right"><span class="style1">�g��:</span></div></td>
    <td name="id">��<%=no%>�g</td>
    
  </tr>
  <tr>
    <td bgcolor="#0099FF"><div align="right"><span class="style1">���|���D:</span></div></td>
    <td ><%=rs.getString("f_title")%> </td>
    
  </tr>
  <tr>
    <td bgcolor="#0099FF"><div align="right"><span class="style1">�|��:</span></div></td>
    <td ><%=rs.getString("user_id")%></td>
  </tr>
  <tr>
    <td  bgcolor="#0099FF"><div align="right"><span class="style1">�ɶ�:</span></div></td>
    <td ><%=rs.getString("f_time")%></td>
   
  </tr>
  <tr>
    <td height="97" bgcolor="#0099FF"><span class="style1">���|���e:</span></td>
    <td ><%=rs.getString("f_text")%></td>
   
  </tr>
  <tr>
  <td colspan="2" align="center"><input name="reply" type="submit" value="�^��"  onclick="ajax_showTooltip(window.event,'<%="reply.jsp?Id="+id%>',this);return false"></td>
  </tr><hr width="120" color="#3399FF">
  </table>
<% if(rs.getString("reply_text")!=null){%>
  
  <table width="" >
  <tr>
  <td>&nbsp;</td>
  </tr>

  <tr>
    <td bgcolor="#0099FF"><div align="right"><span class="style1">�^�Юɶ�:</span></div></td>
    <td name="id"><%=rs.getString("reply_time")%></td>
    
  </tr>
  <tr>
    <td bgcolor="#0099FF"><div align="right"><span class="style1">�^�Ф��e:</span></div></td>
    <td ><%=rs.getString("reply_text")%> </td>
    
  </tr>
 
<hr width="80">
  </table>
  <%}%>

<%
 }
  rs.close();
stmt.close();

con.close();
%>

</form>
</body>

</html>
