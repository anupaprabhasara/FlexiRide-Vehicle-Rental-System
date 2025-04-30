<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FlexiRide Sri Lanka</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/header.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Hero Section -->
  <section class="relative w-full h-screen overflow-hidden">
    <img src="${pageContext.request.contextPath}/client/assets/banner.jpg" alt="Hero Background" class="w-full h-full object-cover">
    <div class="absolute inset-0 bg-gray-950 bg-opacity-40 dark:bg-opacity-60"></div>
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4">
      <h1 class="text-4xl md:text-6xl font-bold text-white mb-4">Discover Your Perfect Ride</h1>
      <p class="text-lg md:text-2xl text-gray-300 mb-6">Rent Cars, SUVs, and Trucks at Best Rates with FlexiRide</p>
      <a href="#vehicles" class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-8 py-3 rounded-full text-lg transition-all">Explore Vehicles</a>
    </div>
  </section>

  <!-- Vehicle Section -->
  <section id="vehicles" class="bg-gray-50 dark:bg-gray-900 py-16">
    <div class="max-w-7xl mx-auto px-6 text-center">
      <div class="flex justify-between items-center mb-12">
        <h2 class="text-3xl font-bold text-gray-800 dark:text-white">Popular Vehicles</h2>
        <a href="${pageContext.request.contextPath}/vehicles" class="text-orange-500 hover:text-orange-600 flex items-center font-medium">
          View All Vehicles <i class="fas fa-arrow-right ml-2"></i>
        </a>
      </div>

      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="v" items="${vehicles}">
          <div class="bg-white dark:bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
            <div class="overflow-hidden">
              <img src="./assets/vehicles/${v.vehicleId}.jpg" alt="${v.vehicleName}" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500">
            </div>
            <div class="p-6 text-left space-y-3">
              <h3 class="text-xl font-bold text-gray-800 dark:text-white truncate">${v.vehicleName}</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400">${v.brand} • ${v.vehicleType}</p>
              <div class="flex items-center justify-between mt-4">
                <span class="text-lg font-semibold text-orange-500">Rs ${v.costPerKm}/km</span>
                <a href="view-vehicle?id=${v.vehicleId}" class="text-sm bg-orange-500 hover:bg-orange-600 text-white py-2 px-4 rounded-full transition">
                  View Details
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
        <c:if test="${empty vehicles}">
          <div class="col-span-full text-gray-400 dark:text-gray-300">No vehicles available.</div>
        </c:if>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />
</body>
</html>