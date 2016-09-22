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
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <meta name="description" content="">
		  <meta name="keywords" content="饺耳、美食">
		<title>百科问答</title>
		<!--<link href="css/bootstrap.css" rel="stylesheet">-->
		<link href="css/_main.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="layer/layer.js"></script>
		<!--[if it iE8]>
			<p class="tixin">为了达到最佳观看效果，请升级到最新浏览器</p>
        -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    	
	</head>
	<body>
		<!--视频弹出层开始-->
		<div class="video-box" style="display: none;">
			<video id="vPlayer" controls="controls"  width="100%" heigh="517" poster="img/video-bg.jpg" src="video/example.mp4"></video>
		</div>
		<!--视频弹出层结束-->
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
	        			<div class="logo fl"><a href="index.html"><img src="img/logo_03.jpg"></a></div>
	        			<div class="tell fl">
	        				<p>24小时服务热线：<span>400-8000-888</span></p>
	        			</div>
	        			<div class="search fr">
	        				<div class="resiter fr">
								<%if(flag==1){ %>
								<span class="glyphicon glyphicon-user"></span><a></a>
								<%}else{ %>
								<span class="glyphicon glyphicon-user"></span><a href="front_login.jsp" target="_blank">登陆</a>/<a href="front_reg.jsp" target="_blank">注册</a>
							<%} %>
							</div>
	        				<div class="input-group fr">
							 <form action="front_index.jsp" method="post">
							  <input type="text" class="form-control" name="search">
							  <input class="input-group-addon cursor" type="submit" name="搜索" value="搜索" >
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
							<h3><a href="" target="_blank">首页</a></h3>
						</li>
						<li class="nLi">
								<h3><a href="" target="_blank">新闻</a></h3>
								<ul class="sub">
									<li><a href="#">新闻首页</a></li>
									<li><a href="#">新闻人物</a></li>
									<li><a href="#">新闻电视</a></li>
									<li><a href="#">新闻图片</a></li>
									<li><a href="#">新闻视频</a></li>
									<li><a href="# ">新闻专题</a></li>
								</ul>
						</li>
						<li class="nLi">
						<!-- 假设当前频道为“预告片”，手动或后台程序添加titOnClassName类名（默认是'on'），相当于设置参数defaultIndex:1。若同时设置参数returnDefault:true，则鼠标移走后0.3秒返回当前频道 -->
								<h3><a href="" target="_blank">link</a></h3>
								<ul class="sub">
									<li><a href="#">新闻首页</a></li>
									<li><a href="#">新闻人物</a></li>
									<li><a href="#">新闻电视</a></li>
									<li><a href="#">新闻图片</a></li>
									<li><a href="#">新闻视频</a></li>
									<li><a href="# ">新闻专题</a></li>
								</ul>
						</li>
						<li class="nLi ">
								<h3><a href="" target="_blank">link</a></h3>
								<ul class="sub">
									<li><a href="#">新闻首页</a></li>
									<li><a href="#">新闻人物</a></li>
									<li><a href="#">新闻电视</a></li>
									<li><a href="#">新闻图片</a></li>
									<li><a href="#">新闻视频</a></li>
									<li><a href="# ">新闻专题</a></li>
								</ul>
						</li>
						<li class="nLi on">
								<h3><a href="" target="_blank">百科问答</a></h3>
								<!--<ul class="sub">
									<li><a href="#">新闻首页</a></li>
									<li><a href="#">新闻人物</a></li>
									<li><a href="#">新闻电视</a></li>
									<li><a href="#">新闻图片</a></li>
									<li><a href="#">新闻视频</a></li>
									<li><a href="# ">新闻专题</a></li>
								</ul>-->
						</li>
						<li class="nLi">
								<h3><a href="" target="_blank">饺耳博客</a></h3>
						</li>
					</ul>


        		</div>
		    </div>
		</div>
        <!--导航部分结束-->
        <!--banner图部分开始-->
        <div class="banner-inner"></div>
        <!--banner图部分结束-->
        <!--博客主体内容开始-->
        <div class="mainbox">
         <div class="container">
         <div class="row">
         		<ol class="breadcrumb" style="margin-bottom: 0;">
				  <li><a href="#">饺耳</a></li>
				  <li class="active">百科问答</li>
				</ol>
         	</div>
         	<div class="row">
         		<!--左边部分开始-->
	         		<div class="col-md-3">
	         			<div class="baike-navbar">
	         				<!--百科导航部分开始-->
	         				<h4><span class="glyphicon glyphicon-book"></span>百科问答</h4>
	         				<ul>
	         					<li><a href="" class="active">家常菜做法大全</a></li>
	         					<li><a href="">青菜做法大全</a></li>
	         					<li><a href="">水果做法大全</a></li>
	         					<li><a href="">煲汤做法大全</a></li>
	         				</ul>
	         				<h4 class="icon-hotword">热门搜索</h4>
	         				<ul class="hotword">
	         					<li class="just-line1"><a href="" target="_blank">饺耳店长推荐金牌水饺/西红柿鸡蛋水饺/三鲜饺子/素饺子</a></li>
	         					<li class="just-line1"><a href="" target="_blank">饺耳店长推荐金牌水饺</a></li>
	         					<li class="just-line1"><a href="" target="_blank">饺耳店长推荐金牌水饺</a></li>
	         					<li class="just-line1"><a href="" target="_blank">饺耳店长推荐金牌水饺</a></li>
	         					<li class="just-line1"><a href="" target="_blank">饺耳店长推荐金牌水饺</a></li>
	         					<li class="just-line1"><a href="" target="_blank">饺耳店长推荐金牌水饺</a></li>
	         				</ul>
	         				<h4 class="icon-recommend">饺耳推荐</h4>
	         				<div class="celan5">
	         					<ul class="clearfix">
		         					<li>
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li class="mr0">
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li>
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li class="mr0">
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li>
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li class="mr0">
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li>
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					<li class="mr0">
		         						<a href="" target="_blank">
			         						<img src="img/cai05_03.jpg">
			         						<p>西红柿鸡蛋水饺</p>
		         						</a>
		         					</li>
		         					
		         				</ul>
		         				</div>
	         				<!--百科导航部分结束-->
	         		    </div>
         		    </div>
         		<!--右边部分开始-->
	         		<div class="col-md-9">
	         			<div class="main-right">
		         			<div class="cell-list">
								<div class="cell">
									<div class="pic">
										<img src="img/cai01_03.jpg">
										<span class="pic-tilte">资讯</span>
									</div>
									<div class="cell_primary">
										<a href="" target="_blank"><h3 class="color-dd2727 mb15">金牌水饺-做法大全 | 做法详解 9.12</h3></a>	
										<p class="mb20">
												<a href="" class="line3 color-666666">全球移动营销第一平台Morketing全球移动营销第一平台Morketing,全球
												移动营销第一平台Morketing,全球移动营销第一平台Morketing,,每周一至移动营销第一平台Morketing,全球移动营销第一平台Morketing,,每周一至
												周五晨间时分为您提供移动互联网观察早欢迎您的关注...</a>
										</p>
										
										<p class="color-666666">来自：恶魔圣典<span>|</span>2016-9-10<span class="glyphicon glyphicon-eye-open color-ff6600"></span>1377</p>
										<div class="bdsharebuttonbox bd-share">
											<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
										</div>
									</div>
								</div>
								<div class="cell">
									<div class="pic">
										<img src="img/cai01_03.jpg">
										<span class="pic-tilte">新闻</span>
									</div>
									<div class="cell_primary">
										<a href="" target="_blank"><h3 class="color-dd2727 mb15">Morketing移动互联网观察  | 每日早报9.12</h3></a>	
										<p class="mb20">
												<a href="" class="line3 color-666666">全球移动营销第一平台Morketing全球移动营销第一平台Morketing,全球
												移动营销第一平台Morketing,全球移动营销第一平台Morketing,,每周一至
												周五晨间时分为您提供移动互联网观察早欢迎您的关注...</a>
										</p>
										
										<p class="color-666666">来自：恶魔圣典<span>|</span>2016-9-10<span class="glyphicon glyphicon-eye-open color-ff6600"></span>1377</p>
										<div class="bdsharebuttonbox bd-share">
											<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
										</div>
									</div>
								</div>
								<div class="cell">
									<div class="pic">
										<img src="img/cai01_03.jpg">
										<span class="pic-tilte">资讯</span>
									</div>
									<div class="cell_primary">
										<a href="" target="_blank"><h3 class="color-dd2727 mb15">Morketing移动互联网观察  | 每日早报9.12</h3></a>	
										<p class="mb20">
												<a href="" class="line3 color-666666">全球移动营销第一平台Morketing全球移动营销第一平台Morketing,全球
												移动营销第一平台Morketing,全球移动营销第一平台Morketing,,每周一至
												周五晨间时分为您提供移动互联网观察早欢迎您的关注...</a>
										</p>
										
										<p class="color-666666">来自：恶魔圣典<span>|</span>2016-9-10<span class="glyphicon glyphicon-eye-open color-ff6600"></span>1377</p>
										<div class="bdsharebuttonbox bd-share">
											<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
										</div>
									</div>
								</div>
								<div class="cell">
									<div class="pic">
										<img src="img/cai01_03.jpg">
										<span class="pic-tilte">资讯</span>
									</div>
									<div class="cell_primary">
										<a href="" target="_blank"><h3 class="color-dd2727 mb15">Morketing移动互联网观察  | 每日早报9.12</h3></a>	
										<p class="mb20">
												<a href="" class="line3 color-666666">全球移动营销第一平台Morketing全球移动营销第一平台Morketing,全球
												移动营销第一平台Morketing,全球移动营销第一平台Morketing,,每周一至
												周五晨间时分为您提供移动互联网观察早欢迎您的关注...</a>
										</p>
										
										<p class="color-666666">来自：恶魔圣典<span>|</span>2016-9-10<span class="glyphicon glyphicon-eye-open color-ff6600"></span>1377</p>
										<div class="bdsharebuttonbox bd-share">
											<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
										</div>
									</div>
								</div>
								<div class="cell">
									<div class="pic">
										<img src="img/cai01_03.jpg">
										<span class="pic-tilte">资讯</span>
									</div>
									<div class="cell_primary">
										<a href="" target="_blank"><h3 class="color-dd2727 mb15">Morketing移动互联网观察  | 每日早报9.12</h3></a>	
										<p class="mb20">
												<a href="" class="line3 color-666666">全球移动营销第一平台Morketing全球移动营销第一平台Morketing,全球
												移动营销第一平台Morketing,全球移动营销第一平台Morketing,,每周一至
												周五晨间时分为您提供移动互联网观察早欢迎您的关注...</a>
										</p>
										
										<p class="color-666666">来自：恶魔圣典<span>|</span>2016-9-10<span class="glyphicon glyphicon-eye-open color-ff6600"></span>1377</p>
										<div class="bdsharebuttonbox bd-share">
											<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
										</div>
									</div>
								</div>
								<!--分页内容标签开始-->
								<div class="nav-page">
								  <ul class="pagination">
								    <li><a href="#">&laquo;</a></li>
								    <li><a href="#">1</a></li>
								    <li><a href="#">2</a></li>
								    <li><a href="#">3</a></li>
								    <li><a href="#">...</a></li>
								    <li><a href="#">9</a></li>
								    <li><a href="#">10</a></li>
								    <li><a href="#">&raquo;</a></li>
								  </ul>
								</div>
							</div>
	         			</div>
         		</div>
         		<!--右边部分结束-->
         	</div>
         	
         </div>  
       </div>  
        <!--博客主体内容结束-->
        <!--页面底部板块开始-->
        <div class="footer">
        	<div class="container">
        		<div class="row">
        			<div class="cell">
        				<div class="logo"><a href="" target="_blank"><img src="img/logo02_03.png"></a></div>
        				<div class="cell_primary">
        					<p class="foot-link">
        						<a href="" target="_blank">首页</a><span>|</span>
        						<a href="" target="_blank">关于我们</a><span>|</span>
        						<a href="" target="_blank">最新资讯</a><span>|</span>
        						<a href="" target="_blank">百科问题</a>
        					</p>
        					<p>© Copyright © 2008-2016.Designed By David 京ICP备15008545号</p>
        					<p><a href="" target="_blank">技术支持：寰宇汇智文化传播有限公司</a></p>
        					<p class="icon-link">
        						<a href="" target="_blank"><img src="img/wb-icon_03.png"></a>
        						<a href="" target="_blank"><img src="img/kj-icon_03.png"></a>
        						<a href="" target="_blank"><img src="img/rr-icon_03.png"></a>
        						<a href="" target="_blank"><img src="img/wx-icon_03.png"></a>
        					</p>
        				</div>
        				<div class="ewm-box">
        					<img src="img/ewm02_03.jpg">
        					<p><a href="" target="_blank">RSS</a><a href="" target="_blank">XML</a><a href="" target="_blank">Newslater</a></p>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <!--页面底部板块结束-->
        <!--返回顶部-->
		<div id="topcontrol" style="position: fixed; bottom: 80px; right: 60px;cursor: pointer; z-index: 9; display: none;" title="返回顶部">
			<img style="width:50px; height:50px;" src="img/gotop.jpg">
		</div>
		<!--返回顶部结束-->
	</body>
	<!--主内容区左边标题导航tab切换js-->
	<!--<script>
	$(function(){
	var $div_li=$('.title-nav .title-nav-item');
	$div_li.click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		var index =$div_li.index(this);
		$('.course-slide >div').eq(index).show().siblings().hide();
		});	
	});
	</script>-->
	<!--导航下拉菜单js部分-->
	<script src="js/jquery.SuperSlide.2.1.1.js"></script>
	<script id="jsID" type="text/javascript">
			
			jQuery("#nav2").slide({ 
				type:"menu",// 效果类型，针对菜单/导航而引入的参数（默认slide）
				titCell:".nLi", //鼠标触发对象
				targetCell:".sub", //titCell里面包含的要显示/消失的对象
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:0, //鼠标延迟触发时间（默认150）
				returnDefault:true //鼠标移走后返回默认状态，例如默认频道是“预告片”，鼠标移走后会返回“预告片”（默认false）
			});
	</script>
	<!--视频弹出层js开始-->
	<script>
		$(function(){
			$(".play-video").click(function(){
			layer.open({
				  type: 1, 
				  title: false,//不要标题
				  area: ['930px', '537px'],//区域宽和高
				  shadeClose:1,//点击遮罩层关闭弹窗
				  content: $(".video-box") //这里显示内容
			});
		})	
		})
	</script>
	<!--返回顶部js部分-->
	<script>
		$(function(e) {
            var T=0;
		    $(window).scroll(function(event) {
		        T=$(window).scrollTop();
		
		        if(T>500)
		        {
		            $("#topcontrol").fadeIn();
		        }
		        else
		        {
		            $("#topcontrol").fadeOut();
		        }
		
		    });
		    $("#topcontrol").click(function(event) {
		        $("body,html").stop().animate({"scrollTop":0},1000);//一秒钟时间回到顶部
		    });
      })
	</script>
<!--百度分享js-->
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"18"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</html>
