package com.TeamPro.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.action.Light_action;
import com.TeamPro.action.Product_InsertAction;
import com.TeamPro.action.Product_ListAction;
import com.TeamPro.action.Product_UpdateAction;
import com.TeamPro.action.Product_UpdateProAction;
import com.TeamPro.dto.ActionForward;

@WebServlet("*.bo")
public class Light_controller extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Light_action action=null;
		
		// check command
		if(command.equals("/productList.bo")) {
			action = new Product_ListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/productUpdate.bo")) {
			action = new Product_UpdateAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/productProUpdate.bo")) {
			action = new Product_UpdateProAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/productInsert.bo")) { // 0730 dhdbswl ¼öÁ¤
			action = new Product_InsertAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				System.out.println(e);
			}
		} 
 		
		// check forward
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}
}
