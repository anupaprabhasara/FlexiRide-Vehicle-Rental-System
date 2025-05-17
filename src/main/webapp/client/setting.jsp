<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Profile Settings | FlexiRide Sri Lanka</title>
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

<!-- Profile Settings Layout -->
<section class="bg-gray-50 dark:bg-gray-900 pt-32 pb-16">
  <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-8">

    <!-- Sidebar -->
    <aside class="bg-white dark:bg-gray-800 rounded-2xl shadow-md p-6 space-y-4">
      <h3 class="text-xl font-bold text-gray-800 dark:text-white mb-4">My Account</h3>
      <ul class="space-y-2">
        <li>
          <a href="${pageContext.request.contextPath}/profile"
             class="flex items-center gap-2 px-4 py-2 rounded-lg text-gray-800 dark:text-white hover:bg-orange-100 dark:hover:bg-orange-600/20 transition">
            <i class="fas fa-user-circle"></i> Profile
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/bookings"
             class="flex items-center gap-2 px-4 py-2 rounded-lg text-gray-800 dark:text-white hover:bg-orange-100 dark:hover:bg-orange-600/20 transition">
            <i class="fas fa-car"></i> Bookings
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/settings"
             class="flex items-center gap-2 px-4 py-2 rounded-lg bg-orange-100 dark:bg-orange-600/20 text-orange-700 dark:text-orange-300 font-semibold">
            <i class="fas fa-cog"></i> Settings
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/logout"
             class="flex items-center gap-2 px-4 py-2 rounded-lg text-red-600 hover:bg-red-100 dark:hover:bg-red-600/20 dark:text-red-400 transition">
            <i class="fas fa-sign-out-alt"></i> Logout
          </a>
        </li>
      </ul>
    </aside>

    <!-- Settings Form -->
    <div class="md:col-span-3">
      <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 md:p-12 space-y-8">

        <div class="flex items-center space-x-4">
          <img src="https://ui-avatars.com/api/?name=${userFullName}&background=818CF8&color=fff" alt="Profile Avatar" class="w-15 h-15 rounded-full">
          <div>
            <h2 class="text-2xl font-bold text-gray-800 dark:text-white">${userFullName}</h2>
          </div>
        </div>

        <!-- Update Form -->
        <form action="${pageContext.request.contextPath}/settings" method="post" class="space-y-6">
          <div class="grid md:grid-cols-2 gap-6">
            <div>
              <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Full Name</label>
              <input type="text" name="fullName" value="${user.fullName}" required
                     class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
            <div>
              <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Email</label>
              <input type="email" name="email" value="${user.email}" required
                     class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
            <div>
              <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Phone</label>
              <input type="text" name="phone" value="${user.phone}" required
                     class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
            <div>
              <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">NIC</label>
              <input type="text" name="nicNumber" value="${user.nicNumber}" required
                     class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
            <div class="md:col-span-2">
              <label class="block text-sm font-semibold text-gray-600 dark:text-gray-300">Address</label>
              <input type="text" name="address" value="${user.address}" required
                     class="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
          </div>

          <!-- Action Buttons -->
          <div class="flex justify-between items-center pt-6">
            <button type="submit"
                    class="px-6 py-2 bg-orange-500 hover:bg-orange-600 text-white font-semibold rounded-lg shadow transition" id="saveButton">
              Save Changes
            </button>

            <button type="button" name="delete"
                    class="px-6 py-2 bg-red-600 hover:bg-red-700 text-white font-semibold rounded-lg shadow transition">
              Delete Account
            </button>
          </div>
        </form>

      </div>
    </div>
  </div>
</section>

