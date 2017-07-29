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

<title>Great Deals</title>
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
            <li class="active"><a  href="${pageContext.request.contextPath}/greatDeals">Great Deals</a></li>
            <li><a href="${pageContext.request.contextPath}/help">Help/Information</a></li>
            <li><a href="${pageContext.request.contextPath}/contactUs">Contact Us</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
		<!-- see this tutorial for setting up a c--if tag: https://www.tutorialspoint.com/jsp/index.htm  -->
<div class="container">
	
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-6" style="text-align:center;">
		<h3>Here are some flights on sale now!</h3>
	</div>
			

		</div>
	
	<!-- copied from here: http://v4-alpha.getbootstrap.com/components/forms/#checkboxes-and-radios-1 
	     and here: http://v4-alpha.getbootstrap.com/components/list-group/
	 -->
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6" style="margin-top: 3em">
			<ul class="list-group">
				<c:forEach var="deal" items="${greatDeals}">
					<li class="list-group-item"><label
						class="custom-control custom-radio"></label>
						<!--name of input was: radio-stacked --> 
						<!-- I don't think I need this id for the input tag... id="radioStacked1" -->
						
						
							<span class="custom-control-indicator"></span> 
							
							<span class="custom-control-description" style="margin-left: 1.6rem;">Flight number: ${deal.fnumber }</span> <br>
							<!-- Thanks to this SO post for accessing hashmap values in a JSP: http://stackoverflow.com/questions/4792444/access-hashmap-value-by-variable-in-jsp
						     OP: http://stackoverflow.com/users/223386/hsz
						     Answered by: http://stackoverflow.com/users/157882/balusc
						     -->
							<span class="custom-control-description" style="margin-left: 2rem;">From: <c:out value="${hashMap[deal.orig]}"></c:out></span> <br> 
							<span class="custom-control-description" style="margin-left: 2rem;">To: <c:out value="${hashMap[deal.dest]}"></c:out></span> <br>
							<span style="margin-left: 2rem;" class="custom-control custom-control-description">Departure time: ${deal.ftime }</span> <br> 
							<span style="margin-left: 2rem;" class="custom-control custom-control-description">Available seats: ${deal.available}</span> <br> 
							<span style="margin-left: 2rem;" class="custom-control custom-control-description">Price: $${deal.price} </span>
					</li>
				</c:forEach>
				
			</ul>
		</div>
		<div class="col-lg-3" style="margin-top: 3em">
		<div class="well">
			<strong><p>Buy a return flight and get 40% off your total order price.</p></strong>
		</div>
			
		</div>
	</div>
	
	

</div>