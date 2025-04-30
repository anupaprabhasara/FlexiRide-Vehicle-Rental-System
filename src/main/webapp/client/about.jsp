<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FlexiRide | About</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">
  
  <!-- Dynamic Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/header.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Page Hero Section -->
  <section class="relative w-full h-[480px] overflow-hidden">
    <!-- Background Image -->
    <img src="${pageContext.request.contextPath}/client/assets/about.jpg" 
         alt="All Vehicles Hero" 
         class="w-full h-full object-cover">
    
    <!-- Shadow Layer -->
    <div class="absolute inset-0 bg-gray-950 bg-opacity-40 dark:bg-opacity-60"></div>
  
    <!-- Content -->
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4">
      <h1 class="text-4xl md:text-5xl font-bold text-white mb-2">
        Our Story
      </h1>
      <p class="text-lg md:text-xl text-gray-300">
        Driven by Trust, Powered by Passion
      </p>
    </div>
  </section>
  
  <!-- About Us Section -->
  <section class="bg-gray-50 dark:bg-gray-900 py-20 transition duration-300">
    <div class="max-w-7xl mx-auto px-6 grid lg:grid-cols-2 gap-16 items-center">
  
      <!-- Text Content -->
      <div class="text-left">
        <h2 class="text-4xl font-bold text-gray-900 dark:text-white mb-6">
          About FlexiRide
        </h2>
        <p class="text-gray-600 dark:text-gray-400 mb-6 leading-relaxed text-lg">
          FlexiRide is your trusted partner for affordable, reliable, and premium vehicle rentals. 
          Whether you're planning a weekend getaway, business trip, or simply need a vehicle for a day,
          we have the perfect ride waiting for you.
        </p>
        <p class="text-gray-600 dark:text-gray-400 mb-8 leading-relaxed text-lg">
          With a wide fleet ranging from compact cars to heavy-duty trucks, we ensure seamless booking, competitive pricing, 
          and exceptional customer support, making your journey smooth and memorable.
        </p>
        <a href="#vehicles" 
           class="inline-block bg-orange-500 hover:bg-orange-600 text-white font-semibold px-6 py-3 rounded-full text-lg transition">
          Browse Vehicles
        </a>
      </div>
  
      <!-- Image or Illustration -->
      <div class="relative">
        <img src="${pageContext.request.contextPath}/client/assets/company.jpg" alt="About FlexiRide" class="rounded-2xl shadow-lg w-full object-cover">
        
        <!-- Decorative Element -->
        <div class="absolute top-0 left-0 w-24 h-24 bg-orange-500 rounded-full opacity-20 blur-3xl"></div>
      </div>
  
    </div>
  </section>

  <!-- Optimized Footer -->
  <%@ include file="./partials/footer.jsp"%>
</body>
</html>