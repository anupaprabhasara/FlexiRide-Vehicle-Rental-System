package com.flexiride.servlet;

import com.flexiride.model.Notification;
import com.flexiride.model.Vehicle;
import com.flexiride.service.NotificationService;
import com.flexiride.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final NotificationService notificationService = new NotificationService();
    private final VehicleService vehicleService = new VehicleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Vehicle> allVehicles = vehicleService.getAllVehicles();
        List<Vehicle> limitedVehicles = allVehicles.stream().limit(6).toList(); // Java 16+ (or use subList)
        request.setAttribute("vehicles", limitedVehicles);

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("userSession") != null) {
            isLoggedIn = true;
            List<Notification> notifications = notificationService.getAllNotifications();
            request.setAttribute("notifications", notifications);
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
        }

        request.setAttribute("isLoggedIn", isLoggedIn);
        request.getRequestDispatcher("/client/home.jsp").forward(request, response);
    }
}