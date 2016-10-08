<%@ page language="java" pageEncoding="gbk"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(new File(request.getRealPath("uploadtemp")));
	factory.setSizeThreshold(1024 * 1024);
	ServletFileUpload upload = new ServletFileUpload(factory);
	List<FileItem> fileItems = upload.parseRequest(request);
	String newfilename = "";
	for (FileItem item : fileItems) {
		if (!item.isFormField()) {
			if ("photo".equals(item.getFieldName())) {
				String suffix = item.getName().substring(
						item.getName().lastIndexOf("."));
				newfilename = new SimpleDateFormat("yyyyMMddHHmmss")
						.format(new Date())
						+ suffix;
				InputStream ins = null;
				OutputStream os = null;
				try {
					ins = item.getInputStream();
					os = new FileOutputStream(new File(request
							.getRealPath("uploadfiles/" + newfilename)));
					byte[] buffer = new byte[1024];
					int len = 0;
					while ((len = ins.read(buffer)) > 0) {
						os.write(buffer, 0, len);
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					if (ins != null) {
						ins.close();
					}
					if (os != null) {
						os.close();
						os.flush();
					}
				}
			}
		}
	}
	request.setAttribute("photoname", newfilename);
	System.out.println("newfilename=="+newfilename);
	request.getRequestDispatcher("photocut.jsp").forward(request,
			response);
%>
