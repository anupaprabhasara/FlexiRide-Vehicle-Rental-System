package com.flexiride.servlet;

import com.flexiride.model.User;
import com.flexiride.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String nicNumber = request.getParameter("nic_number");
        String address = request.getParameter("address");

        // Input validation
        String error = null;

        if (fullName == null || fullName.trim().isEmpty()) {
            error = "Full name is required.";
        } else if (email == null || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            error = "Invalid email format.";
        } else if (password == null || !password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}$")) {
            error = "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.";
        } else if (phone == null || !phone.matches("^0\\d{9}$")) {
            error = "Phone number must start with 0 and be 10 digits long.";
        } else if (nicNumber == null || !(nicNumber.matches("^\\d{12}$") || nicNumber.matches("^\\d{9}[vV]$"))) {
            error = "NIC must be 12 digits or 9 digits followed by 'V' or 'v'.";
        } else if (address == null || address.trim().isEmpty()) {
            error = "Address is required.";
        }

        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
            return;
        }

        // Create user object
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setNicNumber(nicNumber);
        user.setAddress(address);

        boolean success = userService.createUser(user);

        if (success) {
            request.setAttribute("success", "Registration successful! Redirecting to login...");
            request.setAttribute("redirect", true);
        } else {
            request.setAttribute("error", "Something went wrong. Please try again.");
        }

        request.getRequestDispatcher("/client/register.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            String lastPage = request.getHeader("Referer");
            if (lastPage == null || lastPage.contains("/register")) {
                lastPage = request.getContextPath() + "/client/login";
            }
            response.sendRedirect(lastPage);
        } else {
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
        }
    }
}
