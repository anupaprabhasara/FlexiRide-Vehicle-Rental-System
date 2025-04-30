<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FlexiRide | Contact</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
  <style>
    /* Fix map z-index issue */
    #map {
      z-index: 1;
    }
    .leaflet-control-container {
      z-index: 0;
    }
  </style>
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">
  <!-- Client Header (Logged In User) -->
  <%@ include file="./partials/sessionheader.jsp"%>

  <!-- Page Hero Section -->
  <section class="relative w-full h-[480px] overflow-hidden">
    <!-- Background Image -->
    <img src="./assets/contact.jpg" 
         alt="All Vehicles Hero" 
         class="w-full h-full object-cover">
    
    <!-- Shadow Layer -->
    <div class="absolute inset-0 bg-gray-950 bg-opacity-50 dark:bg-opacity-70"></div>
  
    <!-- Content -->
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4">
      <h1 class="text-4xl md:text-5xl font-bold text-white mb-2">
        Get In Touch
      </h1>
      <p class="text-lg md:text-xl text-gray-300">
        We're here to assist you anytime
      </p>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="bg-gray-50 dark:bg-gray-900 text-gray-800 dark:text-gray-300 py-20 transition duration-300">
    <div class="max-w-7xl mx-auto px-6 grid lg:grid-cols-2 gap-16 items-start">

      <!-- Contact Info -->
      <div>
        <h2 class="text-3xl font-bold text-gray-900 dark:text-white mb-6">Contact Information</h2>
        <p class="text-gray-600 dark:text-gray-400 mb-8 leading-relaxed">
          Reach out to FlexiRide for reservations, support, or partnership inquiries. We are available on all weekdays.
        </p>
        <ul class="space-y-6 text-base">
          <li class="flex gap-4 items-start">
            <i class="fas fa-map-marker-alt text-orange-500 text-xl mt-1"></i>
            <div>
              <strong class="block text-gray-900 dark:text-white">Address</strong>
              <span class="text-gray-700 dark:text-gray-400">123 FlexiRide Street, Colombo 07, Sri Lanka</span>
            </div>
          </li>
          <li class="flex gap-4 items-start">
            <i class="fas fa-phone-alt text-orange-500 text-xl mt-1"></i>
            <div>
              <strong class="block text-gray-900 dark:text-white">Phone</strong>
              <span class="text-gray-700 dark:text-gray-400">+94 76 123 4567</span>
            </div>
          </li>
          <li class="flex gap-4 items-start">
            <i class="fas fa-envelope text-orange-500 text-xl mt-1"></i>
            <div>
              <strong class="block text-gray-900 dark:text-white">Email</strong>
              <span class="text-gray-700 dark:text-gray-400">support@flexiride.lk</span>
            </div>
          </li>
          <li class="flex gap-4 items-start">
            <i class="fas fa-clock text-orange-500 text-xl mt-1"></i>
            <div>
              <strong class="block text-gray-900 dark:text-white">Working Hours</strong>
              <span class="text-gray-700 dark:text-gray-400">Monday - Friday: 9:00 AM to 6:00 PM</span>
            </div>
          </li>
        </ul>
      </div>

      <!-- Map -->
      <div>
        <h2 class="text-2xl font-semibold text-gray-900 dark:text-white mb-4">Locate Us</h2>
        <div id="map" class="w-full h-80 rounded-xl shadow-lg border border-gray-300 dark:border-gray-700 overflow-hidden"></div>
      </div>

    </div>
  </section>
  
  <!-- Map JS -->
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const map = L.map('map').setView([6.9271, 79.8612], 13);
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { attribution: '© OpenStreetMap', maxZoom: 18 }).addTo(map);
      L.marker([6.9271, 79.8612]).addTo(map).bindPopup('<b>FlexiRide HQ</b><br>Colombo 07, Sri Lanka').openPopup();
    });
  </script>

  <!-- Optimized Footer -->
  <%@ include file="./partials/footer.jsp"%>
</body>
</html>