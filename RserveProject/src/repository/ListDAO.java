package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.ListMapper;
import vo.JobListVO;
import vo.RequestListVO;

@Component
public class ListDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int insertRequestList(RequestListVO vo){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.insertRequestList(vo);
	}
	
	public List<RequestListVO> selectWaitList(String request_code){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.selectWaitList(request_code);
	}
	
	public int updateDoneList(int request_num){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.updateDoneList(request_num);
	}
	
	public int selectRquestCheck(int request_num){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.selectRquestCheck(request_num);
	}
	
	public int insertJobList(JobListVO vo){
		ListMapper mapper = template.getMapper(ListMapper.class);
		return mapper.insertJobList(vo);
	}
}
