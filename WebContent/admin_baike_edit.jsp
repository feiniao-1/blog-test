<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>百科编辑</title>
  
<%
//获取当前url
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String jishu = "";
try{
jishu = request.getParameter("jishu");
System.out.println("jishu"+jishu);
}catch(Exception e){
	
}
//验证用户登陆
Mapx<String,Object> user = G.getUser(request);
String pageType = null;
String userType = null;
//验证用户登陆
String username = (String)session.getAttribute("username");
List<Mapx<String, Object>> useridc= DB.getRunner().query("SELECT userid FROM user where username=?", new MapxListHandler(),username);
int flag=0;
if(username==null){
	%>
	<script type="text/javascript" language="javascript">
			alert("请登录");                                            // 弹出错误信息
			window.location='front_login.jsp' ;                            // 跳转到登录界面
	</script>
<%
}else{
	flag=1;
}
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式  
System.out.println(df.format(new Date()));// new Date()为获取当前系统时间  
//设置随机数
int  val = (int)(Math.random()*10000)+1;
int tagid=(int)new Date().getTime()/1000+(int)(Math.random()*10000)+1;
int url_canshu;
if(jishu==null){
	url_canshu=Integer.parseInt("1");
}else{	
	url_canshu=Integer.parseInt(jishu);
}
//当前登录用户
//int dluserid=useridc.get(0).getInt("userid");
int dluserid=10196;
//显示博客信息
List<Mapx<String,Object>> showdiscuss1 = DB.getRunner().query("select canshu_url as canshu_url from baike_article where  author=? order by articleid desc limit 1",new MapxListHandler(),dluserid);
System.out.println();
int canshu_url=showdiscuss1.get(0).getInt("canshu_url");
//编辑保存博客信息
System.out.println(request.getMethod());//获取request方法 POST or GET
HashMap<String,String> param= G.getParamMap(request);
String title;
String content1;
String tag1;
String tag2;
String tag3;
String tag4;
String chinaname;
String Englishname;
String maining;
String function;
String character;
String usetime;
String step1;
String step2;
String step3;
String step4;
String img1;
String img2;
String img3;
String img4;
System.out.println("url_canshu:"+url_canshu+"canshu_url"+canshu_url);
if(url_canshu!=canshu_url){
if(param.get("Action")!=null && param.get("Action").equals("发表文章")){
	title=new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
	content1=new String(request.getParameter("content1").getBytes("iso-8859-1"),"utf-8");
	tag1=new String(request.getParameter("tag1").getBytes("iso-8859-1"),"utf-8");
	tag2=new String(request.getParameter("tag2").getBytes("iso-8859-1"),"utf-8");
	tag3=new String(request.getParameter("tag3").getBytes("iso-8859-1"),"utf-8");
	tag4=new String(request.getParameter("tag4").getBytes("iso-8859-1"),"utf-8");
	chinaname=new String(request.getParameter("chinaname").getBytes("iso-8859-1"),"utf-8");
	Englishname=new String(request.getParameter("Englishname").getBytes("iso-8859-1"),"utf-8");
	maining=new String(request.getParameter("maining").getBytes("iso-8859-1"),"utf-8");
	function=new String(request.getParameter("function").getBytes("iso-8859-1"),"utf-8");
	character=new String(request.getParameter("character").getBytes("iso-8859-1"),"utf-8");
	usetime=new String(request.getParameter("usetime").getBytes("iso-8859-1"),"utf-8");
	step1=new String(request.getParameter("step1").getBytes("iso-8859-1"),"utf-8");
	step2=new String(request.getParameter("step2").getBytes("iso-8859-1"),"utf-8");
	step3=new String(request.getParameter("step3").getBytes("iso-8859-1"),"utf-8");
	step4=new String(request.getParameter("step4").getBytes("iso-8859-1"),"utf-8");
	img1=new String(request.getParameter("img1").getBytes("iso-8859-1"),"utf-8");
	img2=new String(request.getParameter("img2").getBytes("iso-8859-1"),"utf-8");
	img3=new String(request.getParameter("img3").getBytes("iso-8859-1"),"utf-8");
	img4=new String(request.getParameter("img4").getBytes("iso-8859-1"),"utf-8");
	if((title.equals("")||title.equals(null))||(content1.equals("")||content1.equals(null))){
		%>
			<script type="text/javascript" language="javascript">
					alert("主体信息不能为空");                                            // 弹出错误信息
					window.location='admin_baike_edit.jsp' ;                            // 跳转到登录界面
			</script>
		<%
	}else{
		DB.getRunner().update("insert into baike_article(author,title,content1,createtime,tag1,tag2,tag3,tag4,canshu_url,chinaname,Englishname,maining,function,`character`,usetime,step1,step2,step3,step4,img1,img2,img3,img4,tagid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",dluserid,title,content1,df.format(new Date()),tag1,tag2,tag3,tag4,url_canshu,chinaname,Englishname,maining,function,character,usetime,step1,step2,step3,step4,img1,img2,img3,img4,tagid);
		DB.getRunner().update("insert into news(author,title,content,createtime,newstype,img1,tagid) values(?,?,?,?,?,?,?)",dluserid,title,content1,df.format(new Date()),"baike",img1,tagid);
		%>
		<script type="text/javascript" language="javascript">
				alert("发表成功");                                            // 弹出错误信息
				window.location='admin_baike_edit.jsp' ;                            // 跳转到登录界面
		</script>
	<%
	}
}else{
}
}

