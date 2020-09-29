package com.TeamPro.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.action.Buy_nowListAction;
import com.TeamPro.action.Buy_nowformAction;
import com.TeamPro.action.Customer_DownloadAction;
import com.TeamPro.action.Customer_DownloadFileAction;
import com.TeamPro.action.Index_ListAction;
import com.TeamPro.action.Light_action;
import com.TeamPro.action.MD_randomListAction;
import com.TeamPro.action.MD_weatherAction;
import com.TeamPro.action.Product_DeleteAction;
import com.TeamPro.action.Product_DetailAction;
import com.TeamPro.action.Product_InsertAction;
import com.TeamPro.action.Product_ListAction;
import com.TeamPro.action.Product_UpdateAction;
import com.TeamPro.action.Review_AllListAction;
import com.TeamPro.action.Review_CommentInsertAction;
import com.TeamPro.action.Review_DetailAction;
import com.TeamPro.action.Review_ReplyInsertAction;
import com.TeamPro.action.Review_likeUpdateAction;
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
		System.out.println("연결 controller : " + action);
		
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
		}else if(command.equals("/productInsert.bo")) { // 0730 dhdbswl 수정
			action = new Product_InsertAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/productDelete.bo")) { // 0730 rkr0111 수정
			action = new Product_DeleteAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/productDetailSelect.bo")) { // 0730 rkr0111 수정
			action = new Product_DetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/mdRandomList.bo")) { // 0811 dhdbswl 수정
			action = new MD_randomListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/mdWeatherList.bo")) { // 0826 dhdbswl 수정
			action = new MD_weatherAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/buyNowList.bo")) { // 0819 dhdbswl 수정
			action = new Buy_nowListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/buyCustomerinfo.bo")) { // 0826 dhdbswl 수정
			action = new Buy_nowformAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/reviewAllList.bo")) { // 0914 dhdbswl 수정
			action = new Review_AllListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/reviewDetailSelect.bo")) { // 0915 dhdbswl 수정
			action = new Review_DetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/reviewComment.bo")) { // 0916 dhdbswl 수정
			action = new Review_CommentInsertAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/reviewReply.bo")) { // 0916 dhdbswl 수정
			action = new Review_ReplyInsertAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/reivewLikeUpdate.bo")) { // 0917 dhdbswl 수정
			action = new Review_likeUpdateAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/customerDownload.bo")) { // 0917 dhdbswl 수정
			action = new Customer_DownloadAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/customerDownloadfile.bo")) { // 0917 dhdbswl 수정
			action = new Customer_DownloadFileAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/indexList.bo")) { // 0929 dhdbswl 수정
			System.out.println("연결 controller");
			action = new Index_ListAction();
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
