package com.TeamPro.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	// select - product list
	public List<Product_dto> Conn_select_proList(String search_product) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_proList");
		sqlsession.close();
		return connresultsel;
	}
	// select_ListCount - 0730 dhdbswl 수정
	public int select_ListCount() {
		int listCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> connresultsel = sqlsession.selectList("xml_select_count");
		sqlsession.close();
		listCount = Integer.parseInt(connresultsel.get(0).toString());
		return listCount;
	}
	
	//insert - 0730 dhdbswl 수정
	public int Conn_insert(Product_dto dto) {
		int insertCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert", dto);
		sqlsession.commit();
		insertCount = 1;
		sqlsession.close();
		return insertCount;
	}
	
	//update - 0730 rkr0111 수정
	public int Conn_update() {
		int updateCount = 0;
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> connresultsel = sqlsession.selectList("xml_select_count");
		sqlsession.commit();
		sqlsession.close();
		updateCount = Integer.parseInt(connresultsel.get(0).toString());
		//System.out.println();
		return updateCount;
	}
	//update_selectName - 0730 rkr0111 수정
	public List<Product_dto> Conn_updateselect(String check_name) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultupd= sqlsession.selectList("xml_select_name");
		sqlsession.close();
		return connresultupd; 
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
