package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.model.Booking;
import com.flexiride.model.User;
import com.flexiride.model.Feedback;
import com.flexiride.service.AdminService;
import com.flexiride.service.BookingService;
import com.flexiride.service.UserService;
import com.flexiride.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("unused")
@WebServlet("/admin/feedback")
public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FeedbackService feedbackService;
    private AdminService adminService;
    private BookingService bookingService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        feedbackService = new FeedbackService();
        adminService = new AdminService();
        bookingService = new BookingService();
        userService = new UserService();
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
        } else if (action.equals("create")) {
            // Load dropdown data
            request.setAttribute("bookings", bookingService.getAllBookings());
            request.setAttribute("users", userService.getAllUsers());
            request.getRequestDispatcher("feedbacks/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Feedback feedback = feedbackService.getFeedback(id);

            request.setAttribute("feedbackData", feedback);
            request.setAttribute("bookings", bookingService.getAllBookings());
            request.setAttribute("users", userService.getAllUsers());
            request.getRequestDispatcher("feedbacks/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            feedbackService.deleteFeedback(id);
            response.sendRedirect("feedback");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            int bookingId = Integer.parseInt(request.getParameter("booking_id"));
            int userId = Integer.parseInt(request.getParameter("user_id"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comments = request.getParameter("comments");

            Feedback feedback = new Feedback();
            feedback.setBookingId(bookingId);
            feedback.setUserId(userId);
            feedback.setRating(rating);
            feedback.setComments(comments);

            if (feedbackService.createFeedback(feedback)) {
                response.sendRedirect("feedback");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            int feedbackId = Integer.parseInt(request.getParameter("feedback_id"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comments = request.getParameter("comments");

            Feedback feedback = new Feedback();
            feedback.setFeedbackId(feedbackId);
            feedback.setRating(rating);
            feedback.setComments(comments);

            if (feedbackService.updateFeedback(feedback)) {
                response.sendRedirect("feedback");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (feedbackService.deleteFeedback(id)) {
                response.sendRedirect("feedback");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}
