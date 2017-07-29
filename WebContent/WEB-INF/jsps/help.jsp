<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
  	<link href="${pageContext.request.contextPath}/resources/jumbotron-narrow.css" rel="stylesheet" type="text/css"></link>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Help/Information</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    

    <!-- Custom styles for this template -->
    <link href="jumbotron-narrow.css" rel="stylesheet">

    

    
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" ><a href="${pageContext.request.contextPath}/greatDeals">Great Deals</a></li>
            <li role="presentation"><a href="#">Help/Information</a></li>
            <li role="presentation" class="active"><a href="#">Contact Us</a></li>
          </ul>
        </nav>
        <a href="${pageContext.request.contextPath}/"><h3 class="text-muted">Best Flights</h3></a>
      </div>

      <div class="jumbotron">
        <h1>Check out our system rules or email us for more assistance.</h1>
        <p class="lead">We hope you find everything you are looking for.</p>
        <p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/sysRules" role="button">System Rules</a></p>
        <p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/contactUs" role="button">Contact Us</a></p>
      </div>

      

      

    </div> <!-- /container -->


    
  </body>
</html>