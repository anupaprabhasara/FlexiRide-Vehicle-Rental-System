<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header class="bg-gray-50 dark:bg-gray-800 shadow-md w-full fixed top-0 left-0 right-0 z-50">
  <div class="max-w-7xl mx-auto px-8 flex justify-between items-center h-16">
    <div class="flex items-center gap-2 text-orange-600 dark:text-orange-400 font-bold text-2xl">
      <a href="${pageContext.request.contextPath}/"><i class="fas fa-car-side"></i><span class="ml-2">FlexiRide</span></a>
    </div>

    <nav class="flex gap-8 items-center text-gray-700 dark:text-gray-200 text-base font-medium">
      <a href="${pageContext.request.contextPath}/" class="hover:text-orange-500 flex items-center gap-2"><i class="fas fa-home"></i> Home</a>
      <a href="${pageContext.request.contextPath}/vehicles" class="hover:text-orange-500 flex items-center gap-2"><i class="fas fa-car"></i> Vehicles</a>
      <a href="${pageContext.request.contextPath}/about" class="hover:text-orange-500 flex items-center gap-2"><i class="fas fa-info-circle"></i> About Us</a>
      <a href="${pageContext.request.contextPath}/contact" class="hover:text-orange-500 flex items-center gap-2"><i class="fas fa-phone"></i> Contact Us</a>
    </nav>

    <div class="flex items-center gap-6 relative">
      <!-- Notifications -->
      <div class="relative">
        <button id="notifBtn" class="relative text-gray-700 dark:text-gray-200 hover:text-orange-500">
          <i class="fas fa-bell text-2xl"></i>
          <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">${fn:length(notifications)}</span>
        </button>
        <div id="notifDropdown" class="hidden absolute right-0 mt-2 w-72 bg-white dark:bg-gray-700 shadow-lg rounded-lg overflow-hidden z-50">
          <div class="p-4 border-b dark:border-gray-600 font-semibold">Notifications</div>
          <ul class="text-sm max-h-60 overflow-y-auto">
            <c:forEach var="note" items="${notifications}">
              <li class="p-4 hover:bg-gray-100 dark:hover:bg-gray-600">${note.message}</li>
            </c:forEach>
            <c:if test="${empty notifications}">
              <li class="p-4 text-gray-400 dark:text-gray-300">No notifications available</li>
            </c:if>
          </ul>
        </div>
      </div>

      <!-- Profile -->
      <div class="relative">
        <button id="profileBtn" class="flex items-center gap-2 focus:outline-none">
          <img src="https://ui-avatars.com/api/?name=${userFullName}&background=818CF8&color=fff" alt="Profile" class="w-10 h-10 rounded-full">
          <span class="font-semibold text-gray-700 dark:text-gray-200">${userFullName}</span>
          <i class="fas fa-chevron-down text-gray-600 dark:text-gray-300"></i>
        </button>
        <div id="profileDropdown" class="hidden absolute right-0 mt-2 w-48 bg-white dark:bg-gray-700 shadow-lg rounded-lg overflow-hidden">
          <ul class="text-sm">
            <li><a href="#" class="block px-4 py-3 hover:bg-gray-100 dark:hover:bg-gray-600">Profile</a></li>
            <li><a href="#" class="block px-4 py-3 hover:bg-gray-100 dark:hover:bg-gray-600">My Bookings</a></li>
            <li><a href="#" class="block px-4 py-3 hover:bg-gray-100 dark:hover:bg-gray-600">Settings</a></li>
          </ul>
          <div class="border-t dark:border-gray-600"></div>
          <a href="${pageContext.request.contextPath}/logout" class="block px-4 py-3 text-red-500 hover:bg-red-100 dark:hover:bg-red-900/40">Logout</a>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- Dropdown Script -->
<script>
  const notifBtn = document.getElementById('notifBtn');
  const notifDropdown = document.getElementById('notifDropdown');
  const profileBtn = document.getElementById('profileBtn');
  const profileDropdown = document.getElementById('profileDropdown');

  notifBtn.addEventListener('click', () => {
    notifDropdown.classList.toggle('hidden');
    profileDropdown.classList.add('hidden');
  });

  profileBtn.addEventListener('click', () => {
    profileDropdown.classList.toggle('hidden');
    notifDropdown.classList.add('hidden');
  });

  window.addEventListener('click', function(e) {
    if (!notifBtn.contains(e.target) && !notifDropdown.contains(e.target)) {
      notifDropdown.classList.add('hidden');
    }
    if (!profileBtn.contains(e.target) && !profileDropdown.contains(e.target)) {
      profileDropdown.classList.add('hidden');
    }
  });
</script>