package com.flexiride.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class UserLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.removeAttribute("userSession");
            session.removeAttribute("userIdSession");
            session.removeAttribute("userFullNameSession");
        }

        // Remove user-specific "remember me" cookie
        Cookie rememberCookie = new Cookie("rememberUserEmail", "");
        rememberCookie.setMaxAge(0);
        rememberCookie.setPath(request.getContextPath());
        response.addCookie(rememberCookie);

        response.sendRedirect(request.getContextPath() + "/");
    }
}