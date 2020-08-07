<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<%
	String id = (String)session.getAttribute("id");
	String mypageCategory = null;
	int param = (int)request.getAttribute("param");
	
	if(param==0) {
		mypageCategory = "리뷰";
	}
	else if(param==1) {
		mypageCategory = "A/S 문의";
	}
	else {
		throw new Exception("param 오류");
	}

	if (id== null) {
		throw new Exception("로그인을 해주세요.");
	}
	Connection conn=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light", "orro", "1995");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select buy_id, buy_name, buy_condition from buyhistory where buy_id='"+id+"' and buy_condition='"+"배송 완료"+"'; ");
		if(rs!=null) {
			request.setCharacterEncoding("UTF-8");
			ArrayList<Object> reviewNasList = new ArrayList<Object>();
			
			while(rs.next()) {
				Buyhistory_dto dto = new Buyhistory_dto();
				dto.setBuy_id(rs.getString(1));
				dto.setBuy_name(rs.getString(2));
				dto.setBuy_condition(rs.getString(3));
								
				reviewNasList.add(dto);
			}
			request.setAttribute("reviewNasList", reviewNasList);			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage.jsp?mypageCategory="+mypageCategory);
			dispatcher.forward(request, response);
		}else if(mypageCategory.equals("리뷰")) {
			out.println("<script>alert('리뷰를 작성하실 상품이 없습니다.');</script>");
			out.println("<script>location.href='DB_mypage_buyhistory.jsp';</script>");
		}else if(mypageCategory.equals("AS")) {
			out.println("<script>alert('A/S문의 내역이 없습니다.');</script>");
			out.println("<script>location.href='DB_mypage_buyhistory.jsp';</script>");
		}
	} finally {
	try {
		stmt.close();
	} catch (Exception ignored) {
	}
	try {
		conn.close();
	} catch (Exception ignored) {
	}
	}
%>>