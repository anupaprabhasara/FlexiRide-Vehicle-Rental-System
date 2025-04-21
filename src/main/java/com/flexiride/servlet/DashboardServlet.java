package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.model.Booking;
import com.flexiride.service.AdminService;
import com.flexiride.service.DashboardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DashboardService dashboardService;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        dashboardService = new DashboardService();
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        // Get logged-in admin
        int adminId = (int) session.getAttribute("adminId");
        Admin loggedInAdmin = adminService.getAdmin(adminId);
        request.setAttribute("loggedAdmin", loggedInAdmin);

        // Set dashboard stats
        request.setAttribute("totalVehicles", dashboardService.getTotalVehicles());
        request.setAttribute("totalUsers", dashboardService.getTotalUsers());
        request.setAttribute("pendingBookings", dashboardService.getPendingBookings());
        request.setAttribute("feedbacksReceived", dashboardService.getFeedbacksReceived());

        // Set latest bookings
        List<Booking> latestBookings = dashboardService.getLatestBookings();
        request.setAttribute("latestBookings", latestBookings);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}