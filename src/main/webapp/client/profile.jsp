<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Profile | FlexiRide Sri Lanka</title>
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

  <!-- Profile with Sidebar Layout -->
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
               class="flex items-center gap-2 px-4 py-2 rounded-lg text-gray-800 dark:text-white hover:bg-orange-100 dark:hover:bg-orange-600/20 transition">
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

      <!-- Profile Info -->
      <div class="md:col-span-3">
        <c:if test="${not empty user}">
          <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 md:p-12 space-y-6">

            <!-- Profile Header -->
            <div class="flex items-center space-x-6">         
          		<img src="https://ui-avatars.com/api/?name=${userFullName}&background=818CF8&color=fff" alt="Profile" class="w-15 h-15 rounded-full">
              <div>
                <h2 class="text-2xl font-bold text-gray-800 dark:text-white">${user.fullName}</h2>
                
              </div>
            </div>

            <!-- Profile Details -->
            <div class="grid md:grid-cols-2 gap-6 pt-6">
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Email</label>
                <p class="text-gray-800 dark:text-white">${user.email}</p>
              </div>
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Phone</label>
                <p class="text-gray-800 dark:text-white">${user.phone}</p>
              </div>
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">NIC</label>
                <p class="text-gray-800 dark:text-white">${user.nicNumber}</p>
              </div>
              <div>
                <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Address</label>
                <p class="text-gray-800 dark:text-white">${user.address}</p>
              </div>
            </div>

            

          </div>
        </c:if>

        <c:if test="${empty user}">
          <div class="text-center text-gray-500 dark:text-gray-400 p-8 bg-white dark:bg-gray-800 rounded-xl shadow">
            Unable to load user profile.
          </div>
        </c:if>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="/client/partials/footer.jsp" />
</body>
</html>
