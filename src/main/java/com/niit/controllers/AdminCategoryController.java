 package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.CategoryDAO;
import com.niit.models.Category;


@Controller
public class AdminCategoryController {



	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = { "category"})
	public String CategoryPage(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("CategoryPageClicked", "true");
		return "Welcome";
	}

	@RequestMapping(value = { "addcategory", "editcategory/addcategory" }, method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category) {
		categoryDAO.saveOrUpdate(category);
		return "redirect:/category";
	}

	@RequestMapping("editcategory/{id}")
	public String editCategory(@PathVariable("id") String id, Model model) {
		System.out.println("editCategory");
		model.addAttribute("category", this.categoryDAO.get(id));
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("CategoryPageClicked", "true");
		return "Welcome";
	}

	@RequestMapping(value = { "removecategory/{id}", "editcategory/removecategory/{id}" })
	public String removeCategory(@PathVariable("id") String id, Model model) throws Exception {
		categoryDAO.delete(id);
		model.addAttribute("message", "Successfully Deleted");
		return "redirect:/category";
	}



}
