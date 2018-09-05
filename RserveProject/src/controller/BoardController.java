package controller;

import java.io.IOException;

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
import service.FileService;
import vo.RequestBoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private FileService fservice;
	
	@RequestMapping("/requestBoardList.do")
	public ModelAndView boardList(@RequestParam(value="p", defaultValue="1")int page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", service.makeRequestBoardPage(page));
		mv.setViewName("request_board_list");
		return mv;
	}
	
	@RequestMapping("/requestWriteForm.do")
	public ModelAndView writerForm(@RequestParam(value="n", defaultValue="0")int rb_num, HttpSession session) {
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
	
	@RequestMapping(value="/writeRB.do", method=RequestMethod.POST)
	@ResponseBody
	public void write(HttpServletResponse response, int num, HttpServletRequest request,
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
	public ModelAndView writeResult(int rb_num) {

		ModelAndView mv = new ModelAndView("write_rb_result");
		mv.addObject("insertedRB", service.readRBWithoutCount(rb_num));
		mv.addObject("file", fservice.getRBfile(rb_num));
		return mv;
	}
}
