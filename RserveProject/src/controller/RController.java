package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/simpleRequestWcnews.do")
	public String simpeReauestWcnews(String id, String codeprefix, String keyword, String filename){
		String code=codeprefix+"_"+keyword+"_"+filename;
		if(rservice.insertRequestList(id, code)){
			return "request_success";
		}else{
			return "request_fail";
		}
	}
	
	@RequestMapping("/myRequest.do")
	public ModelAndView myRequest(HttpSession session){
		String request_id=(String)session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView("my_request");
		mv.addObject("RequestList", rservice.getSimpleRequestList(request_id));
		mv.addObject("CompleteList", rservice.getSimpleCompleteList(request_id));
		return mv;
	}
	
	@RequestMapping("/simpleRequestProc.do")
	public ModelAndView testR(String code, HttpServletRequest request) throws RserveException, REXPMismatchException{
		ModelAndView mv = new ModelAndView();
		String request_code=code+"_%";
		if(request_code.equals("wcn_%")){
		mv.addObject("str", rservice.wordcloudNews(request_code, request));
		}
		mv.setViewName("testR");
		return mv;
	}
}
