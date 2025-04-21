package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.service.AdminService;
import com.flexiride.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/feedback")
public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FeedbackService feedbackService;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        feedbackService = new FeedbackService();
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

        // Get logged-in admin details
        int adminId = (int) session.getAttribute("adminId");
        Admin loggedInAdmin = adminService.getAdmin(adminId);
        request.setAttribute("loggedAdmin", loggedInAdmin);

        // Routing
        if (action == null) {
            request.setAttribute("feedbacks", feedbackService.getAllFeedbacks());
            request.getRequestDispatcher("feedbacks/index.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            feedbackService.deleteFeedback(id);
            response.sendRedirect("feedback");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (feedbackService.deleteFeedback(id)) {
                response.sendRedirect("feedback");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}
