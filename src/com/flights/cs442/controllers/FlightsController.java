package com.flights.cs442.controllers;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.flights.cs442.dao.City;
import com.flights.cs442.dao.Flight;
import com.flights.cs442.dao.FlightReservation;
import com.flights.cs442.dao.User;
import com.flights.cs442.service.AirlineService;

@Controller
public class FlightsController {

	private AirlineService airlineService;

	@Autowired
	public void setCitiesService(AirlineService airlineService) {
		this.airlineService = airlineService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showHome(Model model) {

		List<City> cities = airlineService.getCities();

		model.addAttribute("cities", cities);

		return "home";
	}

	@RequestMapping(value = "/depFlight", method = RequestMethod.POST)
	public String showHome(Model model, @RequestParam(value = "orig") int orig, HttpServletResponse response,
				  @RequestParam(value = "dest") int dest,
			      @RequestParam(value = "returnDate") String returnDate,
			      @RequestParam(value = "departureDate") String departureDate) {


		
		//store the return date on the user's system;
		//this value will be retrieved later.
		//code explaining how to set up Cookies with Spring MVC comes from these tutorials:
		//    http://viralpatel.net/blogs/spring-mvc-cookie-example/
		//    http://viralpatel.net/blogs/read-http-cookies-in-jsp-expression-language/
		Cookie cookie = new Cookie("returnDate", returnDate);
		cookie.setMaxAge(60*60*24*31); //one month expiration date; copied from the book page 260
		response.addCookie(cookie);
		
		String[] mmDDYY = departureDate.split("/");
		
//		for(String s : mmDDYY){
//			System.out.println(s);
//		}
		
		int year = Integer.parseInt(mmDDYY[2]);
		int month = Integer.parseInt(mmDDYY[0]);
		int day = Integer.parseInt(mmDDYY[1]);
		
		
		//the format for constructing a java.sql.Date is : year, month, day
		//see: https://docs.oracle.com/javase/8/docs/api/java/sql/Date.html
		//see this link for setting the Date parameters correctly: https://docs.oracle.com/javase/8/docs/api/java/sql/Date.html#Date(int,%20int,%20int)
		@SuppressWarnings("deprecation")
		List<Flight> flights = airlineService.searchFlights(orig, dest, new Date(year - 1900, month - 1 , day));
		
		
		
		model.addAttribute("orig", (new Integer(orig)).toString());
		model.addAttribute("dest", (new Integer(dest)).toString());
		model.addAttribute("flights", flights);
		if(!flights.isEmpty()){
			City temp = airlineService.getCity(flights.get(0).getDest());   //all flights have the same to and from locations
			String to = temp.getTitle() + ", " + temp.getState();           //so the first flight's info will suffice        
			
			temp = airlineService.getCity(flights.get(0).getOrig());   
			String from = temp.getTitle() + ", " + temp.getState();    
			model.addAttribute("to", to);
			model.addAttribute("from", from);
		}
		
		model.addAttribute("isEmpty", flights.isEmpty());
			

		return "depFlight"; 
	}
	
	@RequestMapping(value = "/returnFlight", method = RequestMethod.POST)
	public String showReturnFlight(Model model, @RequestParam(value = "depart") int departFid,
								   @RequestParam(value = "orig") int orig,
								   @RequestParam(value = "dest") int dest,
			                       HttpServletResponse response, HttpServletRequest request) {


		Cookie [] cookies = request.getCookies();
		String returnDate = null;
		for(Cookie cookie : cookies){
			//see code on page 260 of the textbook
//			System.out.println(cookie.getName());
//			System.out.println(cookie.getValue());
			if(cookie.getName().equals("returnDate")){
				returnDate = cookie.getValue();
			}
		}
		
		String[] mmDDYY = returnDate.split("/");
		

		
		int year = Integer.parseInt(mmDDYY[2]);
		int month = Integer.parseInt(mmDDYY[0]);
		int day = Integer.parseInt(mmDDYY[1]);
		
		
		//the format for constructing a java.sql.Date is : year, month, day
		//see: https://docs.oracle.com/javase/8/docs/api/java/sql/Date.html
		//see this link for setting the Date parameters correctly: https://docs.oracle.com/javase/8/docs/api/java/sql/Date.html#Date(int,%20int,%20int)
		@SuppressWarnings("deprecation")
		List<Flight> flights = airlineService.searchFlights(dest, orig, new Date(year - 1900, month - 1 , day));
		
		if(!flights.isEmpty()){
			City temp = airlineService.getCity(flights.get(0).getDest()); //all flights have the same to and from locations
			String to = temp.getTitle() + ", " + temp.getState();         //so the first flight's info will suffice
			                                                      
			temp = airlineService.getCity(flights.get(0).getOrig()); 
			String from = temp.getTitle() + ", " + temp.getState();  
			model.addAttribute("to", to);
			model.addAttribute("from", from);
		}
		
		model.addAttribute("flights", flights);
		model.addAttribute("isEmpty", flights.isEmpty());
		//store the depart fid on the user's system;
		//this value will be retrieved later.
		//code explaining how to set up Cookies with Spring MVC comes from these tutorials:
		//    http://viralpatel.net/blogs/spring-mvc-cookie-example/
		//    http://viralpatel.net/blogs/read-http-cookies-in-jsp-expression-language/
		Cookie cookie = new Cookie("departFid", (new Integer(departFid)).toString());
		cookie.setMaxAge(60*60*24*31); //one month expiration date; copied from the book page 260
		response.addCookie(cookie);
		
		return "returnFlight"; 
	}
	
	@RequestMapping(value = "/quantitySelect", method = RequestMethod.POST)
	public String showQuantitySelect(Model model, @RequestParam(value = "return") int returnFid,
			               HttpServletRequest request, HttpServletResponse response) {

		Cookie[] cookies = request.getCookies();
		int departFid = -1;
		City departOrigCity = null;
		City departDestCity = null;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("departFid")){
				departFid = Integer.parseInt(cookie.getValue());
			}
		}
		Flight departFlight = null;
		if(departFid > 0){
			departFlight = airlineService.searchFlights(departFid);
			departOrigCity = airlineService.getCity(departFlight.getOrig());
			departDestCity = airlineService.getCity(departFlight.getDest());
		}
		else{
			System.out.println("Error getting the proper departure Fid");
		}
		
		
		model.addAttribute("hasReturnFlight", returnFid > 0);
		
