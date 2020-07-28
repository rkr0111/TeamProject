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
	SqlSessionFactory sqlfactory; // �ܺ��� xml�� �ڹٿ��� ����ϱ� ���� �ʿ��� Ŭ����
	private static TeamPro_dao instance;
	//�̱��� ���� : ���α׷� ������ �ϰ� ���� �߿��� ��ü�� �� �� �����ϰ� ��� �����ϴ� ��. / ��� ��ü���� ����� ���� ����.
	//�̱��� ������ ����� ������ static�� �־�� �Ѵ�.
	
	public static TeamPro_dao getinstance() {
		if(instance == null) { // instance �� ��������� �ʾ��� �� 
			synchronized (TeamPro_dao.class) { // �������� �����ͼ� �ش� Ŭ������ instance�� �����.
				instance = new TeamPro_dao();
			}
		}
		// instance�� ������� ���� ��
		return instance; //������ �ϸ� ��ȯ���� void�� ���� �����ϱ� ��ȯ���� �������ִµ� ���⼭ ��ȯ���� ExamMybatis_dao.
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
		sqlsession.commit(); //insert, update, delete�� Ȯ���� �ʿ��ϴ�.
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
