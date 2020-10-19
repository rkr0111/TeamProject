<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*"%>

<%

String path = application.getRealPath("/upload/product_file");
MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*100, "utf-8", new DefaultFileRenamePolicy());

// file
String filename1 = null;
String filename2 = null;
String filename3 = null;
String filename4 = null;
String filename5 = null;
// 파일
File file1 = multi.getFile("product_file1");
if(file1 != null) {
	filename1 = multi.getOriginalFileName("product_file1");
}
// 썸네일 이미지
File file2 = multi.getFile("product_file2");
if(file2 != null) {
	filename2 = multi.getOriginalFileName("product_file2");
}
//상세 이미지
File file3 = multi.getFile("product_file3");
if(file3 != null) {
	filename3 = multi.getOriginalFileName("product_file3");
}
File file4 = multi.getFile("product_file4");
if(file4 != null) {
	filename4 = multi.getOriginalFileName("product_file4");
}
File file5 = multi.getFile("product_file5");
if(file5 != null) {
	filename5 = multi.getOriginalFileName("product_file5");
}

//상세이미지 ,로 구분
String product_detailimg = filename3 + "," + filename4 + "," + filename5;	

//컬러 ,로 구분
String colors[] = multi.getParameterValues("product_color");
String product_color = "";
for(int i=0; i<colors.length; i++) {
	product_color += colors[i] + ",";
}

String product_name = multi.getParameter("product_name");
String product_category = multi.getParameter("product_category");
Integer product_price = Integer.parseInt(multi.getParameter("product_price"));
String product_contents = multi.getParameter("product_contents");
String product_weather = multi.getParameter("product_weather");

// insert database
Connection conn = null;
Statement stmt = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamlight?characterEncoding=utf8&serverTimezone=UTC", "teamlight", "teamlight1995!");
	if(conn == null) throw new Exception("DB에 연결할 수 없습니다.");
	stmt = conn.createStatement();
	String sql = "insert into product values('"+product_name+"', '"+product_category+"', "+product_price+", '"+product_color+"', '"+filename1+"', '"+filename2+"', '"+product_detailimg+"', '"+product_contents+"', '"+product_weather+"', now())";
	int result = stmt.executeUpdate(sql);
	if(result > 0) {
		out.println("<script>location.href='../productList.bo?product_category="+product_category+"'</script>");
	}
}finally {
	try {
		stmt.close();
	} catch(Exception ignored) {}
	try {
		conn.close();
	} catch(Exception ignored) {}
}

%>