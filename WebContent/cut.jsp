<%@ page language="java" pageEncoding="gbk"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.imageio.stream.ImageInputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.imageio.ImageReader"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.imageio.ImageReadParam"%>
<%@page import="java.awt.Rectangle"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%
	String oriphotoname = request.getParameter("photoName");
	int x1 = Integer.parseInt(request.getParameter("x1"));
	int x2 = Integer.parseInt(request.getParameter("x2"));
	int y1 = Integer.parseInt(request.getParameter("y1"));
	int y2 = Integer.parseInt(request.getParameter("y2"));
	int width = Integer.parseInt(request.getParameter("width"));
	int height = Integer.parseInt(request.getParameter("height"));

	String newphotoname = "cut-" + oriphotoname;
	//其实用不到这么多参数，这些参数您可以自己选择使用
	FileInputStream is = null;
	ImageInputStream iis = null;

	try {
	
		is = new FileInputStream(request.getRealPath("/uploadfiles/"
				+ oriphotoname));
				
		//文件的后缀
		String fileSuffix = oriphotoname.substring(oriphotoname
				.lastIndexOf(".") + 1);
				
		//图片的字符流	
		Iterator<ImageReader> it = ImageIO
				.getImageReadersByFormatName(fileSuffix);
		ImageReader reader = it.next();
		
		
		//得到图片的字节流将字节流转换成字符流
		iis = ImageIO.createImageInputStream(is);
		reader.setInput(iis, true);
		
		//设置新图片的生成参数
		ImageReadParam param = reader.getDefaultReadParam();
		Rectangle rect = new Rectangle(x1, y1, width, height);
		param.setSourceRegion(rect);
		
		//在内存中生成新图片
		BufferedImage bi = reader.read(0, param);
		ImageIO.write(bi, fileSuffix, new File(request
				.getRealPath("/uploadfiles/" + newphotoname)));
				
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		if (is != null) {
			is.close();
			is = null;
		}
		if (iis != null) {
			iis.close();
			iis = null;
		}
	}
	session.setAttribute("photoname", newphotoname);
	response.sendRedirect("cutpreview.jsp");
%>