package com.niit.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDAO;
import com.niit.dao.ProductDAO;
import com.niit.models.Cart;
import com.niit.models.Product;

@Controller
public class CartController {
	
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired 
	private ProductDAO productDAO;
	
	
	@RequestMapping("addtoCart/{userId}/{id}")
	public String addToCart(@PathVariable("id") String Productid,@PathVariable("userId") int userId,@RequestParam("quantity") int q,HttpSession session)throws Exception 
	{
		if (cartDAO.getitem(Productid, userId)!= null ){
			Cart item=cartDAO.getitem(Productid, userId);
			item.setQuantity(item.getQuantity()+q);
			Product p=productDAO.get(item.getProductid());
			item.setPrice(item.getPrice()+(q*p.getPrice()));
			cartDAO.saveOrUpdate(item);
			session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId")));
			return "redirect:/Welcome";
		}
		else
		{
			Cart item=new Cart();
			Product product=productDAO.get(Productid);
			item.setProductname(product.getName());
			item.setUserid(userId);
			item.setQuantity(q);
			item.setPrice(q*product.getPrice());
			item.setStatus("C");
			item.setProductid(Productid);
			cartDAO.saveOrUpdate(item);
			session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId")));
			return "redirect:/Welcome";
		}
		
	}
	@RequestMapping("editorder/{cartid}")
	public String editorder(@PathVariable("cartid") int cartid,@RequestParam("quantity") int q,HttpSession session)
	{
		Cart cart=cartDAO.getitem(cartid);
		Product p=productDAO.get(cart.getProductid());
		cart.setQuantity(q);
		cart.setPrice(q*p.getPrice());
		cartDAO.saveOrUpdate(cart);
		session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId")));
		return "redirect:/viewcart";
	}
	
	@RequestMapping("deleteitem/{id}")
	public String deleteorder(@PathVariable("id")int id,HttpSession session)
	{
		cartDAO.delete(id);
		session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId")));
		return "redirect:/viewcart";
	}
	
	@RequestMapping("viewcart")
	public String viewCart(Model model,HttpSession session)
	{
		int userId=(int)session.getAttribute("userId");
		model.addAttribute("CartList",cartDAO.get(userId));
		model.addAttribute("CartPrice",cartDAO.CartPrice(userId));
		model.addAttribute("IfViewCartClicked", "true");
		model.addAttribute("HideOthers","true");
		return "Welcome";
	}
	
	@RequestMapping("placeorder")
	public String placeorder(Model model)
	{
		model.addAttribute("IfPaymentClicked", "true");
		model.addAttribute("HideOthers","true");
		return "Welcome";
	}

	@RequestMapping("Payment")
	public String payment(HttpSession session)
	{
		cartDAO.pay((int)session.getAttribute("userId"));
		return "redireck:/Welcome";
	}	
}
