package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.model.Booking;
import com.flexiride.model.User;
import com.flexiride.model.Vehicle;
import com.flexiride.service.AdminService;
import com.flexiride.service.BookingService;
import com.flexiride.service.UserService;
import com.flexiride.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("unused")
@WebServlet("/admin/booking")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private AdminService adminService;
    private UserService userService;
    private VehicleService vehicleService;

    @Override
    public void init() throws ServletException {
        super.init();
        bookingService = new BookingService();
        adminService = new AdminService();
        userService = new UserService();
        vehicleService = new VehicleService();
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
            request.setAttribute("bookings", bookingService.getAllBookings());
            request.getRequestDispatcher("bookings/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            // Load dropdown data
            request.setAttribute("users", userService.getAllUsers());
            request.setAttribute("vehicles", vehicleService.getAllVehicles());
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("bookings/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Booking booking = bookingService.getBooking(id);

            request.setAttribute("bookingData", booking);
            request.setAttribute("users", userService.getAllUsers());
            request.setAttribute("vehicles", vehicleService.getAllVehicles());
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("bookings/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            bookingService.deleteBooking(id);
            response.sendRedirect("booking");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));
            String bookingDate = request.getParameter("booking_date");
            String rentalStartDate = request.getParameter("rental_start_date");
            String rentalEndDate = request.getParameter("rental_end_date");
            String status = request.getParameter("status");
            String confirmedByParam = request.getParameter("confirmed_by");
            Integer confirmedBy = (confirmedByParam != null && !confirmedByParam.isEmpty()) ? Integer.parseInt(confirmedByParam) : null;

            Booking booking = new Booking();
            booking.setUserId(userId);
            booking.setVehicleId(vehicleId);
            booking.setBookingDate(bookingDate);
            booking.setRentalStartDate(rentalStartDate);
            booking.setRentalEndDate(rentalEndDate);
            booking.setStatus(status);
            booking.setConfirmedBy(confirmedBy);

            if (bookingService.createBooking(booking)) {
                response.sendRedirect("booking");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            int bookingId = Integer.parseInt(request.getParameter("booking_id"));
            int userId = Integer.parseInt(request.getParameter("user_id"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));
            String bookingDate = request.getParameter("booking_date");
            String rentalStartDate = request.getParameter("rental_start_date");
            String rentalEndDate = request.getParameter("rental_end_date");
            String status = request.getParameter("status");
            String confirmedByParam = request.getParameter("confirmed_by");
            Integer confirmedBy = (confirmedByParam != null && !confirmedByParam.isEmpty()) ? Integer.parseInt(confirmedByParam) : null;

            Booking booking = new Booking();
            booking.setBookingId(bookingId);
            booking.setUserId(userId);
            booking.setVehicleId(vehicleId);
            booking.setBookingDate(bookingDate);
            booking.setRentalStartDate(rentalStartDate);
            booking.setRentalEndDate(rentalEndDate);
            booking.setStatus(status);
            booking.setConfirmedBy(confirmedBy);

            if (bookingService.updateBooking(booking)) {
                response.sendRedirect("booking");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (bookingService.deleteBooking(id)) {
                response.sendRedirect("booking");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}