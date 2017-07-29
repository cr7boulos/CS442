<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- the taglib code comes from here: http://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html -->

<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/resources/navbar-fixed-top.css" rel="stylesheet" type="text/css"></link>

<link href="${pageContext.request.contextPath}/resources/bootstrap-select.min.css" rel="stylesheet" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quantity Select</title>
</head>
<body>
<!-- copied from the Bootstrap Navbar Fixed Static Template -->
	<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">Best Flights</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/">Start Over</a></li>
            <li><a href="${pageContext.request.contextPath}/greatDeals">Great Deals</a></li>
            <li><a href="${pageContext.request.contextPath}/help">Help/Information</a></li>
            <li><a href="${pageContext.request.contextPath}/contactUs">Contact Us</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
	<div class="container">
		<div class="row">
			<!-- for setting up Bootstrap tables see this link: http://getbootstrap.com/css/#tables -->
			<div class="col-lg-9">
				<div class="table-responsive"></div>
				<table class="table table-bordered">
					<tr>
						<td>Departure Flight</td>
						<c:if test="${hasReturnFlight}">
							<td>Return Flight</td>
						</c:if>
						<td>Number of <c:if test="${hasReturnFlight}">round-trip</c:if>
							tickets
						</td>
					</tr>

					<tr>
						<td>${departOrigCity.title}, ${departOrigCity.state}  -- ${departDestCity.title}, ${departDestCity.state}</td>
						<c:if test="${hasReturnFlight}">
							<td>${returnOrigCity.title}, ${returnDestCity.state} -- ${returnDestCity.title}, ${returnDestCity.state}</td>
						</c:if>
						<td><select name="quantity" class="select-picker"
							data-width="auto" form="quantitySelect">
								<option selected value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
						</select></td>
					</tr>

					<tr>
						<td>Cost: <span id="depCost">${departFlight.price}</span></td>
						<c:if test="${hasReturnFlight}">
							<td>Cost: <span id="retCost">${returnFlight.price} </span></td>
						</c:if>

						<td><em>Total Cost: $<span id="totalCost"></span> <c:if
									test="${hasReturnFlight}">(with 40% discount applied)</c:if></em></td>
					</tr>
				</table>


			</div>
			<div class="row">
				<form id="quantitySelect" method="post"
						action="${pageContext.request.contextPath}/billingInfo">
					<div class="col-lg-9">
						<button class="btn btn-primary pull-right" type="submit">Enter
							Billing Info</button>
					</div>
				</form>

			</div>
		</div>

	</div>
	<script
		src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/bootstrap-select.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var returnFlight = false;
							<c:if test="${hasReturnFlight}">
							returnFlight = true;
							</c:if>
							/* see this article for setting up the .text() and .change() functions: http://api.jquery.com/val/ */

							var totalCost = 0;
							function calculateCost() {
								var ticketCount = parseInt($(".select-picker")
										.val());

								if (returnFlight) {

									totalCost = (parseInt($("#depCost").text()) + parseInt($(
											"#retCost").text()))
											* ticketCount;

									totalCost = totalCost - (totalCost * 0.40); //subtract the 40% discount for round-trip tickets

									$("#totalCost").text(totalCost);
								} else {
									//no return flight
									totalCost = (parseInt($("#depCost").text()))
											* ticketCount;

									$("#totalCost").text(totalCost);
								}
							}

							calculateCost();

							$(".select-picker").change(function() {
								calculateCost();

							});
						});
	</script>
</body>
</html>