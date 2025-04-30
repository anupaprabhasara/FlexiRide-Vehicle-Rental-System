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
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get registration form data
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String nicNumber = request.getParameter("nic_number");
        String address = request.getParameter("address");

        // Create User object
        User newUser = new User();
        newUser.setFullName(fullName);
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setPhone(phone);
        newUser.setNicNumber(nicNumber);
        newUser.setAddress(address);

        // Attempt to create user
        boolean isCreated = userService.createUser(newUser);

        if (isCreated) {
            // Fetch the created user to retrieve ID and other details
            User registeredUser = userService.getAllUsers().stream()
                    .filter(u -> u.getEmail().equalsIgnoreCase(email))
                    .findFirst()
                    .orElse(null);

            if (registeredUser != null) {
                // Start session
                HttpSession session = request.getSession(true);
                session.setAttribute("userSession", registeredUser);
                session.setAttribute("userIdSession", registeredUser.getUserId());
                session.setAttribute("userFullNameSession", registeredUser.getFullName());
                session.setMaxInactiveInterval(30 * 60);

                response.sendRedirect(request.getContextPath() + "/");
                return;
            }
        }

        // On failure
        request.setAttribute("error", "Registration failed. Try again.");
        request.setAttribute("inputUser", newUser); // For repopulation
        request.getRequestDispatcher("/client/register.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Prevent access if already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userSession") != null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        request.getRequestDispatcher("/client/register.jsp").forward(request, response);
    }
}