%>
</head>
<body>
填写百科信息 <span style="margin-left:200px;"><a href="admin_boke_edit.jsp">发表博客</a>/<a  href="admin_baike_edit.jsp">发表百科</a></span><br>
<form id="form_tj" action="admin_baike_edit.jsp?jishu=<%=val%>" method="post" >
标题*：<br><input type="text" Name="title"  placeholder="标题"><br>
描述*：<br><textarea id="discuss_content" rows="3" cols="35" name="content1" placeholder="描述" ></textarea><br>
摘要(选填)：<br>
中文名：&nbsp;&nbsp;&nbsp;<input type="text" Name="chinaname"  placeholder="中文名" style="width:150px;"><br>
英文名：&nbsp;&nbsp;&nbsp;<input type="text" Name="Englishname"  placeholder="英文名" style="width:150px;"><br>
主要食材：<input type="text" Name="maining"  placeholder="主要食材" style="width:150px;"><br>
功效：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" Name="function"  placeholder="功效" style="width:150px;"><br>
特色：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" Name="character"  placeholder="特色" style="width:150px;"><br>
用时：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" Name="usetime"  placeholder="用时" style="width:150px;"><br>
做法：<br>
步骤一：<br>
图片*：<br><input type="text" Name="img1"  placeholder="图片名1"><br>
<textarea id="discuss_content" rows="3" cols="35" name="step1" placeholder="步骤一" ></textarea><br>
步骤二：<br>
图片：<br><input type="text" Name="img2"  placeholder="图片名2"><br>
<textarea id="discuss_content" rows="3" cols="35" name="step2" placeholder="步骤二" ></textarea><br>
步骤三：<br>
图片：<br><input type="text" Name="img3"  placeholder="图片名3"><br>
<textarea id="discuss_content" rows="3" cols="35" name="step3" placeholder="步骤三" ></textarea><br>
步骤四：<br>
图片：<br><input type="text" Name="img4"  placeholder="图片名4"><br>
<textarea id="discuss_content" rows="3" cols="35" name="step4" placeholder="步骤四" ></textarea><br>
关键词（选填）：<br>
<input type="text" Name="tag1"  placeholder="标签1" style="width:50px;">
<input type="text" Name="tag2"  placeholder="标签2" style="width:50px;">
<input type="text" Name="tag3"  placeholder="标签3" style="width:50px;">
<input type="text" Name="tag4"  placeholder="标签4" style="width:50px;"><br>
<input type="submit" Name="Action" value="发表文章" >
</form>
</body>
</html>