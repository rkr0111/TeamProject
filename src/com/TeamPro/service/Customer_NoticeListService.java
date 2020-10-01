package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.CustomerCenter_dto;

public class Customer_NoticeListService {

	public List<CustomerCenter_dto> getNoticeList(int page) throws Exception {
		List<CustomerCenter_dto> centerlist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		centerlist = prodao.Conn_select_CenterNoticelist(page);
		CustomerCenter_dto centerdto = new CustomerCenter_dto();
		ArrayList<CustomerCenter_dto> list = new ArrayList<CustomerCenter_dto>();
		
		for(int i = 0; i < centerlist.size(); i++) {
			centerdto.setCenter_category(centerlist.get(i).getCenter_category());
			centerdto.setCenter_no(centerlist.get(i).getCenter_no());
			centerdto.setCenter_title(centerlist.get(i).getCenter_title());
			centerdto.setCenter_date(centerlist.get(i).getCenter_date());
			centerdto.setCenter_contents(centerlist.get(i).getCenter_contents());
			list.add(centerdto);
		}
		return centerlist;
	}
	
	public int getListCount(String center_category) throws Exception {
		int listCount = 0;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		listCount = prodao.select_customerNoticeListCount(center_category);
		return listCount;
	}
	
}
