<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	// ===== Sidebar Elements =====
	const sidebar = document.getElementById('sidebar');
	const sidebarText = document.querySelectorAll('.sidebar-text');
	const sidebarTitle = document.getElementById('sidebarTitle');
	const sidebarIcon = document.getElementById('sidebarIcon');
	const collapseBtn = document.getElementById('collapseBtn');
	const expandBtn = document.getElementById('expandBtn');
	
	let manuallyToggled = false;
	
	// ===== Sidebar Toggle Functions =====
	function collapseSidebar() {
		if (sidebar.classList.contains('w-64')) {
			sidebar.classList.replace('w-64', 'w-20');
		}
		sidebarText.forEach(el => el.classList.add('hidden'));
		sidebarTitle.classList.add('hidden');
		sidebarIcon.classList.remove('hidden');
	
		collapseBtn.classList.add('hidden');
		expandBtn.classList.remove('hidden');
		expandBtn.classList.add('flex');
	}
	
	function expandSidebar() {
		if (sidebar.classList.contains('w-20')) {
			sidebar.classList.replace('w-20', 'w-64');
		}
		sidebarText.forEach(el => el.classList.remove('hidden'));
		sidebarTitle.classList.remove('hidden');
		sidebarIcon.classList.add('hidden');
	
		collapseBtn.classList.remove('hidden');
		expandBtn.classList.add('hidden');
		expandBtn.classList.remove('flex');
	}
	
	// ===== Manual Toggle Events =====
	collapseBtn.addEventListener('click', () => {
		manuallyToggled = true;
		collapseSidebar();
	});
	
	expandBtn.addEventListener('click', () => {
		manuallyToggled = true;
		expandSidebar();
	});
	
	// ===== Responsive Sidebar Handler =====
	function handleResponsiveSidebar() {
		const width = window.innerWidth;
	
		// Reset manual override on screen size jump
		if (window.lastWidth && (
			(window.lastWidth < 1024 && width >= 1024) ||
			(window.lastWidth >= 1024 && width < 1024)
		)) {
			manuallyToggled = false;
		}
		window.lastWidth = width;
	
		if (!manuallyToggled) {
			if (width >= 1024) {
				expandSidebar();  // Large screens
			} else {
				collapseSidebar(); // Medium and small screens
			}
		}
	}
	
	// ===== Initialize Sidebar on Load & Resize =====
	window.addEventListener('DOMContentLoaded', handleResponsiveSidebar);
	window.addEventListener('resize', handleResponsiveSidebar);
	
	// ===== Search Function (Excludes Actions Column) =====
	document.getElementById("search").addEventListener("input", function() {
		const query = this.value.toLowerCase();
		const rows = document.querySelectorAll("#mainTable tr");
	
		rows.forEach(row => {
			const cells = row.querySelectorAll("td");
			let matchFound = false;
	
			for (let i = 0; i < cells.length - 1; i++) {
				if (cells[i].innerText.toLowerCase().includes(query)) {
					matchFound = true;
					break;
				}
			}
	
			row.style.display = matchFound ? "" : "none";
		});
	});
	
	// ===== Confirm Delete Admin =====
	function confirmAction(url) {
		if (confirm("Delete this record? This can't be undone.")) {
			window.location.href = url;
		}
	}
</script>