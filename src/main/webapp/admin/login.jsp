<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login | FlexiRide Admin</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">

  <!-- Mobile-only message -->
  <div class="block md:hidden fixed inset-0 z-50 bg-white dark:bg-gray-900 flex items-center justify-center text-center p-6">
    <div>
      <h2 class="text-xl font-semibold text-red-600 dark:text-red-400 mb-2">Mobile View Not Supported</h2>
      <p class="text-gray-700 dark:text-gray-300">Please use a desktop or larger screen to access this website for the best experience.</p>
    </div>
  </div>

  <div class="hidden md:flex min-h-screen items-center justify-center px-6">
    <div class="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-8 w-full max-w-md">

      <div class="text-center mb-6">
        <h1 class="text-3xl font-bold text-orange-600 dark:text-orange-400">FlexiRide Admin</h1>
        <p class="text-gray-600 dark:text-gray-300 mt-1">Welcome back! Please login to continue.</p>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/admin/login" class="space-y-5">

		  <!-- Error Message -->
		  <c:if test="${not empty error}">
		    <div class="bg-red-500 bg-opacity-20 text-red-700 border border-red-500 p-3 rounded-lg text-sm mb-4 flex items-center">
		      <p><i class="fa-solid fa-exclamation-circle mr-2"></i>${error}</p>
		    </div>
		  </c:if>
		
		  <!-- Email Field -->
		  <div>
		    <label class="block text-sm mb-1" for="email">Email</label>
		    <div class="flex items-center border border-gray-300 dark:border-gray-700 rounded px-3 py-2 bg-white dark:bg-gray-700">
		      <i class="fas fa-envelope text-gray-400 mr-2"></i>
		      <input name="email" id="email" type="email"
		             placeholder="you@example.com"
		             value="${not empty email ? email : rememberedEmail}"
		             required
		             class="w-full bg-transparent focus:outline-none text-gray-800 dark:text-gray-100">
		    </div>
		  </div>
		
		  <!-- Password Field -->
		  <div>
		    <label class="block text-sm mb-1" for="password">Password</label>
		    <div class="flex items-center border border-gray-300 dark:border-gray-700 rounded px-3 py-2 bg-white dark:bg-gray-700 relative">
		      <i class="fas fa-lock text-gray-400 mr-2"></i>
		      <input name="password" id="password" type="password" placeholder="∗∗∗∗∗∗∗∗"
		             required
		             class="w-full bg-transparent focus:outline-none text-gray-800 dark:text-gray-100 pr-8">
		      <button type="button" id="togglePassword" class="absolute right-3 text-gray-500 hover:text-orange-500 focus:outline-none">
		        <i class="fas fa-eye" id="eyeIcon"></i>
		      </button>
		    </div>
		  </div>
		
		  <!-- Remember Me -->
		  <div class="flex items-center justify-between text-sm">
		    <label class="inline-flex items-center">
		      <input type="checkbox" name="remember" class="form-checkbox text-orange-500 dark:bg-gray-700"
		             <c:if test="${not empty rememberedEmail}">checked</c:if>>
		      <span class="ml-2">Remember me</span>
		    </label>
		    <a href="mailto:admin@flexiride.com" class="text-orange-500 hover:underline">Forgot password?</a>
		  </div>
		
		  <!-- Submit Button -->
		  <button type="submit" class="w-full bg-orange-500 hover:bg-orange-600 text-white py-2 rounded transition duration-200">
		    <i class="fas fa-sign-in-alt mr-2"></i> Login
		  </button>
		</form>
    </div>
  </div>

  <%@ include file="./scripts/login.jsp"%>

</body>
</html>