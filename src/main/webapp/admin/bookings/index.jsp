<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Booking Management | FlexiRide Admin</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">

  <%@ include file="../partials/mobilehidden.jsp"%>

  <div class="hidden md:flex h-screen">

    <%@ include file="../partials/sidebar.jsp"%>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
      <!-- Header with Search and Button -->
      <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-6">
        <h1 class="text-2xl font-semibold">
          Hello, <span class="text-orange-600 dark:text-orange-400 font-bold">${loggedAdmin.full_name} (${loggedAdmin.role})</span>
        </h1>

        <div class="flex flex-col sm:flex-row items-stretch sm:items-center gap-4 w-full md:w-auto">
          <!-- Search Bar -->
          <input
            type="text"
            id="search"
            placeholder="Search bookings..."
            class="w-full sm:w-64 px-4 py-2 border border-gray-300 dark:border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-orange-500 dark:bg-gray-700 dark:text-white"
          />

          <!-- Create Button -->
          <a href="booking?action=create" class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded w-full sm:w-auto text-center">
            <i class="fas fa-plus mr-2"></i> Add New Booking
          </a>
        </div>
      </div>

      <!-- Data Table -->
      <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
        <table class="min-w-full text-sm text-left">
          <thead class="bg-orange-500 text-white dark:bg-orange-600">
            <tr>
              <th class="px-6 py-3">#</th>
              <th class="px-6 py-3">User</th>
              <th class="px-6 py-3">Vehicle</th>
              <th class="px-6 py-3">Booking Date</th>
              <th class="px-6 py-3">Start Date</th>
              <th class="px-6 py-3">End Date</th>
              <th class="px-6 py-3">Status</th>
              <th class="px-6 py-3 desc-col hidden">Confirmed By</th> <!-- Hidden initially -->
              <th class="px-6 py-3">Actions</th>
            </tr>
          </thead>
          <tbody id="mainTable" class="divide-y divide-gray-200 dark:divide-gray-700">
            <c:forEach var="booking" items="${bookings}" varStatus="loop">
              <tr>
                <td class="px-6 py-4">${loop.index + 1}</td>
                <td class="px-6 py-4">${booking.userName}</td>
                <td class="px-6 py-4">${booking.vehicleName}</td>
                <td class="px-6 py-4">${booking.bookingDate}</td>
                <td class="px-6 py-4">${booking.rentalStartDate}</td>
                <td class="px-6 py-4">${booking.rentalEndDate}</td>
                <td class="px-6 py-4">${booking.status}</td>
                <td class="px-6 py-4 desc-col hidden">
                  <c:choose>
                    <c:when test="${empty booking.confirmedByName}">-</c:when>
                    <c:otherwise>${booking.confirmedByName}</c:otherwise>
                  </c:choose>
                </td>
                <td class="px-6 py-4 space-x-2">
                  <a href="booking?action=edit&id=${booking.bookingId}" class="text-yellow-500 hover:underline">
                    <i class="fas fa-edit"></i> Edit
                  </a>
                  <button class="text-red-500 hover:underline" onclick="confirmAction('booking?action=delete&id=${booking.bookingId}')">
                    <i class="fas fa-trash-alt"></i> Delete
                  </button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <%@ include file="../scripts/main.jsp"%>

  <!-- === New JS Only for Table Description Toggle === -->
  <script>
    function toggleDescriptionColumn(collapse) {
      const descCols = document.querySelectorAll('.desc-col');
      descCols.forEach(col => {
        if (collapse) {
          col.classList.remove('hidden'); // show description/extra columns
        } else {
          col.classList.add('hidden'); // hide description/extra columns
        }
      });
    }

    // Listen for Sidebar Width Change
    const observer = new MutationObserver(mutations => {
      mutations.forEach(mutation => {
        if (mutation.attributeName === 'class') {
          if (sidebar.classList.contains('w-20')) {
            toggleDescriptionColumn(true);
          } else {
            toggleDescriptionColumn(false);
          }
        }
      });
    });

    observer.observe(document.getElementById('sidebar'), { attributes: true });
  </script>

</body>
</html>