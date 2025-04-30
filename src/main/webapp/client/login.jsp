<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FlexiRide Sri Lanka</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">
  <!-- Client Header (Logged In User) -->
  <%@ include file="./partials/header.jsp"%>

  <!-- Login Section -->
  <main class="bg-gray-50 dark:bg-gray-900 pt-32 pb-16">
    <div class="max-w-md mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-xl overflow-hidden">

      <!-- Card Header -->
      <div class="bg-orange-500 dark:bg-gray-800 px-6 pt-12 text-center">
        <h2 class="text-3xl font-bold text-white">Login to FlexiRide</h2>
      </div>

      <!-- Login Form -->
      <form action="login" method="post" class="px-6 py-8 space-y-6">
        <!-- Email -->
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Email</label>
          <input type="email" name="email" id="email" required autocomplete="email"
            placeholder="you@example.com"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Password -->
        <div>
          <label for="password" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Password</label>
          <input type="password" name="password" id="password" required autocomplete="current-password"
            placeholder="••••••••"
            class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Actions -->
        <div class="flex items-center justify-between">
          <label class="inline-flex items-center text-sm text-gray-600 dark:text-gray-400">
            <input type="checkbox" class="form-checkbox text-orange-500" />
            <span class="ml-2">Remember me</span>
          </label>
          <a href="#" class="text-sm text-orange-500 hover:text-orange-600 font-medium">Forgot Password?</a>
        </div>

        <!-- Submit -->
        <button type="submit"
          class="w-full py-3 bg-orange-500 hover:bg-orange-600 text-white font-semibold rounded-lg transition-all duration-300">
          <i class="fas fa-sign-in-alt mr-2"></i> Login
        </button>

        <!-- Register -->
        <div class="text-center text-sm text-gray-500 dark:text-gray-400 pt-4">
          Don’t have an account?
          <a href="register.jsp" class="text-orange-500 hover:text-orange-600 font-medium">Register</a>
        </div>
      </form>
    </div>
  </main>

  <!-- Optimized Footer -->
  <%@ include file="./partials/footer.jsp"%>
</body>
</html>