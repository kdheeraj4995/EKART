package com.niit.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.SupplierDAO;
import com.niit.models.Supplier;

@Controller
public class AdminSupplierController {

	@Autowired
	private SupplierDAO supplierDAO;
	

	@RequestMapping(value = {"supplier"})
	public String SupplierPage(Model model) {
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("SupplierPageClicked", "true");
		return "Welcome";
	}

	@RequestMapping(value = {"addsupplier", "editsupplier/addsupplier" }, method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier , HttpServletRequest request) {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\images\\supplier\\";
		supplierDAO.saveOrUpdate(supplier);
		MultipartFile file=supplier.getImage();
		MultiPartController.upload(path, file, supplier.getId()+".jpg");
		return "redirect:/supplier";
		
	}

	@RequestMapping("editsupplier/{id}")
	public String editSupplier(@PathVariable("id") String id, Model model) {
		System.out.println("editSupplier");
		model.addAttribute("supplier", this.supplierDAO.get(id));
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("SupplierPageClicked", "true");
		return "Welcome";
	}

	@RequestMapping(value = { "removesupplier/{id}", "editsupplier/removesupplier/{id}" })
	public String removeSupplier(@PathVariable("id") String id, Model model, HttpServletRequest request) throws Exception {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\images\\supplier\\";
		MultiPartController.deleteimage(path, id+".jpg");
		supplierDAO.delete(id);
		model.addAttribute("message", "Successfully Deleted");
		return "redirect:/supplier";
	}



}
