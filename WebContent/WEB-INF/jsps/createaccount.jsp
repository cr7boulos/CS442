<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!-- login form is a modified version of the default Bootstrap signin form:
	 http://getbootstrap.com/examples/signin/   
 -->

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   <!--  <link rel="icon" href="../../favicon.ico"> -->

    <title>Create Account</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>

    

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/signin.css" rel="stylesheet">

    

    
  </head>

  <body>

    <div class="container-responsive">
    
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
    <c:if test="${duplicateEmail == true}">
    	<div class="row">
    		<div class="col-lg-2"></div>
    		<div class="col-lg-8" style="text-align:center;" style="margin-top: 5em;">
    		<!-- code for duplicate email addresses is based off code from here: http://getbootstrap.com/components/#alerts -->
    			<div class="alert alert-danger alert-dismissible role="alert">
    				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    				<strong>The email address entered was already taken; Please choose another.</strong>
    			</div>
    		</div>
    	</div>
     </c:if>
    	
		<!-- original had: /spring/login in the path. Use ${pageContext.request.contextPath}/login in Spring 4+
				instead of ${pageContext.request.contextPath}/j_security_check (the former is for Spring version  3.x -->
      <sf:form class="form-signin" method="post" action="${pageContext.request.contextPath}/accountcreated" modelAttribute="user">
      
        <h2 class="form-signin-heading">Create an account</h2>
        
        <sf:input type="email"  class="form-control" path="username" name="username" placeholder="Email address" required="true" autofocus="true"></sf:input>
        
        <sf:input type="text"  class="form-control" path="name" name="name" placeholder="Full Name" required="true"></sf:input>
        
        <sf:input type="text"  class="form-control" path="address" name="address" placeholder="Street Address" required="true" ></sf:input>
        
        <sf:input type="password"  path="password" name="password" class="form-control" placeholder="Password" required="true"></sf:input>
        
        <sf:button class="btn btn-lg btn-primary btn-block" type="submit">Create Account</sf:button>
      </sf:form>

    </div> <!-- /container -->


    
    <script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	
  </body>
</html>