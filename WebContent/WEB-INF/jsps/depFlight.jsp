<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- the taglib code comes from here: http://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html -->

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/bootstrap.css"
	rel="stylesheet" type="text/css"></link>
<link
	href="${pageContext.request.contextPath}/resources/navbar-fixed-top.css"
	rel="stylesheet" type="text/css"></link>
<link
	href="${pageContext.request.contextPath}/resources/jumbotron-narrow.css"
	rel="stylesheet">
<%-- <link
	href="${pageContext.request.contextPath}/resources/bootstrap-reboot.css"
	rel="stylesheet" type="text/css"></link> --%>
<title>Insert title here</title>
</head>
<body>

	<!-- copied from the Bootstrap Navbar Fixed Static Template -->
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">Best Flights</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/">Start
							Over</a></li>
					<li><a href="${pageContext.request.contextPath}/greatDeals">Great Deals</a></li>
					<li><a href="${pageContext.request.contextPath}/help">Help/Information</a></li>
					<li><a href="${pageContext.request.contextPath}/contactUs">Contact Us</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<!-- see this tutorial for setting up a c--if tag: https://www.tutorialspoint.com/jsp/index.htm  -->
	<div class="container">
		<c:if test="${isEmpty}">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="jumbotron " style="margin-top: 5em;">
					<h1 class="heading">Oops</h1>
					<p>There are no flights matching your request</p>
					<a href="${pageContext.request.contextPath}/"><button
							class="btn bt-lg btn-warning">Start Over</button></a>
				</div>
			</div>
		</c:if>

		<c:if test="${!isEmpty}">

		
		<!-- copied from here: http://v4-alpha.getbootstrap.com/components/forms/#checkboxes-and-radios-1 
	     and here: http://v4-alpha.getbootstrap.com/components/list-group/
	 -->
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6" style="margin-top: 5em">
				<!-- the list-group class was implemented in Bootstrap 4.0 alpha build; I may need to copy the code into the older version of Bootstrap. -->
				<ul class="list-group">
					<!-- see these tutorials for setting up c:out and c:set tags:
			     https://www.tutorialspoint.com/jsp/jstl_core_out_tag.htm
			     https://www.tutorialspoint.com/jsp/jstl_core_set_tag.htm
			     
			     thanks to this SO post for indexing arrays using JSTL:
			     Question: http://stackoverflow.com/questions/24019845/getting-elements-of-arraylist-based-on-index-in-jstl
			     OP: http://stackoverflow.com/users/1304357/tawheed
			     Solution: http://stackoverflow.com/a/24020068
			     Solution Poster: http://stackoverflow.com/users/3533191/syam-s 
		     -->
					
					<c:forEach var="flight" items="${flights}">
					<!-- see this tutorial for setting a default option on radio buttons: http://www.w3schools.com/TAgs/att_input_checked.asp -->
						<li class="list-group-item"> <!--name of input was: radio-stacked -->
							<input value="${flight.fid}" name="depart" type="radio" checked="true"
							form="depFlightSelect" class="custom-control-input"> <span
							class="custom-control-indicator"></span> <span
							class="custom-control-description">Flight number:
								${flight.fnumber }</span> <br>
						<span style="margin-left: 2rem;"
							class="custom-control custom-control-description">From: ${from}</span> <br> <span
							style="margin-left: 2rem;"
							class="custom-control custom-control-description">To: ${to}</span> <br> <span
							style="margin-left: 2rem;"
							class="custom-control custom-control-description">Departure
								time: ${flight.ftime }</span> <br> <span
							style="margin-left: 2rem;"
							class="custom-control custom-control-description">Available
								seats: ${flight.available}</span> <br> <span
							style="margin-left: 2rem;"
							class="custom-control custom-control-description">Price:
								$${flight.price} </span></li>
							
					</c:forEach>
				
				</ul>
				
				
			</div>
		</div>
		
			<div class="row">
				<form id="depFlightSelect" method="post"
					action="${pageContext.request.contextPath}/returnFlight">
					<div class="col-lg-9">
						<input type="hidden" value="${orig}" name="orig"></input> <input
							type="hidden" value="${dest}" name="dest"></input>
						<button class="btn btn-primary pull-right" type="submit">Next
							Page</button>
					</div>

				</form>

			</div>
		
		</c:if>

	</div>

    <script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
	
		


</body>
</html>