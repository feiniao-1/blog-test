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
		<title>饺耳新闻详情</title>
		<link href="images/top-icon.png" type="image/x-icon" rel="shortcut icon" />
		<link href="css/m-style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="head head-rel">
				<p>饺耳新闻</p>
				<a href="" class="back02"><img src="images/back.png"></a>
			</div>
			<!--新闻详情页-->
			<div class="news-inner">
				<div class="news-inner-title">
					<h3>李克强双创周上为创业者“发红包”</h3>
					<p class="size12">来源：中国政府网<span>|</span>2016-10-13</p>
				</div>
				<div class="news-inner-warp">
					<img src="images/news02.jpg" />
					<p>【全国双创周深圳开展：总理来啦！】李克强12日下午来到深圳湾创业广场，参观2016年全国大众创业万众创新活动周相关主题展示。琳琅满目的展位展品五花八门，创意十足。展台负责人争相向总理介绍他们最新的创业创新成果。总理至少在20多个展台驻足停留。</p>
					<img src="images/new03.jpg" />
					<p>【李克强双创周上为创业者“发红包”】李克强总理12日下午在深圳参观2016年全国双创周主题展示时，来到腾讯展台前，应公司创始人马化腾邀请，点击触屏为创业者“发红包”。随后大屏幕上不断显示有人成功领取1000元。这种红包共计100万个，可用于购买商标注册、社保代缴等企业服务，助力扶持创业创新。</p>
					<div class="share">
			            <dl>
			                <dt>分享到</dt>
			                <dd>
			                	<span class="share-wx"></span>
			                    <span class="share-qzone"></span>
			                    <span class="share-wb"></span>
			                </dd>
			            </dl>
        			</div>
				</div>
			</div>
		</div>	
	</body>
</html>
