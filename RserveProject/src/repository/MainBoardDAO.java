package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.MainBoardMapper;
import vo.MainBoardVO;
import vo.UpdownflagVO;

@Component
public class MainBoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int insertMainBoard(MainBoardVO vo){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.insertMainBoard(vo);
	}
	
	public int selectMainMaxNum(){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.selectMainMaxNum();
	}
	
	public List<MainBoardVO> selectMainBoardList(int startRow, int endRow){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.selectMainBoardList(startRow, endRow);
	}
	
	public MainBoardVO selectMainBoard(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.selectMainBoard(mb_num);
	}
	
	public int selectMainBoardCount(){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.selectMainBoardCount();
	}
	
	public int updateMainReply(int mb_ref, int mb_seq){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.updateMainReply(mb_ref, mb_seq);
	}
	
	public int updateMainReadCount(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.updateMainReadCount(mb_num);
	}
	
	public int updateMainBoard(MainBoardVO vo){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.updateMainBoard(vo);
	}
	
	public int deleteMainBoard(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.deleteMainBoard(mb_num);
	}
	
	public MainBoardVO selectUpDown(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.selectUpDown(mb_num);
	}
	
	public int upRecommend(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.upRecommend(mb_num);
	}
	
	public int downOpposite(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.downOpposite(mb_num);
	}
	
	public int reRecommend(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.reRecommend(mb_num);
	}
	
	public int reOpposite(int mb_num){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.reOpposite(mb_num);
	}
	
	public int insertUpdownflag(UpdownflagVO updown){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.insertUpdownflag(updown);
	}
	
	public UpdownflagVO selectUpdownflag(int mb_num, String updown_id){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.selectUpdownflag(mb_num, updown_id);	
	}
	
	public int updateUpdownflag(UpdownflagVO updown){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.updateUpdownflag(updown);
	}
	
	public int deleteUpdownflag(){
		MainBoardMapper mapper = template.getMapper(MainBoardMapper.class);
		return mapper.deleteUpdownflag();
	}
}
