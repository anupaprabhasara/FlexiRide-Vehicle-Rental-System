<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Vehicle | FlexiRide Admin</title>
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
        <h2 class="text-2xl font-semibold">Edit Vehicle</h2>
        <a href="${pageContext.request.contextPath}/admin/vehicle" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-800 dark:text-gray-200 px-4 py-2 rounded">
          <i class="fas fa-arrow-left mr-2"></i> Back
        </a>
      </div>

      <!-- ===== Important: enctype added for file upload ===== -->
      <form method="post" action="${pageContext.request.contextPath}/admin/vehicle" enctype="multipart/form-data" class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 space-y-6">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="vehicle_id" value="${vehicleData.vehicleId}"/>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <!-- Vehicle Name -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle Name</label>
            <input name="vehicle_name" type="text" value="${vehicleData.vehicleName}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Brand -->
          <div>
            <label class="block mb-1 text-sm font-medium">Brand</label>
            <input name="brand" type="text" value="${vehicleData.brand}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Model -->
          <div>
            <label class="block mb-1 text-sm font-medium">Model</label>
            <input name="model" type="text" value="${vehicleData.model}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Vehicle Type -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle Type</label>
            <input name="vehicle_type" type="text" value="${vehicleData.vehicleType}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Cost Per Km -->
          <div>
            <label class="block mb-1 text-sm font-medium">Cost Per Km (Rs)</label>
            <input name="cost_per_km" type="number" step="0.01" min="0" value="${vehicleData.costPerKm}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Availability Status -->
          <div>
            <label class="block mb-1 text-sm font-medium">Availability Status</label>
            <select name="availability_status" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Select status</option>
              <option value="Available" <c:if test="${vehicleData.availabilityStatus == 'Available'}">selected</c:if>>Available</option>
              <option value="Booked" <c:if test="${vehicleData.availabilityStatus == 'Booked'}">selected</c:if>>Booked</option>
              <option value="Maintenance" <c:if test="${vehicleData.availabilityStatus == 'Maintenance'}">selected</c:if>>Maintenance</option>
            </select>
          </div>

          <!-- Description (Full Width) -->
          <div class="lg:col-span-2">
            <label class="block mb-1 text-sm font-medium">Description</label>
            <textarea name="description" rows="4" required
                      class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">${vehicleData.description}</textarea>
          </div>

          <!-- Upload Vehicle Image (New) -->
          <div class="lg:col-span-2">
            <label class="block mb-1 text-sm font-medium">Vehicle Image</label>
            <input type="file" name="vehicle_image" accept="image/*"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-orange-500 file:text-white hover:file:bg-orange-600">
            <div class="mt-3">
              <img src="${pageContext.request.contextPath}/assets/vehicles/${vehicleData.vehicleId}.jpg" alt="Vehicle Image" class="w-48 h-32 object-cover rounded">
            </div>
          </div>
        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-4 mt-6">
          <button type="reset" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-600 dark:hover:bg-gray-500 text-gray-800 dark:text-white px-4 py-2 rounded" onclick="window.location.href='vehicle';">
            Cancel
          </button>
          <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 rounded">
            <i class="fas fa-save mr-2"></i> Update Vehicle
          </button>
        </div>
      </form>
    </main>
  </div>

  <%@ include file="../scripts/main.jsp" %>

</body>
</html>