package com.jx;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileCleaningTracker;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 文件上传数据接收类
 * 
 * 
 */
public class AjaxUploadFileServlet extends HttpServlet {

	/** 日志对象 */
	private Log logger = LogFactory.getLog(this.getClass());

	private static final long serialVersionUID = 1L;

	/** 上传目录名 */
	private static String uploadFolderName;

	/** 上传临时文件存储目录 */
	private static String tempFolderName;

	private static String urlPre;

	/** 上传文件最大为30M */
	private static final Long fileMaxSize = 30000000L;

	/** 允许上传的扩展名 */
	private static final String[] extensionPermit = { "txt", "xls", "zip",
			"jpg", "png", "gif", "jpeg" };

	/** 统一的编码格式 */
	private static final String encode = "UTF-8";

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		initParam();
		logger.info("UploadFileServlet#doPost() start");

		try {
			// 清除上次上传进度信息
			request.getSession().removeAttribute("fileUploadProcess");

			// String curProjectPath =
			// this.getServletContext().getRealPath("/");
			// String saveDirectoryPath = curProjectPath + "/" +
			// uploadFolderName;
			// String tempDirectoryPath = curProjectPath + "/" + tempFolderName;
			String saveDirectoryPath = uploadFolderName;
			String tempDirectoryPath = tempFolderName;
			File saveDirectory = new File(saveDirectoryPath);
			// System.out.println(saveDirectory.getAbsolutePath());
			File tempDirectory = new File(tempDirectoryPath);
			logger.debug("Project real path ["
					+ saveDirectory.getAbsolutePath() + "]");
			// 上传时产生的临时文件的默认保存目录
			logger.debug("Temp files default save path ["
					+ System.getProperty("java.io.tmpdir") + "]");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// DiskFileItemFactory中DEFAULT_SIZE_THRESHOLD=10240表示如果上传文件大于10K则会产生上传临时文件
			// 上传临时文件的默认目录为java.io.tmpdir中保存的路径，根据操作系统的不同会有区别

			if (!tempDirectory.exists()) {
				tempDirectory.mkdir();
			}
			// 重新设置临时文件保存目录
			factory.setRepository(tempDirectory);

			// 设置文件清除追踪器，文件上传过程中产生的临时文件会在
			FileCleaningTracker fileCleaningTracker = FileCleanerCleanup
					.getFileCleaningTracker(this.getServletContext());
			factory.setFileCleaningTracker(fileCleaningTracker);

			ServletFileUpload upload = new ServletFileUpload(factory);

			// 设置文件上传进度监听器
			FileProcessListener processListener = new FileProcessListener(
					request.getSession());
			upload.setProgressListener(processListener);

			// 设置文件上传的大小限制
			upload.setFileSizeMax(fileMaxSize);

			// 设置文件上传的头编码，如果需要正确接收中文文件路径或者文件名
			// 这里需要设置对应的字符编码，为了通用这里设置为UTF-8
			upload.setHeaderEncoding(encode);

			// 解析请求数据包
			List<FileItem> fileItems = upload.parseRequest(request);
			// 遍历解析完成后的Form数据和上传文件数据
			String fileUrl = "";
			for (Iterator<FileItem> iterator = fileItems.iterator(); iterator
					.hasNext();) {
				FileItem fileItem = iterator.next();
				String fieldName = fileItem.getFieldName();
				String name = fileItem.getName();
				// 如果为上传文件数据
				if (!fileItem.isFormField()) {
					logger.info("fieldName[" + fieldName + "] fileName[" + name
							+ "] ");
					if (fileItem.getSize() > 0) {
						String fileExtension = FilenameUtils.getExtension(name);
						if (!ArrayUtils
								.contains(extensionPermit, fileExtension)) {
							throw new NoSupportExtensionException(
									"No Support extension.");
						}
						String fileName = FilenameUtils.getName(name);
						// uuid名字，防止重复
						fileName = UUID.randomUUID().toString()
								+ fileName
										.substring(fileName.lastIndexOf(".") == -1 ? 0
												: fileName.lastIndexOf("."));

						FileUtils.copyInputStreamToFile(fileItem
								.getInputStream(), new File(saveDirectory,
								fileName));
						fileUrl = urlPre + fileName;
					}
				} else { // Form表单数据
					String value = fileItem.getString(encode);
					logger.info("fieldName[" + value + "] fieldValue["
							+ fieldName + "]");
				}
			}
			responseMessage(response, State.OK, fileUrl);
		} catch (FileSizeLimitExceededException e) {
			logger.error(e.getMessage(), e);
			responseMessage(response, State.OVER_FILE_LIMIT, null);
		} catch (NoSupportExtensionException e) {
			logger.error(e.getMessage(), e);
			responseMessage(response, State.NO_SUPPORT_EXTENSION, null);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			responseMessage(response, State.ERROR, null);
		}
		logger.info("UploadFileServlet#doPost() end");
	}

	private void initParam() throws IOException {
		if (uploadFolderName != null) {
			return;
		}
		Properties prop = new Properties();
		InputStream in = getClass().getResourceAsStream("/common.properties");
		prop.load(in);
		Set entrySet = prop.entrySet();
		for (Iterator iterator = entrySet.iterator(); iterator.hasNext();) {
			Entry<Object, Object> entry = (Entry<Object, Object>) iterator
					.next();
			if (entry.getKey().equals("uploadFolderName")) {
				uploadFolderName = entry.getValue().toString();
			}
			if (entry.getKey().equals("tempFolderName")) {
				tempFolderName = entry.getValue().toString();
			}
			if (entry.getKey().equals("urlPre")) {
				urlPre = entry.getValue().toString();
			}
		}
	}

	public enum State {
		OK(200, "上传成功"), ERROR(500, "上传失败"), OVER_FILE_LIMIT(501, "超过上传大小限制"), NO_SUPPORT_EXTENSION(
				502, "不支持的扩展名");

		private int code;
		private String message;

		private State(int code, String message) {
			this.code = code;
			this.message = message;
		}

		public int getCode() {
			return code;
		}

		public String getMessage() {
			return message;
		}

	}

	/**
	 * 返回结果函数
	 * 
	 * @param response
	 * @param state
	 */
	private void responseMessage(HttpServletResponse response, State state,
			String fileUrl) {
		response.setCharacterEncoding(encode);
		response.setContentType("text/html; charset=" + encode);
		Writer writer = null;
		try {
			writer = response.getWriter();
			writer.write("{\"code\":" + state.getCode() + ",\"message\":\""
					+ state.getMessage() + "\",\"fileUrl\":\"" + fileUrl
					+ "\"}");
			writer.flush();
			writer.close();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		} finally {
			IOUtils.closeQuietly(writer);
		}
	}

}
