<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<link href="../CSSfile/admin_page_member-manage.css" rel="stylesheet" type="text/css" />
<%

    String member_id=request.getParameter("member_search_text");//輸入的會員帳號
	
   sql="select * from users where user_id LIKE '%"+member_id+"%' AND (user_authority = 0 OR user_authority = 1)";
   
   rs=stmt.executeQuery(sql);
   if(!rs.next()){
     out.print("<script language='javascript'>");
     out.print("window.alert('無此會員');");
	 out.print("location.href='admin_page_member_manage.jsp';");
     out.print("</script>");
   }
   else{
   %>
   <div id="mem_query">
	<div id="search_member"></div>
 <%      
    
	int RowCount=0;//ResultSet記錄筆數
		
	 sql="select COUNT(*) from users where user_id LIKE '%"+member_id+"%' AND (user_authority = 0 or user_authority = 1) order by reg_time desc";
	 rs=stmt.executeQuery(sql);//查詢SQL 該會員留言版的總筆數
	rs.next();   //紀錄剛開啟時 指針位於第一筆記錄之前
    RowCount=rs.getInt(1); //取得記錄筆數    
    rs.close();
	
	  sql="select * from users where user_id LIKE '%"+member_id+"%' AND (user_authority = 0 or user_authority = 1) order by reg_time desc";
	  rs=stmt.executeQuery(sql);//將指針定位到顯示頁數的第筆記錄上
	
	  rs.next();
   
   %>
   <!--頁次-->
   <div id="member"><!--member-->
   <div style="margin:15px 0 20px 0;" align="center">
   
    <p>共有<font color="#0066FF"><b><%=RowCount%></b></font>筆搜尋結果</p>
    <p> <b style="float:right;"><a href="admin_page_member_manage.jsp">回會員資料管理</a></b></p>
    
 </div>
 <!--End of 頁次-->
 <table width="658" border="0" >
   <tr >
     <td width="50" align="center" class="tablebtm col-width1"><div class="col-width1">#</div></td>
     <td width="147" align="center" class="tablebtm col-width2"><div class="col-width2">會員帳號</div></td>
     <td width="132" align="center" class="tablebtm">註冊時間</td>
     <td width="130" align="center" class="tablebtm">上次登入時間</td>
     <td width="129" align="center" class="tablebtm">狀態</td>
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
     <td align="center" class="tablebtm"><input type="button" value="停權" onclick="location.href='member_stop.jsp?id=<%=id%>'" class="stop-block style4"/></td>
     <%		}//if1
    	else{//else1
%>
     <td width="44" align="center" class="tablebtm"><input type="button" value="停權中" onclick="return authority_return(<%=id%>)" class="stoped-block style4"/></td>
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