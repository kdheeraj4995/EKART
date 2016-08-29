package com.niit.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;

@Controller
public class DynamicNavbar {

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;
	

	@RequestMapping("/")
	public ModelAndView dynamicNav(HttpSession session) {
		ModelAndView mv = new ModelAndView("Welcome");
		session.setAttribute("categoryList", categoryDAO.list());
		session.setAttribute("productList6", productDAO.Homelist());
		return mv;
	}

	@RequestMapping("Welcomepage")
	public String returnhome(Model mv) {
	
		mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList6", productDAO.Homelist());
		return "Welcome";
	}

	@RequestMapping("/Welcome")
	public ModelAndView logoutsession(HttpSession session) {
		ModelAndView mv = new ModelAndView("Welcome");
		session.setAttribute("categoryList", categoryDAO.list());
		session.setAttribute("productList6", productDAO.Homelist());
		return mv;
	}
	@RequestMapping("view/{category}")
	public String view(@PathVariable("category") int categoryid,RedirectAttributes attributes)
	{
		attributes.addFlashAttribute("productList",productDAO.getcatitem(categoryid));
		attributes.addFlashAttribute("ViewCategoryClicked", "true");
		attributes.addFlashAttribute("HideOthers","true");
		/*mv.addAttribute("productList",productDAO.getcatitem(categoryid));
		mv.addAttribute("ViewCategoryClicked", "true");*/
		return "redirect:/Welcome";
	}

	@RequestMapping("IndividualItem/{id}")
	public String IndividualItem(@PathVariable("id") int id,RedirectAttributes attributes)
	{
		attributes.addFlashAttribute("IndividualItemClicked", "true");
		attributes.addFlashAttribute("IndividualProduct", productDAO.getindividual(id));
		attributes.addFlashAttribute("HideOthers", "true");
		return "redirect:/Welcome";
	}
}
