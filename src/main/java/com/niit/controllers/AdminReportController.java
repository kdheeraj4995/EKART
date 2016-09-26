package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CartDAO;


@Controller
public class AdminReportController {
	
	@Autowired
	CartDAO cartDAO;

	/*@RequestMapping(value="/AdminReport")
	@ResponseBody
	public String AdminReport()
	{
		List<Cart> list=cartDAO.AdminReport();
		Gson gson=new Gson();
		String data=gson.toJson(list);
		return data;
	}*/
	/*@RequestMapping("Report")
	public String getReport(Model m)
	{
		m.addAttribute("AdminReportClicked","true");
		return "Welcome";
	}*/
	
	@RequestMapping("Report")
	public ModelAndView getReport()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Welcome");
		mv.addObject("AdminReportClicked","true");
		mv.addObject("OrderList",cartDAO.AdminReport());
		return mv;
		
	}
}
