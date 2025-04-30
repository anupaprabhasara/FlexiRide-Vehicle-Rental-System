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
          <button id="bookNowBtn" class="inline-block mt-4 px-6 py-3 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition">
            Book Now
          </button>
        </div>
      </div>

    </div>
  </section>

  <!-- Rental Date Modal -->
  <div id="rentalModal" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-xl max-w-md w-full p-6">
      <h2 class="text-2xl font-bold mb-4 text-gray-800 dark:text-white">Book Vehicle</h2>

      <form id="rentalForm" class="space-y-4">
        <!-- Rental Start Date -->
        <div>
          <label for="rental_start_date" class="block mb-1 text-gray-700 dark:text-gray-300">Rental Start Date</label>
          <input type="date" id="rental_start_date" name="rental_start_date" required class="w-full p-2 rounded border dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          <span id="startDateError" class="text-sm text-red-500 hidden">Start date cannot be in the past</span>
        </div>

        <!-- Rental End Date -->
        <div>
          <label for="rental_end_date" class="block mb-1 text-gray-700 dark:text-gray-300">Rental End Date</label>
          <input type="date" id="rental_end_date" name="rental_end_date" required class="w-full p-2 rounded border dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          <span id="endDateError" class="text-sm text-red-500 hidden">End date must be after the start date</span>
        </div>

        <!-- Buttons -->
        <div class="flex justify-end space-x-3 pt-4">
          <button type="button" onclick="closeModal()" class="px-4 py-2 rounded bg-gray-300 dark:bg-gray-600 hover:bg-gray-400 dark:hover:bg-gray-500 text-gray-800 dark:text-white">Cancel</button>
          <button type="submit" id="submitBtn" class="px-4 py-2 rounded bg-orange-500 hover:bg-orange-600 text-white font-semibold">Book Now</button>
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
    const rentalForm = document.getElementById('rentalForm');

    const rentalStartInput = document.getElementById('rental_start_date');
    const rentalEndInput = document.getElementById('rental_end_date');
    const startDateError = document.getElementById('startDateError');
    const endDateError = document.getElementById('endDateError');
    const submitBtn = document.getElementById('submitBtn');

    // Open modal
    bookBtn.addEventListener('click', function () {
      modal.classList.remove('hidden');
    });

    // Close modal
    function closeModal() {
      modal.classList.add('hidden');
    }

    // Validate function
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

    rentalForm.addEventListener('submit', function (e) {
      e.preventDefault(); // Prevent actual form submission

      if (validateDates()) {
        closeModal();
        // Data can be sent to backend here using fetch() or via a Servlet later
        console.log("Form ready to send: ", {
          startDate: rentalStartInput.value,
          endDate: rentalEndInput.value
        });
      }
    });
  </script>

</body>
</html>