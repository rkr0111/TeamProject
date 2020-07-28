package com.TeamPro.service;

import java.sql.Connection;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class ProductSelectService {
	
	Product_dto getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		Product_dto article = null;
		Connection con = getConnection();
		TeamPro_dao boardDAO = TeamPro_dao.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
}