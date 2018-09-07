package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.RequestBoardMapper;
import vo.RequestBoardVO;

@Component
public class RequestBoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int insertRequesstBoard(RequestBoardVO vo){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.insertRequesstBoard(vo);
	}
	
	public int selectRequestMaxNum(){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.selectRequestMaxNum();
	}
	
	public List<RequestBoardVO> selectRequestBoardList( int startRow, int endRow){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.selectRequestBoardList(startRow, endRow);
	}
	
	public RequestBoardVO selectRequestBoard(int rb_num){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.selectRequestBoard(rb_num);
	}
	
	public int selectRequestBoardCount(){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.selectRequestBoardCount();
	}
	
	public int updateRequestReply(int rb_ref, int rb_seq){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.updateRequestReply(rb_ref, rb_seq);
	}
	
	public int updateRequestReadCount(int rb_num){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.updateRequestReadCount(rb_num);
	}
	
	public int updateRequestBoard(RequestBoardVO vo){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.updateRequestBoard(vo);	
	}
	
	public int deleteRequestBoard(int boardNum){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.deleteRequestBoard(boardNum);
	}
	
	public int updateFlagRC(int rb_num){
		RequestBoardMapper mapper = template.getMapper(RequestBoardMapper.class);
		return mapper.updateFlagRC(rb_num);
	}
}
