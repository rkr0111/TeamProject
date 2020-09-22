package com.TeamPro.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.ReviewLike_dto;
import com.TeamPro.dto.ReviewReply_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.dto.CustomerInfo_dto;

public class TeamPro_dao {
	SqlSessionFactory sqlfactory;
	private static TeamPro_dao instance;
	
	public static TeamPro_dao getinstance() {
		if(instance == null) {
			synchronized (TeamPro_dao.class) {
				instance = new TeamPro_dao();
			}
		}
		return instance;
	}
	
	//select
	public List<Product_dto> Conn_select() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select");
		sqlsession.close();
		return connresultsel; 
	}
	// select product list - 0731 dhdbswl 수정
	public List<Product_dto> Conn_select_proList(int page, int limit, String product_category) {
		int startrow = (page-1)*5;
		Product_dto prodto = new Product_dto();
		prodto.setProduct_category(product_category);
		prodto.setStartrow(startrow);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_list", prodto);
		sqlsession.close();
		return connresultsel;
	}
	// select_ListCount - 0730 dhdbswl 수정
	public int select_ListCount(String product_category) {
		int listCount = 0;
		Product_dto prodto = new Product_dto();
		prodto.setProduct_category(product_category);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> connresultsel = sqlsession.selectList("xml_select_count", prodto);
		sqlsession.close();
		listCount = Integer.parseInt(connresultsel.get(0).toString());
		return listCount;
	}
	// select_ListcountAll - 0811 dhdbswl 수정
	public int select_ListcountAll() {
		int listCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> connresultsel = sqlsession.selectList("xml_select_countAll");
		sqlsession.close();
		listCount = Integer.parseInt(connresultsel.get(0).toString());
		return listCount;
	}
	//detail_selectName - 0730 rkr0111 수정
	public List<Product_dto> Conn_detailselect(String product_name) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultupd= sqlsession.selectList("xml_select_name", product_name);
		sqlsession.close();
		return connresultupd; 
	}
	// 날씨에 대한 상품 select - 0818 dhdbswl 수정
	public List<Product_dto> Conn_select_weatherPro(String product_weather) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultupd= sqlsession.selectList("xml_select_weatherProList", product_weather);
		sqlsession.close();
		return connresultupd; 
	}
	// 구매내역 select - 0821 dhdbswl 수정
	public List<Buyhistory_dto> Conn_select_buyList(Buyhistory_dto buyDto) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Buyhistory_dto> connresultupd = sqlsession.selectList("xml_select_buyList", buyDto);
		sqlsession.close();
		return connresultupd;
	}
	// 회원 정보 all select - 0821 dhdbswl 수정
	public List<CustomerInfo_dto> Conn_select_customerList(String id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<CustomerInfo_dto> connresultupd = sqlsession.selectList("xml_select_customerList", id);
		sqlsession.close();
		return connresultupd;
	}
	// 인테리어 리뷰 all select - 0914 dhdbswl 수정
	public List<Product_dto> Conn_select_listImg() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_listImg");
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 all select - 0915 dhdbswl 수정
	public List<Review_dto> Conn_select_listInfo() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Review_dto> connresultsel= sqlsession.selectList("xml_select_listInfo");
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 디테일 페이지 select - 0915 dhdbswl 수정
	public List<Review_dto> Conn_reviewDetailSelect(int review_num) {
		Review_dto reviewdto = new Review_dto();
		reviewdto.setReview_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Review_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetail", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 디테일 페이지 이미지 select - 0915 dhdbswl 수정
	public List<Product_dto> Conn_reviewDetailImgSelcet(int review_num) {
		Review_dto reviewdto = new Review_dto();
		reviewdto.setReview_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetailImg", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 디테일 페이지 댓글 select - 0916 dhdbswl 수정
	public List<ReviewComment_dto> Conn_reviewCommentSelect(int review_num) {
		Review_dto reviewdto = new Review_dto();
		reviewdto.setReview_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewComment_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetailCmt", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 디테일 페이지 대댓글 select - 0916 dhdbswl 수정
	public List<ReviewReply_dto> Conn_reviewReplySelect(int review_num) {
		ReviewReply_dto reviewdto = new ReviewReply_dto();
		reviewdto.setReviewboard_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewReply_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetailReply", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 디테일 페이지 좋아요 버튼 누른 사람 select - 0918 dhdbswl 수정
	public List<ReviewLike_dto> Conn_reviewLikeSelect(String reply_id, int review_num) {
		ReviewLike_dto likedto = new ReviewLike_dto();
		likedto.setLike_id(reply_id);
		likedto.setReviewboard_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewLike_dto> connresultsel= sqlsession.selectList("xml_select_reviewLike", likedto);
		sqlsession.close();
		return connresultsel;
	}
	// 인테리어 리뷰 디테일페이지 게시물 좋아요 리스트 select - 0922 dhdbswl 수정
	public List<ReviewLike_dto> select_ReviewLikeList(int review_num) {
		ReviewLike_dto likedto = new ReviewLike_dto();
		likedto.setReviewboard_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewLike_dto> connresultsel= sqlsession.selectList("xml_select_reviewLikeCnt", likedto);
		sqlsession.close();
		return connresultsel;
	}
	
	//insert - 0731 dhdbswl 수정
	public int Conn_insert(Product_dto dto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert_prolist", dto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	//insert - 0820 dhdbswl 수정
	public int Conn_insert_buyhistory(Buyhistory_dto buyDto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert_buyhistory", buyDto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// review 상세페이지내 comment insert - 0916 dhdbswl 수정 
	public int Conn_reviewCommentInsert(ReviewComment_dto cmtdto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_reviewComment", cmtdto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// review 상세페이지내 reply insert - 0916 dhdbswl 수정 
	public int Conn_reviewReplyInsert(ReviewReply_dto replydto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_reviewReply", replydto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// review 상세페이지내 like insert - 0918 dhdbswl 수정 
	public int Conn_reviewLikeInsert(ReviewLike_dto likedto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_reviewLike", likedto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	
	//update - 0730 rkr0111 수정
	public int Conn_update(Product_dto dto) {
		int updateCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("xml_update", dto);
		sqlsession.commit();
		sqlsession.close();
		updateCount = 1;
		return updateCount;
	}
	// review 상세페이지내 like update - 0918 dhdbswl 수정 
	public int Conn_reviewLikeUpdate(ReviewLike_dto likedto) {
		int updateCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("update_reviewlike", likedto);
		sqlsession.commit();
		sqlsession.close();
		updateCount = 1;
		return updateCount;
	}
	
	//delete 
	public void Conn_delete(Product_dto dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_delete", dto);
		sqlsession.commit();
		sqlsession.close();
	}
	public SqlSessionFactory getConn() { //jsp에서 사용하기 위해 생성자 이름을 일반 메소드로 변경
		//punlic static SqlSessionFactory getConn() 이라고 적어도 된다.
		try { 
			Reader reader = Resources.getResourceAsReader("com/TeamPro/dao/mybatis-config.xml"); // 외부의 xml 파일을 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader); // 자바 내에서 xml을 사용할 변수
		} catch (IOException e) {
			e.printStackTrace();
		}return sqlfactory;
	}
}
