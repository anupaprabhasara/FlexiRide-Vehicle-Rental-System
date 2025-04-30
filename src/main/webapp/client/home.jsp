<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FlexiRide Sri Lanka</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">
  <!-- Client Header (Logged In User) -->
  <%@ include file="./partials/sessionheader.jsp"%>

  <!-- Hero Section -->
  <section class="relative w-full h-screen overflow-hidden">
  
    <!-- Background Image -->
    <img src="./assets/banner.jpg" 
         alt="Hero Background" 
         class="w-full h-full object-cover">
  
    <!-- Shadow Layer -->
    <div class="absolute inset-0 bg-gray-950 bg-opacity-40 dark:bg-opacity-60"></div>
  
    <!-- Content Layer -->
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4">
      <h1 class="text-4xl md:text-6xl font-bold text-white mb-4">
        Discover Your Perfect Ride
      </h1>
      <p class="text-lg md:text-2xl text-gray-300 mb-6">
        Rent Cars, SUVs, and Trucks at Best Rates with FlexiRide
      </p>
      <a href="#vehicles" 
         class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-8 py-3 rounded-full text-lg transition-all">
        Explore Vehicles
      </a>
    </div>
  
  </section>

  <section class="bg-gray-50 dark:bg-gray-900 py-16">
    <div class="max-w-7xl mx-auto px-6 text-center">
  
      <!-- Section Header -->
      <div class="flex justify-between items-center mb-12">
        <h2 class="text-3xl font-bold text-gray-800 dark:text-white">
          Popular Vehicles
        </h2>
        <a href="#"
           class="text-orange-500 hover:text-orange-600 flex items-center font-medium">
          View All Vehicles <i class="fas fa-arrow-right ml-2"></i>
        </a>
      </div>
  
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
  
        <!-- Vehicle 1 -->
        <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
          <div class="overflow-hidden">
            <img src="./1.jpg" alt="Swift Car" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
          </div>
          <div class="p-6 text-left space-y-3">
            <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">Swift Car</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400">Suzuki • Hatchback</p>
            <div class="flex items-center justify-between mt-4">
              <span class="text-lg font-semibold text-orange-500">Rs 25.00/km</span>
              <a href="vehicle-details.jsp?id=1" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                View Details
              </a>
            </div>
          </div>
        </div>
  
        <!-- Vehicle 2 -->
        <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
          <div class="overflow-hidden">
            <img src="./2.jpg" alt="Hilux Truck" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
          </div>
          <div class="p-6 text-left space-y-3">
            <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">Hilux Truck</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400">Toyota • Pickup</p>
            <div class="flex items-center justify-between mt-4">
              <span class="text-lg font-semibold text-orange-500">Rs 40.00/km</span>
              <a href="vehicle-details.jsp?id=2" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                View Details
              </a>
            </div>
          </div>
        </div>
  
        <!-- Vehicle 1 -->
        <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
            <div class="overflow-hidden">
              <img src="./1.jpg" alt="Swift Car" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
            </div>
            <div class="p-6 text-left space-y-3">
              <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">Swift Car</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400">Suzuki • Hatchback</p>
              <div class="flex items-center justify-between mt-4">
                <span class="text-lg font-semibold text-orange-500">Rs 25.00/km</span>
                <a href="vehicle-details.jsp?id=1" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                  View Details
                </a>
              </div>
            </div>
          </div>
    
          <!-- Vehicle 2 -->
          <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
            <div class="overflow-hidden">
              <img src="./2.jpg" alt="Hilux Truck" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
            </div>
            <div class="p-6 text-left space-y-3">
              <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">Hilux Truck</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400">Toyota • Pickup</p>
              <div class="flex items-center justify-between mt-4">
                <span class="text-lg font-semibold text-orange-500">Rs 40.00/km</span>
                <a href="vehicle-details.jsp?id=2" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                  View Details
                </a>
              </div>
            </div>
          </div><!-- Vehicle 1 -->
          <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
            <div class="overflow-hidden">
              <img src="./1.jpg" alt="Swift Car" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
            </div>
            <div class="p-6 text-left space-y-3">
              <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">Swift Car</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400">Suzuki • Hatchback</p>
              <div class="flex items-center justify-between mt-4">
                <span class="text-lg font-semibold text-orange-500">Rs 25.00/km</span>
                <a href="vehicle-details.jsp?id=1" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                  View Details
                </a>
              </div>
            </div>
          </div>
    
          <!-- Vehicle 2 -->
          <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
            <div class="overflow-hidden">
              <img src="./2.jpg" alt="Hilux Truck" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
            </div>
            <div class="p-6 text-left space-y-3">
              <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">Hilux Truck</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400">Toyota • Pickup</p>
              <div class="flex items-center justify-between mt-4">
                <span class="text-lg font-semibold text-orange-500">Rs 40.00/km</span>
                <a href="vehicle-details.jsp?id=2" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                  View Details
                </a>
              </div>
            </div>
          </div>
  
      </div>
    </div>
  </section>

  <!-- Optimized Footer -->
  <%@ include file="./partials/footer.jsp"%>
</body>
</html>