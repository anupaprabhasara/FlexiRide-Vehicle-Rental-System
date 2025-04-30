package com.flexiride.servlet;

import com.flexiride.model.Booking;
import com.flexiride.model.Notification;
import com.flexiride.model.User;
import com.flexiride.model.Vehicle;
import com.flexiride.service.BookingService;
import com.flexiride.service.NotificationService;
import com.flexiride.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/view-vehicle")
public class ViewVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final NotificationService notificationService = new NotificationService();
    private final VehicleService vehicleService = new VehicleService();
    private final BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User loggedUser = (User) session.getAttribute("userSession");
        request.setAttribute("userFullName", loggedUser.getFullName());

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Vehicle ID is required");
            return;
        }

        int vehicleId;
        try {
            vehicleId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid vehicle ID format");
            return;
        }

        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
        if (vehicle == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Vehicle not found");
            return;
        }

        List<Notification> notifications = notificationService.getAllNotifications();

        // Check for success flag
        Boolean bookingSuccess = (Boolean) session.getAttribute("bookingSuccess");
        if (bookingSuccess != null) {
            request.setAttribute("bookingSuccess", true);
            session.removeAttribute("bookingSuccess");
        }

        request.setAttribute("isLoggedIn", true);
        request.setAttribute("notifications", notifications);
        request.setAttribute("vehicle", vehicle);

        request.getRequestDispatcher("/client/view-vehicle.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User loggedUser = (User) session.getAttribute("userSession");
        int userId = loggedUser.getUserId();

        try {
            int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));
            String startDate = request.getParameter("rental_start_date");
            String endDate = request.getParameter("rental_end_date");

            Booking booking = new Booking();
            booking.setUserId(userId);
            booking.setVehicleId(vehicleId);
            booking.setBookingDate(LocalDate.now().toString());
            booking.setRentalStartDate(startDate);
            booking.setRentalEndDate(endDate);
            booking.setStatus("Pending");
            booking.setConfirmedBy(null);

            bookingService.createBooking(booking);

            session.setAttribute("bookingSuccess", true);
            response.sendRedirect(request.getContextPath() + "/view-vehicle?id=" + vehicleId);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid vehicle ID format");
        }
    }
}