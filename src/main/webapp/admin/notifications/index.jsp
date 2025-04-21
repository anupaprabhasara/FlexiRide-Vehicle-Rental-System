<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Notification Management | FlexiRide Admin</title>
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
            placeholder="Search notifications..."
            class="w-full sm:w-64 px-4 py-2 border border-gray-300 dark:border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-orange-500 dark:bg-gray-700 dark:text-white"
          />
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
              <th class="px-6 py-3">Message</th> <!-- Always visible -->
              <th class="px-6 py-3 date-col hidden">Created At</th> <!-- Date column hidden by default -->
            </tr>
          </thead>
          <tbody id="mainTable" class="divide-y divide-gray-200 dark:divide-gray-700">
            <c:forEach var="notification" items="${notifications}" varStatus="loop">
              <tr>
                <td class="px-6 py-4">${loop.index + 1}</td>
                <td class="px-6 py-4">${notification.userName}</td>
                <td class="px-6 py-4">${notification.vehicleName}</td>
                <td class="px-6 py-4">${notification.message}</td> <!-- Always show message -->
                <td class="px-6 py-4 date-col hidden">${notification.createdAt}</td> <!-- Created At, hidden initially -->
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <%@ include file="../scripts/main.jsp"%>

  <!-- === New JS Only for Table Date Toggle === -->
  <script>
    function toggleDateColumn(collapse) {
      const dateCols = document.querySelectorAll('.date-col');
      dateCols.forEach(col => {
        if (collapse) {
          col.classList.remove('hidden'); // Show created_at in collapsed
        } else {
          col.classList.add('hidden'); // Hide created_at in expanded
        }
      });
    }

    // Sidebar observer
    const observer = new MutationObserver(mutations => {
      mutations.forEach(mutation => {
        if (mutation.attributeName === 'class') {
          if (sidebar.classList.contains('w-20')) {
            toggleDateColumn(true); // Sidebar collapsed -> show created_at
          } else {
            toggleDateColumn(false); // Sidebar expanded -> hide created_at
          }
        }
      });
    });

    observer.observe(document.getElementById('sidebar'), { attributes: true });
  </script>

</body>
</html>