<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDate" %>

<%
    String today = LocalDate.now().toString();
    request.setAttribute("today", today);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>My Bookings | FlexiRide</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="/client/partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="/client/partials/header.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Bookings with Sidebar Layout -->
  <section class="bg-gray-50 dark:bg-gray-900 pt-32 pb-16">
    <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-8">

      <!-- Sidebar -->
      <jsp:include page="/client/partials/sidebar.jsp" />

      <!-- Booking Info -->
      <div class="md:col-span-3">
        <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 md:p-10 space-y-6">
          <h2 class="text-2xl font-bold text-gray-800 dark:text-white">My Bookings</h2>
          <p class="text-gray-600 dark:text-gray-300">Manage your bookings and leave feedback</p>

          <c:choose>
            <c:when test="${empty bookings}">
              <div class="text-center text-gray-500 dark:text-gray-400">You have no bookings.</div>
            </c:when>
            <c:otherwise>
              <div class="overflow-x-auto">
                <table class="w-full text-sm text-left border-collapse mt-4">
                  <thead class="bg-orange-500 text-white">
                    <tr>
                      <th class="px-6 py-3">Vehicle</th>
                      <th class="px-6 py-3">Start Date</th>
                      <th class="px-6 py-3">End Date</th>
                      <th class="px-6 py-3">Status</th>
                      <th class="px-6 py-3 text-center">Actions</th>
                    </tr>
                  </thead>
                  <tbody class="bg-gray-100 dark:bg-gray-800 divide-y divide-gray-300 dark:divide-gray-700">
                    <c:forEach var="b" items="${bookings}">
                      <tr>
                        <td class="px-6 py-4 whitespace-nowrap">${b.vehicleName}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${b.rentalStartDate}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${b.rentalEndDate}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${b.status}</td>
                        <td class="px-6 py-4">
                          <div class="flex justify-center items-center gap-6">
                            <c:if test="${b.status != 'Confirmed' && b.status != 'Completed'}">
                              <form action="deleteBooking" method="post">
                                <input type="hidden" name="bookingId" value="${b.bookingId}" />
                                <button class="text-red-500 hover:underline" onclick="return confirm('Cancel booking?');">
                                  Delete
                                </button>
                              </form>
                            </c:if>
                            <c:if test="${b.status == 'Completed' || fn:substring(b.rentalEndDate, 0, 10) lt today}">
                              <a href="${pageContext.request.contextPath}/user/feedback?bookingId=${b.bookingId}" class="text-blue-500 hover:underline">
                                Feedback
                              </a>
                            </c:if>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="/client/partials/footer.jsp" />
</body>
</html>