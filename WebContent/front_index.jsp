<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<%
//验证用户登陆
Mapx<String,Object> user = G.getUser(request);
String pageType = null;
String userType = null;
int flag=0;
if(user==null || !user.getStringView("shenhe").equals("审核通过") || !user.getStringView("status").equals("有效")){
	
}else{
	flag=1;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博客首页</title>
</head>
<body>
首页<br>
已登录
<a href="front_login.jsp">返回登录页</a>
</body>
</html>