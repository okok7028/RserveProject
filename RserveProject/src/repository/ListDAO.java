package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.ListMapper;
import vo.RequestListVO;

@Component
public class ListDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int insertRequestList(String request_id, String request_code){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.insertRequestList(request_id, request_code);
	}
	
	public List<RequestListVO> selectWaitListfromCode(String request_code){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.selectWaitListfromCode(request_code);
	}
	
	public List<RequestListVO> selectWaitListfromId(String request_id){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.selectWaitListfromId(request_id);
	}
	
	public List<RequestListVO> selectCompleteList(String request_id){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.selectCompleteList(request_id);
	}
	
	public int updateDoneList(int request_num){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.updateDoneList(request_num);
	}
	
	public int selectRquestCheck(int request_num){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.selectRquestCheck(request_num);
	}
	
}
