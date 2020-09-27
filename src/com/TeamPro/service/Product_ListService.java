package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_ListService {
	// 0730 dhdbswl 추가
	public int getListCount(String product_category) throws Exception {
		int listCount = 0;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		listCount = prodao.select_ListCount(product_category);
		return listCount;
	}
	// 0730 dhdbswl 수정
	public List<Product_dto> getProductList(int page, int limit, String product_category) throws Exception {
		List<Product_dto> productList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_proList(page, limit, product_category);
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < productList.size(); i++) {
			prodto.setProduct_name(productList.get(i).getProduct_name());
			prodto.setProduct_category(productList.get(i).getProduct_category());
			prodto.setProduct_color(productList.get(i).getProduct_color());
			prodto.setProduct_img(productList.get(i).getProduct_img());
			prodto.setProduct_contents(productList.get(i).getProduct_contents());
			list.add(prodto);
		}
		return productList;
	}
	// sort new - 0927 dhdbswl 수정
	public List<Product_dto> getProductListSortNew(int page, int limit, String product_category) throws Exception {
		List<Product_dto> productList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_proListSortNew(page, limit, product_category);
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < productList.size(); i++) {
			prodto.setProduct_name(productList.get(i).getProduct_name());
			prodto.setProduct_category(productList.get(i).getProduct_category());
			prodto.setProduct_color(productList.get(i).getProduct_color());
			prodto.setProduct_img(productList.get(i).getProduct_img());
			prodto.setProduct_contents(productList.get(i).getProduct_contents());
			list.add(prodto);
		}
		return productList;
	}
	// sort price ASC - 0927 dhdbswl 수정
	public List<Product_dto> getProductListSortASC(int page, int limit, String product_category) throws Exception {
		List<Product_dto> productList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_proListSortASC(page, limit, product_category);
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < productList.size(); i++) {
			prodto.setProduct_name(productList.get(i).getProduct_name());
			prodto.setProduct_category(productList.get(i).getProduct_category());
			prodto.setProduct_color(productList.get(i).getProduct_color());
			prodto.setProduct_img(productList.get(i).getProduct_img());
			prodto.setProduct_contents(productList.get(i).getProduct_contents());
			list.add(prodto);
		}
		return productList;
	}
	// sort price DESC - 0927 dhdbswl 수정
	public List<Product_dto> getProductListSortDESC(int page, int limit, String product_category) throws Exception {
		List<Product_dto> productList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_proListSortDESC(page, limit, product_category);
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < productList.size(); i++) {
			prodto.setProduct_name(productList.get(i).getProduct_name());
			prodto.setProduct_category(productList.get(i).getProduct_category());
			prodto.setProduct_color(productList.get(i).getProduct_color());
			prodto.setProduct_img(productList.get(i).getProduct_img());
			prodto.setProduct_contents(productList.get(i).getProduct_contents());
			list.add(prodto);
		}
		return productList;
	}
}
