<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%
		/*String web_url="http://127.0.0.1:8080"+request.getRequestURI()+"?"+request.getQueryString();//§ì¥À­¶­±ªººô§}*/
		String web_url=request.getRequestURI()+"?"+request.getQueryString();
		if(request.getQueryString()==null){
			web_url=request.getRequestURI();
		}
		
%>
