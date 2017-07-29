<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- the taglib code comes from here: http://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html -->


<!DOCTYPE html>
<html>


<head>
<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/resources/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/resources/bootstrap-select.min.css" rel="stylesheet" type="text/css"></link> 
<!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/jumbotron-narrow.css" rel="stylesheet">

	
	
	



	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Flights</title>
</head>
<body>

<style>
/* this style code is copied from the bootstrap.css file.
   Spring needed the correct context path for loading these resources.
   the required snippet of code ${pageContext.request.contextPath} only 
   works in a JSP file so the relevant style info was moved directly into the JSP */
	@font-face {
	
  font-family: 'Glyphicons Halflings';

  src: url("${pageContext.request.contextPath}/resources/fonts/glyphicons-halflings-regular.eot");
  src: url('${pageContext.request.contextPath}/resources/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/fonts/glyphicons-halflings-regular.woff2') format('woff2'), url('${pageContext.request.contextPath}/resources/fonts/glyphicons-halflings-regular.woff') format('woff'), url('${pageContext.request.contextPath}/resources/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');
}
</style>
<div class="container">
<!-- code copied from Bootstrap Jumbotran template -->
		<div class="header clearfix">
	        <nav>
	          <ul class="nav nav-pills pull-right">
	            
	            
	            <li role="presentation"><a href="${pageContext.request.contextPath}/greatDeals">Great Deals</a></li>
	            <li role="presentation"><a href="${pageContext.request.contextPath}/help">Help/Information</a></li>
	            <li role="presentation"><a href="${pageContext.request.contextPath}/contactUs">Contact Us</a></li>
	          </ul>
	        </nav>
	        <h3 class="text-muted">Best Flights</h3>
      </div>

      <div class="jumbotron">
        <h1>Welcome</h1>
        <p class="lead">We hope you can find the
				flight you are looking for, and at a great price, too!</p>
        
      </div>
<!-- end code copied from Bootstrap Jumbotran template -->
	
			
		<!-- thanks to this tutorial for setting up the form with a drop-down menu: http://www.w3schools.com/TAgs/att_select_form.asp -->
			<!-- foreach loop comes from here: http://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html -->
		
		
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="col-lg-6">
				<h4>Origin City</h4>
				<select name="orig" class="selectpicker" data-width="auto" form="flightSelect">
						
						<!-- the 'cities' variable is set in the Model that gets passed by the page to the controller -->
						<c:forEach var="row" items="${cities}">
						
							<!-- for setting the select value to be different than the text see here: http://www.w3schools.com/tags/tag_select.asp -->
							<option value=${row.cityid}>${row.title},${row.state}</option>
							<!-- the for each loop populates the options to the select box -->
						</c:forEach>
					</select>
			</div>
			
			<div class="col-lg-6">
				<h4>Destination City</h4>
				<select name="dest" class="selectpicker" data-width="auto"  form="flightSelect">
					<!-- the 'cities' variable is set in the Model that gets passed by the page to the controller -->
					<c:forEach var="row" items="${cities}">
						
		
						<option value=${row.cityid}>${row.title},${row.state}</option>
						<!-- the for each loop populates the options to the select box -->
					</c:forEach>
				</select>
			</div>
				
				
		</div>
	</div>
	
	<div class="row" style="margin-top:30px;">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="col-lg-6">
				<h4>Departure Date</h4>
				<!-- the following code comes from here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
					
		                <div class='input-group date' id='datetimepicker6'>
		                    <input type='text' class="form-control" form="flightSelect" name="departureDate"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
            		
           		<!-- end copied code -->
			</div>
			
			<!-- <div class="col-lg-2"></div> -->
			<div class="col-lg-6">
				<h4>Return Date</h4>
				<!-- the following code comes from here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
					
						<div>
			                <div class='input-group date' id='datetimepicker5'>
			                    <input type='text' class="form-control" form="flightSelect" name="returnDate"/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
	            		</div>
	           		<!-- end copied code -->	
			</div>
		</div>
	</div>
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="col-lg-5" style="margin-top:30px;">
			<form id="flightSelect" method="post"
				action="${pageContext.request.contextPath}/depFlight">
	
				<button class="btn btn-primary" type="submit">Submit</button>
			</form>
		</div>
	</div>
		
		
		
	</div>
</div>
	
		
	
	

	<script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/moment-with-locales.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-select.min.js"></script>
	
	<script>
	/* the following code comes from here: https://eonasdan.github.io/bootstrap-datetimepicker/ 
		Sets up both date pickers
	*/
		$(document).ready(function(){
			
			$('#datetimepicker6').datetimepicker({
				format: 'l',
			});
			
			$('#datetimepicker5').datetimepicker({
				format: 'l',
			});
		});
		
	/* end copied code */
	</script>
	
	

</body>
</html>