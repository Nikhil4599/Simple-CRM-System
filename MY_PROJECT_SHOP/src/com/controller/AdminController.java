package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Product;
import com.model.DB;


public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		if(page==null) {
			request.getRequestDispatcher("admin/login.jsp").forward(request, response);
		}
		else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		if(page.equals("login_form")) {
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			if(username.equals("abc")&&password.equals("123")) {
				request.getRequestDispatcher("admin/index.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg","fill correctly");
				request.getRequestDispatcher("admin/login.jsp").forward(request, response);
			}
		}
		if(page.equals("delete")) {
			String id=request.getParameter("id");
			DB db=new DB();
			try {
				db.deleteProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg","product deleted");
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		if(page.equals("edit")){
			String id = request.getParameter("id");
			DB db= new DB();
			Product p = null;
			try {
				 p = db.fetchProduct(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);

		}
		
		if(page.equals("edit_product")){
			String pid = request.getParameter("id");
			String pname = request.getParameter("pname");
			String pprice = request.getParameter("pprice");
			String pdesc = request.getParameter("pdesc");
			String fid=request.getParameter("fid");
			String pcat_id=request.getParameter("pcat_id");
			
			Product p = new Product();
			p.setId(Integer.parseInt(pid));
			p.setPname(pname);
			p.setPprice(pprice);
			p.setPdesc(pdesc);
			p.setPcat_id(pcat_id);
			p.setFid(fid);
			
			DB account = new DB();
			try {
				account.updateProduct(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("msg", "Product Details Updated.. thanx");
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
	}

}
