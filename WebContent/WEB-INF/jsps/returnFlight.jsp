<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- the taglib code comes from here: http://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html -->

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/resources/navbar-fixed-top.css" rel="stylesheet" type="text/css"></link>

<title>Insert title here</title>
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
    
		<!-- see this tutorial for setting up a c--if tag: https://www.tutorialspoint.com/jsp/index.htm  -->
<div class="container">
	<c:if test="${isEmpty}">
		<p>No flights match your specified criteria...</p>
	</c:if>

	
	<!-- copied from here: http://v4-alpha.getbootstrap.com/components/forms/#checkboxes-and-radios-1 
	     and here: http://v4-alpha.getbootstrap.com/components/list-group/
	 -->
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6" style="margin-top: 3em">
			<ul class="list-group">
				<c:forEach var="flight" items="${flights}">
					<li class="list-group-item"><label
						class="custom-control custom-radio"></label>
						<!--name of input was: radio-stacked --> 
						<!-- I don't think I need this id for the input tag... id="radioStacked1" -->
						<input value="${flight.fid}"
							name="return" type="radio" form="returnFlightSelect"
							class="custom-control-input"> <span
							class="custom-control-indicator"></span> <span
							class="custom-control-description">Flight number:
								${flight.fnumber }</span> <br><span
							class="custom-control-description"
							style="margin-left: 2rem;">From:
								${from }</span> <br> <span
							class="custom-control-description"
							style="margin-left: 2rem;">To:
								${to}</span> <br><span style="margin-left: 2rem;"
							class="custom-control custom-control-description">Departure
								time: ${flight.ftime }</span> <br> <span
							style="margin-left: 2rem;"
							class="custom-control custom-control-description">Available
								seats: ${flight.available}</span> <br> <span
							style="margin-left: 2rem;"
							class="custom-control custom-control-description">Price:
								$${flight.price} </span>
					</li>
				</c:forEach>
				<li class="list-group-item">
				<!-- see this tutorial for setting a default option on radio buttons: http://www.w3schools.com/TAgs/att_input_checked.asp -->
					<input value="-1" style="margin-left: .4rem"
							id="radioStacked1" name="return" type="radio" form="returnFlightSelect" checked="true"
							class="custom-control-input"> <span
							class="custom-control-indicator"></span> 
							<span class="custom-control-description"> No return flight</span>
				</li>
			</ul>
		</div>
		<div class="col-lg-3" style="margin-top: 3em">
		<div class="well">
			<strong><p>Select a return flight for 40% off your total order price.</p></strong>
		</div>
			
		</div>
	</div>
	
	<div class="row">
			<form id="returnFlightSelect" method="post"
				action="${pageContext.request.contextPath}/quantitySelect">
				<div class="col-lg-9">
					<input type="hidden" value="${orig}" name="orig"></input>
					<input type="hidden" value="${dest}" name="dest"></input>
					<button class="btn btn-primary pull-right" type="submit">Next
						Page</button>
				</div>

			</form>

		</div>

</div>





</body>
</html>