		if(returnFid > 0){
			Flight returnFlight = airlineService.searchFlights(returnFid);
			City returnOrigCity = airlineService.getCity(returnFlight.getOrig());
			City returnDestCity = airlineService.getCity(returnFlight.getDest());
			
			model.addAttribute("returnFlight", returnFlight);
			model.addAttribute("returnOrigCity", returnOrigCity);
			model.addAttribute("returnDestCity", returnDestCity);
		}	
			//store the return fid on the user's system;
			//this value will be retrieved later.
			//code explaining how to set up Cookies with Spring MVC comes from these tutorials:
			//    http://viralpatel.net/blogs/spring-mvc-cookie-example/
			//    http://viralpatel.net/blogs/read-http-cookies-in-jsp-expression-language/
			Cookie cookie = new Cookie("returnFid", (new Integer(returnFid)).toString());
			cookie.setMaxAge(60*60*24*31); //one month expiration date; copied from the book page 260
			response.addCookie(cookie);
		
		
		
		model.addAttribute("departFlight", departFlight);
		model.addAttribute("departOrigCity", departOrigCity);
		model.addAttribute("departDestCity", departDestCity);
		
		
		
		return "quantitySelect"; 
	}
	
	@RequestMapping(value ="/login")
	public String showLogin(Model model){
		
		model.addAttribute("user", new User());
		
		return "login";
	}
	
	@RequestMapping(value ="/createaccount")
	public String showCreateAccount(Model model){
		
		model.addAttribute("user", new User());
		model.addAttribute("duplicateEmail", false); 
		return "createaccount";
	}
	
	@RequestMapping(value ="/accountcreated", method=RequestMethod.POST)
	public String showCreateAccount(User user, Model model){
		
		user.setAuthority("ROLE_USER");
		user.setEnabled(true);
		try{
			airlineService.createUser(user);
		}
		catch(DuplicateKeyException dupl){
			model.addAttribute("user", new User());
			model.addAttribute("duplicateEmail", true);
			return "createaccount";
		}
		
		return "accountcreated";
	}
	
	
	@RequestMapping(value="/billingInfo")
	public String showBillingInfo(Model model, @RequestParam(value="quantity", defaultValue="0") int quantity,
			                HttpServletResponse response, HttpServletRequest request){
		
		
		String userEmail = "";
		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("userEmail")){
				
				userEmail = cookie.getValue();
			}
			
		}
		User user = airlineService.getUser(userEmail);
		
		model.addAttribute("userFullName", user.getName());
		
		model.addAttribute("reserve", new FlightReservation());
		
		model.addAttribute("inputErrors", null);
		
		
		if(quantity > 0){
			//store the quantity of tickets on the user's system;
			//this value will be retrieved later.
			//code explaining how to set up Cookies with Spring MVC comes from these tutorials:
			//    http://viralpatel.net/blogs/spring-mvc-cookie-example/
			//    http://viralpatel.net/blogs/read-http-cookies-in-jsp-expression-language/
			Cookie cookie = new Cookie("ticketQuantity", (new Integer(quantity)).toString());
			cookie.setMaxAge(60*60*24*31); //one month expiration date; copied from the book page 260
			response.addCookie(cookie);
		}
		return "billingInfo";
	}
	
	@RequestMapping(value="/confirmReservation")
	public String showConfirmReservation(Model model, FlightReservation flightReserve, HttpServletRequest request){
		
		int departFid = 0;
		int returnFid = 0;
		int ticketQuantity = 0;
		String userEmail = "";
		double totalCost = 0;
		
		
		
		model.addAttribute("reservation", new FlightReservation());
		model.addAttribute("cardnum", flightReserve.getCardnum());
		model.addAttribute("cardmonth", flightReserve.getCardmonth());
		model.addAttribute("cardyear", flightReserve.getCardyear());
		model.addAttribute("reservation", flightReserve);
		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			
			if(cookie.getName().equals("userEmail")){
							
				userEmail = cookie.getValue();
			}
			else if(cookie.getName().equals("departFid")){
				
				departFid = Integer.parseInt(cookie.getValue());
			}
			else if(cookie.getName().equals("returnFid")){
				returnFid = Integer.parseInt(cookie.getValue());
			}
			else if(cookie.getName().equals("ticketQuantity")){
				ticketQuantity = Integer.parseInt(cookie.getValue());
			}
		}
		model.addAttribute("ticketQuantity", ticketQuantity);
		User user = airlineService.getUser(userEmail);
		
		model.addAttribute("user", user);
		
		Flight depart = airlineService.searchFlights(departFid);
		City departFrom = airlineService.getCity(depart.getOrig());
		City departTo = airlineService.getCity(depart.getDest());
		
		model.addAttribute("depart", depart);
		model.addAttribute("departFrom", departFrom);
		model.addAttribute("departTo", departTo);
		
		if(returnFid > 0){
			model.addAttribute("hasReturnFlight", true);
			Flight returnFlight = airlineService.searchFlights(returnFid);
			City returnFrom = airlineService.getCity(returnFlight.getOrig());
			City returnTo = airlineService.getCity(returnFlight.getDest());
			
			model.addAttribute("returnFlight", returnFlight);
			model.addAttribute("returnFrom", returnFrom);
			model.addAttribute("returnTo", returnTo);
			totalCost = (returnFlight.getPrice() + depart.getPrice() ) * ticketQuantity;
			model.addAttribute("totalCost", totalCost);
		}
		else{
			//no return flight
			model.addAttribute("hasReturnFlight", false);
			totalCost = depart.getPrice() * ticketQuantity;
			model.addAttribute("totalCost", totalCost);
		}
		
		
		
		return "confirmReservation";
	}
	
	@RequestMapping(value="/submitReservation")
	public String showSubmitReservation(Model model, FlightReservation flightReserve, HttpServletRequest request){
		//System.out.println(flightReserve);
		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			cookie.setMaxAge(0); //delete all cookies
		}
		boolean reservationSuccess = airlineService.addReservation(flightReserve);
		
		int orderNum = -1;
		if(reservationSuccess){
			orderNum = airlineService.getOrderNum(flightReserve.getUid());
			model.addAttribute("orderNum", orderNum);
		}
		model.addAttribute("success", reservationSuccess);
		return "submitReservation";
	}
	
	@RequestMapping(value="/contactUs")
	public String showContactUs(){
		return "contactUs";
	}
	
	@RequestMapping(value="/greatDeals")
	public String showGreatDeals(Model model){
		
		List<Flight> greatDeals = airlineService.getGreatDeals();
		String[] flightOrigins = airlineService.getFromCities(greatDeals);
		String[] flightDests = airlineService.getToCities(greatDeals);
		
		HashMap<Integer, String> hm = new HashMap<Integer, String>();
		
		for(int i = 0; i < greatDeals.size(); i++){
			hm.put(greatDeals.get(i).getOrig(), flightOrigins[i]);
			hm.put(greatDeals.get(i).getDest(), flightDests[i]);
		}
		model.addAttribute("greatDeals", greatDeals);
		model.addAttribute("hashMap", hm);
		return null;
	}
	
	@RequestMapping(value="/help")
	public String showHelp(){
		return "help";
	}
	
	@RequestMapping(value="/sysRules")
	public String showSysRules(){
		return "sysRules";
	}
}
