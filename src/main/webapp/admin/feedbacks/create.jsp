<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Create Vehicle | FlexiRide Admin</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">

  <%@ include file="../partials/mobilehidden.jsp" %>

  <div class="hidden md:flex h-screen">
    <%@ include file="../partials/sidebar.jsp" %>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
      <div class="flex items-center justify-between mb-6">
        <h2 class="text-2xl font-semibold">Create New Vehicle</h2>
        <a href="${pageContext.request.contextPath}/admin/vehicle" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-800 dark:text-gray-200 px-4 py-2 rounded">
          <i class="fas fa-arrow-left mr-2"></i> Back
        </a>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/admin/vehicle" class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 space-y-6">
        <input type="hidden" name="action" value="create"/>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <!-- Vehicle Name -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle Name</label>
            <input name="vehicle_name" type="text" placeholder="Enter vehicle name" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Brand -->
          <div>
            <label class="block mb-1 text-sm font-medium">Brand</label>
            <input name="brand" type="text" placeholder="Enter brand" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Model -->
          <div>
            <label class="block mb-1 text-sm font-medium">Model</label>
            <input name="model" type="text" placeholder="Enter model" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Vehicle Type -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle Type</label>
            <input name="vehicle_type" type="text" placeholder="e.g., Sedan, SUV" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Cost per Km -->
          <div>
            <label class="block mb-1 text-sm font-medium">Cost Per Km (Rs)</label>
            <input name="cost_per_km" type="number" step="0.01" min="0" placeholder="e.g., 20.00" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Availability Status -->
          <div>
            <label class="block mb-1 text-sm font-medium">Availability Status</label>
            <select name="availability_status" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Select status</option>
              <option value="Available">Available</option>
              <option value="Booked">Booked</option>
              <option value="Maintenance">Maintenance</option>
            </select>
          </div>

          <!-- Description (Full Width) -->
          <div class="lg:col-span-2">
            <label class="block mb-1 text-sm font-medium">Description</label>
            <textarea name="description" rows="4" placeholder="Enter vehicle description..." required
                      class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none"></textarea>
          </div>
        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-4 mt-6">
          <button type="reset" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-600 dark:hover:bg-gray-500 text-gray-800 dark:text-white px-4 py-2 rounded" onclick="window.location.href='vehicle';">
            Cancel
          </button>
          <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 rounded">
            <i class="fas fa-save mr-2"></i> Save Vehicle
          </button>
        </div>
      </form>
    </main>
  </div>

  <%@ include file="../scripts/main.jsp" %>

</body>
</html>