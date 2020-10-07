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
import com.TeamPro.dto.Cart_dto;
import com.TeamPro.dto.CustomerCenter_dto;
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
	// select product list - 0731 dhdbswl ����
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
	// select product list sort new  - 0927 dhdbswl ����
	public List<Product_dto> Conn_select_proListSortNew(int page, int limit, String product_category) {
		int startrow = (page-1)*5;
		Product_dto prodto = new Product_dto();
		prodto.setProduct_category(product_category);
		prodto.setStartrow(startrow);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_list", prodto);
		sqlsession.close();
		return connresultsel;
	}
	// select product list sort price asc  - 0927 dhdbswl ����
	public List<Product_dto> Conn_select_proListSortASC(int page, int limit, String product_category) {
		int startrow = (page-1)*5;
		Product_dto prodto = new Product_dto();
		prodto.setProduct_category(product_category);
		prodto.setStartrow(startrow);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_ListSortASC", prodto);
		sqlsession.close();
		return connresultsel;
	}
	// select product list sort price DESC  - 0927 dhdbswl ����
	public List<Product_dto> Conn_select_proListSortDESC(int page, int limit, String product_category) {
		int startrow = (page-1)*5;
		Product_dto prodto = new Product_dto();
		prodto.setProduct_category(product_category);
		prodto.setStartrow(startrow);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_ListSortDESC", prodto);
		sqlsession.close();
		return connresultsel;
	}
	// select_ListCount - 0730 dhdbswl ����
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
	// select_ListcountAll - 0811 dhdbswl ����
	public int select_ListcountAll() {
		int listCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> connresultsel = sqlsession.selectList("xml_select_countAll");
		sqlsession.close();
		listCount = Integer.parseInt(connresultsel.get(0).toString());
		return listCount;
	}
	//detail_selectName - 0730 rkr0111 ����
	public List<Product_dto> Conn_detailselect(String product_name) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultupd= sqlsession.selectList("xml_select_name", product_name);
		sqlsession.close();
		return connresultupd; 
	}
	// ������ ���� ��ǰ select - 0818 dhdbswl ����
	public List<Product_dto> Conn_select_weatherPro(String product_weather) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultupd= sqlsession.selectList("xml_select_weatherProList", product_weather);
		sqlsession.close();
		return connresultupd; 
	}
	// ���ų��� select - 0821 dhdbswl ����
	public List<Buyhistory_dto> Conn_select_buyList(Buyhistory_dto buyDto) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Buyhistory_dto> connresultupd = sqlsession.selectList("xml_select_buyList", buyDto);
		sqlsession.close();
		return connresultupd;
	}
	// ȸ�� ���� all select - 0821 dhdbswl ����
	public List<CustomerInfo_dto> Conn_select_customerList(String id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<CustomerInfo_dto> connresultupd = sqlsession.selectList("xml_select_customerList", id);
		sqlsession.close();
		return connresultupd;
	}
	// ���׸��� ���� all select - 0914 dhdbswl ����
	public List<Product_dto> Conn_select_listImg() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_listImg");
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� all select - 0915 dhdbswl ����
	public List<Review_dto> Conn_select_listInfo() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Review_dto> connresultsel= sqlsession.selectList("xml_select_listInfo");
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� ������ ������ select - 0915 dhdbswl ����
	public List<Review_dto> Conn_reviewDetailSelect(int review_num) {
		Review_dto reviewdto = new Review_dto();
		reviewdto.setReview_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Review_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetail", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� ������ ������ �̹��� select - 0915 dhdbswl ����
	public List<Product_dto> Conn_reviewDetailImgSelcet(int review_num) {
		Review_dto reviewdto = new Review_dto();
		reviewdto.setReview_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetailImg", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� ������ ������ ��� select - 0916 dhdbswl ����
	public List<ReviewComment_dto> Conn_reviewCommentSelect(int review_num) {
		Review_dto reviewdto = new Review_dto();
		reviewdto.setReview_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewComment_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetailCmt", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� ������ ������ ���� select - 0916 dhdbswl ����
	public List<ReviewReply_dto> Conn_reviewReplySelect(int review_num) {
		ReviewReply_dto reviewdto = new ReviewReply_dto();
		reviewdto.setReviewboard_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewReply_dto> connresultsel= sqlsession.selectList("xml_select_reviewDetailReply", reviewdto);
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� ������ ������ ���ƿ� ��ư ���� ��� select - 0918 dhdbswl ����
	public List<ReviewLike_dto> Conn_reviewLikeSelect(String reply_id, int review_num) {
		ReviewLike_dto likedto = new ReviewLike_dto();
		likedto.setLike_id(reply_id);
		likedto.setReviewboard_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewLike_dto> connresultsel= sqlsession.selectList("xml_select_reviewLike", likedto);
		sqlsession.close();
		return connresultsel;
	}
	// ���׸��� ���� ������������ �Խù� ���ƿ� ����Ʈ select - 0922 dhdbswl ����
	public List<ReviewLike_dto> select_ReviewLikeList(int review_num) {
		ReviewLike_dto likedto = new ReviewLike_dto();
		likedto.setReviewboard_num(review_num);
		SqlSession sqlsession = sqlfactory.openSession();
		List<ReviewLike_dto> connresultsel= sqlsession.selectList("xml_select_reviewLikeCnt", likedto);
		sqlsession.close();
		return connresultsel;
	}
	// ������ - ��ǰ���� product ���̺� select - 0923 dhdbswl ����
	public List<Product_dto> Conn_select_productlist() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select");
		sqlsession.close();
		return connresultsel; 
	}
	// index������ review list select - 0928 dhdbswl ����
	public List<Review_dto> Conn_select_indexReviewList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Review_dto> connresultsel= sqlsession.selectList("xml_select_reviewIndex");
		sqlsession.close();
		return connresultsel; 
	}
	// index������ customer center list select - 1002 dhdbswl ����
	public List<CustomerCenter_dto> Conn_select_indexCustomerCenterList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<CustomerCenter_dto> connresultsel= sqlsession.selectList("xml_select_customercenterIndex");
		sqlsession.close();
		return connresultsel; 
	}
	// index������ review list select product - 0928 dhdbswl ����
	public List<Product_dto> Conn_select_indexProductList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_proIndex");
		sqlsession.close();
		return connresultsel; 
	}
	// ������ > �������� list select - 1001 dhdbswl ����
	public List<CustomerCenter_dto> Conn_select_CenterNoticelist(int page) {
		int startrow = (page-1)*5;
		CustomerCenter_dto centerdto = new CustomerCenter_dto();
		centerdto.setStartrow(startrow);
		SqlSession sqlsession = sqlfactory.openSession();
		List<CustomerCenter_dto> connresultsel= sqlsession.selectList("xml_select_customernoticeList", centerdto);
		sqlsession.close();
		return connresultsel; 
	}
	// ������ > �������� list count select - 1001 dhdbswl ����
	public int select_customerNoticeListCount(String center_category) {
		int listCount = 0;
		CustomerCenter_dto centerdto = new CustomerCenter_dto();
		centerdto.setCenter_category(center_category);
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> connresultsel = sqlsession.selectList("xml_select_customerNoticecount", centerdto);
		sqlsession.close();
		listCount = Integer.parseInt(connresultsel.get(0).toString());
		return listCount;
	}
	
	//insert - 0731 dhdbswl ����
	public int Conn_insert(Product_dto dto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert_prolist", dto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	//insert - 0820 dhdbswl ����
	public int Conn_insert_buyhistory(Buyhistory_dto buyDto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert_buyhistory", buyDto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// review ���������� comment insert - 0916 dhdbswl ���� 
	public int Conn_reviewCommentInsert(ReviewComment_dto cmtdto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_reviewComment", cmtdto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// review ���������� reply insert - 0916 dhdbswl ���� 
	public int Conn_reviewReplyInsert(ReviewReply_dto replydto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_reviewReply", replydto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// review ���������� like insert - 0918 dhdbswl ���� 
	public int Conn_reviewLikeInsert(ReviewLike_dto likedto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_reviewLike", likedto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// ������ > �������� insert - 1001 dhdbswl ���� 
	public int Conn_CustomerNoticeinsert(CustomerCenter_dto centerdto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_customerNotice", centerdto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	// ��ٱ��� insert - 1007 dhdbswl ���� 
	public int Conn_insert_cart(Cart_dto cartdto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("insert_cart", cartdto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	
	//update - 0730 rkr0111 ����
	public int Conn_update(Product_dto dto) {
		int updateCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("xml_update", dto);
		sqlsession.commit();
		sqlsession.close();
		updateCount = 1;
		return updateCount;
	}
	// review ���������� like update - 0918 dhdbswl ���� 
	public int Conn_reviewLikeUpdate(ReviewLike_dto likedto) {
		int updateCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("update_reviewlike", likedto);
		sqlsession.commit();
		sqlsession.close();
		updateCount = 1;
		return updateCount;
	}
	// ������ > �������� update - 1002 dhdbswl ���� 
	public int Conn_update_customerNotice(CustomerCenter_dto dto) {
		int updateCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("update_customerNotice", dto);
		sqlsession.commit();
		sqlsession.close();
		updateCount = 1;
		return updateCount;
	}
	
	//delete 
	// ��ǰ ����
	public void Conn_delete(Product_dto dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_delete", dto);
		sqlsession.commit();
		sqlsession.close();
	}
	// ������ > �������� ���� - 1002 dhdbswl ����
	public int Conn_CustomerNotioce(CustomerCenter_dto dto) {
		int deleteFlag = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_delete_customerNotice", dto);
		sqlsession.commit();
		sqlsession.close();
		deleteFlag = 1;
		return deleteFlag;
	}
	
	
	public SqlSessionFactory getConn() { //jsp���� ����ϱ� ���� ������ �̸��� �Ϲ� �޼ҵ�� ����
		//punlic static SqlSessionFactory getConn() �̶�� ��� �ȴ�.
		try { 
			Reader reader = Resources.getResourceAsReader("com/TeamPro/dao/mybatis-config.xml"); // �ܺ��� xml ������ ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader); // �ڹ� ������ xml�� ����� ����
		} catch (IOException e) {
			e.printStackTrace();
		}return sqlfactory;
	}
}
