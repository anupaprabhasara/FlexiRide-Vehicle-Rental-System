<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
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
        <img src="${pageContext.request.contextPath}/assets/vehicles/${vehicle.vehicleId}.jpg"
             alt="${vehicle.vehicleName}" class="w-full h-auto object-cover">
      </div>

      <!-- Vehicle Details -->
      <div class="space-y-6 text-left">
        <h2 class="text-3xl font-bold text-gray-900 dark:text-white">${vehicle.vehicleName}</h2>

        <p class="text-lg text-gray-600 dark:text-gray-300">
          <strong>Brand:</strong> ${vehicle.brand}<br>
          <strong>Model:</strong> ${vehicle.model}<br>
          <strong>Type:</strong> ${vehicle.vehicleType}<br>
          <strong>Rate:</strong> Rs ${vehicle.costPerKm} per km<br>
          <strong>Status:</strong>
          <c:choose>
            <c:when test="${vehicle.availabilityStatus == 'Available'}">
              <span class="text-green-500 font-medium">Available</span>
            </c:when>
            <c:otherwise>
              <span class="text-red-500 font-medium">${vehicle.availabilityStatus}</span>
            </c:otherwise>
          </c:choose>
        </p>

        <div class="text-base text-gray-700 dark:text-gray-400">
          <p><strong>Description:</strong></p>
          <p>${vehicle.description}</p>
        </div>

        <!-- Success Message -->
		<c:if test="${bookingSuccess}">
		  <div class="text-sm font-medium px-4 py-3 rounded border
		              bg-green-100 text-green-800 border-green-400/70
		              dark:bg-green-900/25 dark:text-green-200 dark:border-green-600">
		    Booking successful!
		  </div>
		</c:if>
		
		<!-- Booking Error Message -->
		<div id="bookingError"
		     class="hidden text-sm font-medium px-4 py-3 rounded border
		            bg-red-100 text-red-800 border-red-400/50
		            dark:bg-red-900/25 dark:text-red-200 dark:border-red-600">
		  Booking is not allowed. Vehicle is not available.
		</div>

        <!-- Book Now Button -->
        <div>
          <button id="bookNowBtn"
                  data-status="${vehicle.availabilityStatus}"
                  class="inline-block mt-4 px-6 py-3 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition">
            Book Now
          </button>
        </div>
      </div>
    </div>
  </section>

  <!-- Booking Modal -->
  <div id="rentalModal" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-xl max-w-md w-full p-6">
      <h2 class="text-2xl font-bold mb-4 text-gray-800 dark:text-white">Book Vehicle</h2>

      <form method="post" class="space-y-4">
        <input type="hidden" name="vehicle_id" value="${vehicle.vehicleId}" />

        <div>
          <label for="rental_start_date" class="block mb-1 text-gray-700 dark:text-gray-300">Rental Start Date</label>
          <input type="date" id="rental_start_date" name="rental_start_date" required
                 class="w-full p-2 rounded border dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          <span id="startDateError" class="text-sm text-red-500 hidden">Start date cannot be in the past</span>
        </div>

        <div>
          <label for="rental_end_date" class="block mb-1 text-gray-700 dark:text-gray-300">Rental End Date</label>
          <input type="date" id="rental_end_date" name="rental_end_date" required
                 class="w-full p-2 rounded border dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          <span id="endDateError" class="text-sm text-red-500 hidden">End date must be after the start date</span>
        </div>

        <div class="flex justify-end space-x-3 pt-4">
          <button type="button" onclick="closeModal()" class="px-4 py-2 bg-gray-300 dark:bg-gray-600 text-gray-900 dark:text-white rounded hover:bg-gray-400 dark:hover:bg-gray-500">Cancel</button>
          <button type="submit" id="submitBtn" class="px-4 py-2 bg-orange-500 text-white font-semibold rounded hover:bg-orange-600">Book Now</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />

  <!-- JavaScript -->
  <script>
    const modal = document.getElementById('rentalModal');
    const bookBtn = document.getElementById('bookNowBtn');
    const bookingError = document.getElementById('bookingError');
    const rentalForm = document.querySelector('form');

    const rentalStartInput = document.getElementById('rental_start_date');
    const rentalEndInput = document.getElementById('rental_end_date');
    const startDateError = document.getElementById('startDateError');
    const endDateError = document.getElementById('endDateError');
    const submitBtn = document.getElementById('submitBtn');

    bookBtn.addEventListener('click', () => {
      const status = bookBtn.getAttribute('data-status');
      if (status !== 'Available') {
        bookingError.classList.remove('hidden');
        return;
      }
      bookingError.classList.add('hidden');
      modal.classList.remove('hidden');
    });

    function closeModal() {
      modal.classList.add('hidden');
    }

    function validateDates() {
      let isValid = true;
      const today = new Date().toISOString().split('T')[0];
      const startDate = rentalStartInput.value;
      const endDate = rentalEndInput.value;

      if (startDate && startDate < today) {
        startDateError.classList.remove('hidden');
        isValid = false;
      } else {
        startDateError.classList.add('hidden');
      }

      if (startDate && endDate && endDate <= startDate) {
        endDateError.classList.remove('hidden');
        isValid = false;
      } else {
        endDateError.classList.add('hidden');
      }

      submitBtn.disabled = !isValid;
      return isValid;
    }

    rentalStartInput.addEventListener('input', validateDates);
    rentalEndInput.addEventListener('input', validateDates);

    rentalForm.addEventListener('submit', (e) => {
      if (!validateDates()) e.preventDefault();
    });
  </script>
</body>
</html>