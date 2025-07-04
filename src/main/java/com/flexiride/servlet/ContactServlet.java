package com.flexiride.servlet;

import com.flexiride.model.Notification;
import com.flexiride.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final NotificationService notificationService = new NotificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("userSession") != null) {
            isLoggedIn = true;
            List<Notification> notifications = notificationService.getAllNotifications();
            request.setAttribute("notifications", notifications);
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
        }

        request.setAttribute("isLoggedIn", isLoggedIn);
        request.getRequestDispatcher("/client/contact.jsp").forward(request, response);
    }
}