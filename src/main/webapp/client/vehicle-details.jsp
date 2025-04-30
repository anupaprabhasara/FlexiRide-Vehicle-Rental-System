<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FlexiRide | Vehicle Details</title>
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

  <!-- Vehicle Details Section -->
  <section class="pt-32 pb-16 bg-gray-50 dark:bg-gray-900">
    <div class="max-w-6xl mx-auto px-6 grid md:grid-cols-2 gap-12 items-start">

      <!-- Vehicle Image -->
      <div class="rounded-xl overflow-hidden shadow-lg">
        <img src="${pageContext.request.contextPath}/assets/vehicles/1.jpg" alt="Swift Car" class="w-full h-auto object-cover">
      </div>

      <!-- Vehicle Details -->
      <div class="space-y-6 text-left">
        <h2 class="text-3xl font-bold text-gray-900 dark:text-white">Swift Car</h2>

        <p class="text-lg text-gray-600 dark:text-gray-300">
          <strong>Brand:</strong> Suzuki<br>
          <strong>Model:</strong> 2022 LXI<br>
          <strong>Type:</strong> Hatchback<br>
          <strong>Rate:</strong> Rs 25.00 per km<br>
          <strong>Status:</strong> <span class="text-green-500 font-medium">Available</span>
        </p>

        <div class="text-base text-gray-700 dark:text-gray-400">
          <p><strong>Description:</strong></p>
          <p>
            The Swift is a compact and efficient city car that blends performance and economy. With its sporty design and comfortable interior,
            it’s perfect for both daily commutes and weekend trips.
          </p>
        </div>

        <div>
          <a href="booking.jsp?vehicle_id=1" class="inline-block mt-4 px-6 py-3 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition">
            Book Now
          </a>
        </div>
      </div>

    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />
</body>
</html>