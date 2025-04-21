package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.model.User;
import com.flexiride.service.AdminService;
import com.flexiride.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/user")
public class UserServlet extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;
	    private UserService userService;
	    private AdminService adminService;
	    
	    @Override
	    public void init() throws ServletException {
	        super.init();
	        userService = new UserService();
	        adminService = new AdminService();
	    }
	    
	
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        // Session check
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("admin") == null) {
	            response.sendRedirect(request.getContextPath() + "/admin/login");
	            return;
	        }

	        // Get logged-in admin details from DB
	        int adminId = (int) session.getAttribute("adminId");
	        Admin loggedInAdmin = adminService.getAdmin(adminId);
	        request.setAttribute("loggedAdmin", loggedInAdmin);
	    
	   
	 // Routing
        if (action == null) {
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("admins/index.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            adminService.deleteAdmin(id);
            response.sendRedirect("admin");
        }
	   }
	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	         if (action.equals("delete")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            if (adminService.deleteAdmin(id)) {
	                response.sendRedirect("admin");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        }
	    }
}


