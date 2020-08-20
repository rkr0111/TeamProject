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
