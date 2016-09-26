<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl核心标签库 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>下载列表展示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  
  <body>
  	 <table border="1" align="center" cellspacing="0">
  	 	<tr>
  	 		<td>编号</td>
  	 		<td>用户</td>
  	 		<td>文件名</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="user" items="${requestScope.listUser}">
  	 		<tr>
	  	 		<td>${user.id }</td>
	  	 		<td>${user.userName }</td>
	  	 		<td>${user.fileName }</td>
	  	 		<td>
	  	 			<!-- 
	  	 			<a href="${pageContext.request.contextPath }/down.action?method=down&id=${user.id}">下载</a>
	  	 			 -->
	  	 			 <!-- 
						构建一个url地址
							var 存放到page域中变量名称 
							value  url对应的地址
							context 指定要跳转的项目名，默认为当前项目，相当于${pageContext.request.contextPath}
					-->
	  	 			 <c:url var="url" value="/down.action">
	  	 			 	<c:param name="method" value="down"></c:param>
	  	 			 	<c:param name="id" value="${user.id}"></c:param>
	  	 			 </c:url>
	  	 			 <!-- 用上面的地址 -->
	  	 			 <a href="${url }">下载</a>
	  	 		</td>
	  	 	</tr>
  	 	</c:forEach>
  	 </table>
  </body>
</html>



