<!-- Client-side validation and deletion email confirmation -->
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("form");
    const submitBtn = document.getElementById("saveButton"); // Save Changes button
    const deleteBtn = form.querySelector("button[name='delete']");

    const fields = {
      fullName: form.querySelector("input[name='fullName']"),
      email: form.querySelector("input[name='email']"),
      phone: form.querySelector("input[name='phone']"),
      nic: form.querySelector("input[name='nicNumber']"),
      address: form.querySelector("input[name='address']"),
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

    const validatePhone = () => {
      const val = fields.phone.value.trim();
      const pattern = /^0\d{9}$/;
      if (val && !pattern.test(val)) {
        showError(fields.phone, "Phone must be 10 digits starting with 0.");
        errors.phone = true;
      } else {
        clearError(fields.phone);
        delete errors.phone;
      }
    };

    const validateNIC = () => {
      const val = fields.nic.value.trim();
      const pattern12 = /^\d{4}\d{8}$/;
      const patternOld = /^\d{9}[vV]$/;
      if (!pattern12.test(val) && !patternOld.test(val)) {
        showError(fields.nic, "NIC must be 12 digits (starting with year) or 9 digits followed by V/v.");
        errors.nic = true;
      } else {
        clearError(fields.nic);
        delete errors.nic;
      }
    };

    const updateSubmitState = () => {
      const hasErrors = Object.keys(errors).length > 0;
      const allFilled = Object.values(fields).every(f => f.value.trim() !== "");
      if (hasErrors || !allFilled) {
        submitBtn.disabled = true;
        submitBtn.classList.add("opacity-50", "cursor-not-allowed");
      } else {
        submitBtn.disabled = false;
        submitBtn.classList.remove("opacity-50", "cursor-not-allowed");
      }
    };

    fields.email.addEventListener("input", () => { validateEmail(); updateSubmitState(); });
    fields.phone.addEventListener("input", () => { validatePhone(); updateSubmitState(); });
    fields.nic.addEventListener("input", () => { validateNIC(); updateSubmitState(); });
    fields.fullName.addEventListener("input", updateSubmitState);
    fields.address.addEventListener("input", updateSubmitState);
    updateSubmitState();

    // Block numbers from being entered in the Full Name field
    fields.fullName.addEventListener("input", (event) => {
      if (/\d/.test(event.target.value)) {
        event.target.value = event.target.value.replace(/\d/g, '');
        showError(fields.fullName, "Numbers are not allowed in the name field.");
      } else {
        clearError(fields.fullName);
      }
    });

    // Block characters from being entered in the Phone field and display an error message
    fields.phone.addEventListener("input", (event) => {
      if (/[a-zA-Z]/.test(event.target.value)) {
        event.target.value = event.target.value.replace(/[a-zA-Z]/g, '');
        showError(fields.phone, "Characters are not allowed in the phone number field.");
      } else {
        clearError(fields.phone);
      }
      // Ensure the button is enabled even when characters are entered temporarily
       updateSubmitState();
    });

    // Deletion with email confirmation via AJAX
    deleteBtn.addEventListener("click", async (event) => {
      const userEmail = fields.email.value.trim();
      const inputEmail = prompt("To confirm deletion, please enter your email:");

      if (!inputEmail) {
        alert("Email confirmation cancelled.");
        return;
      }

      if (inputEmail.trim() !== userEmail) {
        alert("Email does not match. Account deletion aborted.");
        return;
      }

      try {
        const response = await fetch(form.action, {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: new URLSearchParams({
            delete: "true",
            email: userEmail
          })
        });

        if (response.redirected) {
          window.location.href = response.url;
        } else {
          const text = await response.text();
          alert("Unexpected server response:\n" + text);
        }
      } catch (error) {
        console.error("Account deletion failed:", error);
        alert("Something went wrong. Please try again.");
      }
    });

    // Save Changes button with confirmation prompt
    submitBtn.addEventListener("click", (event) => {
      event.preventDefault();  // Prevent form submission before confirmation

      // Show confirmation prompt
      const confirmSave = confirm("Are you sure you want to save the changes?");
      if (confirmSave) {
        form.submit();  // Submit the form if confirmed
      } else {
        alert("Changes were not saved.");
      }
    });
  });
</script>

  <!-- Footer -->
  <jsp:include page="/client/partials/footer.jsp" />
</body>
</html>

