package com.niit.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.niit.dao.SupplierDAO;
import com.niit.models.Supplier;

@Controller
public class AdminSupplierController {

	@Autowired
	private SupplierDAO supplierDAO;

	@RequestMapping(value = "/suppliergson")
	@ResponseBody
	public String SupplierGson() {
		List<Supplier> list = supplierDAO.list();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		return data;
	}

	@RequestMapping(value = { "supplier" })
	public String SupplierPage(@ModelAttribute("supplier") Supplier supplier, BindingResult result,Model model) {
		//model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("SupplierPageClicked", "true");
		return "Welcome";
	}

	@RequestMapping(value = { "addsupplier"}, method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier,
			RedirectAttributes attributes) {
		supplierDAO.saveOrUpdate(supplier);
		attributes.addFlashAttribute("SuccessMessage", "Supplier has been added/Updated Successfully");
		return "redirect:/supplier";

	}

	@RequestMapping("editsupplier/{id}")
	public String editSupplier(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
		System.out.println("editSupplier");
		attributes.addFlashAttribute("supplier", this.supplierDAO.get(id));
	//	model.addAttribute("supplier", this.supplierDAO.get(id));
	//	model.addAttribute("supplierList", supplierDAO.list());
	//	model.addAttribute("EditSupplier", "true");
	//	model.addAttribute("SupplierPageClicked", "true");
		return "redirect:/supplier";
	}

	@RequestMapping(value = { "removesupplier/{id}" })
	public String removeSupplier(@PathVariable("id") int id, HttpServletRequest request,RedirectAttributes attributes) throws Exception {
		supplierDAO.delete(id);
		attributes.addFlashAttribute("DeleteMessage", "Supplier has been deleted Successfully");
		return "redirect:/supplier";
	}
}
