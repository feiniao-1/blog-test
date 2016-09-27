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

/*统计 新闻数及 页数*/
String sqlPreCount = "select count(1) as count from news where newstype=? and (del is NULL or del <>1)  order BY newsid DESC ";
List<Mapx<String,Object>> sqlPreCount1 =  DB.getRunner().query(sqlPreCount, new MapxListHandler(),"boke");
//总商品数量
int total = sqlPreCount1.get(0).getInt("count");
//商品页数
int count_page=total/5;
System.out.println("count_page"+count_page);

int plus;
int minus;
//下一页
if(Integer.parseInt(index_page)==count_page){
	plus=count_page;
}else{
	plus =Integer.parseInt(index_page)+1;
}
//上一页
if(Integer.parseInt(index_page)==1){
	minus =1;	
}else{
	minus =Integer.parseInt(index_page)-1;
}
//用户信息
//List<Mapx<String, Object>> user = DB.getRunner().query("select userid from user where username=? ",new MapxListHandler(), username);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <meta name="description" content="">
		  <meta name="keywords" content="饺耳、美食">
		<title>饺耳首页</title>
		<!--<link href="css/bootstrap.css" rel="stylesheet">-->
		<link href="img/tx.png" type="image/x-icon" rel="shortcut icon" />	
		<link href="css/_main.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/jquery.SuperSlide.2.1.1.js"></script>
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
		<%@ include file="boke_header.jsp"%>
		        <!--banner图部分开始-->
        <div id="homepage-feature" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#homepage-feature" data-slide-to="0" class="active"> </li>
							<li data-target="#homepage-feature" data-slide-to="1"> </li>
							<li data-target="#homepage-feature" data-slide-to="2"> </li>
							<li data-target="#homepage-feature" data-slide-to="3"> </li>
						</ol>
						<!--图片板块-->
						<div class="carousel-inner">
							<div class="item active">
								<img src="img/banner01.jpg" alt="图片1"/>
							</div>
							<div class="item">
								<img src="img/banner02.jpg" alt="图片2"/>
							</div>
							<div class="item">
								<img src="img/banner03.jpg" alt="图片3"/>
							</div>
							<div class="item">
								<img src="img/banner04.jpg" alt="图片4"/>
							</div>
						</div>
						<!--左右控制按钮 -->
						<a class="left carousel-control" href="#homepage-feature" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#homepage-feature" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
		</div>
        <!--banner图部分结束-->
        <!--博客主体内容开始-->
        <div class="mainbox" style="background: #F7F7F7;">
         <div class="container">
         	<div class="row">
         	<!--产品展示开始-->
         		<div class="product-scroll bg_color-fff">
         			<div class="title">
         				<p>出自饺耳世家厨师手中的每个饺子形状都不完全相同，食客迟到的每个饺子都一定是独一无二的.</p>
         			</div>
         			<div class="picMarquee-left">
						<div class="bd">
							<ul class="picList">
								<li>
									<div class="pic"><a href="" target="_blank"><img src="img/wh-pic02_03.jpg" /></a></div>
									<div class="foodname">
										<a href="" target="_blank">金牌水饺</br>Gold Boiled dumplings </a>
									</div>
								</li>
								<li>
									<div class="pic"><a href="" target="_blank"><img src="img/wh-pic03_03.jpg" /></a></div>
									<div class="foodname">
										<a href="" target="_blank">金牌水饺</br>Gold Boiled dumplings </a>
									</div>
								</li>
								<li>
									<div class="pic"><a href="" target="_blank"><img src="img/wh-pic04_03.jpg" /></a></div>
									<div class="foodname">
										<a href="" target="_blank">金牌水饺</br>Gold Boiled dumplings </a>
									</div>
								</li>
								<li>
									<div class="pic"><a href="" target="_blank"><img src="img/wh-pic05_03.jpg" /></a></div>
									<div class="foodname">
										<a href="" target="_blank">金牌水饺</br>Gold Boiled dumplings </a>
									</div>
								</li>
								<li>
									<div class="pic"><a href="" target="_blank"><img src="img/food-sj.png" /></a></div>
									<div class="foodname">
										<a href="" target="_blank">金牌水饺</br>Gold Boiled dumplings </a>
									</div>
								</li> 
								<li>
									<div class="pic"><a href="" target="_blank"><img src="img/wh-pic06_03.jpg" /></a></div>
									<div class="foodname">
										<a href="" target="_blank">金牌水饺</br>Gold Boiled dumplings </a>
									</div>
								</li>
							</ul>
						</div>
					</div>
			
					<script type="text/javascript">
					jQuery(".picMarquee-left").slide({mainCell:".bd ul",autoPlay:true,effect:"leftMarquee",vis:5,interTime:50});
					</script>

         	</div>
         </div>	
         	<!--产品展示结束-->
         	<div class="row">
         	<!--左侧栏内容开始-->
         		<div class="col-md-3">
         		 <div class="row">
         			<div class="news bg_color-fff">
         				<h4 class="icon-zx">饺耳头条</h4>
         				<a href="" class="look-more">查看更多>></a>
         				<div class="txtMarquee-top">
							<div class="bd">
								<ul class="infoList">
									<li class="just-line1"><span class="date">2016-9-24</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
									<li class="just-line1"><span class="date">2016-9-23</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
									<li class="just-line1"><span class="date">2016-9-22</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
									<li class="just-line1"><span class="date">2016-9-21</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
									<li class="just-line1"><span class="date">2016-9-20</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
									<li class="just-line1"><span class="date">2016-9-19</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
								</ul>
							</div>
						</div>
         			</div>
         		</div>	
         			<!--新闻咨询结束-->
         			<!--视频部分开始-->
         		<div class="row">	
         			<div class="bg_color-fff" style="padding:5px 15px 15px; margin-bottom: 20px;">
		         		<h4 class="icon-sp" style="margin-bottom: 5px;">视频</h4>
		         		<div class="video">
		         		  <a href="javascript:;" class="play-video"><img src="img/video-pic_03.jpg" class="img-responsive"></a>
		         		</div>
		         	</div>
		        </div> 	
         			<!--视频部分结束-->
         		<!--二维码部分开始-->
         		<div class="row">
         			<div class="mb30">
         				<img src="img/pic-wx_03.jpg" class="img-responsive">
         			</div>
         		</div>		
         		<!--二维码部分结束-->
         		</div>
         	<!--左侧栏内容结束-->
         	<!--右侧栏内容开始-->
         		<div class="col-md-9" style="padding-left: 50px; padding-right: 0;">
         			<div class="Photo-frame bg_color-fff">
         				<h4 class="icon-heart">饺耳“心”文化</h4>
         				<!--相框部分开始-->
         				<div class="picFocus">
							<div class="bd">
								<ul>
									<li><a target="_blank" href=""><img src="img/wh-pic03_03.jpg" alt="非诚勿扰美味"/></a></li>
									<li><a target="_blank" href=""><img src="img/wh-pic01_03.jpg" /></a></li>
									<li><a target="_blank" href=""><img src="img/wh-pic02_03.jpg" /></a></li>
									<li><a target="_blank" href=""><img src="img/wh-pic04_03.jpg" /></a></li>
									<li><a target="_blank" href=""><img src="img/wh-pic05_03.jpg" /></a></li>
									<li><a target="_blank" href=""><img src="img/wh-pic06_03.jpg" /></a></li>
								</ul>
							</div>
							<div class="hd">
								<ul>
									<li><img src="img/wh-pic03_03.jpg" /></li>
									<li><img src="img/wh-pic01_03.jpg" /></li>
									<li><img src="img/wh-pic02_03.jpg" /></li>
									<li><img src="img/wh-pic04_03.jpg" /></li>
									<li><img src="img/wh-pic05_03.jpg" /></li>
									<li class="mr0"><img src="img/wh-pic06_03.jpg" /></li>
								</ul>
							</div>
						</div>
		                <script type="text/javascript">jQuery(".picFocus").slide({ mainCell:".bd ul",effect:"left" });</script>

         				<!--相框部分结束-->
         			</div>
         		</div>
         	<!--右侧栏内容开始-->
         	</div>
         	<!--合作伙伴开始-->
         	<div class="row">
         		<div class="pataner">
	         		
	         		<h4>合作伙伴</h4>
	         		
	         		<ul class="clearfix">
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			<li><a href="" target="_blank"><img src="img/pic21.jpg"></a></li>
	         			
	         		</ul>
         		</div>
         	</div>
         	<!--友情链接开始-->
         	<div class="row">
         		<div class="link">
	         			<h4>友情链接</h4>
	         			<p><a href="" target="_blank">戛纳国际创意节</a><a href="" target="_blank">戛纳国际创意节</a><a href="" target="_blank">戛纳国际创意节</a><a href="" target="_blank">戛纳国际创意节</a></p>
         		</div>
         	</div>
         </div>  
       </div>  
        <!--博客主体内容结束-->
        <!--页面底部板块开始-->
		<%@ include file="footer.jsp"%>
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
