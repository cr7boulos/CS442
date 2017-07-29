package com.flights.cs442.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flights.cs442.dao.AirlineDAO;
import com.flights.cs442.dao.City;
import com.flights.cs442.dao.Flight;
import com.flights.cs442.dao.FlightReservation;
import com.flights.cs442.dao.User;

@Service("airlineService")
public class AirlineService {

		private AirlineDAO airlineDAO;
		
		@Autowired
		public void setAirlineDAO(AirlineDAO airlineDAO) {
			this.airlineDAO = airlineDAO;
		}
		
		public List<City> getCities() {
			return airlineDAO.getCitiesOrderedByTitleAndState();
		}
		
		public City getCity(int cityId){
			return airlineDAO.getCity(cityId);
		}
		
		public List<Flight> searchFlights(int orig, int dest, Date departure){
			return airlineDAO.findFlight(orig, dest, departure);
		}
		
		public Flight searchFlights(int fid){
			return airlineDAO.findFlight(fid);
		}
		
		public boolean createUser(User user){
			return airlineDAO.create(user);
		}
		
		public User getUser(String email){
			return airlineDAO.getUserByEmail(email);
		}
		
		public boolean addReservation(FlightReservation reservation){
			return airlineDAO.createReservation(reservation);
		}
		
		public String[] getToCities(List<Flight> flights){
			String[] toCities = new String[flights.size()];
			
			for(int i = 0; i < flights.size(); i++){
				City local = getCity(flights.get(i).getDest());
				toCities[i] = local.getTitle() + "," + local.getState();
			}
			
			return toCities;
			
		}
		
		public String[] getFromCities(List<Flight> flights){
			String[] fromCities = new String[flights.size()];
			
			for(int i = 0; i < flights.size(); i++){
				City local = getCity(flights.get(i).getOrig());
				fromCities[i] = local.getTitle() + "," + local.getState();
			}
			
			return fromCities;
			
		}
		
		public List<Flight> getGreatDeals(){
			return airlineDAO.getGreatDeals();
		}
		public int getOrderNum(int uid){
			return (airlineDAO.getMostRecentReservation(uid)).getOrdernum();
		}
		
}
