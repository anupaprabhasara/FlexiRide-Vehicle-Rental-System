package com.flexiride.servlet;

import com.flexiride.model.Admin;
import com.flexiride.model.Vehicle;
import com.flexiride.service.AdminService;
import com.flexiride.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/vehicle")
public class VehicleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private VehicleService vehicleService;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        vehicleService = new VehicleService();
        adminService = new AdminService();
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
            request.setAttribute("vehicles", vehicleService.getAllVehicles());
            request.getRequestDispatcher("vehicles/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("vehicles/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Vehicle vehicle = vehicleService.getVehicle(id);
            request.setAttribute("vehicleData", vehicle);
            request.getRequestDispatcher("vehicles/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            vehicleService.deleteVehicle(id);
            response.sendRedirect("vehicle");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String vehicleName = request.getParameter("vehicle_name");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String vehicleType = request.getParameter("vehicle_type");
            double costPerKm = Double.parseDouble(request.getParameter("cost_per_km"));
            String availabilityStatus = request.getParameter("availability_status");
            String description = request.getParameter("description");

            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleName(vehicleName);
            vehicle.setBrand(brand);
            vehicle.setModel(model);
            vehicle.setVehicleType(vehicleType);
            vehicle.setCostPerKm(costPerKm);
            vehicle.setAvailabilityStatus(availabilityStatus);
            vehicle.setDescription(description);

            if (vehicleService.createVehicle(vehicle)) {
                response.sendRedirect("vehicle");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));
            String vehicleName = request.getParameter("vehicle_name");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String vehicleType = request.getParameter("vehicle_type");
            double costPerKm = Double.parseDouble(request.getParameter("cost_per_km"));
            String availabilityStatus = request.getParameter("availability_status");
            String description = request.getParameter("description");

            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleId(vehicleId);
            vehicle.setVehicleName(vehicleName);
            vehicle.setBrand(brand);
            vehicle.setModel(model);
            vehicle.setVehicleType(vehicleType);
            vehicle.setCostPerKm(costPerKm);
            vehicle.setAvailabilityStatus(availabilityStatus);
            vehicle.setDescription(description);

            if (vehicleService.updateVehicle(vehicle)) {
                response.sendRedirect("vehicle");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (vehicleService.deleteVehicle(id)) {
                response.sendRedirect("vehicle");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}