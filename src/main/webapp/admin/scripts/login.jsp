<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	const passwordInput = document.getElementById('password');
	const toggleBtn = document.getElementById('togglePassword');
	const eyeIcon = document.getElementById('eyeIcon');
	
	toggleBtn.addEventListener('click', () => {
		const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
		passwordInput.setAttribute('type', type);
		eyeIcon.classList.toggle('fa-eye');
		eyeIcon.classList.toggle('fa-eye-slash');
	});
</script>