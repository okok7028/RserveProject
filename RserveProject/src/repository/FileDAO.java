package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.FileMapper;
import vo.JobResultVO;
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
	
	public List<RequestFileVO> selectRequestFiles(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectRequestFiles(request_num);
	}
	
	public int insertResultFile(ResultFileVO vo) {
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.insertResultFile(vo);
	}
	
	public List<ResultFileVO> selectResultFiles(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectResultFiles(request_num);
	}
	
	public int checkDoneRequest(int request_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.checkDoneRequest(request_num);
	}
	
	public int insertJobResultFile(JobResultVO vo) {
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.insertJobResultFile(vo);
	}
	
	public List<JobResultVO> selectJobResultFiles(int job_num){
		FileMapper mapper = template.getMapper(FileMapper.class);
		return mapper.selectJobResultFiles(job_num);
	}
}
