<%@page import="com.mchange.v2.c3p0.impl.DbAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<% 
HashMap<String,String> param= G.getParamMap(request);
HashMap<String,Object> myparam=new HashMap<String,Object>();
List<String> errors=new ArrayList<String>();
if(param.get("opt")!=null && param.get("opt").equals("login")){
	if(param.get("str")==null || param.get("str").equals("") || param.get("password")==null || param.get("password").equals("")){//如果用户名 或密码填写的空值 则报错
		errors.add("用户名密码错误");
	}
	if(errors.size()==0){
		String password2 = DesUtils.encrypt(param.get("password")); // DesUtils加密
		//String password2 = param.get("password");
		System.out.println(password2);
		List<Mapx<String, Object>> listAll = DB.getRunner().query("select userid from user where password=? ",new MapxListHandler(), password2);
		if(listAll==null || listAll.size()==0){
			errors.add("用户名密码错误");
		}else{//登陆成功
			G.setCookie("token", G.getToken(listAll.get(0).getInt("userid"),param.get("password")), response);
			response.sendRedirect("front_index.jsp");
			return;
		}
	}
	myparam.put("errorStr", G.toErrorStr(errors));
}
%>
<!DOCTYPE HTML >
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>博客-欢迎登录</TITLE>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="都学网,在线联考学习,管理类课程,在线课堂,远程教育,在线学习,视频课程,公开课,直播课堂,免费听课,名师网络课程,名师网课,管理类联考" name="keywords">
<meta content="都学网是国内第一家针对于管理类联考的在线实用学习平台,主要为学习者提供优质的、碎片式的管理类联考相关视频课程,为报考管理类联考的考生提供最低价格、最高质量的一站式学习服务。" name="description">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/group1.0.css">
<script src="js/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
<![endif]-->
</HEAD>
<body style="min-height: 1000px">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
    <!--上部内容开始-->
				<div class="center-box center-box1">
					<div class="login-wrap">
						<div class="logobox">
						<a href="http://www.doxue.com" alt=""><img src="images/logo.png" width="110" height="41" alt=""/></a>
						</div>
						<h3 class="mt30">博客账号登录</h3>
						<div class="login-wrap">
							<form class="form" action="front_login.jsp" method="POST">
								<input type="hidden" name="referer"	value="<%=request.getHeader("referer") %>">
							    <input type="hidden" name="opt" value="login">
								<div class="form-group">
							    <label class="sr-only" for="">用户名</label>
							    <INPUT class=itxt tabIndex=1   type=text  placeholder="请输入用户名" autocomplete="off" name="str"> 
							   </div>
							   <!-- <div class="form-group">
							    <label class="sr-only" for="">手机号</label>
							    <INPUT class=itxt tabIndex=1  id="phone" type=text  placeholder="请输入手机号" autocomplete="off" name="str"> 
							   </div> -->
							   <div class="warning" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span>请输入正确的手机号</div>
								 <div class="form-group">
							    <label class="sr-only" for="">密码</label>
							    <INPUT class="itxt itxt-error" tabIndex=2 type="password" placeholder="请输入密码" autocomplete="off" name="password">
							   </div>
							   <div class="warning" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span>密码输入有误</div>
							   <input class="btn btn-success mt20"  onclick="checkPhone()" type="submit" value="立即登录">
							</form>
						   <p class="Already-user center color-999"><a href="front_reg.jsp">注册博客账号</a><span>|</span><a href="">忘记密码？</a></p>
						</div>
					</div>
				</div>
	<!--上部内容end-->
	  </div>
	</div>
	<div class="row">
		<!--底部版权信息内容开始-->
	
		<div class="copyright center">
			<p><a href="">常见问题</a></p>
			<p class="color-999">© 2016寰宇汇智(北京)文化传媒有限公司 版权所有 京ICP备15015012号-2</p>
		</div>
	
	<!--底部版权信息内容end-->
	</div>
</div>	
	<script>
	//手机号 规则匹配
function checkPhone(){ var phone = document.getElementById('phone').value; if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){ alert("手机号码有误，请重填"); return false; } }
</script>	
</body>
</html>

