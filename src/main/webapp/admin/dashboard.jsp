<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard | FlexiRide</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">
  <%@ include file="./partials/mobilehidden.jsp" %>

  <div class="hidden md:flex h-screen">
    <%@ include file="./partials/sidebar.jsp" %>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
      <!-- Welcome Message -->
      <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-8">
        <h1 class="text-2xl font-semibold">
          Welcome back, <span class="text-orange-600 dark:text-orange-400 font-bold">${loggedAdmin.full_name} (${loggedAdmin.role})</span>
        </h1>
      </div>

      <!-- Dashboard Cards -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 text-center">
          <div class="text-3xl font-bold mb-2">${totalVehicles}</div>
          <div class="text-gray-600 dark:text-gray-400">Total Vehicles</div>
        </div>
        <div class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 text-center">
          <div class="text-3xl font-bold mb-2">${totalUsers}</div>
          <div class="text-gray-600 dark:text-gray-400">Total Users</div>
        </div>
        <div class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 text-center">
          <div class="text-3xl font-bold mb-2">${pendingBookings}</div>
          <div class="text-gray-600 dark:text-gray-400">Pending Bookings</div>
        </div>
        <div class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 text-center">
          <div class="text-3xl font-bold mb-2">${feedbacksReceived}</div>
          <div class="text-gray-600 dark:text-gray-400">Feedbacks Received</div>
        </div>
      </div>

      <!-- Latest Bookings Table -->
      <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
        <h2 class="text-xl font-semibold p-6 border-b border-gray-200 dark:border-gray-700">Latest Bookings</h2>
        <table class="min-w-full text-sm text-left">
          <thead class="bg-orange-500 text-white dark:bg-orange-600">
            <tr>
              <th class="px-6 py-3">#</th>
              <th class="px-6 py-3">User</th>
              <th class="px-6 py-3">Vehicle</th>
              <th class="px-6 py-3">Start Date</th>
              <th class="px-6 py-3">End Date</th>
              <th class="px-6 py-3">Status</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
            <c:forEach var="booking" items="${latestBookings}" varStatus="loop">
              <tr>
                <td class="px-6 py-4">${loop.index + 1}</td>
                <td class="px-6 py-4">${booking.userName}</td>
                <td class="px-6 py-4">${booking.vehicleName}</td>
                <td class="px-6 py-4">${booking.rentalStartDate}</td>
                <td class="px-6 py-4">${booking.rentalEndDate}</td>
                <td class="px-6 py-4">${booking.status}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

    </main>
  </div>

  <%@ include file="./scripts/main.jsp" %>

</body>
</html>