package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;
import service.CommentService;
import service.FileService;
import vo.MainBoardVO;
import vo.RequestBoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private FileService fservice;
	
	@Autowired
	private CommentService cservice;
	
	@RequestMapping("/requestBoardList.do")
	public ModelAndView requestboardList(@RequestParam(value="p", defaultValue="1")int page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", service.makeRequestBoardPage(page));
		mv.setViewName("request_board_list");
		return mv;
	}
	
	@RequestMapping("/mainBoardList.do")
	public ModelAndView mainboardList(@RequestParam(value="p", defaultValue="1")int page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", service.makeMainBoardPage(page));
		mv.setViewName("main_board_list");
		return mv;
	}
	
	@RequestMapping("/requestWriteForm.do")
	public ModelAndView requestwriterForm(@RequestParam(value="n", defaultValue="0")int rb_num, HttpSession session) {
		ModelAndView mv = new ModelAndView("request_write_form");

		mv.addObject("writer", session.getAttribute("loginId"));

		if((Integer)rb_num==0) {
		mv.addObject("num", 0);
		mv.addObject("rb_ref", 1);
		mv.addObject("rb_seq", 0);
		mv.addObject("rb_level", 0);
		}else {
			RequestBoardVO vo = service.readRBWithoutCount(rb_num);
			mv.addObject("num", rb_num);
			mv.addObject("rb_ref", vo.getRb_ref());
			mv.addObject("rb_seq", vo.getRb_seq());
			mv.addObject("rb_level", vo.getRb_seq());
		}
		return mv;
	}
	
	@RequestMapping("/mainWriteForm.do")
	public ModelAndView mainwriterForm(@RequestParam(value="n", defaultValue="0")int mb_num, HttpSession session) {
		ModelAndView mv = new ModelAndView("main_write_form");

		mv.addObject("writer", session.getAttribute("loginId"));

		if((Integer)mb_num==0) {
		mv.addObject("num", 0);
		mv.addObject("mb_ref", 1);
		mv.addObject("mb_seq", 0);
		mv.addObject("mb_level", 0);
		}else {
			MainBoardVO vo = service.readMBWithoutCount(mb_num);
			mv.addObject("num", mb_num);
			mv.addObject("mb_ref", vo.getMb_ref());
			mv.addObject("mb_seq", vo.getMb_seq());
			mv.addObject("mb_level", vo.getMb_level());
		}
		return mv;
	}
	
	@RequestMapping(value="/writeRB.do", method=RequestMethod.POST)
	@ResponseBody
	public void requestwrite(HttpServletResponse response, int num, HttpServletRequest request,
			@RequestParam("file") MultipartFile[] files, RequestBoardVO vo) {

		int rb_num = service.writeRB(vo, num);
		
		if(!files[0].isEmpty()){
			fservice.fileRBUpload(request, files, vo, rb_num);
		}
		
		try {
			response.sendRedirect("writeRBResult.do?rb_num=" + rb_num);
		} catch (IOException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/writeRBResult.do")
	public ModelAndView requestwriteResult(int rb_num) {

		ModelAndView mv = new ModelAndView("write_rb_result");
		mv.addObject("insertedRB", service.readRBWithoutCount(rb_num));
		mv.addObject("file", fservice.getRBfile(rb_num));
		return mv;
	}
	
	@RequestMapping(value="/writeMB.do", method=RequestMethod.POST)
	@ResponseBody
	public void mainwrite(HttpServletResponse response, int num, HttpServletRequest request,
			MainBoardVO vo) {

		int mb_num = service.writeMB(vo, num);
		
		try {
			response.sendRedirect("writeMBResult.do?mb_num=" + mb_num);
		} catch (IOException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/writeMBResult.do")
	public ModelAndView mainwriteResult(int mb_num) {

		ModelAndView mv = new ModelAndView("write_mb_result");
		mv.addObject("insertedMB", service.readMBWithoutCount(mb_num));
		return mv;
	}
	
	@RequestMapping(value="/readRB.do", method=RequestMethod.GET)
	@ResponseBody
	public void requestread(@RequestParam("n")int rb_num, 
			@RequestParam(value="p")int currentPage, HttpServletResponse response) {
		
		RequestBoardVO vo = service.readRB(rb_num);
		int insertedNum = vo.getRb_num();
		
		try {
			response.sendRedirect("readRBResult.do?n="+insertedNum+
					"&p="+currentPage);
		} catch (IOException e) {
			System.out.println("글읽기 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/readRBResult.do")
	public ModelAndView requestreadResult(@RequestParam("n")int rb_num, @RequestParam("p")int currentPage) {
		ModelAndView mv = new ModelAndView("read_rb");
		mv.addObject("board", service.readRBWithoutCount(rb_num));
		mv.addObject("p", currentPage);
		return mv;
	}
	
	@RequestMapping(value="/readMB.do", method=RequestMethod.GET)
	@ResponseBody
	public void mainread(@RequestParam("n")int mb_num, 
			@RequestParam(value="p")int currentPage, HttpServletResponse response) {
		
		MainBoardVO vo = service.readMB(mb_num);
		int insertedNum = vo.getMb_num();
		
		try {
			response.sendRedirect("readMBResult.do?n="+insertedNum+
					"&p="+currentPage);
		} catch (IOException e) {
			System.out.println("글읽기 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/readMBResult.do")
	public ModelAndView mainreadResult(@RequestParam("n")int mb_num, @RequestParam("p")int currentPage) {
		ModelAndView mv = new ModelAndView("read_mb");
		mv.addObject("board", service.readMBWithoutCount(mb_num));
		mv.addObject("p", currentPage);
		return mv;
	}
	
	@RequestMapping("/comment.do")
	@ResponseBody
    public void insertComment(@RequestParam(value="con", defaultValue="0")int comment_num, HttpServletRequest request,HttpServletResponse response) throws Exception {//ajax는 void형 함수를 사용한다.
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> map = cservice.insertComment(comment_num, request);
        
        int result = (int) map.get("result");
        out.println(result);        
    }
	
	@RequestMapping(value="/commentList.do")
	@ResponseBody
    public void commentList(HttpServletRequest request, HttpServletResponse response) throws Exception {//ajax는 void형 함수를 사용한다.
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        Map<String,Object> map = cservice.serviceCmt(request);
        String result = (String) map.get("AjaxMember");
        System.out.println(result+"------------------------------");
        out.println(result);        
    }
	
	@RequestMapping("/processUpDown.do")
	@ResponseBody
	public void processUpDown(String code, int mb_num, HttpServletResponse response, HttpSession session){
		
		String mainJson;
		String loginId = (String) session.getAttribute("loginId");
		
		MainBoardVO mainboard = service.processUpDown(code, mb_num, loginId);
		
		if(mainboard != null){
	        mainJson = "{\"recommend\":\""+mainboard.getRecommend()
	                    +"\",\"opposite\":\""+mainboard.getOpposite()+"\"}";
	    }else{
	        mainJson = "null";
	    }

	    try {
	        response.getWriter().print(mainJson);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }   
	}
}
