<%@page import="java.net.URLEncoder"%>
<%@page import="com.mchange.v2.c3p0.impl.DbAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.dbutils.QueryRunner" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
HashMap<String,String> param= G.getParamMap(request);
if(param==null){//临时，未正式交付，无法创建新用户
	response.sendRedirect("front_login.jsp");
	return;
}
HashMap<String,Object> myparam = new HashMap<String,Object>();//存储自用的一些变量
String opt = param.get("opt");
if(opt==null){
	opt="add";
	param.put("opt",opt);
}
if(opt.equals("add")){//创建用户
	int id = Ukey.getKey("user");
	param.put("id", ""+id);
}
System.out.println(param.get("id"));
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
///保存用户注册信息 -start  下面定义的变量 仅在此处使用
if(param.get("Action")!=null && param.get("Action").equals("立即注册")){
	List<String> errors = new ArrayList<String>();
			int id = Integer.parseInt(param.get("id"));
			String name = (String)G.commonCheckx(errors,param.get("username"),"用户名","must","string","between,2,50");
			String phone = (String)G.commonCheckx(errors,param.get("phone"),"电话","phone","string","between,11,20");
			String mail = (String)G.commonCheckx(errors,param.get("mail"),"邮箱","mail","string","between,5,50");
			String password = (String)G.commonCheckx(errors,param.get("password"),"密码","must","string","between,6,50");
			String password2 = (String)G.commonCheckx(errors,param.get("password2"),"密码确认","must","string","between,6,50");
			if(errors.size()>0){
				System.out.println(errors);%>
				<script type="text/javascript" language="javascript">
					alert("<%=errors%>");                                            // 弹出错误信息
					window.location='front_reg.jsp' ;                            // 跳转到登录界面
				</script>
			<%}else{//普通验证通过，继续确认
				if(!password.equals(password2)){
					errors.add("两次输入密码不一致");
					myparam.put("errorStr", G.toErrorStr(errors));
				}else{//验证通过，存库
					password = DesUtils.encrypt(password);
					DB.getRunner().update("insert into user(userid,username,password,shenhe,status,createtime,phone,mail) values(?,?,?,?,?,?,?,?)", id,name,password,"审核通过","有效",df.format(new Date()),phone,mail);
					myparam.put("addResult", "1");
					out.print("<script>alert('注册成功'); window.location='front_index.jsp' </script>");
					//response.sendRedirect("front_index.jsp");
				}
			}
		}
///end
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<title>用户注册</title>
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
</head>

