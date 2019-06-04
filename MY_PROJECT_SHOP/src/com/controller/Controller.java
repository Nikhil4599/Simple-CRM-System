package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Product;
import com.beans.User;
import com.model.DB;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HttpSession session;
    private static	ArrayList<String> cartlist;
    private static ArrayList<Product> list=new ArrayList<>();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		if(page==null) {
			cartlist=new ArrayList<>();
			session=request.getSession();
			DB db=new DB();
			try {
				list=db.fetchProduts();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("list", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			doPost(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		if(page.equals("product")) {
			String id=request.getParameter("id");
			request.setAttribute("id", id);
			request.setAttribute("product",request.getParameter("value").toUpperCase() );
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}
		if(page.equals("home")) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if(page.equals("addCartIndex")) {
			String pid=request.getParameter("pid");
			cartlist.add(pid);
			request.setAttribute("msg", "added successful");
			session.setAttribute("cartlist",cartlist);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if(page.equals("addCartProduct")) {
			String pid=request.getParameter("pid");
			cartlist.add(pid);
			request.setAttribute("msg", "added successful");
			String id=request.getParameter("id");
			request.setAttribute("id", id);
			request.setAttribute("product",request.getParameter("value").toUpperCase() );
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}
		if(page.equals("cart")) {
			if(cartlist.size()!=0)
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			else
				request.setAttribute("warn", "PLEASE GET SOME ITEM FIRST");
				request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if(page.equals("form")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(page.equals("sign")) {
			request.getRequestDispatcher("sign.jsp").forward(request, response);
		}
		if(page.equals("sign_up")) {
			User u=new User();
			if(!request.getParameter("address").equals("") && !request.getParameter("email").equals("") &&
					!request.getParameter("username").equals("") &&!request.getParameter("password").equals("")&&!request.getParameter("name").equals(""))
			{
					u.setAddress(request.getParameter("address"));
					u.setEmail(request.getParameter("email"));
					u.setUsername(request.getParameter("username"));
					u.setPassword(request.getParameter("password"));
					u.setName(request.getParameter("name"));
					
				DB db=new DB();
				try {
					db.addUser(u);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("msg", "sign_up success!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			else {
				request.setAttribute("msg", "please fill all details");
				request.getRequestDispatcher("sign.jsp").forward(request, response);
			}
		}	
		if(page.equals("login")) {
			User u=new User();
			u.setUsername(request.getParameter("username"));
			u.setPassword(request.getParameter("password"));
			DB db=new DB();
			boolean status=false;
			try {
				status = db.checkUser(u);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				if(status) {
					request.getRequestDispatcher("confirm.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg", "invalid details");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
		}
		
	}
}
