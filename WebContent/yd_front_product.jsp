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
//菜品列表信息
//CREATE TABLE `productmenu` (
// `productmenuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
//  `productlei` varchar(255) DEFAULT NULL COMMENT '菜品类别',
//  `productname` varchar(255) DEFAULT NULL COMMENT '菜名',
//  `productEname` varchar(255) DEFAULT NULL COMMENT '菜英文名',
//  `content1` text COMMENT '菜品简介',
//  `img1` varchar(255) DEFAULT NULL COMMENT '图片1',
//  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
//  `updatetime` datetime DEFAULT NULL COMMENT '最新修改时间',
//  `is_discuss` tinyint(1) DEFAULT NULL COMMENT '是否被评论',
//  `del` int(11) DEFAULT NULL,
//  `count` int(11) DEFAULT NULL COMMENT '销售量',
//  `yprice` int(11) DEFAULT NULL COMMENT '原价格',
//  `xprice` int(11) DEFAULT NULL COMMENT '现价格',
//  `shoucang` int(11) DEFAULT NULL COMMENT '收藏量',
//  `canshu_url` int(11) DEFAULT NULL,
//  `tagid` int(22) DEFAULT NULL,
//  `visitor` varchar(255) DEFAULT NULL,
//  PRIMARY KEY (`productmenuid`)
//) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
//获取菜品信息
String leibie="";
if(cailei==1){
	leibie="特色水饺";
}
if(cailei==2){
	leibie="开胃凉菜";
	}
if(cailei==3){
	leibie="精美热菜"; 
	}
if(cailei==4){
	leibie="主食";
	}
if(cailei==5){
	leibie="酒水饮料";
	}
System.out.println(leibie);
List<Mapx<String,Object>> caipinshowlc;
	caipinshowlc=DB.getRunner().query("select productmenuid,productname,productEname,substring(content1,1,64) as content1,count,yprice,img1 from productmenu where del=? and productlei=? order by productmenuid desc limit 9", new MapxListHandler(), "0","开胃凉菜");
List<Mapx<String,Object>> caipinshowrc;
	caipinshowrc=DB.getRunner().query("select productmenuid,productname,productEname,substring(content1,1,64) as content1,count,yprice,img1 from productmenu where del=? and productlei=? order by productmenuid desc limit 9", new MapxListHandler(), "0","精美热菜");
List<Mapx<String,Object>> caipinshowsj;
	caipinshowsj=DB.getRunner().query("select productmenuid,productname,productEname,substring(content1,1,64) as content1,count,yprice,img1 from productmenu where del=? and productlei=? order by productmenuid desc limit 9", new MapxListHandler(), "0","特色水饺");
List<Mapx<String,Object>> caipinshowzs;
	caipinshowzs=DB.getRunner().query("select productmenuid,productname,productEname,substring(content1,1,64) as content1,count,yprice,img1 from productmenu where del=? and productlei=? order by productmenuid desc limit 9", new MapxListHandler(), "0","主食");
