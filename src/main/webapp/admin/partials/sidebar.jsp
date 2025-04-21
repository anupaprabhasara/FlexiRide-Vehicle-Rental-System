<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<aside id="sidebar"
	class="transition-width duration-300 w-64 bg-white dark:bg-gray-800 shadow-md flex flex-col justify-between">
	<div>
		<!-- Sidebar Top -->
		<div
			class="flex items-center justify-between p-4 border-b border-gray-200 dark:border-gray-700">
			<div id="sidebarTitle"
				class="text-2xl font-bold text-orange-600 dark:text-orange-400">FlexiRide</div>
			<div id="sidebarIcon" class="hidden w-full py-2">
				<div class="flex justify-center text-orange-500 text-2xl">
					<i class="fas fa-user-shield"></i>
				</div>
			</div>
			<!-- Collapse Button (only shown when expanded) -->
			<button id="collapseBtn"
				class="text-gray-600 dark:text-gray-300 text-lg focus:outline-none w-10 h-10 flex items-center justify-center">
				<i class="fas fa-bars"></i>
			</button>
		</div>

		<!-- Navigation -->
		<nav id="navLinks" class="p-4 space-y-2">
			<a href="#"
				class="flex items-center gap-4 py-2 px-3 rounded hover:bg-orange-100 dark:hover:bg-gray-700 text-gray-700 dark:text-gray-200">
				<i class="fas fa-table text-lg w-6 text-center"></i> 
				<span class="sidebar-text">Admin Dashboard</span>
			</a> 

			<a href="${pageContext.request.contextPath}/admin/admin"
				class="flex items-center gap-4 py-2 px-3 rounded hover:bg-orange-100 dark:hover:bg-gray-700 text-gray-700 dark:text-gray-200">
				<i class="fas fa-user-shield text-lg w-6 text-center"></i> 
				<span class="sidebar-text">Admin Management</span>
			</a>

			<a href="${pageContext.request.contextPath}/admin/vehicle"
				class="flex items-center gap-4 py-2 px-3 rounded hover:bg-orange-100 dark:hover:bg-gray-700 text-gray-700 dark:text-gray-200">
				<i class="fas fa-car text-lg w-6 text-center"></i> 
				<span class="sidebar-text">Vehicle Management</span>
			</a>

			<a href="${pageContext.request.contextPath}/admin/user"
				class="flex items-center gap-4 py-2 px-3 rounded hover:bg-orange-100 dark:hover:bg-gray-700 text-gray-700 dark:text-gray-200">
				<i class="fas fa-users text-lg w-6 text-center"></i> 
				<span class="sidebar-text">User Management</span>
			</a>

			<!-- Expand Button: visible only when collapsed -->
			<button id="expandBtn"
				class="hidden w-full justify-center text-gray-600 dark:text-gray-300 hover:bg-orange-100 dark:hover:bg-gray-700 py-2 rounded">
				<i class="fas fa-arrow-right"></i>
			</button>
		</nav>
	</div>

	<!-- Logout -->
	<div class="p-4 border-t border-gray-200 dark:border-gray-700">
		<button
			class="flex items-center gap-4 text-red-500 dark:text-red-400 hover:bg-red-100 dark:hover:bg-red-900/40 px-3 py-2 w-full rounded" onclick="window.location.href='logout';">
			<i class="fas fa-sign-out-alt w-6 text-center"></i> 
			<span class="sidebar-text">Logout</span>
		</button>
	</div>
</aside>