<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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