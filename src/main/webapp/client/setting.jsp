<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Profile Settings | FlexiRide Sri Lanka</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="/client/partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="/client/partials/header.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Profile Settings Layout -->
  <section class="bg-gray-50 dark:bg-gray-900 pt-32 pb-16">
    <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-8">

      <!-- Sidebar -->
      <aside class="bg-white dark:bg-gray-800 rounded-2xl shadow-md p-6 space-y-4">
        <h3 class="text-xl font-bold text-gray-800 dark:text-white mb-4">My Account</h3>
        <ul class="space-y-2">
          <li>
            <a href="${pageContext.request.contextPath}/profile"
               class="flex items-center gap-2 px-4 py-2 rounded-lg text-gray-800 dark:text-white hover:bg-orange-100 dark:hover:bg-orange-600/20 transition">
              <i class="fas fa-user-circle"></i> Profile
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/bookings"
               class="flex items-center gap-2 px-4 py-2 rounded-lg text-gray-800 dark:text-white hover:bg-orange-100 dark:hover:bg-orange-600/20 transition">
              <i class="fas fa-car"></i> Bookings
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/settings"
               class="flex items-center gap-2 px-4 py-2 rounded-lg bg-orange-100 dark:bg-orange-600/20 text-orange-700 dark:text-orange-300 font-semibold">
              <i class="fas fa-cog"></i> Settings
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/logout"
               class="flex items-center gap-2 px-4 py-2 rounded-lg text-red-600 hover:bg-red-100 dark:hover:bg-red-600/20 dark:text-red-400 transition">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </li>
        </ul>
      </aside>

      <!-- Settings Form -->
      <div class="md:col-span-3">
        <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 md:p-12 space-y-8">

          <div class="flex items-center space-x-4">
            <img src="https://ui-avatars.com/api/?name=${userFullName}&background=818CF8&color=fff" alt="Profile Avatar" class="w-15 h-15 rounded-full">
            <div>
              <h2 class="text-2xl font-bold text-gray-800 dark:text-white">${userFullName}</h2>
            </div>
          </div>

          <!-- Update Form -->
          <form action="${pageContext.request.contextPath}/settings" method="post" class="space-y-6">
            <div class="grid md:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Full Name</label>
                <input type="text" name="fullName" value="${user.fullName}" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
              </div>
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Email</label>
                <input type="email" name="email" value="${user.email}" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
              </div>
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Phone</label>
                <input type="text" name="phone" value="${user.phone}" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
              </div>
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">NIC</label>
                <input type="text" name="nicNumber" value="${user.nicNumber}" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
              </div>
              <div class="md:col-span-2">
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Address</label>
                <input type="text" name="address" value="${user.address}" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
              </div>
            </div>

            <!-- Action Buttons -->
            <div class="flex justify-between items-center pt-6">
              <button type="submit"
                      class="px-6 py-2 bg-orange-500 hover:bg-orange-600 text-white font-semibold rounded-lg shadow transition">
                Save Changes
              </button>

              <button type="submit" name="delete" value="true"
                      onclick="return confirm('Are you sure you want to delete your profile? This action cannot be undone.');"
                      class="px-6 py-2 bg-red-600 hover:bg-red-700 text-white font-semibold rounded-lg shadow transition">
                Delete Account
              </button>
            </div>
          </form>

        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="/client/partials/footer.jsp" />
</body>
</html>
