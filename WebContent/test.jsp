<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%
HashMap<String,String> param= G.getParamMap(request);
if(param.get("Action")!=null && param.get("Action").equals("提交")){
System.out.println("提交:"+param.get("myEditor"));
response.getWriter().print("<div class='content'>"+param.get("myEditor")+"</div>");
}
%>
<!DOCTYPE HTML>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title></title>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor/ueditor.all.js"></script>
    		<link href="css/m-style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
    <style type="text/css">
        body{
            font-size:14px;
        }
    </style>
</head>
<body>
    <h2>UEditor提交示例11</h2>
    <form id="form" method="post" target="_blank" action="${pageContext.request.contextPath}/test.jsp" style="width:1000px;">
         <script type="text/plain" id="myEditor" name="myEditor"></script>
         <script type="text/plain" id="myEditor1" name="myEditor">
        </script>
        <input type="submit" name="Action"  value="提交">
    </form>

    <script type="text/javascript">
        var editor_a = UE.getEditor('myEditor',{initialFrameHeight:200});
    </script>
	<!--点击加载更多JS-->
		
		<div id="as1" style="display:none;">
			<div id="id1">显示数据1</div>
		</div>
		<div id="as2" style="display:none;">
			<div id="id2">显示数据2</div>
		</div>
		<div id="as3" style="display:none;">
			<div id="id3">显示数据3</div>
		</div>
			<script type="text/javascript">
    		 //将更多加载出的数据隐藏
    		 function yincang4(){
    		 $("#id1").css('display','none'); 
    		 }
    		 </script>
		<div class="load-more">加载更多+</div>
    	<a onclick="yincang4()">已经到底了</a>	
    	<script type="text/javascript">
    		 //将更多加载出的数据隐藏
    		 function yincang4(){
    		 $("#id1").css('display','none'); 
    		 }
    		 </script>
	 	<script>
	 		$(function(e){
			var i=1;
			var aa="#as"+i+"";
	 		var txt1=$(aa).html();
	 		$("#as1").attr("class","name");
	 			$(".load-more").click(function(){
	 				$(this).before(txt1);
					i++;
					aa="#as"+i+"";
					$(aa).attr("class","name");
					txt1=$(aa).html();
	 			})
	 		})
	 	</script>
</body>


</html>
