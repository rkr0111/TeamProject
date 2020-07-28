package com.TeamPro.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.action.Light_action;
import com.TeamPro.dto.ActionForward;

@WebServlet("*.bo")
public class Light_controller extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Light_action action=null;
		
		if(command.equals("/DB_product_select.bo")) {
			action = new ProductSelectAction();
		}
			
	}
}
