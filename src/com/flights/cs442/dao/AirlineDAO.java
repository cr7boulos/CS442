package com.flights.cs442.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flights.cs442.dao.User;


@Component("airlinedao")
public class AirlineDAO {

	// store all database queries here

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<City> getCitiesOrderedByTitleAndState() {

		return jdbc.query("select cityid, title, state from city order by title, state", new RowMapper<City>() {

			@Override
			public City mapRow(ResultSet rs, int rowNum) throws SQLException {
				City city = new City();

				city.setCityid(rs.getInt("cityid"));
				city.setTitle(rs.getString("title"));
				city.setState(rs.getString("state"));

				return city;
			}

		});
	}

	public List<Flight> findFlight(int orig, int dest, Date departure) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("orig", orig);
		params.addValue("dest", dest);
		params.addValue("departure", departure);

		return jdbc.query("select * from flight where orig = :orig and dest = :dest and fdate = :departure", params,
				new RowMapper<Flight>() {

					@Override
					public Flight mapRow(ResultSet rs, int rowNum) throws SQLException {
						Flight flight = new Flight();

						flight.setFid(rs.getInt("fid"));
						flight.setFnumber(rs.getInt("fnumber"));
						flight.setFdate(rs.getDate("fdate"));
						flight.setFtime(rs.getTime("ftime"));
						flight.setPrice(rs.getDouble("price"));
						flight.setSeatClass(rs.getInt("seatClass"));
						flight.setCapacity(rs.getInt("capacity"));
						flight.setAvailable(rs.getInt("available"));
						flight.setOrig(rs.getInt("orig"));
						flight.setDest(rs.getInt("dest"));

						return flight;
					}
				});
	}
	
	public List<Flight> getGreatDeals(){
		
		MapSqlParameterSource params = new MapSqlParameterSource("currentDate", new Date(System.currentTimeMillis()));
		return jdbc.query("select * from flight where price < 50 and fdate >= :currentDate", params, new RowMapper<Flight>(){

			@Override
			public Flight mapRow(ResultSet rs, int rowNum) throws SQLException {
				Flight flight = new Flight();

				flight.setFid(rs.getInt("fid"));
				flight.setFnumber(rs.getInt("fnumber"));
				flight.setFdate(rs.getDate("fdate"));
				flight.setFtime(rs.getTime("ftime"));
				flight.setPrice(rs.getDouble("price"));
				flight.setSeatClass(rs.getInt("seatClass"));
				flight.setCapacity(rs.getInt("capacity"));
				flight.setAvailable(rs.getInt("available"));
				flight.setOrig(rs.getInt("orig"));
				flight.setDest(rs.getInt("dest"));

				return flight;
			}
			
		});
	}

	public Flight findFlight(int fid) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("fid", fid);
		
		
		
		return jdbc.queryForObject("select * from flight where fid = :fid", params,
				new RowMapper<Flight>() {

					@Override
					public Flight mapRow(ResultSet rs, int rowNum) throws SQLException {
						Flight flight = new Flight();

						flight.setFid(rs.getInt("fid"));
						flight.setFnumber(rs.getInt("fnumber"));
						flight.setFdate(rs.getDate("fdate"));
						flight.setFtime(rs.getTime("ftime"));
						flight.setPrice(rs.getDouble("price"));
						flight.setSeatClass(rs.getInt("seatClass"));
						flight.setCapacity(rs.getInt("capacity"));
						flight.setAvailable(rs.getInt("available"));
						flight.setOrig(rs.getInt("orig"));
						flight.setDest(rs.getInt("dest"));

						return flight;
					}
				});
		
	}
	
	@Transactional
	public boolean create(User user){
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		jdbc.update("insert into users (username, password, name, address, enabled, authority) values (:username, :password, :name, :address, :enabled, :authority)", params);
		
		return jdbc.update("insert into authorities (username, authority) values (:username, :authority)", params) == 1;
	}
	
	@Transactional
	public boolean createReservation(FlightReservation reservation){
		
		reservation.setOrder_date(new Date(System.currentTimeMillis())); //time stamp the reservation before submitting to the DB
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(reservation);
		
		String sqlQuery = "insert into reservation (uid, dfid, rfid, qty, cardnum, cardmonth, cardyear, order_date) values (:uid, :dfid, :rfid, :qty, :cardnum, :cardmonth, :cardyear, :order_date)";
		
		if(reservation.getRfid() == 0){
			//handle no return flight
			sqlQuery = "insert into reservation (uid, dfid, rfid, qty, cardnum, cardmonth, cardyear, order_date) values (:uid, :dfid, null, :qty, :cardnum, :cardmonth, :cardyear, :order_date)";
		}
		
		return jdbc.update(sqlQuery, params) == 1;
	}
	
	public User getUserByEmail(String email){
		MapSqlParameterSource params = new MapSqlParameterSource("email", email);
		return jdbc.queryForObject("select * from users where username = :email", params, new RowMapper<User>(){

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUid(rs.getInt("uid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setEnabled(rs.getBoolean("enabled"));
				user.setAuthority(rs.getString("authority"));
				
				return user;
			}
			
		});
	}

	public City getCity(int cityId) {
		
		MapSqlParameterSource params = new MapSqlParameterSource("cityId", cityId);
		
		return jdbc.queryForObject("select * from city where cityid = :cityId", params, new RowMapper<City>(){

			@Override
			public City mapRow(ResultSet rs, int rowNum) throws SQLException {
				City city = new City();

				city.setCityid(rs.getInt("cityid"));
				city.setTitle(rs.getString("title"));
				city.setState(rs.getString("state"));

				return city;
				
			}
			
		});
	}
	
	public FlightReservation getMostRecentReservation(int uid){
		
MapSqlParameterSource params = new MapSqlParameterSource("uid", uid);
		
		return jdbc.queryForObject("select * from reservation where ordernum = (select max(ordernum) from reservation where uid = :uid)", params, new RowMapper<FlightReservation>(){

			@Override
			public FlightReservation mapRow(ResultSet rs, int rowNum) throws SQLException {
				FlightReservation flightRes = new FlightReservation();
				
				flightRes.setOrdernum(rs.getInt("ordernum"));
				flightRes.setUid(rs.getInt("uid"));
				flightRes.setDfid(rs.getInt("dfid"));
				flightRes.setRfid(rs.getInt("rfid"));
				flightRes.setQty(rs.getInt("qty"));
				flightRes.setCardnum(rs.getString("cardnum"));
				flightRes.setCardmonth(rs.getInt("cardmonth"));
				flightRes.setCardyear(rs.getInt("cardyear"));
				flightRes.setOrder_date(rs.getDate("order_date"));
				
				return flightRes;
			}

			
			
			
		});
	}

}
