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

@WebServlet("/settings")
public class SettingsServlet extends HttpServlet {

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
        if (session == null || session.getAttribute("userIdSession") == null) {
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

            request.getRequestDispatcher("/client/setting.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userIdSession") == null) {
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

            // Handle deletion
            String deleteRequest = request.getParameter("delete");
            if ("true".equalsIgnoreCase(deleteRequest)) {
                userService.deleteUser(userId);
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Update user profile information
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String nicNumber = request.getParameter("nicNumber");
            String address = request.getParameter("address");

            user.setFullName(fullName);
            user.setEmail(email);
            user.setPhone(phone);
            user.setNicNumber(nicNumber);
            user.setAddress(address);

            userService.updateUser(user);
            session.setAttribute("userFullNameSession", fullName);

            response.sendRedirect(request.getContextPath() + "/profile");

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/settings?error=true");
        }
    }
}
