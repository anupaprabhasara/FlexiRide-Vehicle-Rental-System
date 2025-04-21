package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.service.AdminService;
import com.flexiride.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/notification")
public class NotificationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private NotificationService notificationService;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        notificationService = new NotificationService();
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
            request.setAttribute("notifications", notificationService.getAllNotifications());
            request.getRequestDispatcher("notifications/index.jsp").forward(request, response);
        }
    }
}