<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stylesheet.css">

<!-- <link rel="stylesheet" type="text/css" href="css/seating-style.css">
 <link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="lib/jquery.seat-charts.css"> -->
		
		
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Seat Booking App</title>

<script type="text/javascript">

   
  function onSectionChange(value) {
	  getSeatsBySection(value);
	};

  </script>
</head>
<body>

<!-- 	<div id="seat-map">
		<div class="front-indicator">Front</div>
	</div>
	<div id="seat-map-2"></div>
	<div class="column">
		<div class="booking-details">
			<h2>Booking Details</h2>
			<h3>
				Selected Seats (<span id="counter">0</span>):
			</h3>
			<ul id="selected-seats"></ul>
			Total: <b>$<span id="total">0</span></b>
			<button class="checkout-button">Checkout &raquo;</button>
			<div id="legend"></div>
		</div>

	</div>
 -->	<!-- <h1>Welcome to Seat Booking application</b></h1> -->
	<h1>Welcome ${user}</h1>

	<div>
		<form action="/bookTickets">
			<div>
				<!-- onchange="onSectionChange(value)" -->
				Select Section: <select name='sectionsDrop' id="sectionsDrop"
					onchange="onSectionChange(value)">
					<c:forEach items="${sections}" var="section">
						<option value="${section.id}">${section.name}</option>
					</c:forEach>
				</select>
				</div>
				
 
<div id="seatBox">
<!-- <input type="checkbox" name="id" value="Java"> Java<BR>
<input type="checkbox" name="id" value=".NET"> .NET<BR>
<input type="checkbox" name="id" value="PHP"> PHP<BR>
<input type="checkbox" name="id" value="C/C++"> C/C++<BR>
<input type="checkbox" name="id" value="PERL"> PERL <BR>
<input type="submit" value="Submit"> -->
</div>

			<button type="submit">Book Tickets</button>
				<!-- 	</div>
			<div class="containerright">-->
				<!-- <div id="seat-map">
		  					<div class="front-indicator">Front</div>
		  				</div>
 -->
				<br />
				<br />
<%-- 				<br /> Select Seat: <select name='role'>
					<c:forEach items="${seats}" var="seat">
						<option value="${seat.id}">${seat.name}</option>
					</c:forEach>
				</select>
 --%>			
			<!-- <div id="seat-map">
		  					<div class="front-indicator">Front</div>

		  				</div> -->
		  				
<!-- 		  					<div id="seat-map">
		<div class="front-indicator">Front</div>
	</div>
	<div id="seat-map-2"></div>
	<div class="column">
		<div class="booking-details">
			<h2>Booking Details</h2>
			<h3>
				Selected Seats (<span id="counter">0</span>):
			</h3>
			<ul id="selected-seats"></ul>
			Total: <b>$<span id="total">0</span></b>
			<button>Checkout &raquo;</button>
			<div id="legend"></div>
		</div>

	</div> -->
		  				
		</form>
	</div>
	<%--   Author :
            <select id="Author" name="Author">
                <c:forEach items="${sections}" var="author">
                    <option value="${author.name}" ${author == param.Author ? 'selected' : ''}>${author}</option>
                </c:forEach>
            </select>
        <button type="submit" value="submit" name="Submit"></button>
        <Br>
        <c:out value="After :   ${param.Author}"/>
 --%>
 
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
	</ul>
 <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="lib/jquery.imagemapster.js"></script>
		<script src="lib/jquery.seat-charts.min.js"></script>
		<script src="js/image-handler.js"></script>
		<script src="js/seating.js"></script>
</body>
</html>