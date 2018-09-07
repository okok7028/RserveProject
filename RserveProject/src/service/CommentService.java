package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.CommentDAO;
import vo.MainCommentVO;

@Component
public class CommentService {

	@Autowired
	private CommentDAO dao;
	
	public Map<String, Object> insertComment(int comment_num, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MainCommentVO vo = new MainCommentVO();
		String loginId = (String) session.getAttribute("loginId");
		String lock_flag = request.getParameter("flag_lock");
		System.out.println(lock_flag);
		int mb_num = Integer.parseInt(request.getParameter("mb_num"));
		vo.setWriter(loginId);
		vo.setComment_pw(request.getParameter("comment_pw"));
		vo.setContent(request.getParameter("content"));
		vo.setMb_num(mb_num);
		if(lock_flag.equals("y")){
			vo.setFlag_lock(3);
		}else{
			vo.setFlag_lock(0);
		}
		if(comment_num==0){
		vo.setComment_origin_num(dao.selectMaxNum()+1);	
		vo.setC_level(0);
		}else{
		vo.setComment_origin_num(comment_num);
		int c_level = dao.getCommentLevel(comment_num);
		c_level++;
		vo.setC_level(c_level);
		}
		dao.insertComment(vo);
		System.out.println("success comment dao proc in commentService");
		Map<String, Object> map = new HashMap<>();
		map.put("result", 1);

		return map;
	}
	
	public Map<String, Object> serviceCmt(HttpServletRequest request) {
		int mb_num = Integer.parseInt(request.getParameter("mb_num"));
		String result = "<?xml version='1.0' encoding='UTF-8'?>";
		result += "<comments>";
		List<MainCommentVO> list = dao.commentList(mb_num);
		for (MainCommentVO vo : list) {
			result += "<comment>";
			result += "<comment_num>" + vo.getComment_num() + "</comment_num>";
			result += "<writer>" + vo.getWriter() + "</writer>";
			result += "<content>" + vo.getContent() + "</content>";
			result += "<write_date>" + vo.getWrite_date() + "</write_date>";
			result += "<c_level>"+ vo.getC_level() +"</c_level>";
			result += "<flag_lock>"+ vo.getFlag_lock() +"</flag_lock>";
			result += "</comment>";
		}
		result += "</comments>";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("AjaxMember", result);

		return map;
	}
}
