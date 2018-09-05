package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.FileMapper;
import vo.RequestFileVO;
import vo.ResultFileVO;

@Component
public class FileDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int insertRequestFile(RequestFileVO vo) {
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.insertRequestFile(vo);
	}
	
	public RequestFileVO selectRequestFile(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectRequestFile(request_num);
	}
	
	public RequestFileVO selectRequestFilebyRb(int rb_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectRequestFilebyRb(rb_num);
	}
	
	public int insertResultFile(ResultFileVO vo) {
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.insertResultFile(vo);
	}
	
	public List<ResultFileVO> selectResultFiles(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectResultFiles(request_num);
	}
	
	public ResultFileVO selectResultFile(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectResultFile(request_num);
	}
	
	public int checkDoneRequest(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.checkDoneRequest(request_num);
	}
	
}
