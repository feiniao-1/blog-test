<%@ page language="java" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  	<%
  		if(session.getAttribute("photoname") != null) {
  	%>
  	<img src="uploadfiles/<%= session.getAttribute("photoname") %>" />
  	<%
  			//session.removeAttribute("photoname");
  		} else {
  			out.print("session.getAttribute(\"photoname\") = null");
  		}
  	%>
  </body>
</html>
