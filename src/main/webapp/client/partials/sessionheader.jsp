<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Client Header (Logged In User) -->
<header class="bg-gray-50 dark:bg-gray-800 shadow-md w-full fixed top-0 left-0 right-0 z-50">
  <div class="max-w-7xl mx-auto px-8 flex justify-between items-center h-16">
    
    <!-- Logo -->
    <div class="flex items-center gap-2 text-orange-600 dark:text-orange-400 font-bold text-2xl">
      <a href=""><i class="fas fa-car-side"></i><span class="ml-2">FlexiRide</span></a>
    </div>

    <!-- Navigation Menu -->
    <nav class="flex gap-8 items-center text-gray-700 dark:text-gray-200 text-base font-medium">
      <a href="${pageContext.request.contextPath}/home" class="hover:text-orange-500 flex items-center gap-2">
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

    <!-- Right Section (Notifications + Profile) -->
    <div class="flex items-center gap-6 relative">

      <!-- Notifications -->
      <div class="relative">
        <button id="notifBtn" class="relative text-gray-700 dark:text-gray-200 hover:text-orange-500">
          <i class="fas fa-bell text-2xl"></i>
          <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">3</span>
        </button>
        
        <!-- Notifications Dropdown -->
        <div id="notifDropdown" class="hidden absolute right-0 mt-2 w-72 bg-white dark:bg-gray-700 shadow-lg rounded-lg overflow-hidden">
          <div class="p-4 border-b dark:border-gray-600 font-semibold">Notifications</div>
          <ul class="text-sm">
            <li class="p-4 hover:bg-gray-100 dark:hover:bg-gray-600">Your booking #123 has been confirmed.</li>
            <li class="p-4 hover:bg-gray-100 dark:hover:bg-gray-600">Vehicle "Hilux Truck" is ready for pickup.</li>
            <li class="p-4 hover:bg-gray-100 dark:hover:bg-gray-600">Feedback submitted successfully.</li>
          </ul>
        </div>
      </div>

      <!-- User Profile -->
      <div class="relative">
        <button id="profileBtn" class="flex items-center gap-2 focus:outline-none">
          <img src="https://ui-avatars.com/api/?name=Charlie+Ben&background=818CF8&color=fff" alt="Profile" class="w-10 h-10 rounded-full">
          <span class="font-semibold text-gray-700 dark:text-gray-200">Charlie Ben</span>
          <i class="fas fa-chevron-down text-gray-600 dark:text-gray-300"></i>
        </button>

        <!-- Profile Dropdown -->
        <div id="profileDropdown" class="hidden absolute right-0 mt-2 w-48 bg-white dark:bg-gray-700 shadow-lg rounded-lg overflow-hidden">
          <ul class="text-sm">
            <li><a href="#" class="block px-4 py-3 hover:bg-gray-100 dark:hover:bg-gray-600">Profile</a></li>
            <li><a href="#" class="block px-4 py-3 hover:bg-gray-100 dark:hover:bg-gray-600">My Bookings</a></li>
          </ul>
          <div class="border-t dark:border-gray-600"></div>
          <a href="logout" class="block px-4 py-3 text-red-500 hover:bg-red-100 dark:hover:bg-red-900/40">Logout</a>
        </div>
      </div>

    </div>

  </div>
</header>

<!-- Toggle Dropdowns Script -->
<script>
  const notifBtn = document.getElementById('notifBtn');
  const notifDropdown = document.getElementById('notifDropdown');
  const profileBtn = document.getElementById('profileBtn');
  const profileDropdown = document.getElementById('profileDropdown');

  notifBtn.addEventListener('click', () => {
    notifDropdown.classList.toggle('hidden');
    profileDropdown.classList.add('hidden'); // close profile dropdown when opening notif
  });

  profileBtn.addEventListener('click', () => {
    profileDropdown.classList.toggle('hidden');
    notifDropdown.classList.add('hidden'); // close notif dropdown when opening profile
  });

  // Close when clicking outside
  window.addEventListener('click', function(e) {
    if (!notifBtn.contains(e.target) && !notifDropdown.contains(e.target)) {
      notifDropdown.classList.add('hidden');
    }
    if (!profileBtn.contains(e.target) && !profileDropdown.contains(e.target)) {
      profileDropdown.classList.add('hidden');
    }
  });
</script>