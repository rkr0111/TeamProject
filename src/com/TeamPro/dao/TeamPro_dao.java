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
	SqlSessionFactory sqlfactory; // 외부의 xml을 자바에서 사용하기 위해 필요한 클래스
	private static TeamPro_dao instance;
	//싱글톤 패턴 : 프로그램 시작을 하고 실행 중에는 객체를 한 번 생성하고 계속 재사용하는 것. / 모든 객체에서 사용할 수는 없다.
	//싱글톤 패턴을 사용할 때에는 static이 있어야 한다.
	
	public static TeamPro_dao getinstance() {
		if(instance == null) { // instance 가 만들어지지 않았을 때 
			synchronized (TeamPro_dao.class) { // 점유권을 가져와서 해당 클래스에 instance를 만든다.
				instance = new TeamPro_dao();
			}
		}
		// instance가 만들어져 있을 때
		return instance; //리턴을 하면 반환값이 void일 수가 없으니까 반환값을 변경해주는데 여기서 반환값을 ExamMybatis_dao.
	}
	
	//select
	public List<Product_dto> Conn_select() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select");
		sqlsession.close();
		return connresultsel; 
	}
	
	//insert 
	public void Conn_insert(Product_dto dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert", dto);
		sqlsession.commit(); //insert, update, delete는 확인이 필요하다.
		sqlsession.close();
	}
	
	//update 
	public List<Product_dto> Conn_update(Product_dto dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		//List<ExamMybatis_dto> connresultUpt= sqlsession.selectList("xml_update");
		sqlsession.commit();
		sqlsession.close();
		return null;//
	}
	//update_selectId
	public List<Product_dto> Conn_updateselect() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product_dto> connresultupd= sqlsession.selectList("xml_selectId");
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
