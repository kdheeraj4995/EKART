 package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.dao.CategoryDAO;
import com.niit.models.Category;

@Controller
public class AdminCategoryController {

	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value="/categorygson")
	@ResponseBody
	public String CategoryGson()
	{
		List<Category> list=categoryDAO.list();
		Gson gson=new Gson();
		String data=gson.toJson(list);
		return data;
	}

	@RequestMapping(value = { "category"})
	public String CategoryPage(@ModelAttribute("category") Category category,BindingResult result,Model model) {
		//model.addAttribute("category", new Category());
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("CategoryPageClicked", "true");
		return "Welcome";
	}
	@RequestMapping(value = { "addcategory" }, method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category,RedirectAttributes attributes) {
		categoryDAO.saveOrUpdate(category);
		attributes.addFlashAttribute("SuccessMessage", "Category has been added/Updated Successfully");
		return "redirect:/category";
	}
	@RequestMapping("editcategory/{id}")
	public String editCategory(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
		System.out.println("editCategory");
		attributes.addFlashAttribute("category", this.categoryDAO.get(id));
		return "redirect:/category";
	}
	@RequestMapping(value = { "removecategory/{id}"})
	public String removeCategory(@PathVariable("id") int id,RedirectAttributes attributes) throws Exception {
		categoryDAO.delete(id);
		attributes.addFlashAttribute("DeleteMessage", "Category has been deleted Successfully");
		return "redirect:/category";
	}
}
