<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
HashMap<String,String> param= G.getParamMap(request);
//获取url
String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);
String url1 = request.getRequestURI(); 

String url3=request.getRequestURI().toString(); //得到相对url 
String url2=request.getRequestURI().toString(); //得到绝对URL
//验证用户登陆
String username = (String)session.getAttribute("username");
int flag=0;
if(username==null){
	
}else{
	flag=1;
}
int cailei;
if(request.getParameter("cailei")==null){
	cailei=1;
}else{
	cailei=Integer.parseInt(request.getParameter("cailei"));
}
System.out.println("cailei"+cailei);
//获取页数信息
String index_page;
if(request.getParameter("page")==null){
	index_page=String.valueOf(0);
}else{
	index_page=request.getParameter("page");
}
int page_ye=Integer.parseInt(index_page)*5;
//搜索属性
String searchtj;

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="饺耳世家">
		<meta name="keywords" content="饺耳世家、美食">
		<title>登陆饺耳</title>
		<link href="images/top-icon.png" type="image/x-icon" rel="shortcut icon" />
		<link href="css/weui.css" rel="stylesheet">
		<link href="css/m-style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
		<style>
			html,body{ height: 100%!important;}
			.container{ width: 100%; height: 100%;}
		</style>
	</head>
	<body style="width: 100%;">
		<div class="container">
			<div class="wrapbox">
				<div class="back"><img src="images/back.png"></div>
				<div class="logo"><img src="images/M-logo.png"></div>
				<form class="form-group">
					<div class="cell">
						<div class="icon"><img src="images/user.png"></div>
						<div class="cell_primary">
							<input class="weui_input" placeholder="请输入用户名/手机号" value="" type="tel" autocomplete="off" name="log_name"  maxlength="11">
						</div>
					</div>
					<div class="cell">
						<div class="icon"><img src="images/password.png"></div>
						<div class="cell_primary">
							<input class="weui_input" placeholder="请输入6-8位密码" value="" type="password" autocomplete="off" name="password" maxlength="8">
						</div>
					</div>
					<div class="cell" style="border: 0;">
						<div class="cell_primary" style="text-align: left;"><a href="" class="color-fff">新用户注册</a></div>
						<div class="cell_primary" style="text-align: right;"><a href="" class="color-fff">忘记密码?</a></div>
					</div>
					<input class="input-btn" type="button" value="登录" />
				</form>
				<div class="User-notes">理解并同意饺耳的<a href="" style="text-decoration: underline; color: #e2e2e2;">用户协议</a></div>
			</div>
		</div>
	</body>
</html>
