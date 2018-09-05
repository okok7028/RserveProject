package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.FileService;
import service.RService;
import vo.ResultFileVO;

@Controller
public class RController {

	@Autowired
	private RService rservice;
	
	@Autowired
	private FileService fservice;
	
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
		List<ResultFileVO> list = fservice.SimpleResultList(request_id);
		mv.addObject("FileList", list);
		return mv;
	}
	
	@RequestMapping("/simpleRequestProc.do")
	public ModelAndView testR(String code, HttpServletRequest request) throws RserveException, REXPMismatchException{
		ModelAndView mv = new ModelAndView();
		String request_code=code+"_%";
		if(request_code.equals("wcn_%")){
		mv.addObject("str", rservice.wordcloudNews(request_code, request));
		}
		if(request_code.equals("scm_%")){
			mv.addObject("str", rservice.schoolMap(request_code, request));
		}
		mv.setViewName("testR");
		return mv;
	}
	
	@RequestMapping("/download.do")
	@ResponseBody
	public void download(@RequestParam(value="f")int request_num, @RequestParam(value="t")String file_type, HttpServletResponse response) throws UnsupportedEncodingException {
		ResultFileVO vo = fservice.getFile(request_num);

		String filename = vo.getOriginal_name();
		String encodedFileName = "";
		StringBuffer sb = new StringBuffer();
		String savedPath = "";
		String file_t="";
		if(file_type.equals("x1")){
			savedPath=vo.getSaved_path()+".csv";
			file_t=".csv";
		}
		if(file_type.equals("i1")){
			savedPath=vo.getSaved_path()+".png";
			file_t=".png";
		}
		System.out.println(savedPath);
		for (int i = 0; i < filename.length(); i++) {

			char c = filename.charAt(i);
			if (c > '~') {
				sb.append(URLEncoder.encode("" + c, "UTF-8"));
			} else {
				sb.append(c);
			}
		}
			sb.append(file_t);
			encodedFileName = sb.toString();
			response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
			
			try {
				FileInputStream is = new FileInputStream(savedPath);
				ServletOutputStream os = response.getOutputStream();
				int data = 0;
				while ((data = is.read()) != -1) {
					os.write(data);
				}
				is.close();
				os.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {

			}

		

	}
}
