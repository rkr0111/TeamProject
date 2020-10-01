package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.CustomerCenter_dto;
import com.TeamPro.dto.PageInfo;
import com.TeamPro.service.Customer_NoticeListService;

public class Customer_NoticeListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int page = 1;
		int limit = 5;
		ActionForward forward = null;
		List<CustomerCenter_dto> centerlist = new ArrayList<CustomerCenter_dto>();
		Customer_NoticeListService customernoticelistservice = new Customer_NoticeListService();
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		//�� ������ ��.
		String center_category = request.getParameter("center_category");
		int listCount = customernoticelistservice.getListCount(center_category);
   		int maxPage=(int)((double)listCount / limit + 0.95); //0.95�� ���ؼ� �ø� ó��.
   		//���� �������� ������ ���� ������ ��(1, 6, 11 ��...)
   		int startPage = (((int) ((double)page / 5 + 0.8)) - 1) * 5 + 1;
   		//���� �������� ������ ������ ������ ��.(5, 10, 15 ��...)
   	    int endPage = startPage + 5 - 1;

   		if (endPage> maxPage) endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		// �������� ����Ʈ
		centerlist = customernoticelistservice.getNoticeList(page);		
		if(!centerlist.isEmpty()) {
			request.setAttribute("centerlist", centerlist);
		}
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_customer/customer_notice.jsp");
		return forward;
	}
	
}
