package com.niit.controllers;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.models.Product;

@Controller
public class AdminProductController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
 private Path path;
	
 @RequestMapping(value="/productgson")
	@ResponseBody
	public String ProductGson()
	{
		List<Product> list=productDAO.list();
		Gson gson=new Gson();
		String data=gson.toJson(list);
		return data;
	}	
 
	@RequestMapping(value = { "product"})
	public String ProductPage(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("categoryList",categoryDAO.list());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("ProductPageClicked","true");
		return "Welcome";
	}

	@RequestMapping(value = { "addproduct", "editproduct/addproduct" }, method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product , HttpServletRequest request) {
		
		productDAO.saveOrUpdate(product);
		MultipartFile file=product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\resources\\images\\product\\"+product.getId()+".jpg");
        if (file != null && !file.isEmpty()) {
            try {
            	System.out.println("Image Saving Start");
            	file.transferTo(new File(path.toString()));
            	System.out.println("Image Saved");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error");
                throw new RuntimeException("item image saving failed.", e);
               
            }
        }
		return "redirect:/product";
	}

	@RequestMapping("editproduct/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		System.out.println("editProduct");
		model.addAttribute("product", this.productDAO.get(id));
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("categoryList",categoryDAO.list());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("ProductPageClicked", "true");
		return "Welcome";
	}

	@RequestMapping(value = { "removeproduct/{id}", "editproduct/removeproduct/{id}" })
	public String removeproduct(@PathVariable("id") String id, Model model,HttpServletRequest request) throws Exception {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\images\\product\\";
		MultiPartController.deleteimage(path, id+".jpg");
		productDAO.delete(id);
		model.addAttribute("message", "Successfully Deleted");
		return "redirect:/product";
	}
}
