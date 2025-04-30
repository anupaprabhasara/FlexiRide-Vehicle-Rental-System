package com.flexiride.servlet;

import com.flexiride.model.User;
import com.flexiride.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        User user = authenticateUser(email, password);

        if (user != null) {
            // Create session with distinct user session attributes
            HttpSession session = request.getSession(true);
            session.setAttribute("userSession", user);
            session.setAttribute("userIdSession", user.getUserId());
            session.setAttribute("userFullNameSession", user.getFullName());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Handle "Remember Me"
            if ("on".equals(remember)) {
                Cookie rememberCookie = new Cookie("rememberUserEmail", email);
                rememberCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                rememberCookie.setPath(request.getContextPath());
                response.addCookie(rememberCookie);
            } else {
                Cookie removeCookie = new Cookie("rememberUserEmail", "");
                removeCookie.setMaxAge(0); // Delete cookie
                removeCookie.setPath(request.getContextPath());
                response.addCookie(removeCookie);
            }

            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // Failed login
            request.setAttribute("error", "Incorrect email or password!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/client/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check user session using distinct attribute
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userSession") != null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        // Load remember cookie
        String rememberedEmail = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberUserEmail".equals(cookie.getName())) {
                    rememberedEmail = cookie.getValue();
                    break;
                }
            }
        }

        request.setAttribute("rememberedEmail", rememberedEmail);
        request.getRequestDispatcher("/client/login.jsp").forward(request, response);
    }

    private User authenticateUser(String email, String password) {
        List<User> users = userService.getAllUsers();
        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}