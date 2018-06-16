<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Seat Booking App</title>
<link rel="stylesheet" type="text/css" href="/css/stylesheet.css">


<script type="text/javascript">
	/* function showDiv(){
	 document.getElementById('regDiv').style.display = 'block';
	 } */
</script>
</head>
<body>
	<br />
	<br />
	<h1>
		Welcome to Seat Booking application</b>
	</h1>

	<div class="wrapper">
		<div class="container">


			<c:if test="${param.error ne null}">
				<div style="color: red">Incorrect username or password.</div>
			</c:if>
			
			<div>${registrationSuccessMsg}</div>

			<form action="/login" method="post">
				<input type="text" id="username" name="username"
					placeholder="Username"> <input type="password" id="pwd"
					name="password" placeholder="Password">
				<button type="submit" id="login-button">Login</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <br /> Need an account ? <a
					href="/register.html"
					style="color: #4285f4; line-height: 1.4286; cursor: pointer;">Click
					here</a>


			</form>
		</div>

	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>

</body>
</html>
