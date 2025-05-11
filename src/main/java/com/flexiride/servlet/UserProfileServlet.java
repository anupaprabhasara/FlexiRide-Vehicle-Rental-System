package com.flexiride.servlet;

import com.flexiride.model.User;
import com.flexiride.model.Notification;
import com.flexiride.service.UserService;
import com.flexiride.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private transient UserService userService;
    private transient NotificationService notificationService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userSession") == null || session.getAttribute("userIdSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int userId = Integer.parseInt(session.getAttribute("userIdSession").toString());

            User user = userService.getUserById(userId);
            if (user == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
                return;
            }

            List<Notification> notifications = notificationService.getAllNotifications();

            request.setAttribute("user", user);
            request.setAttribute("notifications", notifications);
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
            // Removed: request.setAttribute("userCreatedAt", ...);

            request.getRequestDispatcher("/client/profile.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
        }
    }
}
