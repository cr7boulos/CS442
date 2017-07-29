<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
  	<link href="${pageContext.request.contextPath}/resources/jumbotron-narrow.css" rel="stylesheet" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="jumbotron " style="margin-top: 5em;">
			<h1 class="heading">Account created successfully</h1>
			<p>Your account was successfully created. To finish your order, please login</a>.</p>
			<a href="${pageContext.request.contextPath}/login"><button
					class="btn bt-lg btn-success">Login</button></a>
		</div>
	</div>
<p></p>
</body>
</html>