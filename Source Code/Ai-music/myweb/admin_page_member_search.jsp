<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<link href="../CSSfile/admin_page_member-manage.css" rel="stylesheet" type="text/css" />
<%

    String member_id=request.getParameter("member_search_text");//��J���|���b��
	
   sql="select * from users where user_id LIKE '%"+member_id+"%' AND (user_authority = 0 OR user_authority = 1)";
   
   rs=stmt.executeQuery(sql);
   if(!rs.next()){
     out.print("<script language='javascript'>");
     out.print("window.alert('�L���|��');");
	 out.print("location.href='admin_page_member_manage.jsp';");
     out.print("</script>");
   }
   else{
   %>
   <div id="mem_query">
	<div id="search_member"></div>
 <%      
    
	int RowCount=0;//ResultSet�O������
		
	 sql="select COUNT(*) from users where user_id LIKE '%"+member_id+"%' AND (user_authority = 0 or user_authority = 1) order by reg_time desc";
	 rs=stmt.executeQuery(sql);//�d��SQL �ӷ|���d�������`����
	rs.next();   //������}�Ү� ���w���Ĥ@���O�����e
    RowCount=rs.getInt(1); //���o�O������    
    rs.close();
	
	  sql="select * from users where user_id LIKE '%"+member_id+"%' AND (user_authority = 0 or user_authority = 1) order by reg_time desc";
	  rs=stmt.executeQuery(sql);//�N���w�w�����ܭ��ƪ��ĵ��O���W
	
	  rs.next();
   
   %>
   <!--����-->
   <div id="member"><!--member-->
   <div style="margin:15px 0 20px 0;" align="center">
   
    <p>�@��<font color="#0066FF"><b><%=RowCount%></b></font>���j�M���G</p>
    <p> <b style="float:right;"><a href="admin_page_member_manage.jsp">�^�|����ƺ޲z</a></b></p>
    
 </div>
 <!--End of ����-->
 <table width="658" border="0" >
   <tr >
     <td width="50" align="center" class="tablebtm col-width1"><div class="col-width1">#</div></td>
     <td width="147" align="center" class="tablebtm col-width2"><div class="col-width2">�|���b��</div></td>
     <td width="132" align="center" class="tablebtm">���U�ɶ�</td>
     <td width="130" align="center" class="tablebtm">�W���n�J�ɶ�</td>
     <td width="129" align="center" class="tablebtm">���A</td>
   </tr>
   <%
   rs.previous();
	int num=0;
	while(rs.next()){
	
	 num++;
	  String user_id=rs.getString("user_id");
	
	  int user_authority=rs.getInt("user_authority");
	  int id=rs.getInt("Id");
	  
%>
   <tr>
     <td align="center" class="tablebtm"><div class="col-width1"><%=num%></div></td>
     <td align="center" class="tablebtm"><div class="col-width2"><%=user_id%></div></td>
     <td align="center" class="tablebtm"><%=rs.getDate("reg_time")%> <%=rs.getTime("reg_time")%></td>
     <td align="center" class="tablebtm"><span class="gensmall"><%=rs.getDate("login_time")%> <%=rs.getTime("login_time")%></span></td>
     <%		if(user_authority==0){//if1%>
     <td align="center" class="tablebtm"><input type="button" value="���v" onclick="location.href='member_stop.jsp?id=<%=id%>'" class="stop-block style4"/></td>
     <%		}//if1
    	else{//else1
%>
     <td width="44" align="center" class="tablebtm"><input type="button" value="���v��" onclick="return authority_return(<%=id%>)" class="stoped-block style4"/></td>
     <%	
	}//else1
%>
   </tr>
   <%
     }%>
 </table>
<%

	 rs.close();
	 stmt.close();
	 }//else
	 
	 con.close();
 %>
 </div><!--member end-->
</div>