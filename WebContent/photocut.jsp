<%@ page language="java" pageEncoding="gbk"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>裁切形象照</title>
		<script type="text/javascript" src="js/jquery-pack.js"></script>
		<script type="text/javascript" src="js/jquery.imgareaselect.min.js"></script>
	</head>
	<body>
		<%
			if (request.getAttribute("photoname") != null) {
				if (!"".equals(request.getAttribute("photoname").toString())) {
		%>
		<script type="text/javascript">
		
				//图片的宽度 
				//图片的高度
				var picwidth, picheight;
				
				function preview(img, selection) { 
				
					//150和200这两个值来源于你图片预览区域的尺寸，对应下面aspectRatio: '3:4'这个比例,尺寸和比例可按照指定要求修改
					var scaleX = 150 / selection.width; 
					var scaleY = 200 / selection.height; 
	
	
					//调节预览图片的显示内容
					$('#photopreview').css({ 
						width: Math.round(scaleX * picwidth) + 'px', 
						height: Math.round(scaleY * picheight) + 'px',
						marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px', 
						marginTop: '-' + Math.round(scaleY * selection.y1) + 'px' 
					});
					
					//在各个隐藏域中存储裁剪的小图片的信息
					$('#x1').val(selection.x1);
					$('#y1').val(selection.y1);
					$('#x2').val(selection.x2);
					$('#y2').val(selection.y2);
					$('#w').val(selection.width);
					$('#h').val(selection.height);
				} 

				$(document).ready(function () {
				 
					$('#save_thumb').click(function() {
						var x1 = $('#x1').val();
						var y1 = $('#y1').val();
						var x2 = $('#x2').val();
						var y2 = $('#y2').val();
						var w = $('#w').val();
						var h = $('#h').val();
						if(x1=="" || y1=="" || x2=="" || y2=="" || w=="" || h==""){
							alert("请您拖动鼠标进行裁切!");
							return false;
						}else{
							return true;
						}
					});
					
				}); 

				//当浏览器加载完页面以后
				$(window).load(function () { 
				
					$('#thumbnail').imgAreaSelect({ aspectRatio: '4:3', onSelectChange: preview }); 
					picwidth = $("#thumbnail").width();
					picheight = $("#thumbnail").height();
					
				});
		</script>
	<form action="${pageContext.request.contextPath }/uploadServlet?url=boke" method="post" enctype="multipart/form-data">
		<input type="file" name="attr_file" style="display:inline-block;"></div>
		<input type="submit" value="上传"></div>
  	 </form><br>
		<table>
			<tr>
				<td>
					<form action="${pageContext.request.contextPath }/uploadServlet?url=boke" method="post"  name="thumbnail">
						<input type="hidden" name="x1" value="" id="x1" />
						<input type="hidden" name="y1" value="" id="y1" />
						<input type="hidden" name="x2" value="" id="x2" />
						<input type="hidden" name="y2" value="" id="y2" />
						<input type="hidden" name="width" value="" id="w" />
						<input type="hidden" name="height" value="" id="h" />
						<input type="hidden" name="photoName"
							value="<%=request.getAttribute("photoname")%>" />
						<input type="submit" class="button" name="upload_thumbnail"
							value="裁切照片" id="save_thumb" style="width: 120px; height: 30px" />
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<img src="uploadfiles/<%=request.getAttribute("photoname")%>"
						style="float: left; margin-right: 10px;" id="thumbnail"
						alt="按住鼠标拖动进行裁剪" />
					<div
						style="float: left; position: relative; overflow: hidden; width: 150px; height: 200px;">
						<img id="photopreview"
							src="uploadfiles/<%=request.getAttribute("photoname")%>"
							style="position: relative;" alt="Thumbnail Preview" />
					</div>
					<br style="clear: both;" />
				</td>
			</tr>
		</table>
		<%
			}
			} else {
				out.print("request.getAttribute(\"photoname\") = null");
			}
		%>
	</body>
</html>
