package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.AdminService;
import service.MemberService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private MemberService mservice;
	
	@RequestMapping("/adminMain.do")
	public String adminMain(){
		return "admin_main";
	}
}
