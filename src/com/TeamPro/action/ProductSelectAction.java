package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;

public class ProductSelectAction implements Light_action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		ProductSelectService productSelectService = new ProductSelectService();
		Product_dto article = productSelectService.Conn_select();
		ActionForward forward = new ActionForward();
		
		
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
  		forward.setPath("/qna_board_view.jsp");
  		return forward;
	}

}
