<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/resources/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/resources/bootstrap-select.min.css" rel="stylesheet" type="text/css"></link> 
<link href="${pageContext.request.contextPath}/resources/navbar-fixed-top.css" rel="stylesheet" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">

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
            <li ><a  href="${pageContext.request.contextPath}/greatDeals">Great Deals</a></li>
            <li><a href="../navbar-static-top/">Help/Information</a></li>
            <li><a href="${pageContext.request.contextPath}/contactUs">Contact Us</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

	<!-- display if there is error on submitting username or password. -->
    <%-- <c:if test="${inputErrors == true}">
    	<div class="row" >
    		<div class="col-lg-3"></div>
    		<div class="col-lg-6">
    		<!-- code for invalid username/password based off code from here: http://getbootstrap.com/components/#alerts -->
    			<div style="text-align:center;" class="alert alert-danger alert-dismissible role="alert">
    				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    				<strong>Please resolve the following input errors:</strong>
    			</div>
    		</div>
    	</div>
     </c:if>
     
     <c:if test="${cardLengthWrong == true}">
    	<div class="row" >
    		<div class="col-lg-3"></div>
    		<div class="col-lg-6">
    		<!-- code for invalid username/password based off code from here: http://getbootstrap.com/components/#alerts -->
    			<div style="text-align:center;" class="alert alert-danger alert-dismissible role="alert">
    				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    				<strong>Error: Credit card number must be 16 digits in length</strong>
    			</div>
    		</div>
    	</div>
     </c:if>
     
     <c:if test="${invalidYear == true}">
    	<div class="row" >
    		<div class="col-lg-3"></div>
    		<div class="col-lg-6">
    		<!-- code for invalid username/password based off code from here: http://getbootstrap.com/components/#alerts -->
    			<div style="text-align:center;" class="alert alert-danger alert-dismissible role="alert">
    				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    				<strong>Error: Year must be between 0 -- 9999</strong>
    			</div>
    		</div>
    	</div>
     </c:if>
     
     <c:if test="${invalidMonth == true}">
    	<div class="row" >
    		<div class="col-lg-3"></div>
    		<div class="col-lg-6">
    		<!-- code for invalid username/password based off code from here: http://getbootstrap.com/components/#alerts -->
    			<div style="text-align:center;" class="alert alert-danger alert-dismissible role="alert">
    				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    				<strong>Error: Month must be between 0 -- 12</strong>
    			</div>
    		</div>
    	</div>
     </c:if> --%>

	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<sf:form method="post" action="${pageContext.request.contextPath}/confirmReservation" modelAttribute="reserve">
			<h2> Welcome, ${userFullName}</h2>
			<h3>Please enter your billing information</h3>
			  <div class="form-group">
			    <label for="cardNumber">Credit/Debit Card Number</label>
			    <sf:input type="text" path="cardnum" class="form-control" id="cardNumber" placeholder="Enter your 16-digit card number"></sf:input>
			  </div>
			  <div class="form-group">
			    <label for="cardMonth">Expiration Month</label>
			    <sf:input type="text" path="cardmonth" class="form-control" id="cardMonth" placeholder="Month must be between 1 and 12"></sf:input>
			  </div>
			  <div class="form-group">
			    <label for="cardYear">Expiration Year</label>
			    <sf:input type="text" path="cardyear" class="form-control" id="cardYear" placeholder="Year must be between 0 and 9999"></sf:input>
			  </div>
			  <button id="confirm" type="submit" class="btn btn-primary pull-right">Confirm Order</button>
			</sf:form>
		</div>
	</div>
</div>


	<script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/moment-with-locales.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-select.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	
	<!-- <script>
	
	$(document).ready(function(){
	strict = true;
	var hasMonthError = false;
	var hasCardNumberError = false;
	var hasCardYearError = false;
	
		function valid(){
			if(!hasMonthError && !hasCardNumberError && !hasCardYearError){
				$("#confirm").removeAttr('disabled');
			}
				
		}
		
		function hasCardNumberErrors(){
			var cardNum = $("#cardNum").val();
			
			if(String(cardNum).length != 16){
				alert("Credit card number must be 16 digits in length.");
				
				hasCardNumberError = true;
				
			}
			else{
				hasCardNumberError = false;
				valid();
			}
			
		}
		
		function hasCardYearErrors(){
			var cardYear = $("#cardYear").val();
			
			if(cardYear < 0 || cardYear > 9999 ){
				alert("Card Year must be between 0 and 9999");
				
				hasCardYearError = true;
				
			}
			else{
				hasCardYearError = false;
				valid();
			}
			
		}
		
		function hasCardMonthErrors(){
			var cardMonth = $("#cardMonth").val();
			
			if(cardMonth < 1 || cardYear > 12 ){
				alert("Card Month must be between 1 and 12");
				
				hasCardMonthError = true;
				
			}
			else{
				hasCardMonthError = false;
				valid();
			}
			
		}
		
		$("#cardNum").focusout(hasCardNumberErrors);
		$("#cardMonth").focusout(hasCardMonthErrors);
		$("#cardYear").focusout(hasCardYearErrors);
		
		
		
	});
		
	</script> -->
	
</body>
</html>