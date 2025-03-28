<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Admin | FlexiRide Admin</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">

  <%@ include file="../partials/mobilehidden.jsp" %>

  <div class="hidden md:flex h-screen">
    <%@ include file="../partials/sidebar.jsp" %>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
      <div class="flex items-center justify-between mb-6">
        <h2 class="text-2xl font-semibold">Edit Admin</h2>
        <a href="${pageContext.request.contextPath}/admin/admin" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-800 dark:text-gray-200 px-4 py-2 rounded">
          <i class="fas fa-arrow-left mr-2"></i> Back
        </a>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/admin/admin" class="bg-white dark:bg-gray-800 shadow rounded-lg p-6 space-y-6" onsubmit="return validatePassword();">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="${adminData.id}"/>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <!-- Full Name -->
          <div>
            <label class="block mb-1 text-sm font-medium">Full Name</label>
            <input name="full_name" type="text" value="${adminData.full_name}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Email -->
          <div>
            <label class="block mb-1 text-sm font-medium">Email</label>
            <input name="email" type="email" value="${adminData.email}" required
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
          </div>

          <!-- Password -->
          <div>
            <label class="block mb-1 text-sm font-medium">Password</label>
            <div class="relative">
              <input name="password" id="password" type="password" value="${adminData.password}" required
                     oninput="checkPasswordStrength()"
                     class="w-full px-4 py-2 pr-10 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <button type="button" class="absolute inset-y-0 right-0 px-3 text-gray-600 dark:text-gray-300" onclick="togglePassword()">
                <i id="eyeIcon" class="fas fa-eye"></i>
              </button>
            </div>
            <div id="passwordError" class="text-xs text-red-500 mt-1 hidden">
              Must be at least 8 characters, include a number, uppercase and lowercase letter.
            </div>
          </div>

          <!-- Role -->
          <div>
            <label class="block mb-1 text-sm font-medium">Role</label>
            <select name="role" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none">
              <option value="">Select role</option>
              <option value="Admin" <c:if test="${adminData.role == 'Admin'}">selected</c:if>>Admin</option>
              <option value="Manager" <c:if test="${adminData.role == 'Manager'}">selected</c:if>>Manager</option>
            </select>
          </div>
        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-4">
          <button type="reset" class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-600 dark:hover:bg-gray-500 text-gray-800 dark:text-white px-4 py-2 rounded" onclick="window.location.href='admin';">
            Cancel
          </button>
          <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 rounded">
            <i class="fas fa-save mr-2"></i> Update Admin
          </button>
        </div>
      </form>
    </main>
  </div>

  <%@ include file="../scripts/main.jsp" %>

  <script>
    function togglePassword() {
      const passwordInput = document.getElementById("password");
      const eyeIcon = document.getElementById("eyeIcon");
      const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
      passwordInput.setAttribute("type", type);
      eyeIcon.classList.toggle("fa-eye");
      eyeIcon.classList.toggle("fa-eye-slash");
    }

    function checkPasswordStrength() {
      const password = document.getElementById("password").value;
      const error = document.getElementById("passwordError");
      const pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
      if (!pattern.test(password)) {
        error.classList.remove("hidden");
      } else {
        error.classList.add("hidden");
      }
    }

    function validatePassword() {
      const password = document.getElementById("password").value;
      const pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
      if (!pattern.test(password)) {
        alert("Password must be at least 8 characters long and include a number, uppercase and lowercase letter.");
        return false;
      }
      return true;
    }

    // Validate on page load
    window.onload = function() {
      checkPasswordStrength();
    }
  </script>

</body>
</html>