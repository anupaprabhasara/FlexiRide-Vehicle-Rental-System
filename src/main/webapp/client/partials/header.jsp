<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Client Header (For Not Logged In Users) -->
<header class="bg-gray-50 dark:bg-gray-800 shadow-md w-full fixed top-0 left-0 right-0 z-50">
  <div class="max-w-7xl mx-auto px-8 flex justify-between items-center h-16">
    
    <!-- Logo -->
    <div class="flex items-center gap-2 text-orange-600 dark:text-orange-400 font-bold text-2xl">
      <a href="${pageContext.request.contextPath}/"><i class="fas fa-car-side"></i><span class="ml-2">FlexiRide</span></a>
    </div>

    <!-- Navigation Menu -->
    <nav class="flex gap-8 items-center text-gray-700 dark:text-gray-200 text-base font-medium">
      <a href="${pageContext.request.contextPath}/" class="hover:text-orange-500 flex items-center gap-2">
        <i class="fas fa-home"></i> Home
      </a>
      <a href="${pageContext.request.contextPath}/vehicles" class="hover:text-orange-500 flex items-center gap-2">
        <i class="fas fa-car"></i> Vehicles
      </a>
      <a href="${pageContext.request.contextPath}/about" class="hover:text-orange-500 flex items-center gap-2">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="${pageContext.request.contextPath}/contact" class="hover:text-orange-500 flex items-center gap-2">
        <i class="fas fa-phone"></i> Contact Us
      </a>
    </nav>

    <!-- Login Button -->
    <div>
      <a href="${pageContext.request.contextPath}/login" 
         class="bg-orange-500 hover:bg-orange-600 text-white px-5 py-2 rounded flex items-center gap-2 font-semibold">
        <i class="fas fa-sign-in-alt"></i> Login
      </a>
    </div>

  </div>
</header>