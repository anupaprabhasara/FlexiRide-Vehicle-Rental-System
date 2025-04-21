package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final AdminService adminService = new AdminService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        Admin admin = authenticateAdmin(email, password);

        if (admin != null) {
            // Create session
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            session.setAttribute("adminId", admin.getId());
            session.setAttribute("fullName", admin.getFull_name());
            session.setAttribute("role", admin.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Handle "Remember Me"
            if ("on".equals(remember)) {
                Cookie rememberCookie = new Cookie("rememberEmail", email);
                rememberCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                rememberCookie.setPath(request.getContextPath());
                response.addCookie(rememberCookie);
            } else {
                Cookie removeCookie = new Cookie("rememberEmail", "");
                removeCookie.setMaxAge(0); // Delete cookie
                removeCookie.setPath(request.getContextPath());
                response.addCookie(removeCookie);
            }

            response.sendRedirect(request.getContextPath() + "/admin/admin");
        } else {
            // Failed login
            request.setAttribute("error", "Incorrect email or password!");
            request.setAttribute("email", email); // Keep the entered email
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            response.sendRedirect(request.getContextPath() + "/admin/admin");
            return;
        }

        // Read "Remember Me" cookie
        String rememberedEmail = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberEmail".equals(cookie.getName())) {
                    rememberedEmail = cookie.getValue();
                    break;
                }
            }
        }

        request.setAttribute("rememberedEmail", rememberedEmail);
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }

    private Admin authenticateAdmin(String email, String password) {
        List<Admin> admins = adminService.getAllAdmins();
        for (Admin admin : admins) {
            if (admin.getEmail().equalsIgnoreCase(email) && admin.getPassword().equals(password)) {
                return admin;
            }
        }
        return null;
    }
}