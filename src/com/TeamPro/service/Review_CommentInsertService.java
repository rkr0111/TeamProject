package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.Review_dto;

public class Review_CommentInsertService {
	
	public boolean setReviewComment(String comment_id, String comment_text, int reviewboard_num) throws Exception {
		ReviewComment_dto cmtdto = new ReviewComment_dto();
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		cmtdto.setComment_id(comment_id);
		cmtdto.setComment_text(comment_text);
		cmtdto.setReviewboard_num(reviewboard_num);
		int insertCount = prodao.Conn_reviewCommentInsert(cmtdto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}	
		
		return isInsertSuccess;
	}
	
}
