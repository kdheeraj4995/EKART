package com.niit.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.dao.ProductDAO;
import com.niit.models.Product;

@Controller
public class ImageController {
	
	@Autowired
	private ProductDAO itemDAO;
	
	@RequestMapping(value = "/imageDisplay/{id}", method = RequestMethod.GET)
	  public void showImage(@PathVariable("id") int id, HttpServletResponse response,HttpServletRequest request) 
			  throws ServletException, IOException{
		
		System.out.println(id);
		Product item = itemDAO.get(id);
		System.out.println(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(item.getImage());
		System.out.println("Image is");
		response.getOutputStream().close();
	
	}
	

}