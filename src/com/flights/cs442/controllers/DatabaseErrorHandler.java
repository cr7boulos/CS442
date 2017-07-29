//this code is directly copied from the Udemy course: https://www.udemy.com/javaspring/

package com.flights.cs442.controllers;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class DatabaseErrorHandler {
	
	@ExceptionHandler(DataAccessException.class)
	public String handleDatabaseException(DataAccessException ex){
		ex.printStackTrace();
		return "error";
	}
}

