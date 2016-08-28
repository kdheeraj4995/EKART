package com.niit.controllers;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.dao.CartDAO;
import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.dao.UserDetailsDAO;
import com.niit.models.Product;
import com.niit.models.UserDetails;

@Controller
public class LoginController {

	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	UserDetailsDAO userDetailsDAO;
	@Autowired
	CartDAO cartDAO;
	
	@RequestMapping(value = "login")
	public String DisplayLogin(Model mv) {
		mv.addAttribute("userDetails", new UserDetails());
		/*mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());*/
		mv.addAttribute("IfLoginClicked", "true");
		mv.addAttribute("HideOthers","true");
		return "Welcome";
	}

	@RequestMapping(value = "Register")
	public String DisplayRegister(Model mv) {
		mv.addAttribute("userDetails", new UserDetails());
/*		mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());*/
		mv.addAttribute("IfRegisterClicked", "true");
		mv.addAttribute("HideOthers","true");
		mv.addAttribute("HideOthers","true");
		
		return "Welcome";
	}

	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String UserRegister(@ModelAttribute("userDetails") UserDetails userDetails,RedirectAttributes attributes) {
		userDetails.setEnabled("TRUE");
		userDetails.setRole("ROLE_USER");
		userDetailsDAO.saveOrUpdate(userDetails);
		attributes.addFlashAttribute("SuccessMessage","Registration Successfull");
		return "redirect:Register";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session,Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		UserDetails user = userDetailsDAO.get(username);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("LoggedIn", "true");

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
		.getAuthentication().getAuthorities();
		String role="ROLE_USER";
		for (GrantedAuthority authority : authorities) 
		{
		  
		     if (authority.getAuthority().equals(role)) 
		     {
		    	 session.setAttribute("UserLoggedIn", "true");
		    	 session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId")));
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
		    	 model.addAttribute("product",  new Product());
		    	 model.addAttribute("ProductPageClicked", "true");
		    	 model.addAttribute("supplierList",supplierDAO.list());
		    	 model.addAttribute("categoryList",categoryDAO.list());
			 }
		}
		return "Welcome";
	}

	/*
	 * @RequestMapping(value = "loginvalidation", method = RequestMethod.POST)
	 * public String LoginValidation(@RequestParam("userName") String
	 * userName, @RequestParam("password") String password, HttpSession session)
	 * { if(userDetailsDAO.isValidUser(userName, password)) { UserDetails
	 * user=userDetailsDAO.get(userName); if(user.getAdmin()==0) {
	 * session.setAttribute("userId",user.getUserId());
	 * session.setAttribute("name",user.getName());
	 * session.setAttribute("LoggedIn","true");
	 * session.setAttribute("UserLoggedIn", "true"); return "Welcome"; } else if
	 * (user.getAdmin()==1) { session.setAttribute("userId",user.getUserId());
	 * session.setAttribute("name",user.getName());
	 * session.setAttribute("LoggedIn","true");
	 * session.setAttribute("Administrator", "true"); return "Welcome"; } else {
	 * return "redirect:login"; } } else { return "redirect:login"; }
	 * 
	 * return "Welcome"; }
	 */

	/*@RequestMapping(value = "logout")
	public String Logout(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}*/
	
	@RequestMapping(value="pay")
	public String pay(HttpSession session)
	{
		cartDAO.pay(((int)session.getAttribute("userId")));
		session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId")));
		return "redirect:/Welcome";
	}
}
