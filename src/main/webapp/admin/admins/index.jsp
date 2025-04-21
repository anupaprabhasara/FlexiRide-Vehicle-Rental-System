<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Management | FlexiRide Admin</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    .transition-width {
      transition: width 0.3s ease;
    }
  </style>
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
            placeholder="Search admins..."
            class="w-full sm:w-64 px-4 py-2 border border-gray-300 dark:border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-orange-500 dark:bg-gray-700 dark:text-white"
          />
    
          <!-- Create Button -->
          <a href="admin?action=create" class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded w-full sm:w-auto text-center">
            <i class="fas fa-plus mr-2"></i> Create New Admin
          </a>
        </div>
      </div>

      <!-- Data Table -->
      <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
        <table class="min-w-full text-sm text-left">
          <thead class="bg-orange-500 text-white dark:bg-orange-600">
            <tr>
              <th class="px-6 py-3">#</th>
              <th class="px-6 py-3">Name</th>
              <th class="px-6 py-3">Email</th>
              <th class="px-6 py-3">Role</th>
              <th class="px-6 py-3">Actions</th>
            </tr>
          </thead>
          <tbody id="mainTable" class="divide-y divide-gray-200 dark:divide-gray-700">
            <c:forEach var="admin" items="${admins}" varStatus="loop">
              <tr>
                <td class="px-6 py-4">${loop.index + 1}</td>
                <td class="px-6 py-4">${admin.full_name}</td>
                <td class="px-6 py-4">${admin.email}</td>
                <td class="px-6 py-4">${admin.role}</td>
                <td class="px-6 py-4 space-x-2">
                  <a href="admin?action=edit&id=${admin.id}" class="text-yellow-500 hover:underline">
                    <i class="fas fa-edit"></i> Edit
                  </a>
                  <button class="text-red-500 hover:underline" onclick="confirmAction('admin?action=delete&id=${admin.id}')">
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

</body>
</html>