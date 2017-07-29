<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- the taglib code comes from here: http://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html -->
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
			
			<div>
				<h2>Order Details</h2>
				<br>
				<h3>Your ticket will be mailed to:</h3>
				<address>
					<h4><strong>${user.address}</strong></h4>
				</address>
				
				<h3>Your e-ticket will be e-mailed to:</h3>
				<address>
					<h4><strong>${user.username}</strong></h4>
				</address>
			</div>
				<table class="table">
				
					<tr>
						<th>#####</th>
						<th>Flight #</th>
						<th>Origin</th>
						<th>Destination</th>
						<th>Leaves At</th>
						<th>On</th>
						<th>Cost</th>
						<th>Quantity</th>
					</tr>
					<tr>
						<td>Departure</td>
						<td>${depart.fnumber}</td>
						<td>${departFrom.title}, ${departFrom.state}</td>
						<td>${departTo.title}, ${departTo.state}</td>
						<td>${depart.ftime}</td>
						<td>${depart.fdate}</td>
						<td>$${depart.price}</td>
						<td>${ticketQuantity}</td>
					</tr>
					<c:if test="${hasReturnFlight}">
						<tr>
						<td>Return</td>
						<td>${returnFlight.fnumber}</td>
						<td>${returnFrom.title}, ${returnFrom.state}</td>
						<td>${returnTo.title}, ${returnTo.state}</td>
						<td>${returnFlight.ftime}</td>
						<td>${returnFlight.fdate}</td>
						<td>$${returnFlight.price}</td>
						<td>${ticketQuantity}</td>
					</tr>
					</c:if>
				</table>
				<sf:form id="submitReservation" action="${pageContext.request.contextPath}/submitReservation" method="post" modelAttribute="reservation">
					<sf:input type="hidden" value="${ticketQuantity}" path="qty"></sf:input>
					<sf:input type="hidden" value="${cardnum}" path="cardnum"></sf:input>
					<sf:input type="hidden" value="${cardmonth}" path="cardmonth"></sf:input>
					<sf:input type="hidden" value="${cardyear}" path="cardyear"></sf:input>
					<sf:input type="hidden" value="${user.uid}" path="uid"></sf:input>
					<sf:input type="hidden" value="${depart.fid}" path="dfid"></sf:input>
					<c:if test="${hasReturnFlight}">
						<sf:input type="hidden" value="${returnFlight.fid}" path="rfid"></sf:input>
					</c:if>
					
					
				</sf:form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10">
				<button  form="submitReservation" type="submit" id="placeOrder" class="btn btn-primary pull-right">Total Cost: $${totalCost}</button>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			var text = $("#placeOrder").text();
			$("#placeOrder").mouseover(function(){
				$("#placeOrder").text("Place Order");
			});
			
			$("#placeOrder").mouseout(function(){
				$("#placeOrder").text(text);
			});
		});
	</script>
</body>
</html>