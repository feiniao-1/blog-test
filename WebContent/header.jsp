<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<%

//导航信息
List<Mapx<String, Object>> top_daohang= DB.getRunner().query("SELECT * FROM daohang_type where parentid=0", new MapxListHandler());

%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<!--顶部开始-->
        <div class="header">
        	<div class="container">
        		<div class="row">
	        		<div class="top clearfix">
	        				<div class="dropdown fr">
							  <a class="dropdown-toggle" href="" id="dropdownMenu1" data-toggle="dropdown">
							            更多语言
							    <span class="caret"></span>
							  </a>
							  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">语言1</a></li>
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">语言2</a></li>
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">语言3</a></li>
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">语言4</a></li>
							  </ul>
							</div>
	        				<p class="fr">选择语言：<a href="" target="_blank">简体中文</a><span>|</span><a href="" target="_blank">繁体中文</a><span>|</span><a href="" target="_blank">English</a><span>|</span></p>
	        		</div>
        		</div>
        		<div class="row">
	        		<div class="head clearfix">
	        			<div class="logo fl"><a href="front_index.jsp"><img src="img/logo_03.jpg"></a></div>
	        			<div class="tell fl">
	        				<p>24小时服务热线：<span>400-8000-888</span></p>
	        			</div>
	        			<div class="search fr">
	        				<div class="resiter fr">
								<%if(flag==1){ %>
								<span class="glyphicon glyphicon-user"></span><a><%=username %></a>/<a href="front_login.jsp" >退出</a>
								<%}else{ %>
								<span class="glyphicon glyphicon-user"></span><a href="front_login.jsp" target="_blank">登陆</a>/<a href="front_reg.jsp" target="_blank">注册</a>
							<%} %>
							</div>
	        				<div class="input-group fr">
							 <form action="front_index.jsp" method="post">
							  <input type="text" class="form-control" name="search">
							  <input class="input-group-addon cursor" type="submit" name="search_submit" value="搜索" >
							</form>
							</div>
	        			</div>
	        		</div>
        		</div>
        	</div>
        </div>	
        <!--顶部结束-->
        <!--导航部分开始-->
        <div class="navbar">
        	<div class="container">
        		<div class="row">
			    	<ul id="nav2" class="nav2 clearfix">
						<li class="nLi">
							<h3><a href="front_index.jsp" target="_blank">首页</a></h3>
						</li>
						<% 	for(int i=0;i<top_daohang.size();i++){%>
						<li class="nLi">
						<!-- 假设当前频道为“预告片”，手动或后台程序添加titOnClassName类名（默认是'on'），相当于设置参数defaultIndex:1。若同时设置参数returnDefault:true，则鼠标移走后0.3秒返回当前频道 -->
								<h3><a href="" target="_blank"><%=top_daohang.get(i).getStringView("name") %></a></h3>
								<ul class="sub">
								<%//top二级导航
								List<Mapx<String, Object>> top_er= DB.getRunner().query("SELECT * FROM daohang_type where parentid=?", new MapxListHandler(),top_daohang.get(i).getStringView("id"));
								for(int j=0;j<top_er.size();j++){
								%>
									<li><a href="#"><%=top_er.get(j).getStringView("name") %></a></li>
								<%}%>
								</ul>
						</li>
						<%}%>
						<li class="nLi on">
								<h3><a href="" target="_blank">饺耳博客</a></h3>
						</li>
					</ul>


        		</div>
		    </div>
		</div>
        <!--导航部分结束-->
</body>
</html>