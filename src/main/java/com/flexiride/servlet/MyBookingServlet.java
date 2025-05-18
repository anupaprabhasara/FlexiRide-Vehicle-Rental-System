package com.flexiride.servlet;

import com.flexiride.model.Booking;
import com.flexiride.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/bookings")
public class MyBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userIdSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userIdSession");
        List<Booking> userBookings = bookingService.getBookingsByUser(userId);
        request.setAttribute("bookings", userBookings);
        request.getRequestDispatcher("/client/bookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            bookingService.deleteBooking(bookingId);
            response.sendRedirect("bookings");
        }
    }
}
