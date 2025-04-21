<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Booking | FlexiRide Admin</title>
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
        <h2 class="text-2xl font-semibold">Edit Booking</h2>
        <a href="${pageContext.request.contextPath}/admin/booking" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-800 dark:text-gray-200 px-4 py-2 rounded">
          <i class="fas fa-arrow-left mr-2"></i> Back
        </a>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/admin/booking" class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 space-y-6">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="booking_id" value="${bookingData.bookingId}"/>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <!-- User -->
          <div>
            <label class="block mb-1 text-sm font-medium">User</label>
            <select name="user_id" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Select User</option>
              <c:forEach var="user" items="${users}">
                <option value="${user.userId}" <c:if test="${user.fullName == bookingData.userName}">selected</c:if>>${user.fullName}</option>
              </c:forEach>
            </select>
          </div>

          <!-- Vehicle -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle</label>
            <select name="vehicle_id" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Select Vehicle</option>
              <c:forEach var="vehicle" items="${vehicles}">
                <option value="${vehicle.vehicleId}" <c:if test="${vehicle.vehicleName == bookingData.vehicleName}">selected</c:if>>${vehicle.vehicleName}</option>
              </c:forEach>
            </select>
          </div>

          <!-- Booking Date -->
          <div>
            <label class="block mb-1 text-sm font-medium">Booking Date</label>
            <input name="booking_date" type="date" value="${bookingData.bookingDate}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Rental Start Date -->
          <div>
            <label class="block mb-1 text-sm font-medium">Rental Start Date</label>
            <input name="rental_start_date" type="date" value="${bookingData.rentalStartDate}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Rental End Date -->
          <div>
            <label class="block mb-1 text-sm font-medium">Rental End Date</label>
            <input name="rental_end_date" type="date" value="${bookingData.rentalEndDate}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Status -->
          <div>
            <label class="block mb-1 text-sm font-medium">Status</label>
            <select name="status" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Select Status</option>
              <option value="Pending" <c:if test="${bookingData.status == 'Pending'}">selected</c:if>>Pending</option>
              <option value="Confirmed" <c:if test="${bookingData.status == 'Confirmed'}">selected</c:if>>Confirmed</option>
              <option value="Cancelled" <c:if test="${bookingData.status == 'Cancelled'}">selected</c:if>>Cancelled</option>
              <option value="Completed" <c:if test="${bookingData.status == 'Completed'}">selected</c:if>>Completed</option>
            </select>
          </div>

          <!-- Confirmed By (Optional) -->
          <div>
            <label class="block mb-1 text-sm font-medium">Confirmed By (Optional)</label>
            <select name="confirmed_by"
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Not Confirmed Yet</option>
              <c:forEach var="admin" items="${admins}">
                <option value="${admin.id}" <c:if test="${admin.full_name == bookingData.confirmedByName}">selected</c:if>>${admin.full_name}</option>
              </c:forEach>
            </select>
          </div>
        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-4 mt-6">
          <button type="reset" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-600 dark:hover:bg-gray-500 text-gray-800 dark:text-white px-4 py-2 rounded" onclick="window.location.href='booking';">
            Cancel
          </button>
          <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 rounded">
            <i class="fas fa-save mr-2"></i> Update Booking
          </button>
        </div>
      </form>
    </main>
  </div>

  <%@ include file="../scripts/main.jsp" %>

</body>
</html>