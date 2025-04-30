<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register | FlexiRide Sri Lanka</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">

  <!-- Header -->
  <%@ include file="./partials/header.jsp" %>

  <!-- Registration Section -->
  <main class="bg-gray-50 dark:bg-gray-900 pt-32 pb-16">
    <div class="max-w-md mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-xl overflow-hidden">

      <!-- Title -->
      <div class="bg-white dark:bg-gray-800 px-6 pt-12 text-center">
        <h2 class="text-3xl font-bold text-gray-800/90 dark:text-gray-100/90">Create Your Account</h2>
      </div>

      <!-- Form -->
      <form action="${pageContext.request.contextPath}/register" method="post" class="px-6 py-8 space-y-6">

        <!-- Error -->
        <c:if test="${not empty error}">
          <div class="text-sm font-medium px-4 py-3 rounded border 
                      bg-red-100 text-red-800 border-red-400/50 
                      dark:bg-red-900/25 dark:text-red-200 dark:border-red-600">
            ${error}
          </div>
        </c:if>

        <!-- Full Name -->
        <div>
          <label for="full_name" class="block text-sm font-medium mb-1 text-gray-700 dark:text-gray-300">Full Name</label>
          <input type="text" name="full_name" id="full_name" required
            value="${inputUser.fullName}" placeholder="John Doe"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Email -->
        <div>
          <label for="email" class="block text-sm font-medium mb-1 text-gray-700 dark:text-gray-300">Email</label>
          <input type="email" name="email" id="email" required
            value="${inputUser.email}" placeholder="you@example.com"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Password -->
        <div>
          <label for="password" class="block text-sm font-medium mb-1 text-gray-700 dark:text-gray-300">Password</label>
          <input type="password" name="password" id="password" required
            placeholder="••••••••"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Phone -->
        <div>
          <label for="phone" class="block text-sm font-medium mb-1 text-gray-700 dark:text-gray-300">Phone</label>
          <input type="text" name="phone" id="phone" required
            value="${inputUser.phone}" placeholder="07X-XXXXXXX"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- NIC Number -->
        <div>
          <label for="nic_number" class="block text-sm font-medium mb-1 text-gray-700 dark:text-gray-300">NIC Number</label>
          <input type="text" name="nic_number" id="nic_number" required
            value="${inputUser.nicNumber}" placeholder="200012345678"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Address -->
        <div>
          <label for="address" class="block text-sm font-medium mb-1 text-gray-700 dark:text-gray-300">Address</label>
          <textarea name="address" id="address" required rows="2"
            placeholder="No 123, Main Street, Colombo"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500">${inputUser.address}</textarea>
        </div>

        <!-- Submit Button -->
        <button type="submit"
          class="w-full py-3 bg-orange-500 hover:bg-orange-600 text-white font-semibold rounded-lg transition-all duration-300">
          <i class="fas fa-user-plus mr-2"></i> Register
        </button>

        <!-- Login Link -->
        <div class="text-center text-sm text-gray-500 dark:text-gray-400 pt-4">
          Already have an account?
          <a href="login.jsp" class="text-orange-500 hover:text-orange-600 font-medium">Login</a>
        </div>
      </form>
    </div>
  </main>
  <!-- Footer -->
  <%@ include file="./partials/footer.jsp" %>
  
  <!-- ... your existing HTML and form above remains unchanged ... -->


<script>
  document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("form");
    const registerBtn = form.querySelector("button[type='submit']");
    
    const fields = {
      fullName: document.getElementById("full_name"),
      email: document.getElementById("email"),
      password: document.getElementById("password"),
      phone: document.getElementById("phone"),
      nic: document.getElementById("nic_number"),
      address: document.getElementById("address"),
    };

    const errors = {};

    const showError = (field, message) => {
      let err = field.nextElementSibling;
      if (!err || !err.classList.contains("error-msg")) {
        err = document.createElement("div");
        err.className = "text-sm text-red-600 mt-1 error-msg";
        field.parentNode.appendChild(err);
      }
      err.innerText = message;
    };

    const clearError = (field) => {
      let err = field.nextElementSibling;
      if (err && err.classList.contains("error-msg")) {
        err.remove();
      }
    };

    const validateEmail = () => {
      const val = fields.email.value.trim();
      const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!pattern.test(val)) {
        showError(fields.email, "Enter a valid email.");
        errors.email = true;
      } else {
        clearError(fields.email);
        delete errors.email;
      }
    };

    const validatePassword = () => {
      const val = fields.password.value;
      const pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
      if (!pattern.test(val)) {
        showError(fields.password, "Min 8 chars with uppercase, lowercase, number, and symbol.");
        errors.password = true;
      } else {
        clearError(fields.password);
        delete errors.password;
      }
    };

    const validatePhone = () => {
      const val = fields.phone.value.trim();
      const pattern = /^0\d{9}$/;
      if (!pattern.test(val)) {
        showError(fields.phone, "Phone must start with 0 and be 10 digits.");
        errors.phone = true;
      } else {
        clearError(fields.phone);
        delete errors.phone;
      }
    };

    const validateNIC = () => {
      const val = fields.nic.value.trim();
      const pattern12 = /^\d{12}$/;
      const patternOld = /^\d{9}[vV]$/;
      if (!pattern12.test(val) && !patternOld.test(val)) {
        showError(fields.nic, "NIC must be 12 digits or 9 digits + V/v.");
        errors.nic = true;
      } else {
        clearError(fields.nic);
        delete errors.nic;
      }
    };

    const updateRegisterState = () => {
      const hasErrors = Object.keys(errors).length > 0;
      const allFilled = Object.values(fields).every(f => f.value.trim() !== "");
      if (hasErrors || !allFilled) {
        registerBtn.disabled = true;
        registerBtn.classList.add("opacity-50", "cursor-not-allowed");
      } else {
        registerBtn.disabled = false;
        registerBtn.classList.remove("opacity-50", "cursor-not-allowed");
      }
    };

    fields.email.addEventListener("input", () => { validateEmail(); updateRegisterState(); });
    fields.password.addEventListener("input", () => { validatePassword(); updateRegisterState(); });
    fields.phone.addEventListener("input", () => { validatePhone(); updateRegisterState(); });
    fields.nic.addEventListener("input", () => { validateNIC(); updateRegisterState(); });
    fields.fullName.addEventListener("input", updateRegisterState);
    fields.address.addEventListener("input", updateRegisterState);

    // Set initial state
    registerBtn.disabled = true;
    registerBtn.classList.add("opacity-50", "cursor-not-allowed");
  });
</script>




  

</body>
</html>

    