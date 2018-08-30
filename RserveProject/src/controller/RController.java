package controller;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.RService;

@Controller
public class RController {

	@Autowired
	private RService rservice;
	
	@RequestMapping("testR.do")
	public ModelAndView testR() throws RserveException, REXPMismatchException{
		ModelAndView mv = new ModelAndView();
		mv.addObject("str", rservice.testR());
		mv.setViewName("testR");
		return mv;
	}
}
