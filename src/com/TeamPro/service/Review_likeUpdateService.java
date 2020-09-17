package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.ReviewReply_dto;
import com.TeamPro.dto.Review_dto;

public class Review_likeUpdateService {
	
	public boolean setReviewReply(String reply_id, String reply_text, int reviewboard_num, int comment_num) throws Exception {
		ReviewReply_dto replydto = new ReviewReply_dto();
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		replydto.setReply_id(reply_id);
		replydto.setReply_text(reply_text);
		replydto.setReviewboard_num(reviewboard_num);
		replydto.setComment_num(comment_num);
		
		int insertCount = prodao.Conn_reviewReplyInsert(replydto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}	
		
		return isInsertSuccess;
	}
	
}
