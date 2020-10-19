<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URLEncoder"%>

<%

String fileName = request.getParameter("product_file");

String savePath = "upload//product_file";
ServletContext context = request.getServletContext();
String sDownloadPath = context.getRealPath(savePath);
String sFilePath = sDownloadPath + "//" + fileName;
byte b[] = new byte[4096];
FileInputStream in = new FileInputStream(sFilePath);
String sMimeType = request.getServletContext().getMimeType(sFilePath);

if (sMimeType == null)
	sMimeType = "application/octet-stream";

response.setContentType(sMimeType);
String agent = request.getHeader("User-Agent");
boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

if (ieBrowser) {
	fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
} else {
	fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
}

response.setHeader("Content-Disposition", "attachment; filename= " + fileName);

ServletOutputStream out2 = response.getOutputStream();
int numRead;

while ((numRead = in.read(b, 0, b.length)) != -1) {
	out2.write(b, 0, numRead);
}
out2.flush();
out2.close();
in.close();

out.println("<script>location.href='../customerDownload.bo'</script>");

%>