List<Mapx<String,Object>> caipinshowjs;
	caipinshowjs=DB.getRunner().query("select productmenuid,productname,productEname,substring(content1,1,64) as content1,count,yprice,img1 from productmenu where del=? and productlei=? order by productmenuid desc limit 9", new MapxListHandler(), "0","酒水饮料");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="饺耳世家">
		<meta name="keywords" content="饺耳世家、美食">
		<title>饺耳菜品</title>
		<link href="images/top-icon.png" type="image/x-icon" rel="shortcut icon" />
		<link href="css/m-style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="head head-rel">
				<p>饺耳菜谱</p>
				<a href="yd_front_index.jsp" class="back02"><img src="images/back.png"></a>
			</div>
			<!--产品列表部分开始-->
			<div class="product product-list">
				<!--标题部分-->
				<div class="title-nav clearfix">
							<div class="title-nav-item">凉菜</div>
							<div class="title-nav-item">热菜</div>
							<div class="title-nav-item active">水饺</div>
							<div class="title-nav-item">主食</div>
							<div class="title-nav-item">酒水</div>
			    </div>
			    <!--内容部分开始-->
			    <div class="course-slide">
			    	<div class="product-type" style="display: none;">
			    		<%for(int i=0;i<caipinshowlc.size();i++){ %>
	            		<a href="yd_front_product_inner.jsp?caiid=<%=caipinshowlc.get(i).getIntView("productmenuid")%>">
	            		<div class="cell bg-white">
		            			<div class="menu-pic">
		            				<img src="<%=caipinshowlc.get(i).getStringView("img1")%>">
		            			</div>
		            			<div class="cell_primary">
		            				<h4><%=caipinshowlc.get(i).getStringView("productname")%></h4>
		            				<p class="color-999999"><%=caipinshowlc.get(i).getStringView("productname")%></p>
		            				<p class="color-666666 mb5">月售<%=caipinshowlc.get(i).getIntView("count")%><span class="ml10">好评率100%</span></p>
		            				<p><span class="color-dd2727 size16">￥<%=caipinshowlc.get(i).getIntView("yprice")%></span><del class="color-666666 ml10"><!-- 42 --></del></p>
		            			</div>
	            		</div>
	            		</a>
	            		<%} %>
			    	</div>
			    	<div class="product-type" style="display: none;">
			    		<%for(int i=0;i<caipinshowrc.size();i++){ %>
	            		<a href="yd_front_product_inner.jsp?caiid=<%=caipinshowrc.get(i).getIntView("productmenuid")%>">
	            		<div class="cell bg-white">
		            			<div class="menu-pic">
		            				<img src="<%=caipinshowrc.get(i).getStringView("img1")%>">
		            			</div>
		            			<div class="cell_primary">
		            				<h4><%=caipinshowrc.get(i).getStringView("productname")%></h4>
		            				<p class="color-999999"><%=caipinshowrc.get(i).getStringView("productname")%></p>
		            				<p class="color-666666 mb5">月售<%=caipinshowrc.get(i).getIntView("count")%><span class="ml10">好评率100%</span></p>
		            				<p><span class="color-dd2727 size16">￥<%=caipinshowrc.get(i).getIntView("yprice")%></span><del class="color-666666 ml10"><!-- 38 --></del></p>
		            			</div>
	            		</div>
	            		</a>
	            		<%} %>
			    	</div>
			    	<div class="product-type">
			    		<%for(int i=0;i<caipinshowsj.size();i++){ %>
			    		<a href="yd_front_product_inner.jsp?caiid=<%=caipinshowsj.get(i).getIntView("productmenuid")%>">
	            		<div class="cell bg-white">
		            			<div class="menu-pic">
		            				<img src="<%=caipinshowsj.get(i).getStringView("img1")%>">
		            			</div>
		            			<div class="cell_primary">
		            				<h4><%=caipinshowsj.get(i).getStringView("productname")%></h4>
		            				<p class="color-999999"><%=caipinshowsj.get(i).getStringView("productname")%></p>
		            				<p class="color-666666 mb5">月售<%=caipinshowsj.get(i).getIntView("count")%><span class="ml10">好评率100%</span></p>
		            				<p><span class="color-dd2727 size16">￥<%=caipinshowsj.get(i).getIntView("yprice")%></span><del class="color-666666 ml10"><!-- 38 --></del></p>
		            			</div>
	            		</div>
	            		</a>
	            		<%} %>
			    	</div>
			    	<div class="product-type" style="display: none;">
	            		<%for(int i=0;i<caipinshowzs.size();i++){ %>
	            		<a href="yd_front_product_inner.jsp?caiid=<%=caipinshowzs.get(i).getIntView("productmenuid")%>">
	            		<div class="cell bg-white">
		            			<div class="menu-pic">
		            				<img src="<%=caipinshowzs.get(i).getStringView("img1")%>">
		            			</div>
		            			<div class="cell_primary">
		            				<h4><%=caipinshowzs.get(i).getStringView("productname")%></h4>
		            				<p class="color-999999"><%=caipinshowzs.get(i).getStringView("productname")%></p>
		            				<p class="color-666666 mb5">月售<%=caipinshowzs.get(i).getIntView("count")%><span class="ml10">好评率100%</span></p>
		            				<p><span class="color-dd2727 size16">￥<%=caipinshowzs.get(i).getIntView("yprice")%></span><del class="color-666666 ml10"><!-- 38 --></del></p>
		            			</div>
	            		</div>
	            		</a>
	            		<%} %>
			    	</div>
			    	<div class="product-type" style="display: none;">
			    		<%for(int i=0;i<caipinshowjs.size();i++){ %>
			    		<a href="yd_front_product_inner.jsp?caiid=<%=caipinshowjs.get(i).getIntView("productmenuid")%>">
	            		<div class="cell bg-white">
		            			<div class="menu-pic">
		            				<img src="<%=caipinshowjs.get(i).getStringView("img1")%>">
		            			</div>
		            			<div class="cell_primary">
		            				<h4><%=caipinshowjs.get(i).getStringView("productname")%></h4>
		            				<p class="color-999999"><%=caipinshowjs.get(i).getStringView("productname")%></p>
		            				<p class="color-666666 mb5">月售<%=caipinshowjs.get(i).getIntView("count")%><span class="ml10">好评率100%</span></p>
		            				<p><span class="color-dd2727 size16">￥<%=caipinshowjs.get(i).getIntView("yprice")%></span><del class="color-666666 ml10"><!-- 38 --></del></p>
		            			</div>
	            		</div>
	            		</a>
	            		<%} %>
			    	</div>
			    </div>
			    <div style="height: 50px; width: 100%;"></div>
			</div>
			<!--产品列表部分结束-->
			<div class="tellbox">
				<h3>订餐电话:<a href="tel:010-80440188"> 010-<span>8044</span><span>0188</span></a></h3>
			</div>
			<!--返回顶部按钮-->
			<div id="topcontrol" style="display:none; position: fixed; bottom: 180px; right: 0px; cursor: pointer; z-index: 119;" title="返回顶部">
			<img style="width:36px; height:40px;" src="images/gotop.png">
		    </div>
		</div>
		<!--菜品切换js-->
		<script>
			$(function(){
			var $div_li=$('.title-nav .title-nav-item');
			$div_li.click(function(){
				$(this).addClass('active').siblings().removeClass('active');
				var index =$div_li.index(this);
				$('.course-slide >div').eq(index).show().siblings().hide();
				});	
			});
		</script>
		<!--返回顶部js-->
		<script>
		$(function(e) {
            var T=0;
		    $(window).scroll(function(event) {
		        T=$(window).scrollTop();
		
		        if(T>300)
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
	</body>
</html>