<body style="min-height: 1000px;">
	<div class="container">
	<!--上部内容开始-->
	<div class="row">
	<div class="col-md-10 col-md-offset-1">
	<div class="center-box center-box2">
		<div class="register-wrap">
			<div class="logobox">
			<a href="http://www.doxue.com" alt=""><img src="images/logo.png" width="110" height="41" alt=""/></a>
			</div>
			<h3 class="mt30">博客账号</h3>
			<div class="register-main">
				<form class="form" action="front_reg.jsp" method="POST">
					<input type="hidden" name="opt" value="addsave">
					<input type="hidden" name="usertype" value="<%= param.get("usertype")==null?"":param.get("usertype") %>">
					<input type="text" style="visibility: hidden;" readOnly="true" class="text"  autocomplete="off" name="id"
		                   onpaste="return false;" value="<%= param.get("id")==null?"":param.get("id") %>">
					<div class="form-group">
					    <label class="sr-only" for="">用户名</label>
					    <input type="text"   class="form-control"  autocomplete="off" name="username"
		                   onpaste="return false;" placeholder="请输入用户名" value="<%= param.get("username")==null?"":param.get("username") %>">
				   	</div>
				   	<div class="form-group">
					    <label class="sr-only" for="">手机号</label>
					    <input type="text"  class="form-control" id="phone"  name="phone" placeholder="请输入手机号" value="<%= param.get("phone")==null?"":param.get("phone") %>">
				   	</div>
				   <div class="warning" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span>请输入正确的手机号</div>
					<div class="form-group">
					    <label class="sr-only" for="">邮箱</label>
					    <input type="text"  class="form-control"  name="mail" placeholder="请输入邮箱" value="<%= param.get("mail")==null?"":param.get("mail") %>">
				   	</div>
				   <div class="warning" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span>请输入正确的邮箱</div>
			    <!-- <div class="form-group">
				    <label class="sr-only" for="">验证码</label>
				    <input type="text" id="" class="form-control text02 " placeholder="请输入验证码" style="display: inline-block;">
				    <div class="validate" style="display: inline-block;">
						<a href="javascipt:;" class="btn btn-primary get-validate">获取验证码</a>
						<a href="javascipt:;" class="btn wait-validate" style="display:none;">59秒后重新获取</a>
						</div>
				  </div>  -->
			  	 
			  	 	<div class="form-group">
				    <label class="sr-only" for="">请设置密码</label>
				    <input type="password"  class="form-control"  style="ime-mode:disabled;"
	                   onpaste="return  false" autocomplete="off" name="password" placeholder="请设置密码" value="<%= param.get("password")==null?"":param.get("password") %>">
				   </div>
				   <div class="form-group">
				    <label class="sr-only" for="">请确认密码</label>
				    <input type="password"  class="form-control"  onpaste="return  false" name="password2"
	                   autocomplete="off" placeholder="请确认密码" value="<%= param.get("password2")==null?"":param.get("password2") %>">
				   </div>
				   <div class="warning" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span>密码输入有误</div>
				   <input type="submit" Name="Action" Value="立即注册"  class="btn btn-success mt20"  tabindex="25" onclick="test()">
			  </form>
			   <p class="mt20 color-999">点击“立即注册”即表示您同意并愿意遵守都学网<a href="">用户协议</a>和<a href="">隐私政策</a></p>
			   <p class="Already-user center color-999">已经注册会员？<a href="front_login.jsp">登录</a></p> 
			</div>
		</div>
	</div>
	</div>
	
	<!--上部内容end-->
	</div>
	<div class="row">
		<!--底部版权信息内容开始-->
	
		<div class="copyright center">
			<p><a href="">常见问题</a></p>
			<p class="color-999">© 2015-2016 都学网络科技（北京）有限公司 版权所有 京ICP备15015012号-2</p>
		</div>
	
	<!--底部版权信息内容end-->
	</div>
</div>	
	
	<!--获取验证码部分JS-->
	<script>
	$(function(){
	  $('.get-validate').click(function(){
		  $('.get-validate').hide();
		  $('.wait-validate').show();
	   });	
		
	});
	</script>
	<script>
	//手机号 规则匹配
	//function checkPhone(){ var phone = document.getElementById('phone').value; if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){ alert("手机号码有误，请重填"); return false; } }
	//JS正则验证邮箱的格式
	function test()
        {
           var temp = document.getElementById("mail");
           //对电子邮件的验证
           var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
           if(!myreg.test(temp.value))
           {
                alert('提示\n\n请输入有效的E_mail！');
                myreg.focus();
                return false;
           }
        }
	</script>	
	<script type="text/javascript">  
	//电子邮箱正则表达式  
	var tel=document.getElementById("teltext");      if(!(reg.test(tel))){           alert("不是正确的11位手机号");          document.getElementById("teltext").Value="";      }else{            }}  
	//检查输入的数据是不是邮箱格式  function checkemail(){
	var email = document.getElementById("emailtext");    
	//获取email控件对象         
	var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	//正则表达式        
	if (!reg.test(email.Value)) {                    alert("邮箱格式错误，请重新输入！");                    emailtext.focus();                    document.getElementById("emailtext").Value="";                      return;                    }          }    

</script>
</body>
</html>
