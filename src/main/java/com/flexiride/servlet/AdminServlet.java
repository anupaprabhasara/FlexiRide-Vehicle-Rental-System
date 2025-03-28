package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/admin")
public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
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

        // Role check (only 'Admin' role can access)
        if (!"Admin".equalsIgnoreCase(loggedInAdmin.getRole())) {
            response.setContentType("text/html");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('You do not have permission to access this page.');");
            response.getWriter().println("window.location = '" + request.getContextPath() + "/admin/dashboard';");
            response.getWriter().println("</script>");
            return;
        }

        // Routing
        if (action == null) {
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("admins/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("admins/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.getAdmin(id);
            request.setAttribute("adminData", admin);
            request.getRequestDispatcher("admins/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            adminService.deleteAdmin(id);
            response.sendRedirect("admin");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String fullName = request.getParameter("full_name");
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Admin admin = new Admin();
            admin.setFull_name(fullName);
            admin.setRole(role);
            admin.setEmail(email);
            admin.setPassword(password);

            if (adminService.createAdmin(admin)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String fullName = request.getParameter("full_name");
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Admin admin = new Admin();
            admin.setId(id);
            admin.setFull_name(fullName);
            admin.setRole(role);
            admin.setEmail(email);
            admin.setPassword(password);

            if (adminService.updateAdmin(admin)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (adminService.deleteAdmin(id)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}